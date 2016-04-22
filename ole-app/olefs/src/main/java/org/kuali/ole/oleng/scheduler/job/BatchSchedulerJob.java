package org.kuali.ole.oleng.scheduler.job;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.codehaus.jettison.json.JSONObject;
import org.kuali.ole.constants.OleNGConstants;
import org.kuali.ole.docstore.common.util.BusinessObjectServiceHelperUtil;
import org.kuali.ole.oleng.batch.process.model.BatchJobDetails;
import org.kuali.ole.oleng.batch.process.model.BatchProcessJob;
import org.kuali.ole.spring.batch.BatchUtil;
import org.kuali.ole.spring.batch.processor.BatchFileProcessor;
import org.kuali.rice.core.api.config.property.ConfigContext;
import org.kuali.rice.krad.UserSession;
import org.kuali.rice.krad.util.GlobalVariables;
import org.quartz.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * Created by SheikS on 4/15/2016.
 */
public class BatchSchedulerJob extends BusinessObjectServiceHelperUtil implements Job {

    private static final Logger LOG = Logger.getLogger(BatchSchedulerJob.class);

    private BatchUtil batchUtil;

    public void execute(JobExecutionContext context)
            throws JobExecutionException {
        try {
            JobDetail jobDetail = context.getJobDetail();
            LOG.info("Job Initiated : " + jobDetail.getName());
            JobDataMap jobDataMap = jobDetail.getJobDataMap();
            BatchFileProcessor processor = (BatchFileProcessor) jobDataMap.get(OleNGConstants.PROCESSOR);
            long jobId = (Long) jobDataMap.get(OleNGConstants.JOB_ID);
            String principalName = (String) jobDataMap.get(OleNGConstants.PRINCIPAL_NAME);
            GlobalVariables.setUserSession(new UserSession(principalName));
            if(null != processor) {
                String schedulerUploadLocation = ConfigContext.getCurrentContextConfig().getProperty("schedulerUploadLocation");
                File schedulerFileUploadLocation = new File(schedulerUploadLocation, String.valueOf(jobId));
                File file = getFileName(schedulerFileUploadLocation);
                if (null != file) {
                    File uploadedFileDirecotry = storeUploadedFileToFileSystem(file);
                    if(null != uploadedFileDirecotry) {
                        String fileName = file.getName();
                        String extension = FilenameUtils.getExtension(fileName);
                        BatchProcessJob batchProcessJobById = getBatchUtil().getBatchProcessJobById(jobId);
                        BatchJobDetails batchJobDetails = getBatchUtil().createBatchJobDetailsEntry(batchProcessJobById, fileName);
                        getBusinessObjectService().save(batchJobDetails);
                        try {
                            processBatch(processor, uploadedFileDirecotry, String.valueOf(batchProcessJobById.getBatchProfileId()), extension, batchJobDetails);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private File getFileName(File uploadedFileDirecotry) {
        File[] files = uploadedFileDirecotry.listFiles();
        if(files != null && files.length > 0) {
            return files[0];
        }
        return null;
    }

    private void processBatch(BatchFileProcessor batchFileProcessor, File uploadDirectory, String profileId, String fileExtension,
                                    BatchJobDetails batchJobDetails) throws Exception {
        long jobDetailsId = batchJobDetails.getJobDetailId();
        String reportDirectory = (jobDetailsId != 0) ? String.valueOf(jobDetailsId) : OleNGConstants.QUICK_LAUNCH + OleNGConstants.DATE_FORMAT.format(new Date());

        JSONObject response = batchFileProcessor.processBatch(uploadDirectory, fileExtension, profileId,reportDirectory, batchJobDetails);
        if (batchJobDetails.getJobId() != 0 && batchJobDetails.getJobDetailId() != 0) {
            getBusinessObjectService().save(batchJobDetails);
        }
    }

    private File storeUploadedFileToFileSystem(File file){
        String batchUploadLocation = getBatchUploadLocation();
        if(StringUtils.isNotBlank(batchUploadLocation)) {
            batchUploadLocation = batchUploadLocation + File.separator + OleNGConstants.DATE_FORMAT.format(new Date());
            File uploadDirectory = new File(batchUploadLocation);
            try {
                FileUtils.moveFileToDirectory(file, uploadDirectory, true);
                return uploadDirectory;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    private String getBatchUploadLocation() {
        return ConfigContext.getCurrentContextConfig().getProperty("batchUploadLocation");
    }

    public BatchUtil getBatchUtil() {
        if(null == batchUtil) {
            batchUtil = new BatchUtil();
        }
        return batchUtil;
    }

}
