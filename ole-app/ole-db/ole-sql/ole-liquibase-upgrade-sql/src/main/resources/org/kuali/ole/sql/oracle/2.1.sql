-- *********************************************************************
-- Update Database Script
-- *********************************************************************
-- Change Log: org/kuali/ole/2.1/db.changelog-20151123.xml
-- *********************************************************************

-- Lock Database
-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_LOAD_KRCR_PARM_T_oracle::ole
INSERT INTO KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID) VALUES ('OLE-DESC', 'Describe', 'HOLDINGS_CALL_NUMBER_TYPE', '5A689075D35B7AEBE0404F8189D81922', '1', 'CONFG', 'LCC', 'To set Holdings Default value in editor', 'A', 'KUALI')
/

INSERT INTO KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID) VALUES ('OLE-DESC', 'Describe', 'ITEM_CALL_NUMBER_TYPE', '5A689075D35B7AEBE0404F8189D81923', '1', 'CONFG', 'LCC', 'To set Item Default value in editor', 'A', 'KUALI')
/

INSERT INTO KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID) VALUES ('OLE-DESC', 'Describe', 'E-HOLDINGS_CALL_NUMBER_TYPE', '5A689075D35B7AEBE0404F8189D81924', '1', 'CONFG', 'LCC', 'To set Holdings Default value in editor', 'A', 'KUALI')
/

INSERT INTO KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID) VALUES ('OLE-DLVR', 'Deliver', 'RECEIPT_PRINTER_PAGE_SIZE', 'OLE7048', '1', 'CONFG', 'B7', 'This parameter value is used for configuring the page size for receipt printer.', 'A', 'OLE')
/

INSERT INTO KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID) VALUES ('OLE-DLVR', 'Deliver', 'RECEIPT_PRINTER_FONT_SIZE', 'OLE7049', '1', 'CONFG', '13', 'This parameter value is used for configuring the font size for receipt printer.', 'A', 'OLE')
/

INSERT INTO KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID) VALUES ('OLE-DLVR', 'Deliver', 'REGULAR_PRINTER_PAGE_SIZE', 'OLE7050', '1', 'CONFG', 'A4', 'This parameter value is used for configuring the page size for regular printer.', 'A', 'OLE')
/

INSERT INTO KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID) VALUES ('OLE-DLVR', 'Deliver', 'REGULAR_PRINTER_FONT_SIZE', 'OLE7051', '1', 'CONFG', '10', 'This parameter value is used for configuring the font size for regular printer.', 'A', 'OLE')
/

INSERT INTO KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID) VALUES ('OLE-DLVR', 'Deliver', 'FINE_CALC_WHILE_RENEW', 'OLE7052', '1', 'CONFG', 'false', 'This parameter value is used for configuring the system to calculate overdue fines while renew an item.', 'A', 'OLE')
/

INSERT INTO KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID) VALUES ('OLE-DESC', 'Describe', 'CALL_NUMBER_MIGRATION_CHUNK_SIZE', 'OLEDEC7047', '1', 'CONFG', '1000', 'To define call number migration Chunk Size', 'A', 'OLE')
/

INSERT INTO KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID) VALUES ('OLE-SELECT', 'Select', 'AUTO_CLOSE_PO_THREAD_POOL_SIZE', 'OLE7053', '1', 'CONFG', '5', 'To define the size of thread for auto close PO executor class', 'A', 'OLE')
/

INSERT INTO KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID) VALUES ('OLE-SELECT', 'Select', 'MAX_NO_OF_THREAD_FOR_ORDER_IMPORT', 'OLE7054', '1', 'CONFG', '10', 'This parameter is having option to set default number of thread for order import.', 'A', 'OLE')
/

INSERT INTO KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID) VALUES ('OLE-DESC', 'Describe', 'SRU_AVAILABLE_STATUSES', 'OLEDEC7055', '1', 'CONFG', 'AVAILABLE', 'To define the items statuses to which the sru response should responds as AVAILABLE item.You can provide multiple values with '';'' as separator', 'A', 'OLE')
/

INSERT INTO KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID) VALUES ('OLE-DESC', 'Describe', 'SRU_ON_HOLD_STATUSES', 'OLEDEC7056', '1', 'CONFG', 'ONHOLD', 'To define the items statuses to which the sru response should responds as ONHOLD item.You can provide multiple values with '';'' as separator', 'A', 'OLE')
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_LOAD_KRCR_PARM_T_oracle', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 1, '7:9e2b0fd838a0069d499c6a91e59728bd', 'loadData', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_KRCR_PARM_T::ole
UPDATE KRCR_PARM_T SET VAL = 'PO + 0 $' WHERE PARM_NM = 'REENCUMBER_RECURRING_ORDERS'
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_KRCR_PARM_T', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 2, '7:4b8bac07b079429600f713e4b495a922', 'update', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_DS_ITEM_T_ADD::ole
ALTER TABLE OLE_DS_ITEM_T ADD DESC_OF_PIECES VARCHAR2(400)
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_DS_ITEM_T_ADD', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 3, '7:9195e2f46e6a719bf93100823a3f6e31', 'addColumn', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::ITEM_AUDIT_T::ole
CREATE TABLE ITEM_AUDIT_T (AUDIT_ID NUMBER(10) NOT NULL, FOREIGN_KEY_REF NUMBER(10), ACTOR VARCHAR2(40), UPDATE_DATE TIMESTAMP, COLUMN_UPDATED VARCHAR2(40), COLUMN_VALUE BLOB, OBJ_ID VARCHAR2(36), VER_NBR DECIMAL(8), CONSTRAINT PK_ITEM_AUDIT_T PRIMARY KEY (AUDIT_ID))
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('ITEM_AUDIT_T', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 4, '7:c6426909901d1d50e0f7f4476e615658', 'createTable', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::ITEM_AUDIT_S::ole
CREATE SEQUENCE ITEM_AUDIT_S START WITH 1 INCREMENT BY 1 ORDER
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('ITEM_AUDIT_S', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 5, '7:fd527acefcf4c49add4a9ac71c8a55e9', 'createSequence', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::BIB_AUDIT_T::ole
CREATE TABLE BIB_AUDIT_T (AUDIT_ID NUMBER(10) NOT NULL, FOREIGN_KEY_REF NUMBER(10), ACTOR VARCHAR2(40), UPDATE_DATE TIMESTAMP, COLUMN_UPDATED VARCHAR2(40), COLUMN_VALUE BLOB, OBJ_ID VARCHAR2(36), VER_NBR DECIMAL(8), CONSTRAINT PK_BIB_AUDIT_T PRIMARY KEY (AUDIT_ID))
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('BIB_AUDIT_T', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 6, '7:1f3e9c6b844c26d85a4bf5577e4e7efa', 'createTable', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::BIB_AUDIT_S::ole
CREATE SEQUENCE BIB_AUDIT_S START WITH 1 INCREMENT BY 1 ORDER
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('BIB_AUDIT_S', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 7, '7:e039a5e8a1208884358b8dfa5c9c917f', 'createSequence', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::HOLDINGS_AUDIT_T::ole
CREATE TABLE HOLDINGS_AUDIT_T (AUDIT_ID NUMBER(10) NOT NULL, FOREIGN_KEY_REF NUMBER(10), ACTOR VARCHAR2(40), UPDATE_DATE TIMESTAMP, COLUMN_UPDATED VARCHAR2(40), COLUMN_VALUE BLOB, OBJ_ID VARCHAR2(36), VER_NBR DECIMAL(8), CONSTRAINT PK_HOLDINGS_AUDIT_T PRIMARY KEY (AUDIT_ID))
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('HOLDINGS_AUDIT_T', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 8, '7:458ea09629d0eb2d0ffe8b80da20c278', 'createTable', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::HOLDINGS_AUDIT_S::ole
CREATE SEQUENCE HOLDINGS_AUDIT_S START WITH 1 INCREMENT BY 1 ORDER
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('HOLDINGS_AUDIT_S', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 9, '7:39abd635b73322358845d51792de50ea', 'createSequence', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_BAT_PRCS_PRFLE_CNST_T_ATT_VAL_ORACLE::ole
ALTER TABLE OLE_BAT_PRCS_PRFLE_CNST_T MODIFY ATT_VAL varchar2(500)
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_BAT_PRCS_PRFLE_CNST_T_ATT_VAL_ORACLE', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 10, '7:edbb487537bc30b88b9f265c66a413c4', 'sql', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_DS_HOLDINGS_T_ADD_CANCELLATION_CANDIDATE::ole
ALTER TABLE OLE_DS_HOLDINGS_T ADD CANCELLATION_CANDIDATE CHAR(1)
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_DS_HOLDINGS_T_ADD_CANCELLATION_CANDIDATE', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 11, '7:6d78e0988ed6e5e10cf1735cd9ce8885', 'addColumn', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::RQST_NOTE_ADD::ole
ALTER TABLE OLE_DLVR_RQST_T ADD RQST_NOTE VARCHAR2(4000)
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('RQST_NOTE_ADD', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 12, '7:ce622f267ae14d2658c07d9acdb6e78b', 'addColumn', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_RETURN_HISTORY_T::ole
ALTER TABLE OLE_LOAN_INTRANSIT_HISTORY_T RENAME TO OLE_RETURN_HISTORY_T
/

ALTER TABLE OLE_RETURN_HISTORY_T ADD RETURNED_ITEM_STATUS VARCHAR2(200)
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_RETURN_HISTORY_T', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 13, '7:a37b0219bda47584d5ae2ac2ce763ecc', 'renameTable, addColumn', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_RETURN_HISTORY_S_ORACLE::ole
RENAME OLE_LOAN_INTRANSIT_HISTORY_S to OLE_RETURN_HISTORY_S
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_RETURN_HISTORY_S_ORACLE', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 14, '7:e22c261e82b2c6beada0c31cd4662b36', 'sql', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::ADD_RCP_ROLE_GROUP::ole
ALTER TABLE OLE_E_RES_REC_T ADD E_RES_RCP_ROLE_ID VARCHAR2(40)
/

ALTER TABLE OLE_E_RES_REC_T ADD E_RES_RCP_GROUP_ID VARCHAR2(40)
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('ADD_RCP_ROLE_GROUP', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 15, '7:56484a78acc4bb73efd16413743bd059', 'addColumn (x2)', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_PUR_RCVNG_LN_ITM_NTE_T::ole
ALTER TABLE OLE_PUR_RCVNG_LN_ITM_NTE_T ADD OLE_NTE_ACK VARCHAR2(1)
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_PUR_RCVNG_LN_ITM_NTE_T', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 16, '7:69c62075353f547b61cd4d47a7f2c965', 'addColumn', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::KRCR_PARM_T_UPDATE_PARAM_NAME::ole
UPDATE KRCR_PARM_T SET PARM_NM = 'EHOLDINGS_CALL_NUMBER_TYPE' WHERE NMSPC_CD ='OLE-DESC' and CMPNT_CD='Describe' and PARM_NM='E-HOLDINGS_CALL_NUMBER_TYPE' and APPL_ID='KUALI'
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('KRCR_PARM_T_UPDATE_PARAM_NAME', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 17, '7:6365723584c571cfdac7ea881ed255ac', 'update', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_DLVR_CIRC_RECORD_T1::ole
ALTER TABLE OLE_DLVR_CIRC_RECORD ADD ITEM_TYP_ID VARCHAR2(100)
/

ALTER TABLE OLE_DLVR_CIRC_RECORD ADD TEMP_ITEM_TYP_ID VARCHAR2(100)
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_DLVR_CIRC_RECORD_T1', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 18, '7:9d567dadcfeacc4f0a12ea062b594c65', 'addColumn', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_DLVR_RQST_T_ITEM_Q_INX_UK::ole
ALTER TABLE OLE_DLVR_RQST_T DROP CONSTRAINT OLE_DLVR_RQST_T_ITEM_Q_INX_UK DROP INDEX
/

ALTER TABLE OLE_DLVR_RQST_T ADD CONSTRAINT OLE_DLVR_RQST_T_ITEM_Q_INX_UK UNIQUE (OLE_PTRN_ID, PTRN_Q_POS, ITEM_UUID)
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_DLVR_RQST_T_ITEM_Q_INX_UK', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 19, '7:c70e809763a48c2df89dcaf89af2ffe3', 'dropUniqueConstraint, addUniqueConstraint', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_NG_BAT_PRF_T::ole
CREATE TABLE OLE_NG_BAT_PRF_T (PRF_ID NUMBER(10) NOT NULL, PRF_NM VARCHAR2(40), PRF_TYP VARCHAR2(40), CONTENT BLOB, OBJ_ID VARCHAR2(36), VER_NBR DECIMAL(8), CONSTRAINT PK_OLE_NG_BAT_PRF_T PRIMARY KEY (PRF_ID))
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_NG_BAT_PRF_T', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 20, '7:6a7d3940c0aaf6f4996b496aebfa3c36', 'createTable', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_NG_BAT_PRF_S::ole
CREATE SEQUENCE OLE_NG_BAT_PRF_S START WITH 1 INCREMENT BY 1 ORDER
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_NG_BAT_PRF_S', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 21, '7:325fb8c3c8d50a777901517ca27c0c4c', 'createSequence', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_NG_BAT_PRCS_JOB_T::ole
CREATE TABLE OLE_NG_BAT_PRCS_JOB_T (JOB_ID NUMBER(10) NOT NULL, JOB_NAME VARCHAR2(100), PROFILE_TYPE VARCHAR2(40), PRF_ID NUMBER(10), JOB_TYPE VARCHAR2(40), CRON_EXP VARCHAR2(100), CREATED_BY VARCHAR2(40), CREATED_ON TIMESTAMP, NEXT_RUN_TIME TIMESTAMP, OBJ_ID VARCHAR2(36), VER_NBR DECIMAL(8), CONSTRAINT PK_OLE_NG_BAT_PRCS_JOB_T PRIMARY KEY (JOB_ID))
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_NG_BAT_PRCS_JOB_T', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 22, '7:70fec36f51b792574b7cc78869bd00e3', 'createTable', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_NG_BAT_PRCS_JOB_S::ole
CREATE SEQUENCE OLE_NG_BAT_PRCS_JOB_S START WITH 1 INCREMENT BY 1 ORDER
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_NG_BAT_PRCS_JOB_S', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 23, '7:9eafcc49595d855e7f55207488c074a5', 'createSequence', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_NG_BAT_JOB_DETAILS_T::ole
CREATE TABLE OLE_NG_BAT_JOB_DETAILS_T (JOB_DETAIL_ID NUMBER(10) NOT NULL, JOB_NAME VARCHAR2(100), JOB_ID NUMBER(10), PROFILE_TYPE VARCHAR2(40), PROFILE_NAME VARCHAR2(100), CREATED_BY VARCHAR2(40), START_TIME TIMESTAMP, END_TIME TIMESTAMP, PER_COMPLETED VARCHAR2(40), TIME_SPENT VARCHAR2(40), TOTAL_RECORDS VARCHAR2(40), TOTAL_RECORDS_PRCSD VARCHAR2(40), STATUS VARCHAR2(40), OBJ_ID VARCHAR2(36), VER_NBR DECIMAL(8), CONSTRAINT PK_OLE_NG_BAT_JOB_DETAILS_T PRIMARY KEY (JOB_DETAIL_ID))
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_NG_BAT_JOB_DETAILS_T', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 24, '7:b6c4509ac50869d75760e8a7f545d29b', 'createTable', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_NG_BAT_JOB_DETAILS_S::ole
CREATE SEQUENCE OLE_NG_BAT_JOB_DETAILS_S START WITH 1 INCREMENT BY 1 ORDER
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_NG_BAT_JOB_DETAILS_S', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 25, '7:9af29a082688e7225d21cd14a198ec46', 'createSequence', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_NG_BAT_PRF_ID_FK::ole
ALTER TABLE ole.OLE_NG_BAT_PRCS_JOB_T ADD CONSTRAINT OLE_NG_BAT_PRF_ID_FK FOREIGN KEY (PRF_ID) REFERENCES OLE_NG_BAT_PRF_T (PRF_ID) ON DELETE CASCADE
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_NG_BAT_PRF_ID_FK', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 26, '7:85d85111e729dc5d2177122b215e606e', 'addForeignKeyConstraint', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_NG_BAT_PRCS_ID_FK::ole
ALTER TABLE ole.OLE_NG_BAT_JOB_DETAILS_T ADD CONSTRAINT OLE_NG_BAT_PRCS_ID_FK FOREIGN KEY (JOB_ID) REFERENCES OLE_NG_BAT_PRCS_JOB_T (JOB_ID) ON DELETE CASCADE
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_NG_BAT_PRCS_ID_FK', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 27, '7:ca9b264632f1bdf7b3e6b244502bc67a', 'addForeignKeyConstraint', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_DLVR_PTRN_BILL_FEE_TYP_T_ITM::ole
ALTER TABLE OLE_DLVR_PTRN_BILL_FEE_TYP_T ADD ITM_TITLE VARCHAR2(600)
/

ALTER TABLE OLE_DLVR_PTRN_BILL_FEE_TYP_T ADD ITM_AUTHOR VARCHAR2(200)
/

ALTER TABLE OLE_DLVR_PTRN_BILL_FEE_TYP_T ADD ITM_TYPE VARCHAR2(100)
/

ALTER TABLE OLE_DLVR_PTRN_BILL_FEE_TYP_T ADD ITM_CALL_NUM VARCHAR2(100)
/

ALTER TABLE OLE_DLVR_PTRN_BILL_FEE_TYP_T ADD ITM_COPY_NUM VARCHAR2(20)
/

ALTER TABLE OLE_DLVR_PTRN_BILL_FEE_TYP_T ADD ITM_ENUM VARCHAR2(100)
/

ALTER TABLE OLE_DLVR_PTRN_BILL_FEE_TYP_T ADD ITM_CHRON VARCHAR2(100)
/

ALTER TABLE OLE_DLVR_PTRN_BILL_FEE_TYP_T ADD ITM_LOC VARCHAR2(600)
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_DLVR_PTRN_BILL_FEE_TYP_T_ITM', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 28, '7:8fc0b96b237eff80597b9a00961ea541', 'addColumn', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_DLVR_RQST_T_ORACLE::ole
ALTER TABLE OLE_DLVR_RQST_T MODIFY CRTE_DT_TIME TIMESTAMP
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_DLVR_RQST_T_ORACLE', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 29, '7:8d7e4c3b76c9cefa84fa97188bc19d79', 'sql', '', 'EXECUTED', '3.2.0')
/

-- Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_DLVR_RQST_HSTRY_REC_T_ORACLE::ole
ALTER TABLE OLE_DLVR_RQST_HSTRY_REC_T MODIFY CRTE_DT_TIME TIMESTAMP
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_DLVR_RQST_HSTRY_REC_T_ORACLE', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', SYSTIMESTAMP, 30, '7:a2967d45d609dee7e80167faf8040504', 'sql', '', 'EXECUTED', '3.2.0')
/

-- Release Database Lock
-- Release Database Lock
