package org.kuali.ole.dsng.rest.handler.eholdings;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.codehaus.jettison.json.JSONObject;
import org.kuali.ole.docstore.engine.service.storage.rdbms.pojo.HoldingsNoteRecord;
import org.kuali.ole.docstore.engine.service.storage.rdbms.pojo.HoldingsRecord;
import org.kuali.ole.dsng.rest.Exchange;
import org.kuali.ole.dsng.rest.handler.holdings.HoldingsHandler;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by SheikS on 1/7/2016.
 */
public class PublicNoteHandler extends HoldingsHandler {

    private final String TYPE = "Public Note";

    @Override
    public Boolean isInterested(String operation) {
        return operation.equals(TYPE);
    }

    @Override
    public void process(JSONObject requestJsonObject, Exchange exchange) {
        HoldingsRecord holdingRecord = (HoldingsRecord) exchange.get("holdingsRecord");
        String publicNote = getStringValueFromJsonObject(requestJsonObject, TYPE);
        List<HoldingsNoteRecord> holdingsNoteRecords = holdingRecord.getHoldingsNoteRecords();
        if(CollectionUtils.isNotEmpty(holdingsNoteRecords)) {
            for (Iterator<HoldingsNoteRecord> iterator = holdingsNoteRecords.iterator(); iterator.hasNext(); ) {
                HoldingsNoteRecord holdingsNoteRecord = iterator.next();
                if(StringUtils.equals(holdingsNoteRecord.getType(),"public") &&
                        StringUtils.equals(holdingsNoteRecord.getNote(),publicNote)){
                    exchange.add("matchedHoldings", holdingRecord);
                }
            }
        }
    }

    @Override
    public void processDataMappings(JSONObject requestJsonObject, Exchange exchange) {
        HoldingsRecord holdingRecord = (HoldingsRecord) exchange.get("holdingsRecord");
        String publicNote = getStringValueFromJsonObject(requestJsonObject, TYPE);
        boolean isNoteFound = false;
        List<HoldingsNoteRecord> holdingsNoteRecords = holdingRecord.getHoldingsNoteRecords();
        if(CollectionUtils.isNotEmpty(holdingsNoteRecords)) {
            for (Iterator<HoldingsNoteRecord> iterator = holdingsNoteRecords.iterator(); iterator.hasNext(); ) {
                HoldingsNoteRecord holdingsNoteRecord = iterator.next();
                if(StringUtils.equals(holdingsNoteRecord.getType(),"public")){
                    holdingsNoteRecord.setNote(publicNote);
                    isNoteFound = true;
                }
            }
        }
        if(CollectionUtils.isEmpty(holdingsNoteRecords) || !isNoteFound) {
            holdingsNoteRecords = new ArrayList<HoldingsNoteRecord>();
            HoldingsNoteRecord holdingsNoteRecord = new HoldingsNoteRecord();
            holdingsNoteRecord.setNote(publicNote);
            holdingsNoteRecord.setType("public");
            holdingsNoteRecords.add(holdingsNoteRecord);
            holdingsNoteRecord.setHoldingsId(holdingRecord.getHoldingsId());
            holdingRecord.setHoldingsNoteRecords(holdingsNoteRecords);
        }
        exchange.add("holdingsRecord", holdingRecord);
    }
}