package org.kuali.ole.dsng.rest.handler.eholdings;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.codehaus.jettison.json.JSONObject;
import org.kuali.ole.docstore.engine.service.storage.rdbms.pojo.HoldingsRecord;
import org.kuali.ole.docstore.engine.service.storage.rdbms.pojo.OLEHoldingsDonorRecord;
import org.kuali.ole.dsng.rest.Exchange;
import org.kuali.ole.dsng.rest.handler.holdings.HoldingsHandler;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by SheikS on 12/31/2015.
 */
public class DonorNoteHandler extends HoldingsHandler {

    private final String TYPE = "Donor Note";

    @Override
    public Boolean isInterested(String operation) {
        return operation.equals(TYPE);
    }

    @Override
    public void process(JSONObject requestJsonObject, Exchange exchange) {
        HoldingsRecord holdingRecord = (HoldingsRecord) exchange.get("holdingsRecord");
        String donorNote = getStringValueFromJsonObject(requestJsonObject, TYPE);
        List<OLEHoldingsDonorRecord> donorList = holdingRecord.getDonorList();
        if(CollectionUtils.isNotEmpty(donorList)) {
            for (Iterator<OLEHoldingsDonorRecord> iterator = donorList.iterator(); iterator.hasNext(); ) {
                OLEHoldingsDonorRecord oleHoldingsDonorRecord = iterator.next();
                if(StringUtils.equals(oleHoldingsDonorRecord.getDonorPublicDisplay(),donorNote)) {
                    exchange.add("matchedItem", holdingRecord);
                    break;
                }
            }
        }
    }

    @Override
    public void processDataMappings(JSONObject requestJsonObject, Exchange exchange) {
        HoldingsRecord holdingRecord = (HoldingsRecord) exchange.get("holdingsRecord");
        String donorNote = getStringValueFromJsonObject(requestJsonObject, TYPE);
        List<OLEHoldingsDonorRecord> donorList = holdingRecord.getDonorList();
        if(CollectionUtils.isNotEmpty(donorList)) {
            for (Iterator<OLEHoldingsDonorRecord> iterator = donorList.iterator(); iterator.hasNext(); ) {
                OLEHoldingsDonorRecord oleHoldingsDonorRecord = iterator.next();
                oleHoldingsDonorRecord.setDonorNote(donorNote);
            }
        } else {
            donorList = new ArrayList<OLEHoldingsDonorRecord>();
            OLEHoldingsDonorRecord oleHoldingsDonorRecord = new OLEHoldingsDonorRecord();
            oleHoldingsDonorRecord.setDonorNote(donorNote);
            oleHoldingsDonorRecord.setHoldingsId(holdingRecord.getHoldingsId());
            oleHoldingsDonorRecord.setHoldingsRecord(holdingRecord);
            holdingRecord.setDonorList(donorList);
        }
    }
}