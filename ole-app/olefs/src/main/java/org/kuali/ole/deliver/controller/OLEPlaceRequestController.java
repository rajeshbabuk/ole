package org.kuali.ole.deliver.controller;import org.apache.commons.lang.StringUtils;import org.kuali.ole.OLEConstants;import org.kuali.ole.deliver.bo.OleCirculationDesk;import org.kuali.ole.deliver.bo.OleDeliverRequestBo;import org.kuali.ole.deliver.bo.OlePatronDocument;import org.kuali.ole.deliver.bo.OleTitleLevelRequestItem;import org.kuali.ole.deliver.form.OLEPlaceRequestForm;import org.kuali.ole.deliver.processor.LoanProcessor;import org.kuali.ole.deliver.service.OleDeliverRequestDocumentHelperServiceImpl;import org.kuali.ole.docstore.common.client.DocstoreClientLocator;import org.kuali.ole.docstore.common.document.BibTree;import org.kuali.ole.docstore.common.document.HoldingsTree;import org.kuali.ole.docstore.common.document.Item;import org.kuali.ole.docstore.common.document.content.instance.xstream.ItemOlemlRecordProcessor;import org.kuali.ole.ncip.bo.OLEPlaceRequest;import org.kuali.ole.ncip.converter.OLEPlaceRequestConverter;import org.kuali.ole.ncip.service.OLECirculationService;import org.kuali.ole.ncip.service.impl.OLECirculationServiceImpl;import org.kuali.ole.service.OleCirculationPolicyService;import org.kuali.ole.service.OleCirculationPolicyServiceImpl;import org.kuali.ole.sys.context.SpringContext;import org.kuali.ole.util.StringUtil;import org.kuali.rice.kim.impl.identity.entity.EntityBo;import org.kuali.rice.krad.service.BusinessObjectService;import org.kuali.rice.krad.service.KRADServiceLocator;import org.kuali.rice.krad.util.GlobalVariables;import org.kuali.rice.krad.web.controller.UifControllerBase;import org.kuali.rice.krad.web.form.UifFormBase;import org.springframework.stereotype.Controller;import org.springframework.validation.BindingResult;import org.springframework.web.bind.annotation.ModelAttribute;import org.springframework.web.bind.annotation.RequestMapping;import org.springframework.web.servlet.ModelAndView;import javax.servlet.http.HttpServletRequest;import javax.servlet.http.HttpServletResponse;import java.util.ArrayList;import java.util.HashMap;import java.util.List;import java.util.Map;/** * Created by arunag on 12/16/14. */@Controller@RequestMapping(value = "/placeRequestController")public class OLEPlaceRequestController extends UifControllerBase{    private OLEPlaceRequestConverter olePlaceRequestConverter = new OLEPlaceRequestConverter();    private DocstoreClientLocator docstoreClientLocator;    private ItemOlemlRecordProcessor itemOlemlRecordProcessor;    private BusinessObjectService businessObjectService;    private OleCirculationPolicyService oleCirculationPolicyService;    private LoanProcessor loanProcessor = new LoanProcessor();    private OleDeliverRequestDocumentHelperServiceImpl oleDeliverRequestDocumentHelperService;    private OLECirculationService oleCirculationService ;    public DocstoreClientLocator getDocstoreClientLocator() {        if (docstoreClientLocator == null) {            docstoreClientLocator = SpringContext.getBean(DocstoreClientLocator.class);        }        return docstoreClientLocator;    }    public ItemOlemlRecordProcessor getItemOlemlRecordProcessor() {        if(itemOlemlRecordProcessor == null){            itemOlemlRecordProcessor = SpringContext.getBean(ItemOlemlRecordProcessor.class);        }        return itemOlemlRecordProcessor;    }    public BusinessObjectService getBusinessObjectService() {        if (null == businessObjectService) {            businessObjectService = KRADServiceLocator.getBusinessObjectService();        }        return businessObjectService;    }    public OleCirculationPolicyService getOleCirculationPolicyService() {        if (null == oleCirculationPolicyService) {            oleCirculationPolicyService = SpringContext.getBean(OleCirculationPolicyServiceImpl.class);        }        return oleCirculationPolicyService;    }    public LoanProcessor getLoanProcessor() {        return loanProcessor;    }    public void setDocstoreClientLocator(DocstoreClientLocator docstoreClientLocator) {        this.docstoreClientLocator = docstoreClientLocator;    }    public void setItemOlemlRecordProcessor(ItemOlemlRecordProcessor itemOlemlRecordProcessor) {        this.itemOlemlRecordProcessor = itemOlemlRecordProcessor;    }    public void setBusinessObjectService(BusinessObjectService businessObjectService) {        this.businessObjectService = businessObjectService;    }    public void setOleCirculationPolicyService(OleCirculationPolicyService oleCirculationPolicyService) {        this.oleCirculationPolicyService = oleCirculationPolicyService;    }    public void setLoanProcessor(LoanProcessor loanProcessor) {        this.loanProcessor = loanProcessor;    }    public OleDeliverRequestDocumentHelperServiceImpl getOleDeliverRequestDocumentHelperService() {        if(oleDeliverRequestDocumentHelperService == null){            this.oleDeliverRequestDocumentHelperService = new OleDeliverRequestDocumentHelperServiceImpl();        }        return oleDeliverRequestDocumentHelperService;    }    public void setOleDeliverRequestDocumentHelperService(OleDeliverRequestDocumentHelperServiceImpl oleDeliverRequestDocumentHelperService) {        this.oleDeliverRequestDocumentHelperService = oleDeliverRequestDocumentHelperService;    }    public OLECirculationService getOleCirculationService() {        if(oleCirculationService == null){            oleCirculationService = new OLECirculationServiceImpl();        }        return oleCirculationService;    }    public void setOleCirculationService(OLECirculationService oleCirculationService) {        this.oleCirculationService = oleCirculationService;    }    @Override    protected UifFormBase createInitialForm(HttpServletRequest request) {        return new OLEPlaceRequestForm();    }    @Override    @RequestMapping(params = "methodToCall=start")    public ModelAndView start(@ModelAttribute("KualiForm") UifFormBase form, BindingResult result,                              HttpServletRequest request, HttpServletResponse response) {        OLEPlaceRequestForm olePlaceRequestForm=(OLEPlaceRequestForm)form;        org.kuali.ole.docstore.common.document.Item item = null;        try {            item = getDocstoreClientLocator().getDocstoreClient().retrieveItem(olePlaceRequestForm.getItemId());        } catch (Exception e) {            e.printStackTrace();        }        org.kuali.ole.docstore.common.document.content.instance.Item itemContent = getItemOlemlRecordProcessor().fromXML(item.getContent());        olePlaceRequestForm.setTitle(item.getHolding().getBib().getTitle());        olePlaceRequestForm.setAuthor(item.getHolding().getBib().getAuthor());        olePlaceRequestForm.setHoldingId(item.getHolding().getId());        olePlaceRequestForm.setItemBarcode(itemContent.getAccessInformation().getBarcode());        olePlaceRequestForm.setItemLocation(item.getHolding().getLocationName());        olePlaceRequestForm.setItemStatus(itemContent.getItemStatus().getCodeValue());        if(olePlaceRequestForm.getItemStatus().equalsIgnoreCase("LOST")){                olePlaceRequestForm.setErrorMessage("Request cannot be placed for the lost item .");                 olePlaceRequestForm.setItemEligible(false);        }else if(itemContent.isClaimsReturnedFlag()){            olePlaceRequestForm.setErrorMessage("Item has been claimed returned .So request cannot be placed for this item");        olePlaceRequestForm.setItemEligible(false);        }        else if(itemContent.isMissingPieceFlag()){            olePlaceRequestForm.setErrorMessage("Missing piece flag has been enabled for this item .So request cannot be placed for this item");        olePlaceRequestForm.setItemEligible(false);        }    return getUIFModelAndView(form);    }    @RequestMapping(params = "methodToCall=confirmPatron")    public ModelAndView confirmPatron(@ModelAttribute("KualiForm") UifFormBase form, BindingResult result,                              HttpServletRequest request, HttpServletResponse response) throws Exception {        OLEPlaceRequestForm olePlaceRequestForm=(OLEPlaceRequestForm)form;        boolean isAddressVerified = false;        isAddressVerified = (boolean) getOleCirculationPolicyService().isAddressVerified(olePlaceRequestForm.getPatronId());        olePlaceRequestForm.setAddress(isAddressVerified);        olePlaceRequestForm.setProcessRequest(true);        Map<String,List<String>> requestStatusMap = getOleDeliverRequestDocumentHelperService().getItemStatusBasedOnRequestTypeMap();        if(requestStatusMap.get("recall").contains(olePlaceRequestForm.getItemStatus())){            olePlaceRequestForm.setRecallRequest(true);        }        if(requestStatusMap.get("hold").contains(olePlaceRequestForm.getItemStatus())){            olePlaceRequestForm.setHoldRequest(true);        }        if(requestStatusMap.get("page").contains(olePlaceRequestForm.getItemStatus())){            olePlaceRequestForm.setPageRequest(true);        }        if(requestStatusMap.get("copy").contains(olePlaceRequestForm.getItemStatus())){            olePlaceRequestForm.setCopyRequest(true);        }        String requestLevel =loanProcessor.getParameter("DEFAULT_REQUEST_LEVEL");        if(requestLevel.equalsIgnoreCase("Item")){            requestLevel = "itemLevel";        }else if(requestLevel.equalsIgnoreCase("Title")){            requestLevel = "titleLevel";        }        olePlaceRequestForm.setRequestLevel(requestLevel);        String titleLevelRequest =loanProcessor.getParameter("TITLE_LEVEL_REQUEST_INDICATOR");        if(titleLevelRequest!=null && titleLevelRequest.equalsIgnoreCase("Y")){            olePlaceRequestForm.setTitleLevelRequest(true);        }        return getUIFModelAndView(form);    }    @RequestMapping(params = "methodToCall=searchPatron")    public ModelAndView searchPatron(@ModelAttribute("KualiForm") UifFormBase form, BindingResult result,                                      HttpServletRequest request, HttpServletResponse response) throws Exception {        OLEPlaceRequestForm olePlaceRequestForm=(OLEPlaceRequestForm)form;        if (olePlaceRequestForm.getPatronBarcode()!=null && !olePlaceRequestForm.getPatronBarcode().isEmpty()) {            Map<String, String> patronMap = new HashMap<String, String>();            patronMap.put(OLEConstants.OleDeliverRequest.PATRON_BARCODE, olePlaceRequestForm.getPatronBarcode());            List<OlePatronDocument> olePatronDocumentList = (List<OlePatronDocument>) getBusinessObjectService().findMatching(OlePatronDocument.class, patronMap);            if (olePatronDocumentList != null && olePatronDocumentList.size() > 0) {                EntityBo entityBo = olePatronDocumentList.get(0).getEntity();                olePlaceRequestForm.setPatronType(olePatronDocumentList.get(0).getOleBorrowerType().getBorrowerTypeName());                olePlaceRequestForm.setPatronName(getLoanProcessor().getPatronName(entityBo));                olePlaceRequestForm.setPatronId(olePatronDocumentList.get(0).getOlePatronId());                olePlaceRequestForm.setPatronBarcode(olePatronDocumentList.get(0).getBarcode());                olePlaceRequestForm.setProcessRequest(false);                olePlaceRequestForm.setOlePatronDocument(olePatronDocumentList.get(0));            }        }     return getUIFModelAndView(form);    }    @RequestMapping(params = "methodToCall=refresh")    public ModelAndView refresh(@ModelAttribute("KualiForm") UifFormBase form, BindingResult result,                                HttpServletRequest request, HttpServletResponse response) throws Exception {        OLEPlaceRequestForm olePlaceRequestForm=(OLEPlaceRequestForm)form;        olePlaceRequestForm.setProcessRequest(false);        olePlaceRequestForm.setSuccessMessage(null);        olePlaceRequestForm.setErrorMessage(null);        return getUIFModelAndView(form);    }    @RequestMapping(params = "methodToCall=processRequest")    public ModelAndView processRequest(@ModelAttribute("KualiForm") UifFormBase form, BindingResult result,                                HttpServletRequest request, HttpServletResponse response) throws Exception {        OLEPlaceRequestForm olePlaceRequestForm=(OLEPlaceRequestForm)form;        return getUIFModelAndView(form);    }    @RequestMapping(params = "methodToCall=submit")    public ModelAndView submit(@ModelAttribute("KualiForm") UifFormBase form, BindingResult result,                                       HttpServletRequest request, HttpServletResponse response) throws Exception {        OLEPlaceRequestForm olePlaceRequestForm=(OLEPlaceRequestForm)form;        StringBuffer successMessageBuffer = new StringBuffer();        StringBuffer failureMessageBuffer = new StringBuffer();        olePlaceRequestForm.setErrorMessage(null);        olePlaceRequestForm.setSuccessMessage(null);        if(olePlaceRequestForm.getPickUpLocationId()!=null && !olePlaceRequestForm.getPickUpLocationId().trim().isEmpty()){            OleCirculationDesk oleCirculationDesks = KRADServiceLocator.getBusinessObjectService().findBySinglePrimaryKey(OleCirculationDesk.class,olePlaceRequestForm.getPickUpLocationId());            olePlaceRequestForm.setPickUpLocationCode(oleCirculationDesks.getCirculationDeskCode());        }        if(olePlaceRequestForm.getRecallRequestType()!=null){            olePlaceRequestForm.setRequestType("recall");        }else if(olePlaceRequestForm.getHoldRequestType()!=null){            olePlaceRequestForm.setRequestType("hold");        }else if(olePlaceRequestForm.getPageRequestType()!=null){            olePlaceRequestForm.setRequestType("page");        }else if(olePlaceRequestForm.getCopyRequestType()!=null){            olePlaceRequestForm.setRequestType("copy");        }        if(olePlaceRequestForm.getRequestType()==null || (olePlaceRequestForm.getRequestType()!=null && olePlaceRequestForm.getRequestType().trim().isEmpty())){            olePlaceRequestForm.setErrorMessage("Please select a request request type");            return getUIFModelAndView(form);        }        if(olePlaceRequestForm.getRequestType().equalsIgnoreCase("recall")){            if(olePlaceRequestForm.getPickUpLocationId()==null ||(olePlaceRequestForm.getPickUpLocationId()!=null &&  olePlaceRequestForm.getPickUpLocationId().trim().isEmpty())){                olePlaceRequestForm.setRequestType("Recall/Delivery Request");            }else{                olePlaceRequestForm.setRequestType("Recall/Hold Request");            }        }        if(olePlaceRequestForm.getRequestType().equalsIgnoreCase("hold")){            if(olePlaceRequestForm.getPickUpLocationId()==null ||(olePlaceRequestForm.getPickUpLocationId()!=null &&  olePlaceRequestForm.getPickUpLocationId().trim().isEmpty())){                olePlaceRequestForm.setRequestType("Hold/Delivery Request");            }else{                olePlaceRequestForm.setRequestType("Hold/Hold Request");            }        }        if(olePlaceRequestForm.getRequestType().equalsIgnoreCase("page")){            if(olePlaceRequestForm.getPickUpLocationId()==null ||(olePlaceRequestForm.getPickUpLocationId()!=null &&  olePlaceRequestForm.getPickUpLocationId().trim().isEmpty())){                olePlaceRequestForm.setRequestType("Page/Delivery Request");            }else{                olePlaceRequestForm.setRequestType("Page/Hold Request");            }        }        if(olePlaceRequestForm.getRequestType().equalsIgnoreCase("copy")){            olePlaceRequestForm.setRequestType("Copy Request");        }        if(olePlaceRequestForm.getRequestLevel().equals("itemLevel")){         String circulationResponse = getOleCirculationService().placeRequest(olePlaceRequestForm.getPatronBarcode(),"dev2",olePlaceRequestForm.getItemBarcode(),olePlaceRequestForm.getRequestType(),olePlaceRequestForm.getPickUpLocationCode(),olePlaceRequestForm.getItemLocation(),olePlaceRequestForm.getBibId(),"Item Level");            OLEPlaceRequest olePlaceRequest = (OLEPlaceRequest) olePlaceRequestConverter.generatePlaceRequestObject(circulationResponse);            if(olePlaceRequest.getMessage().contains(OLEConstants.RQST_SUCCESS)){                successMessageBuffer.append(olePlaceRequest.getMessage() + " with Barcode "+olePlaceRequestForm.getItemBarcode() +OLEConstants.BREAK);            }else{                failureMessageBuffer.append(olePlaceRequest.getMessage() + " with Item Barcode "+olePlaceRequestForm.getItemBarcode()+OLEConstants.BREAK);            }            olePlaceRequestForm.setErrorMessage(olePlaceRequest.getMessage());        }        if(olePlaceRequestForm.getRequestLevel().equals("titleLevel")){            try{                OLEPlaceRequest olePlaceRequest = null;                String circulationResponse = null;                if(olePlaceRequestForm.getTitleLevelRequestItems()!=null && olePlaceRequestForm.getTitleLevelRequestItems().size()>0){                  for(OleTitleLevelRequestItem oleTitleLevelRequestItem :olePlaceRequestForm.getTitleLevelRequestItems()){                      circulationResponse = getOleCirculationService().placeRequest(olePlaceRequestForm.getPatronBarcode(),"dev2",oleTitleLevelRequestItem.getItemBarcode(),olePlaceRequestForm.getRequestType(),olePlaceRequestForm.getPickUpLocationCode(),oleTitleLevelRequestItem.getItemLocation(),olePlaceRequestForm.getBibId(),"Title Level");                      olePlaceRequest = (OLEPlaceRequest) olePlaceRequestConverter.generatePlaceRequestObject(circulationResponse);                      if(olePlaceRequest.getMessage().contains(OLEConstants.RQST_SUCCESS)){                          successMessageBuffer.append(olePlaceRequest.getMessage() + " with Barcode "+oleTitleLevelRequestItem.getItemBarcode() +OLEConstants.BREAK);                      }else{                          failureMessageBuffer.append(olePlaceRequest.getMessage() + " with Item Barcode "+oleTitleLevelRequestItem.getItemBarcode()+OLEConstants.BREAK);                      }                  }                }else{                    olePlaceRequestForm.setErrorMessage("Please select an item for placing a request");                  return  getUIFModelAndView(form);                }           olePlaceRequestForm.setSuccessMessage(successMessageBuffer.toString());                olePlaceRequestForm.setErrorMessage(failureMessageBuffer.toString());            }catch(Exception e){                e.printStackTrace();            }        }        return getUIFModelAndView(form);    }    @RequestMapping(params = "methodToCall=getItemsForTitleLevelRequest")    public ModelAndView getItemsForTitleLevelRequest(@ModelAttribute("KualiForm") UifFormBase form, BindingResult result,                                       HttpServletRequest request, HttpServletResponse response) throws Exception {        OLEPlaceRequestForm olePlaceRequestForm=(OLEPlaceRequestForm)form;        String bibIb = olePlaceRequestForm.getBibId();        List<OleTitleLevelRequestItem> titleLevelRequestItems = new ArrayList<OleTitleLevelRequestItem>();        OleTitleLevelRequestItem oleTitleLevelRequestItem;        try{            OLEPlaceRequest olePlaceRequest = null;            String circulationResponse = null;            StringBuffer successMessageBuffer = new StringBuffer();            StringBuffer failureMessageBuffer = new StringBuffer();            BibTree bibTree =  getDocstoreClientLocator().getDocstoreClient().retrieveBibTree(bibIb);            if(bibTree!=null && bibTree.getHoldingsTrees()!=null){                for(HoldingsTree holdingsTree : bibTree.getHoldingsTrees()){                    if(holdingsTree!=null && holdingsTree.getItems()!=null){                        for(Item item : holdingsTree.getItems()){                            org.kuali.ole.docstore.common.document.content.instance.Item itemContent = getItemOlemlRecordProcessor().fromXML(item.getContent());                            if(itemContent.getAccessInformation()!=null && itemContent.getAccessInformation().getBarcode()!=null){                            oleTitleLevelRequestItem = new OleTitleLevelRequestItem();                            oleTitleLevelRequestItem.setItemStatus(itemContent.getItemStatus().getCodeValue());                            oleTitleLevelRequestItem.setHoldingsId(item.getHolding().getId());                            oleTitleLevelRequestItem.setItemBarcode(itemContent.getAccessInformation().getBarcode());                            oleTitleLevelRequestItem.setItemLocation(item.getHolding().getLocationName());                            oleTitleLevelRequestItem.setItemType(item.getItemType());                            titleLevelRequestItems.add(oleTitleLevelRequestItem);                            }                        }                    }                }            }            olePlaceRequestForm.setTitleLevelRequestItems(titleLevelRequestItems);        }catch(Exception e){            e.printStackTrace();        }        return getUIFModelAndView(form);    }    @RequestMapping(params = "methodToCall=getSelectedItemsFromResults")    public ModelAndView getSelectedItemsFromResults(@ModelAttribute("KualiForm") UifFormBase form, BindingResult result,                                                     HttpServletRequest request, HttpServletResponse response) throws Exception {        OLEPlaceRequestForm olePlaceRequestForm=(OLEPlaceRequestForm)form;        List<OleTitleLevelRequestItem> oleTitleLevelRequestItems = new ArrayList<>();        if(olePlaceRequestForm.getTitleLevelRequestItems()!=null && olePlaceRequestForm.getTitleLevelRequestItems().size()>0){            for(OleTitleLevelRequestItem oleTitleLevelRequestItem : olePlaceRequestForm.getTitleLevelRequestItems()){                if(oleTitleLevelRequestItem.isSelectedItem()){                    oleTitleLevelRequestItems.add(oleTitleLevelRequestItem);                }            }        }        olePlaceRequestForm.setTitleLevelRequestItems(oleTitleLevelRequestItems);        return getUIFModelAndView(form);    }    @RequestMapping(params = "methodToCall=clearItemsForTitleLevelRequest")    public ModelAndView clearItemsForTitleLevelRequest(@ModelAttribute("KualiForm") UifFormBase form, BindingResult result,                                                    HttpServletRequest request, HttpServletResponse response) throws Exception {        OLEPlaceRequestForm olePlaceRequestForm=(OLEPlaceRequestForm)form;        List<OleTitleLevelRequestItem> oleTitleLevelRequestItems = new ArrayList<>();        olePlaceRequestForm.setTitleLevelRequestItems(oleTitleLevelRequestItems);        return getUIFModelAndView(form);    }}