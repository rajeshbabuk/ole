package org.kuali.ole.oleng.resolvers;

import org.kuali.ole.oleng.OleNGConstants;
import org.kuali.ole.pojo.OleTxRecord;

/**
 * Created by pvsubrah on 10/4/15.
 */
public class RequisitionSourceValueResolver extends TxValueResolver {
    @Override
    public boolean isInterested(String attributeName) {
        return attributeName.equalsIgnoreCase(OleNGConstants.BatchProcess.REQUISITION_SOURCE);
    }

    @Override
    public void setAttributeValue(OleTxRecord oleTxRecord, String attributeValue) {
        oleTxRecord.setRequisitionSource(attributeValue);
    }
}