package org.kuali.ole.spring.batch.rest.controller;

import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.codehaus.jackson.annotate.JsonAutoDetect;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.drools.core.time.impl.CronExpression;
import org.kuali.ole.constants.OleNGConstants;
import org.kuali.ole.oleng.batch.process.model.BatchJobDetails;
import org.kuali.ole.oleng.batch.process.model.BatchProcessJob;
import org.kuali.ole.oleng.batch.process.model.BatchScheduleJob;
import org.kuali.ole.oleng.rest.controller.OleNgControllerBase;
import org.kuali.ole.oleng.util.BatchExcelReportUtil;
import org.kuali.ole.spring.batch.BatchUtil;
import org.kuali.ole.spring.batch.processor.*;
import org.kuali.rice.core.api.config.property.ConfigContext;
import org.kuali.rice.krad.util.GlobalVariables;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.MediaType;
import java.io.File;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;

/**
 * Created by sheiksalahudeenm on 25/6/15.
 */
@Controller
@RequestMapping("/batch")
public class BatchRestController extends OleNgControllerBase {

    @Autowired
    private BatchBibFileProcessor batchBibFileProcessor;

    @Autowired
    private BatchOrderImportProcessor batchOrderImportProcessor;

    @Autowired
    private BatchInvoiceImportProcessor batchInvoiceImportProcessor;

    @Autowired
    private BatchDeleteFileProcessor batchDeleteFileProcessor;

    private BatchExcelReportUtil batchExcelReportUtil;

    private BatchUtil batchUtil;

    @RequestMapping(value = "/upload", method = RequestMethod.POST, produces = {MediaType. APPLICATION_JSON + OleNGConstants.CHARSET_UTF_8})
    @ResponseBody
    public String UploadFile(@RequestParam("file") MultipartFile file, @RequestParam("profileName") String profileName,
                             @RequestParam("batchType") String batchType, HttpServletRequest request) throws Exception {
        if (null != file && StringUtils.isNotBlank(profileName) && StringUtils.isNotBlank(batchType)) {
            File uploadedDirectory = storeUploadedFileToFileSystem(file);
            if(null != uploadedDirectory) {
                String originalFilename = file.getOriginalFilename();
                String extension = FilenameUtils.getExtension(originalFilename);
                BatchJobDetails batchJobDetails = new BatchJobDetails();
                batchJobDetails.setProfileName(profileName);
                batchJobDetails.setFileName(originalFilename);
                batchJobDetails.setStartTime(new Timestamp(new Date().getTime()));
                batchJobDetails.setStatus(OleNGConstants.RUNNING);
                JSONObject response = processBatch(uploadedDirectory, batchType, profileName, extension, batchJobDetails);
                return response.toString();
            }

        }
        return null;
    }

    private JSONObject processBatch(File uploadDirectory, String batchType, String profileId, String fileExtension, BatchJobDetails batchJobDetails) throws Exception {
        BatchFileProcessor batchProcessor = getBatchProcessor(batchType);

        long jobDetailsId = batchJobDetails.getJobDetailId();
        String reportDirectory = (jobDetailsId != 0) ? String.valueOf(jobDetailsId) : OleNGConstants.QUICK_LAUNCH + OleNGConstants.DATE_FORMAT.format(new Date());

        String statusFilePath = getBatchUtil().writeBatchRunningStatusToFile(uploadDirectory.getAbsolutePath(), OleNGConstants.RUNNING, null);

        JSONObject response = batchProcessor.processBatch(uploadDirectory, fileExtension, profileId,reportDirectory, batchJobDetails);
        if (batchJobDetails.getJobId() != 0 && batchJobDetails.getJobDetailId() != 0) {
            getBusinessObjectService().save(batchJobDetails);
        }
        response.put("filePathName", getStatusFilePathName(statusFilePath));
        return response;
    }

    private String getStatusFilePathName(String statusFilePath) {
        String batchUploadLocation = getBatchUploadLocation();
        File file = new File(batchUploadLocation);
        return statusFilePath.replace(file.getAbsolutePath() + File.separator,  "");
    }

    @RequestMapping(value = "/submit/api", method = RequestMethod.POST, produces = {MediaType. APPLICATION_JSON + OleNGConstants.CHARSET_UTF_8})
    @ResponseBody
    public String submitApi(@RequestBody String requestBody) throws Exception {
        JSONObject requestJson = new JSONObject(requestBody);
        String rawContent = getStringValueFromJsonObject(requestJson, "marcContent");
        String batchType = getStringValueFromJsonObject(requestJson, "batchType");
        String profileId = getStringValueFromJsonObject(requestJson, "profileId");
        BatchJobDetails batchJobDetails = new BatchJobDetails();
        batchJobDetails.setProfileName(profileId);
        String originalFilename = "quicklanch.mrc";
        batchJobDetails.setFileName(originalFilename);
        File uploadedDirectory = storeUploadedFileToFileSystem(rawContent, originalFilename);
        if(null != uploadedDirectory) {
            String extension = FilenameUtils.getExtension(originalFilename);
            JSONObject response = processBatch(uploadedDirectory, batchType, profileId, extension, batchJobDetails);
            return response.toString();
        }
        return null;

    }

    @RequestMapping(method = RequestMethod.POST, value = "/job/create", produces = {MediaType. APPLICATION_JSON + OleNGConstants.CHARSET_UTF_8})
    @ResponseBody
    public String createBatchJobDetailsEntry(@RequestBody String requestBody) {
        String response = "";
        BatchProcessJob batchProcessJob;
        try {
            batchProcessJob = convertJsonToProcessJob(requestBody);
            String loginUser = GlobalVariables.getUserSession().getPrincipalName();
            batchProcessJob.setCreatedBy(loginUser);
            batchProcessJob.setCreatedOn(new Timestamp(new Date().getTime()));
            getBusinessObjectService().save(batchProcessJob);
            response = getObjectMapper().writeValueAsString(batchProcessJob);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return response;
    }

    @RequestMapping(method = RequestMethod.POST, value = "/job/quickLaunch", produces = {MediaType. APPLICATION_JSON + OleNGConstants.CHARSET_UTF_8})
    @ResponseBody
    public String quickLaunchJob(@RequestParam("jobId") String jobId, @RequestParam("file") MultipartFile file, HttpServletRequest request) {
        BatchJobDetails batchJobDetails = null;
        try {
            BatchProcessJob matchedBatchJob = getBatchProcessJobById(Long.valueOf(jobId));
            if (null != file) {
                File uploadedDirectory = storeUploadedFileToFileSystem(file);
                if(null != uploadedDirectory) {
                    String originalFilename = file.getOriginalFilename();
                    batchJobDetails = createBatchJobDetailsEntry(matchedBatchJob, originalFilename);
                    getBusinessObjectService().save(batchJobDetails);
                    String extension = FilenameUtils.getExtension(originalFilename);
                    JSONObject response = processBatch(uploadedDirectory, batchJobDetails.getProfileType(),
                            String.valueOf(matchedBatchJob.getBatchProfileId()) , extension, batchJobDetails);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            batchJobDetails.setStatus(OleNGConstants.FAILED);
        }
        if(null != batchJobDetails) {
            getBusinessObjectService().save(batchJobDetails);
        }
        return "";
    }

    private File storeUploadedFileToFileSystem(MultipartFile file) throws IOException {
        String batchUploadLocation = getBatchUploadLocation();
        if(StringUtils.isNotBlank(batchUploadLocation)) {
            batchUploadLocation = batchUploadLocation + File.separator + OleNGConstants.DATE_FORMAT.format(new Date());
            File uploadDirectory = new File(batchUploadLocation);
            if (!uploadDirectory.exists() || !uploadDirectory.isDirectory()) {
                uploadDirectory.mkdirs();
            }
            File uploadFile = new File(uploadDirectory, file.getOriginalFilename());
            file.transferTo(uploadFile);
            return uploadDirectory;
        }
        return null;
    }

    private String getBatchUploadLocation() {
        return ConfigContext.getCurrentContextConfig().getProperty("batchUploadLocation");
    }

    private File storeUploadedFileToFileSystem(String rawContent, String fileName) throws IOException {
        String batchUploadLocation = getBatchUploadLocation();
        if(StringUtils.isNotBlank(batchUploadLocation)) {
            batchUploadLocation = batchUploadLocation + File.separator + OleNGConstants.DATE_FORMAT.format(new Date());
            File uploadDirectory = new File(batchUploadLocation);
            if (!uploadDirectory.exists() || !uploadDirectory.isDirectory()) {
                uploadDirectory.mkdirs();
            }
            File uploadFile = new File(uploadDirectory, fileName);
            FileUtils.writeStringToFile(uploadFile, rawContent);
            return uploadDirectory;
        }
        return null;
    }

    @RequestMapping(method = RequestMethod.POST, value = "/job/schedule", produces = {MediaType. APPLICATION_JSON + OleNGConstants.CHARSET_UTF_8})
    @ResponseBody
    public String scheduleJob(@RequestParam("jobId") String jobId, @RequestParam("file") MultipartFile file, @RequestParam("scheduleJob") String scheduleJobString, HttpServletRequest request) {
        try {
            BatchScheduleJob batchScheduleJob = convertJsonToScheduleJob(scheduleJobString);
            BatchProcessJob matchedBatchJob = getBatchProcessJobById(Long.valueOf(jobId));
            if (null != file) {
                saveUploadedFile(matchedBatchJob, file);
            }
            String cronExpression = batchScheduleJob.getCronExpression();
            if (StringUtils.isNotBlank(cronExpression)) {
                if (org.quartz.CronExpression.isValidExpression(cronExpression)) {
                    matchedBatchJob.setCronExpression(cronExpression);
                    CronExpression cron = new CronExpression(cronExpression);
                    Date date = cron.getNextValidTimeAfter(new Date());
                    matchedBatchJob.setNextRunTime(new Timestamp(date.getTime()));
                }
            }
            getBusinessObjectService().save(matchedBatchJob);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return String.valueOf(jobId);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/job/destroy", produces = {MediaType. APPLICATION_JSON + OleNGConstants.CHARSET_UTF_8})
    @ResponseBody
    public String destroyJob(@RequestParam("jobId") long jobId) {
        try {
            BatchProcessJob matchedBatchJob = getBatchProcessJobById(jobId);
            if (null != matchedBatchJob) {
                getBusinessObjectService().delete(matchedBatchJob);
                // Todo : Once scheduler come to picture, need to remove the job from quartz-scheduler also.
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return String.valueOf(jobId);
    }

    @RequestMapping(method = RequestMethod.GET, value = "job/getReportsFiles", produces = {MediaType. APPLICATION_JSON + OleNGConstants.CHARSET_UTF_8})
    @ResponseBody
    public String getReportsFiles() {
        JSONArray response = new JSONArray();
        try {
            String reportLocation = ConfigContext.getCurrentContextConfig().getProperty("project.home") + "/reports";
            File reportDirectory = new File(reportLocation);
            response = getFileListResponse(reportDirectory);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return response.toString();
    }



    @RequestMapping(method = RequestMethod.GET, value = "job/getSpecificReportsFiles", produces = {MediaType. APPLICATION_JSON + OleNGConstants.CHARSET_UTF_8})
    @ResponseBody
    public String getSpecificReportsFiles(@RequestParam("jobDetailsId") long jobDetailsId) {
        JSONArray response = new JSONArray();
        try {
            String reportLocation = ConfigContext.getCurrentContextConfig().getProperty("project.home") + "/reports";
            File reportDirectory = new File(reportLocation);
            File jobReportDirectory = new File(reportDirectory,String.valueOf(jobDetailsId));
            if(jobReportDirectory.exists() && jobReportDirectory.isDirectory()) {
                reportDirectory = jobReportDirectory;
            }
            response = getFileListResponse(reportDirectory);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return response.toString();
    }

    private JSONArray getFileListResponse(File reportDirectory) throws JSONException {
        JSONArray response = new JSONArray();
        if(reportDirectory.exists() && reportDirectory.isDirectory()) {
            File[] fileLists = reportDirectory.listFiles();
            for(File file : fileLists) {
                if(file.isFile()) {
                    JSONObject fileObject = new JSONObject();
                    fileObject.put("id",file.getName());
                    fileObject.put("name",file.getName());
                    fileObject.put("parent",file.getParentFile().getName());
                    response.put(fileObject);
                } else if(file.isDirectory()) {
                    JSONArray fileListResponse = getFileListResponse(file);
                    for(int index = 0;  index < fileListResponse.length(); index++) {
                        JSONObject jsonObject = fileListResponse.getJSONObject(index);
                        response.put(jsonObject);
                    }
                }
            }
        }
        return response;
    }

    @RequestMapping(method = RequestMethod.GET, value = "job/getFileContent", produces = {MediaType. APPLICATION_JSON + OleNGConstants.CHARSET_UTF_8})
    @ResponseBody
    public String getFileContent(@RequestParam("fileName") String fileName, @RequestParam("parent") String parent) {
        JSONObject response = new JSONObject();
        try {
            String reportLocation = ConfigContext.getCurrentContextConfig().getProperty("project.home") + "/reports";
            File reportDirectory = new File(reportLocation);
            if(reportDirectory.exists() && reportDirectory.isDirectory()) {
                File file = null;
                if(!reportDirectory.getName().equals(parent)) {
                    file = new File(reportDirectory + File.separator + parent + File.separator + fileName);
                } else {
                    file = new File(reportDirectory + File.separator + fileName);
                }
                if(file.exists() && file.isFile()) {
                    String fileContent = FileUtils.readFileToString(file);
                    response.put("fileContent",fileContent);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return response.toString();
    }

    @RequestMapping(method = RequestMethod.GET, value = "job/downloadReportFile")
    @ResponseBody
    public byte[] downloadReportFile(@RequestParam("fileName") String fileName, @RequestParam("parent") String parent, HttpServletResponse response) throws IOException {

        byte[] fileContentBytes = null;

        String fileContent = "";

        try {
            String reportLocation = ConfigContext.getCurrentContextConfig().getProperty("report.directory");
            File reportDirectory = new File(reportLocation);
            if(reportDirectory.exists() && reportDirectory.isDirectory()) {
                File file = null;
                if(!reportDirectory.getName().equals(parent)) {
                    file = new File(reportDirectory + File.separator + parent + File.separator + fileName);
                } else {
                    file = new File(reportDirectory + File.separator + fileName);
                }
                if(file.exists() && file.isFile()) {
                    fileContent = FileUtils.readFileToString(file);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        String extension = FilenameUtils.getExtension(fileName);
        String fileNameWithoutExtension = FilenameUtils.getBaseName(fileName);
        if(extension.contains(OleNGConstants.MARC)) {
            fileContentBytes = fileContent.getBytes();
        } else {
            if(fileName.contains("FailureMessages")) {
                fileContentBytes = fileContent.getBytes();
            } else if(fileName.contains("BibImport")) {
                fileContentBytes = getBatchExcelReportUtil().getExcelSheetForBibImport(fileContent);
                extension = "xlsx";
            } else if(fileName.contains("OrderImport")) {
                fileContentBytes = getBatchExcelReportUtil().getExcelSheetForOrderImport(fileContent);
                extension = "xlsx";
            } else if(fileName.contains("InvoiceImport")) {
                fileContentBytes = getBatchExcelReportUtil().getExcelSheetForInvoiceImport(fileContent);
                extension = "xlsx";
            } else if(fileName.contains("BatchDelete")) {
                fileContentBytes = getBatchExcelReportUtil().getExcelSheetForBatchDelete(fileContent);
                extension = "xlsx";
            }
        }

        String fileNameWithExtension = fileNameWithoutExtension + "." + extension;

        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileNameWithExtension + "\"");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setContentLength(fileContentBytes.length);

        return fileContentBytes;

    }

    @RequestMapping(method = RequestMethod.GET, value = "job/getBatchStatus", produces = {MediaType. APPLICATION_JSON + OleNGConstants.CHARSET_UTF_8})
    @ResponseBody
    public String getBatchStatus(@RequestParam("filePathName") String filePathName) {
        JSONObject response = new JSONObject();
        try {
            String batchUploadLocation = getBatchUploadLocation();
            File statusFile = new File(batchUploadLocation, filePathName);
            if(statusFile.exists() && statusFile.isFile()) {
                String statusContent = FileUtils.readFileToString(statusFile);
                if(StringUtils.isNotBlank(statusContent)) {
                    JSONObject statusJson = new JSONObject(statusContent);
                    String status = getStringValueFromJsonObject(statusJson, OleNGConstants.STATUS);
                    String timeSpent = getStringValueFromJsonObject(statusJson, OleNGConstants.TIME_SPENT);
                    response.put(OleNGConstants.STATUS, status);
                    response.put(OleNGConstants.TIME_SPENT, timeSpent);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return response.toString();
    }


    private BatchJobDetails createBatchJobDetailsEntry(BatchProcessJob batchProcessJob, String fileName) {
        BatchJobDetails batchJobDetails = new BatchJobDetails();
        batchJobDetails.setJobId(batchProcessJob.getJobId());
        batchJobDetails.setJobName(batchProcessJob.getJobName());
        batchJobDetails.setProfileType(batchProcessJob.getProfileType());
        batchJobDetails.setProfileName(batchProcessJob.getBatchProfileName());
        String loginUser = GlobalVariables.getUserSession().getPrincipalName();
        batchJobDetails.setCreatedBy(loginUser); // Job initiated by
        batchJobDetails.setStartTime(new Timestamp(new Date().getTime()));
        batchJobDetails.setStatus(OleNGConstants.RUNNING);
        batchJobDetails.setFileName(fileName);
        batchJobDetails.setStartTime(new Timestamp(System.currentTimeMillis()));
        return batchJobDetails;
    }

    public BatchProcessJob convertJsonToProcessJob(String processJsonString) throws JSONException, IOException {
        getObjectMapper().setVisibilityChecker(getObjectMapper().getVisibilityChecker().withFieldVisibility(JsonAutoDetect.Visibility.ANY));
        BatchProcessJob batchProcessJob = getObjectMapper().readValue(processJsonString, BatchProcessJob.class);
        return batchProcessJob;
    }

    public BatchScheduleJob convertJsonToScheduleJob(String scheduleJobJsonString) throws JSONException, IOException {
        getObjectMapper().setVisibilityChecker(getObjectMapper().getVisibilityChecker().withFieldVisibility(JsonAutoDetect.Visibility.ANY));
        BatchScheduleJob batchScheduleJob = getObjectMapper().readValue(scheduleJobJsonString, BatchScheduleJob.class);
        return batchScheduleJob;
    }

    public BatchProcessJob getBatchProcessJobById(Long jobId) {
        Map map = new HashedMap();
        map.put(OleNGConstants.JOB_ID, jobId);
        return getBusinessObjectService().findByPrimaryKey(BatchProcessJob.class, map);
    }

    public BatchFileProcessor getBatchProcessor(String batchType) {
        if(batchType.equalsIgnoreCase("Order Record Import")){
            return batchOrderImportProcessor;
        } else if(batchType.equalsIgnoreCase("Bib Import")) {
            return batchBibFileProcessor;
        } else if(batchType.equalsIgnoreCase("Invoice Import")) {
            return batchInvoiceImportProcessor;
        } else if(batchType.equalsIgnoreCase("Batch Delete")) {
            return batchDeleteFileProcessor;
        }
        return null;
    }

    private void saveUploadedFile(BatchProcessJob matchedBatchJob, MultipartFile multipartFile) throws IOException {
        String directoryPath = getDirectoryPath(matchedBatchJob.getProfileType(), matchedBatchJob.getJobId());
        File file = new File(directoryPath + multipartFile.getOriginalFilename());
        FileUtils.writeStringToFile(file, IOUtils.toString(multipartFile.getBytes()));
    }

    private String getDirectoryPath(String profileType, long jobId) {
        String batchFileLocation = null;
        String fileSeparator = FileSystems.getDefault().getSeparator();
        String stagingDirectory = ConfigContext.getCurrentContextConfig().getProperty("staging.directory");
        batchFileLocation = stagingDirectory + fileSeparator + getJobDirectoryName(profileType);

        File profileTypeDirectory = new File(batchFileLocation);
        if (profileTypeDirectory.isDirectory()) {
            batchFileLocation = batchFileLocation + fileSeparator + jobId;
            File jobDirectory = new File(batchFileLocation);
            if (jobDirectory.isDirectory()) {
                batchFileLocation = batchFileLocation + fileSeparator;
            } else {
                jobDirectory.mkdir();
                batchFileLocation = batchFileLocation + fileSeparator;
            }
        } else {
            batchFileLocation = batchFileLocation + fileSeparator + jobId;
            File jobDirectory = new File(batchFileLocation);
            jobDirectory.mkdirs();
            batchFileLocation = batchFileLocation + fileSeparator;
        }
        return batchFileLocation;
    }

    private String getJobDirectoryName(String profileType) {
        String jobDirectoryName = null;
        if (StringUtils.equalsIgnoreCase("Bib Import", profileType)) {
            jobDirectoryName = "batchBibImport";
        } else if (StringUtils.equalsIgnoreCase("Invoice Import", profileType)) {
            jobDirectoryName = "batchInvoice";
        } else if (StringUtils.equalsIgnoreCase("Order Record Import", profileType)) {
            jobDirectoryName = "batchOrderRecord";
        }
        return jobDirectoryName;
    }

    public BatchExcelReportUtil getBatchExcelReportUtil() {
        if(null == batchExcelReportUtil) {
            batchExcelReportUtil = new BatchExcelReportUtil();
        }
        return batchExcelReportUtil;
    }

    public void setBatchExcelReportUtil(BatchExcelReportUtil batchExcelReportUtil) {
        this.batchExcelReportUtil = batchExcelReportUtil;
    }

    public BatchUtil getBatchUtil() {
        if(null == batchUtil) {
            batchUtil = new BatchUtil();
        }
        return batchUtil;
    }

    public void setBatchUtil(BatchUtil batchUtil) {
        this.batchUtil = batchUtil;
    }
}