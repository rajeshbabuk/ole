--  *********************************************************************
--  Update Database Script
--  *********************************************************************
--  Change Log: org/kuali/ole/2.1/db.changelog-20151123.xml
--  *********************************************************************

--  Lock Database
--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_LOAD_KRCR_PARM_T_mysql::ole
SET sql_mode='NO_BACKSLASH_ESCAPES'
/

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

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_LOAD_KRCR_PARM_T_mysql', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 1, '7:5cc4778c41ca7986d8ac42b23d30289d', 'sql, loadData', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_KRCR_PARM_T::ole
UPDATE KRCR_PARM_T SET VAL = 'PO + 0 $' WHERE PARM_NM = 'REENCUMBER_RECURRING_ORDERS'
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_KRCR_PARM_T', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 2, '7:4b8bac07b079429600f713e4b495a922', 'update', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_DS_ITEM_T_ADD::ole
ALTER TABLE OLE_DS_ITEM_T ADD DESC_OF_PIECES VARCHAR(400) NULL
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_DS_ITEM_T_ADD', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 3, '7:9195e2f46e6a719bf93100823a3f6e31', 'addColumn', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::ITEM_AUDIT_T::ole
CREATE TABLE ITEM_AUDIT_T (AUDIT_ID INT(10) NOT NULL, FOREIGN_KEY_REF INT(40) NULL, ACTOR VARCHAR(40) NULL, UPDATE_DATE TIMESTAMP NULL, COLUMN_UPDATED VARCHAR(40) NULL, COLUMN_VALUE BLOB NULL, OBJ_ID VARCHAR(36) NULL, VER_NBR DECIMAL(8) NULL, CONSTRAINT PK_ITEM_AUDIT_T PRIMARY KEY (AUDIT_ID))
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('ITEM_AUDIT_T', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 4, '7:c6426909901d1d50e0f7f4476e615658', 'createTable', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::ITEM_AUDIT_S::ole
CREATE TABLE ITEM_AUDIT_S (ID BIGINT(19) NOT NULL, CONSTRAINT PK_ITEM_AUDIT_S PRIMARY KEY (ID))
/

ALTER TABLE ITEM_AUDIT_S MODIFY ID BIGINT(19) AUTO_INCREMENT
/

ALTER TABLE ITEM_AUDIT_S AUTO_INCREMENT=1
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('ITEM_AUDIT_S', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 5, '7:9bcdc626e01c62324d3215a7ff3188af', 'createTable, addAutoIncrement', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::BIB_AUDIT_T::ole
CREATE TABLE BIB_AUDIT_T (AUDIT_ID INT(10) NOT NULL, FOREIGN_KEY_REF INT(40) NULL, ACTOR VARCHAR(40) NULL, UPDATE_DATE TIMESTAMP NULL, COLUMN_UPDATED VARCHAR(40) NULL, COLUMN_VALUE BLOB NULL, OBJ_ID VARCHAR(36) NULL, VER_NBR DECIMAL(8) NULL, CONSTRAINT PK_BIB_AUDIT_T PRIMARY KEY (AUDIT_ID))
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('BIB_AUDIT_T', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 6, '7:1f3e9c6b844c26d85a4bf5577e4e7efa', 'createTable', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::BIB_AUDIT_S::ole
CREATE TABLE BIB_AUDIT_S (ID BIGINT(19) NOT NULL, CONSTRAINT PK_BIB_AUDIT_S PRIMARY KEY (ID))
/

ALTER TABLE BIB_AUDIT_S MODIFY ID BIGINT(19) AUTO_INCREMENT
/

ALTER TABLE BIB_AUDIT_S AUTO_INCREMENT=1
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('BIB_AUDIT_S', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 7, '7:f05c53d8c16e2e14f32fa0ceb3e6a522', 'createTable, addAutoIncrement', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::HOLDINGS_AUDIT_T::ole
CREATE TABLE HOLDINGS_AUDIT_T (AUDIT_ID INT(10) NOT NULL, FOREIGN_KEY_REF INT(40) NULL, ACTOR VARCHAR(40) NULL, UPDATE_DATE TIMESTAMP NULL, COLUMN_UPDATED VARCHAR(40) NULL, COLUMN_VALUE BLOB NULL, OBJ_ID VARCHAR(36) NULL, VER_NBR DECIMAL(8) NULL, CONSTRAINT PK_HOLDINGS_AUDIT_T PRIMARY KEY (AUDIT_ID))
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('HOLDINGS_AUDIT_T', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 8, '7:458ea09629d0eb2d0ffe8b80da20c278', 'createTable', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::HOLDINGS_AUDIT_S::ole
CREATE TABLE HOLDINGS_AUDIT_S (ID BIGINT(19) NOT NULL, CONSTRAINT PK_HOLDINGS_AUDIT_S PRIMARY KEY (ID))
/

ALTER TABLE HOLDINGS_AUDIT_S MODIFY ID BIGINT(19) AUTO_INCREMENT
/

ALTER TABLE HOLDINGS_AUDIT_S AUTO_INCREMENT=1
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('HOLDINGS_AUDIT_S', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 9, '7:2e0e5c4d5c6511f403f1f7b82f239462', 'createTable, addAutoIncrement', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_BAT_PRCS_PRFLE_CNST_T_ATT_VAL_MYSQL::ole
ALTER TABLE OLE_BAT_PRCS_PRFLE_CNST_T MODIFY ATT_VAL varchar(500)
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_BAT_PRCS_PRFLE_CNST_T_ATT_VAL_MYSQL', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 10, '7:1493697f04debf4577b4234340847e0a', 'sql', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_DS_HOLDINGS_T_ADD_CANCELLATION_CANDIDATE::ole
ALTER TABLE OLE_DS_HOLDINGS_T ADD CANCELLATION_CANDIDATE CHAR(1) NULL
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_DS_HOLDINGS_T_ADD_CANCELLATION_CANDIDATE', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 11, '7:6d78e0988ed6e5e10cf1735cd9ce8885', 'addColumn', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::RQST_NOTE_ADD::ole
ALTER TABLE OLE_DLVR_RQST_T ADD RQST_NOTE VARCHAR(4000) NULL
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('RQST_NOTE_ADD', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 12, '7:ce622f267ae14d2658c07d9acdb6e78b', 'addColumn', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_RETURN_HISTORY_T::ole
ALTER TABLE OLE_LOAN_INTRANSIT_HISTORY_T RENAME OLE_RETURN_HISTORY_T
/

ALTER TABLE OLE_RETURN_HISTORY_T ADD RETURNED_ITEM_STATUS VARCHAR(200) NULL
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_RETURN_HISTORY_T', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 13, '7:a37b0219bda47584d5ae2ac2ce763ecc', 'renameTable, addColumn', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_RETURN_HISTORY_S_MYSQL::ole
ALTER TABLE OLE_LOAN_INTRANSIT_HISTORY_S RENAME OLE_RETURN_HISTORY_S
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_RETURN_HISTORY_S_MYSQL', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 14, '7:06a0fb708c903b0b1e1b29a0b2becbeb', 'renameTable', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::ADD_RCP_ROLE_GROUP::ole
ALTER TABLE OLE_E_RES_REC_T ADD E_RES_RCP_ROLE_ID VARCHAR(40) NULL
/

ALTER TABLE OLE_E_RES_REC_T ADD E_RES_RCP_GROUP_ID VARCHAR(40) NULL
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('ADD_RCP_ROLE_GROUP', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 15, '7:56484a78acc4bb73efd16413743bd059', 'addColumn (x2)', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_PUR_RCVNG_LN_ITM_NTE_T::ole
ALTER TABLE OLE_PUR_RCVNG_LN_ITM_NTE_T ADD OLE_NTE_ACK VARCHAR(1) NULL
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_PUR_RCVNG_LN_ITM_NTE_T', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 16, '7:69c62075353f547b61cd4d47a7f2c965', 'addColumn', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::KRCR_PARM_T_UPDATE_PARAM_NAME::ole
UPDATE KRCR_PARM_T SET PARM_NM = 'EHOLDINGS_CALL_NUMBER_TYPE' WHERE NMSPC_CD ='OLE-DESC' and CMPNT_CD='Describe' and PARM_NM='E-HOLDINGS_CALL_NUMBER_TYPE' and APPL_ID='KUALI'
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('KRCR_PARM_T_UPDATE_PARAM_NAME', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 17, '7:6365723584c571cfdac7ea881ed255ac', 'update', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_DLVR_CIRC_RECORD_T1::ole
ALTER TABLE OLE_DLVR_CIRC_RECORD ADD ITEM_TYP_ID VARCHAR(100) NULL
/

ALTER TABLE OLE_DLVR_CIRC_RECORD ADD TEMP_ITEM_TYP_ID VARCHAR(100) NULL
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_DLVR_CIRC_RECORD_T1', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 18, '7:9d567dadcfeacc4f0a12ea062b594c65', 'addColumn', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_DLVR_RQST_T_ITEM_Q_INX_UK::ole
ALTER TABLE OLE_DLVR_RQST_T DROP KEY OLE_DLVR_RQST_T_ITEM_Q_INX_UK
/

ALTER TABLE OLE_DLVR_RQST_T ADD CONSTRAINT OLE_DLVR_RQST_T_ITEM_Q_INX_UK UNIQUE (OLE_PTRN_ID, PTRN_Q_POS, ITEM_UUID)
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_DLVR_RQST_T_ITEM_Q_INX_UK', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 19, '7:c70e809763a48c2df89dcaf89af2ffe3', 'dropUniqueConstraint, addUniqueConstraint', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_NG_BAT_PRF_T::ole
CREATE TABLE OLE_NG_BAT_PRF_T (PRF_ID INT(10) NOT NULL, PRF_NM VARCHAR(40) NULL, PRF_TYP VARCHAR(40) NULL, CONTENT BLOB NULL, OBJ_ID VARCHAR(36) NULL, VER_NBR DECIMAL(8) NULL, CONSTRAINT PK_OLE_NG_BAT_PRF_T PRIMARY KEY (PRF_ID))
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_NG_BAT_PRF_T', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 20, '7:6a7d3940c0aaf6f4996b496aebfa3c36', 'createTable', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_NG_BAT_PRF_S::ole
CREATE TABLE OLE_NG_BAT_PRF_S (ID BIGINT(19) NOT NULL, CONSTRAINT PK_OLE_NG_BAT_PRF_S PRIMARY KEY (ID))
/

ALTER TABLE OLE_NG_BAT_PRF_S MODIFY ID BIGINT(19) AUTO_INCREMENT
/

ALTER TABLE OLE_NG_BAT_PRF_S AUTO_INCREMENT=1
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_NG_BAT_PRF_S', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 21, '7:205281d250bb22b96e4f33fff208cb13', 'createTable, addAutoIncrement', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_NG_BAT_PRCS_JOB_T::ole
CREATE TABLE OLE_NG_BAT_PRCS_JOB_T (JOB_ID INT(10) NOT NULL, JOB_NAME VARCHAR(100) NULL, PROFILE_TYPE VARCHAR(40) NULL, PRF_ID INT(10) NULL, JOB_TYPE VARCHAR(40) NULL, CRON_EXP VARCHAR(100) NULL, CREATED_BY VARCHAR(40) NULL, CREATED_ON TIMESTAMP NULL, NEXT_RUN_TIME TIMESTAMP NULL, OBJ_ID VARCHAR(36) NULL, VER_NBR DECIMAL(8) NULL, CONSTRAINT PK_OLE_NG_BAT_PRCS_JOB_T PRIMARY KEY (JOB_ID))
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_NG_BAT_PRCS_JOB_T', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 22, '7:70fec36f51b792574b7cc78869bd00e3', 'createTable', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_NG_BAT_PRCS_JOB_S::ole
CREATE TABLE OLE_NG_BAT_PRCS_JOB_S (ID BIGINT(19) NOT NULL, CONSTRAINT PK_OLE_NG_BAT_PRCS_JOB_S PRIMARY KEY (ID))
/

ALTER TABLE OLE_NG_BAT_PRCS_JOB_S MODIFY ID BIGINT(19) AUTO_INCREMENT
/

ALTER TABLE OLE_NG_BAT_PRCS_JOB_S AUTO_INCREMENT=1
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_NG_BAT_PRCS_JOB_S', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 23, '7:bad0876169dce6a500a27f2575e9554e', 'createTable, addAutoIncrement', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_NG_BAT_JOB_DETAILS_T::ole
CREATE TABLE OLE_NG_BAT_JOB_DETAILS_T (JOB_DETAIL_ID INT(10) NOT NULL, JOB_NAME VARCHAR(100) NULL, JOB_ID INT(10) NULL, PROFILE_TYPE VARCHAR(40) NULL, PROFILE_NAME VARCHAR(100) NULL, CREATED_BY VARCHAR(40) NULL, START_TIME TIMESTAMP NULL, END_TIME TIMESTAMP NULL, PER_COMPLETED VARCHAR(40) NULL, TIME_SPENT VARCHAR(40) NULL, TOTAL_RECORDS VARCHAR(40) NULL, TOTAL_RECORDS_PRCSD VARCHAR(40) NULL, STATUS VARCHAR(40) NULL, OBJ_ID VARCHAR(36) NULL, VER_NBR DECIMAL(8) NULL, CONSTRAINT PK_OLE_NG_BAT_JOB_DETAILS_T PRIMARY KEY (JOB_DETAIL_ID))
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_NG_BAT_JOB_DETAILS_T', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 24, '7:b6c4509ac50869d75760e8a7f545d29b', 'createTable', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_NG_BAT_JOB_DETAILS_S::ole
CREATE TABLE OLE_NG_BAT_JOB_DETAILS_S (ID BIGINT(19) NOT NULL, CONSTRAINT PK_OLE_NG_BAT_JOB_DETAILS_S PRIMARY KEY (ID))
/

ALTER TABLE OLE_NG_BAT_JOB_DETAILS_S MODIFY ID BIGINT(19) AUTO_INCREMENT
/

ALTER TABLE OLE_NG_BAT_JOB_DETAILS_S AUTO_INCREMENT=1
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_NG_BAT_JOB_DETAILS_S', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 25, '7:81cf5b29b89632c82926b168d52a4e28', 'createTable, addAutoIncrement', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_NG_BAT_PRF_ID_FK::ole
ALTER TABLE ole.OLE_NG_BAT_PRCS_JOB_T ADD CONSTRAINT OLE_NG_BAT_PRF_ID_FK FOREIGN KEY (PRF_ID) REFERENCES OLE_NG_BAT_PRF_T (PRF_ID) ON UPDATE RESTRICT ON DELETE CASCADE
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_NG_BAT_PRF_ID_FK', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 26, '7:85d85111e729dc5d2177122b215e606e', 'addForeignKeyConstraint', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_NG_BAT_PRCS_ID_FK::ole
ALTER TABLE ole.OLE_NG_BAT_JOB_DETAILS_T ADD CONSTRAINT OLE_NG_BAT_PRCS_ID_FK FOREIGN KEY (JOB_ID) REFERENCES OLE_NG_BAT_PRCS_JOB_T (JOB_ID) ON UPDATE RESTRICT ON DELETE CASCADE
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_NG_BAT_PRCS_ID_FK', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 27, '7:ca9b264632f1bdf7b3e6b244502bc67a', 'addForeignKeyConstraint', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_DLVR_PTRN_BILL_FEE_TYP_T_ITM::ole
ALTER TABLE OLE_DLVR_PTRN_BILL_FEE_TYP_T ADD ITM_TITLE VARCHAR(600) NULL
/

ALTER TABLE OLE_DLVR_PTRN_BILL_FEE_TYP_T ADD ITM_AUTHOR VARCHAR(200) NULL
/

ALTER TABLE OLE_DLVR_PTRN_BILL_FEE_TYP_T ADD ITM_TYPE VARCHAR(100) NULL
/

ALTER TABLE OLE_DLVR_PTRN_BILL_FEE_TYP_T ADD ITM_CALL_NUM VARCHAR(100) NULL
/

ALTER TABLE OLE_DLVR_PTRN_BILL_FEE_TYP_T ADD ITM_COPY_NUM VARCHAR(20) NULL
/

ALTER TABLE OLE_DLVR_PTRN_BILL_FEE_TYP_T ADD ITM_ENUM VARCHAR(100) NULL
/

ALTER TABLE OLE_DLVR_PTRN_BILL_FEE_TYP_T ADD ITM_CHRON VARCHAR(100) NULL
/

ALTER TABLE OLE_DLVR_PTRN_BILL_FEE_TYP_T ADD ITM_LOC VARCHAR(600) NULL
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_DLVR_PTRN_BILL_FEE_TYP_T_ITM', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 28, '7:8fc0b96b237eff80597b9a00961ea541', 'addColumn', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_DLVR_RQST_T_MYSQL::ole
ALTER TABLE OLE_DLVR_RQST_T MODIFY CRTE_DT_TIME TIMESTAMP
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_DLVR_RQST_T_MYSQL', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 29, '7:8d7e4c3b76c9cefa84fa97188bc19d79', 'sql', '', 'EXECUTED', '3.2.0')
/

--  Changeset org/kuali/ole/2.1/db.changelog-20151123.xml::OLE_DLVR_RQST_HSTRY_REC_T_MYSQL::ole
ALTER TABLE OLE_DLVR_RQST_HSTRY_REC_T MODIFY CRTE_DT_TIME TIMESTAMP
/

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('OLE_DLVR_RQST_HSTRY_REC_T_MYSQL', 'ole', 'org/kuali/ole/2.1/db.changelog-20151123.xml', NOW(), 30, '7:a2967d45d609dee7e80167faf8040504', 'sql', '', 'EXECUTED', '3.2.0')
/

--  Release Database Lock
--  Release Database Lock
