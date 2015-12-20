package org.kuali.ole.oleng.dao;

import org.kuali.ole.describe.bo.*;
import org.kuali.ole.select.bo.OLEDonor;

import java.util.List;

/**
 * Created by SheikS on 12/17/2015.
 */
public interface DescribeDAO {

    public List<OleShelvingScheme> fetchAllCallNumerTypes();
    public List<OleLocation> fetchAllLocations();
    public List<OleBibliographicRecordStatus> fetchAllBibStatus();
    public List<OleInstanceItemType> fetchAllItemType();
    public List<OLEDonor> fetchAllDonorCode();
    public List<OleItemAvailableStatus> fetchAllItemStatus();

}