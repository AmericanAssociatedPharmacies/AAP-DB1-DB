USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[spaap_create_PM_Compare_Tables]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <03/05/2010>
-- Description:	Create Compare tables from the backups
-- =============================================
CREATE PROCEDURE [dbo].[spaap_create_PM_Compare_Tables]

AS
	BEGIN
 
 
-- Compare for API Data

   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'CompareAPI')
          DROP TABLE CompareAPI
 

SELECT * into aap..CompareAPI from (

SELECT MIN(TableName) as TableName,  count(*) 
NDUPS,AccountNo,AccountName,Addr1,Addr2,City,State,Zip,ContactFullName,Territory,
QPS,APIMemberNo,BusinessClass,Phone,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,StateLicNo,StateLicExpDate,FedID,Status,CAHStatus,
CardinalDC,PrimaryCAAccountNo,ContractDate,Source,CustPayTermsAPI,APIStatus,AllowDupDEA
FROM
(

  SELECT 'Outdated_APIData' as TableName, count(*) NDUPS, AccountNo,AccountName,Addr1,Addr2,City,State,Zip,ContactFullName,Territory,
QPS,APIMemberNo,BusinessClass,Phone,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,StateLicNo,StateLicExpDate,FedID,Status,CAHStatus,
CardinalDC,PrimaryCAAccountNo,ContractDate,Source,CustPayTermsAPI,APIStatus,AllowDupDEA

  FROM api..apiaccountmaster_orig_bkp A
    GROUP BY 
AccountNo,AccountName,Addr1,Addr2,City,State,Zip,ContactFullName,Territory,
QPS,APIMemberNo,BusinessClass,Phone,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,StateLicNo,StateLicExpDate,FedID,Status,CAHStatus,
CardinalDC,PrimaryCAAccountNo,ContractDate,Source,CustPayTermsAPI,APIStatus,AllowDupDEA

  UNION ALL

  SELECT 'New_APIData' as TableName,  count(*) 
NDUPS,AccountNo,AccountName,Addr1,Addr2,City,State,Zip,ContactFullName,Territory,
QPS,APIMemberNo,BusinessClass,Phone,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,StateLicNo,StateLicExpDate,FedID,Status,CAHStatus,
CardinalDC,PrimaryCAAccountNo,ContractDate,Source,CustPayTermsAPI,APIStatus,AllowDupDEA

  FROM api..apiaccountmaster_orig  B
   GROUP BY AccountNo,AccountName,Addr1,Addr2,City,State,Zip,ContactFullName,Territory,
QPS,APIMemberNo,BusinessClass,Phone,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,StateLicNo,StateLicExpDate,FedID,Status,CAHStatus,
CardinalDC,PrimaryCAAccountNo,ContractDate,Source,CustPayTermsAPI,APIStatus,AllowDupDEA
) tmp

GROUP BY  
NDUPS,AccountNo,AccountName,Addr1,Addr2,City,State,Zip,ContactFullName,Territory,
QPS,APIMemberNo,BusinessClass,Phone,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,StateLicNo,StateLicExpDate,FedID,Status,CAHStatus,
CardinalDC,PrimaryCAAccountNo,ContractDate,Source,CustPayTermsAPI,APIStatus,AllowDupDEA

HAVING COUNT(*) = 1
) tmp

END

BEGIN


-- staging table

   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'ComparePM_Staging')
          DROP TABLE ComparePM_Staging

select * into aap..ComparePM_Staging from (

SELECT MIN(TableName) as TableName,  count(*) 
NDUPS,AccountName,AAPAccountNo,AAPParentNo,APIAccountNo,UDAccountNo,UDParentNo,Addr1,
Addr2,City,State,Zip,ContactFullName,ContactFirst,ContactLast,Territory,QPS,
APIMemberNo,BusinessClass,AreaCode,Phone,FaxAreaCode,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,Status,CAHStatus,CardinalDC,PrimaryCAAccountNo,
ContractDate,StateLicNo,StateLicExpDate,FedID,Source,AllowDupDEA,ChainCode,CustPayTermsAPI,APIStatus,UDStatus,AAPStatus,UDQuitDate,
AAPQuitDate,UDNonPharmacy,AAPEffectiveDate,MCQuitDate,MCEffectiveDate,EffectiveDate
FROM
(

  SELECT 'Outdated_PM_staging' as TableName, count(*) NDUPS, 
AccountName,AAPAccountNo,AAPParentNo,APIAccountNo,UDAccountNo,UDParentNo,Addr1,
Addr2,City,State,Zip,ContactFullName,ContactFirst,ContactLast,Territory,QPS,
APIMemberNo,BusinessClass,AreaCode,Phone,FaxAreaCode,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,Status,CAHStatus,CardinalDC,PrimaryCAAccountNo,
ContractDate,StateLicNo,StateLicExpDate,FedID,Source,AllowDupDEA,ChainCode,CustPayTermsAPI,APIStatus,UDStatus,AAPStatus,UDQuitDate,
AAPQuitDate,UDNonPharmacy,AAPEffectiveDate,MCQuitDate,MCEffectiveDate,EffectiveDate

  FROM PMUpdate_All_staging_bkp A
    GROUP BY 
AccountName,AAPAccountNo,AAPParentNo,APIAccountNo,UDAccountNo,UDParentNo,Addr1,
Addr2,City,State,Zip,ContactFullName,ContactFirst,ContactLast,Territory,QPS,
APIMemberNo,BusinessClass,AreaCode,Phone,FaxAreaCode,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,Status,CAHStatus,CardinalDC,PrimaryCAAccountNo,
ContractDate,StateLicNo,StateLicExpDate,FedID,Source,AllowDupDEA,ChainCode,CustPayTermsAPI,APIStatus,UDStatus,AAPStatus,UDQuitDate,
AAPQuitDate,UDNonPharmacy,AAPEffectiveDate,MCQuitDate,MCEffectiveDate,EffectiveDate

  UNION ALL

  SELECT 'New_PM_staging' as TableName,  count(*) 
NDUPS,AccountName,AAPAccountNo,AAPParentNo,APIAccountNo,UDAccountNo,UDParentNo,Addr1,
Addr2,City,State,Zip,ContactFullName,ContactFirst,ContactLast,Territory,QPS,
APIMemberNo,BusinessClass,AreaCode,Phone,FaxAreaCode,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,Status,CAHStatus,CardinalDC,PrimaryCAAccountNo,
ContractDate,StateLicNo,StateLicExpDate,FedID,Source,AllowDupDEA,ChainCode,CustPayTermsAPI,APIStatus,UDStatus,AAPStatus,UDQuitDate,
AAPQuitDate,UDNonPharmacy,AAPEffectiveDate,MCQuitDate,MCEffectiveDate,EffectiveDate

  FROM PMUpdate_All_staging  B
   GROUP BY AccountName,AAPAccountNo,AAPParentNo,APIAccountNo,UDAccountNo,UDParentNo,Addr1,
Addr2,City,State,Zip,ContactFullName,ContactFirst,ContactLast,Territory,QPS,
APIMemberNo,BusinessClass,AreaCode,Phone,FaxAreaCode,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,Status,CAHStatus,CardinalDC,PrimaryCAAccountNo,
ContractDate,StateLicNo,StateLicExpDate,FedID,Source,AllowDupDEA,ChainCode,CustPayTermsAPI,APIStatus,UDStatus,AAPStatus,UDQuitDate,
AAPQuitDate,UDNonPharmacy,AAPEffectiveDate,MCQuitDate,MCEffectiveDate,EffectiveDate
) tmp

GROUP BY  
NDUPS,AccountName,AAPAccountNo,AAPParentNo,APIAccountNo,UDAccountNo,UDParentNo,Addr1,
Addr2,City,State,Zip,ContactFullName,ContactFirst,ContactLast,Territory,QPS,
APIMemberNo,BusinessClass,AreaCode,Phone,FaxAreaCode,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,Status,CAHStatus,CardinalDC,PrimaryCAAccountNo,
ContractDate,StateLicNo,StateLicExpDate,FedID,Source,AllowDupDEA,ChainCode,CustPayTermsAPI,APIStatus,UDStatus,AAPStatus,UDQuitDate,
AAPQuitDate,UDNonPharmacy,AAPEffectiveDate,MCQuitDate,MCEffectiveDate,EffectiveDate

HAVING COUNT(*) = 1
) tmp

 
END

BEGIN
-- UD table

   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'CompareSSIS_PM_UD')
          DROP TABLE CompareSSIS_PM_UD

SELECT * into aap..CompareSSIS_PM_UD from (

SELECT MIN(TableName) as TableName,  count(*) 
NDUPS,WHYMODIFIED, CORPNAME, STORE, [GROUP], [NON-PHARMACY], ACCT_NO, ADDR1, ADDR2, CITY, COUNTY, STATE, ZIP, ATTEND, COUNCIL, 
                      [COUNCIL NAME], AREACODE, PHONE1, [EMERGENCY PHONE], FAXAREACODE, FAX, EMAILADDRESS, WEBADDRESS, CONTACT_F, CONTACT_L, 
                      [CONTACT PERSON'S TITLE], BoardOfDirectors, [OFFICERS/YEAR], [BOARD POSITION], NSTERRITORY, MDMTERRITORY, RESIGNED, ARCHIVE, 
                      FEE_PD, NPP_MBR, FOREIGN_GRP, FEDID, DEA, [STATE MED #], RURAL, [STATE LIC #], [ON CALL], [OBRA 90], [COUNSELING AREA], [PATIENT MR], 
                      [DRUG INFORMATION], [FRAUD?], FRD_FEL_EXPLAN, [RX LICENSE SUS/REV], SUS_REV_EXPLAN, [UNRESTRICTED LIC], UNRES_LIC_EXPLAN, 
                      [INV/SANC BY MEDICARE], JUDGEMENTS, [COMPLY WITH ADA ACT], [UAI COVERAGE], [PROF LIAB INS], [PROF LIAB CARRIER], [PROF POL #], 
                      [PROF LIAB LIMIT 1], [PROF LIAB LIMIT 2], [PROF LIAB INS COF], [GEN LIAB INS], [GEN LIAB INS CARRIER], [GEN LIAB INS POLICY #], 
                      [GEN LIAB LIMIT 1], [GEN LIAB LIMIT 2], [PHAR LIAB INS], [AVE WAIT TIME], [MEDICATION ERRORS DOCUMENTED], [RESOLUTION POLICY], 
                      [COMPOUND PRESCRIPTIONS], [UNIT DOSING], [DUR MED EQ SVC], [CERTIFIED DISEASE MGMT], [CDM EXPLANATION], [GROUP PRESENTATIONS], 
                      [CONTINUING EDUCATION], [ST BOARD INSP], [COPY RELEASE INFO], NABP, BULLETIN, [STORE SIZE CLASSIFICATION], [HOLIDAY HOURS], HOURS, 
                      [DELIVERY SERVICE], [EMERGENCY SERVICES], [ANS MACH/ANS SERVICE], [ALTERNATIVE LANGUAGES], [SPECIALTY SERVICES], 
                      [COMPUTER SOFTWARE], [OUTSIDE ID], [WHOLESALER NAME], [WHOLESALER ACCT#], DC_NBR, COMPETITIVEACCT, GPPFORM, GPPLETTER, 
                      [LEAST EXP GEN], [HEALTH PLAN CONTACTS], [UNITED ASSURANCE], [MEMO LIT SIGN], [INDOOR LIGHTED SIGN], [RX CARE PROGRAM], [PCS FORM], 
                      [GROUP DESIGNATION], IPCFORM, SWITCHEDFROM, [PRE-POST], [ARGUS AGREE], AFFILIATION, [BBC SECONDARY ACCT], GNP, MSR, PASSWORD, 
                      LOGIN, [AVERAGE VOLUME], PLUSCARE, STEP_UP, ADDCHG, CHAIN_CODE, PAYEE_ID, STORE_ID, LASTMODIFIED, QUITDATE, EFFECTIVE, DEAEXP, 
                      [ST LIC EXP DATE], [PROF LIAB INS EXP DATE], [GEN LIAB INS EXP DATE], GRPEFFDATE, NPI
FROM
(

  SELECT 'Outdated_SSIS_PM_UD' as TableName, count(*) NDUPS, 
WHYMODIFIED, CORPNAME, STORE, [GROUP], [NON-PHARMACY], ACCT_NO, ADDR1, ADDR2, CITY, COUNTY, STATE, ZIP, ATTEND, COUNCIL, 
                      [COUNCIL NAME], AREACODE, PHONE1, [EMERGENCY PHONE], FAXAREACODE, FAX, EMAILADDRESS, WEBADDRESS, CONTACT_F, CONTACT_L, 
                      [CONTACT PERSON'S TITLE], BoardOfDirectors, [OFFICERS/YEAR], [BOARD POSITION], NSTERRITORY, MDMTERRITORY, RESIGNED, ARCHIVE, 
                      FEE_PD, NPP_MBR, FOREIGN_GRP, FEDID, DEA, [STATE MED #], RURAL, [STATE LIC #], [ON CALL], [OBRA 90], [COUNSELING AREA], [PATIENT MR], 
                      [DRUG INFORMATION], [FRAUD?], FRD_FEL_EXPLAN, [RX LICENSE SUS/REV], SUS_REV_EXPLAN, [UNRESTRICTED LIC], UNRES_LIC_EXPLAN, 
                      [INV/SANC BY MEDICARE], JUDGEMENTS, [COMPLY WITH ADA ACT], [UAI COVERAGE], [PROF LIAB INS], [PROF LIAB CARRIER], [PROF POL #], 
                      [PROF LIAB LIMIT 1], [PROF LIAB LIMIT 2], [PROF LIAB INS COF], [GEN LIAB INS], [GEN LIAB INS CARRIER], [GEN LIAB INS POLICY #], 
                      [GEN LIAB LIMIT 1], [GEN LIAB LIMIT 2], [PHAR LIAB INS], [AVE WAIT TIME], [MEDICATION ERRORS DOCUMENTED], [RESOLUTION POLICY], 
                      [COMPOUND PRESCRIPTIONS], [UNIT DOSING], [DUR MED EQ SVC], [CERTIFIED DISEASE MGMT], [CDM EXPLANATION], [GROUP PRESENTATIONS], 
                      [CONTINUING EDUCATION], [ST BOARD INSP], [COPY RELEASE INFO], NABP, BULLETIN, [STORE SIZE CLASSIFICATION], [HOLIDAY HOURS], HOURS, 
                      [DELIVERY SERVICE], [EMERGENCY SERVICES], [ANS MACH/ANS SERVICE], [ALTERNATIVE LANGUAGES], [SPECIALTY SERVICES], 
                      [COMPUTER SOFTWARE], [OUTSIDE ID], [WHOLESALER NAME], [WHOLESALER ACCT#], DC_NBR, COMPETITIVEACCT, GPPFORM, GPPLETTER, 
                      [LEAST EXP GEN], [HEALTH PLAN CONTACTS], [UNITED ASSURANCE], [MEMO LIT SIGN], [INDOOR LIGHTED SIGN], [RX CARE PROGRAM], [PCS FORM], 
                      [GROUP DESIGNATION], IPCFORM, SWITCHEDFROM, [PRE-POST], [ARGUS AGREE], AFFILIATION, [BBC SECONDARY ACCT], GNP, MSR, PASSWORD, 
                      LOGIN, [AVERAGE VOLUME], PLUSCARE, STEP_UP, ADDCHG, CHAIN_CODE, PAYEE_ID, STORE_ID, LASTMODIFIED, QUITDATE, EFFECTIVE, DEAEXP, 
                      [ST LIC EXP DATE], [PROF LIAB INS EXP DATE], [GEN LIAB INS EXP DATE], GRPEFFDATE, NPI

  FROM SSIS_PharmacyMasterUD_ALL_bkp A
    GROUP BY 
WHYMODIFIED, CORPNAME, STORE, [GROUP], [NON-PHARMACY], ACCT_NO, ADDR1, ADDR2, CITY, COUNTY, STATE, ZIP, ATTEND, COUNCIL, 
                      [COUNCIL NAME], AREACODE, PHONE1, [EMERGENCY PHONE], FAXAREACODE, FAX, EMAILADDRESS, WEBADDRESS, CONTACT_F, CONTACT_L, 
                      [CONTACT PERSON'S TITLE], BoardOfDirectors, [OFFICERS/YEAR], [BOARD POSITION], NSTERRITORY, MDMTERRITORY, RESIGNED, ARCHIVE, 
                      FEE_PD, NPP_MBR, FOREIGN_GRP, FEDID, DEA, [STATE MED #], RURAL, [STATE LIC #], [ON CALL], [OBRA 90], [COUNSELING AREA], [PATIENT MR], 
                      [DRUG INFORMATION], [FRAUD?], FRD_FEL_EXPLAN, [RX LICENSE SUS/REV], SUS_REV_EXPLAN, [UNRESTRICTED LIC], UNRES_LIC_EXPLAN, 
                      [INV/SANC BY MEDICARE], JUDGEMENTS, [COMPLY WITH ADA ACT], [UAI COVERAGE], [PROF LIAB INS], [PROF LIAB CARRIER], [PROF POL #], 
                      [PROF LIAB LIMIT 1], [PROF LIAB LIMIT 2], [PROF LIAB INS COF], [GEN LIAB INS], [GEN LIAB INS CARRIER], [GEN LIAB INS POLICY #], 
                      [GEN LIAB LIMIT 1], [GEN LIAB LIMIT 2], [PHAR LIAB INS], [AVE WAIT TIME], [MEDICATION ERRORS DOCUMENTED], [RESOLUTION POLICY], 
                      [COMPOUND PRESCRIPTIONS], [UNIT DOSING], [DUR MED EQ SVC], [CERTIFIED DISEASE MGMT], [CDM EXPLANATION], [GROUP PRESENTATIONS], 
                      [CONTINUING EDUCATION], [ST BOARD INSP], [COPY RELEASE INFO], NABP, BULLETIN, [STORE SIZE CLASSIFICATION], [HOLIDAY HOURS], HOURS, 
                      [DELIVERY SERVICE], [EMERGENCY SERVICES], [ANS MACH/ANS SERVICE], [ALTERNATIVE LANGUAGES], [SPECIALTY SERVICES], 
                      [COMPUTER SOFTWARE], [OUTSIDE ID], [WHOLESALER NAME], [WHOLESALER ACCT#], DC_NBR, COMPETITIVEACCT, GPPFORM, GPPLETTER, 
                      [LEAST EXP GEN], [HEALTH PLAN CONTACTS], [UNITED ASSURANCE], [MEMO LIT SIGN], [INDOOR LIGHTED SIGN], [RX CARE PROGRAM], [PCS FORM], 
                      [GROUP DESIGNATION], IPCFORM, SWITCHEDFROM, [PRE-POST], [ARGUS AGREE], AFFILIATION, [BBC SECONDARY ACCT], GNP, MSR, PASSWORD, 
                      LOGIN, [AVERAGE VOLUME], PLUSCARE, STEP_UP, ADDCHG, CHAIN_CODE, PAYEE_ID, STORE_ID, LASTMODIFIED, QUITDATE, EFFECTIVE, DEAEXP, 
                      [ST LIC EXP DATE], [PROF LIAB INS EXP DATE], [GEN LIAB INS EXP DATE], GRPEFFDATE, NPI

  UNION ALL

  SELECT 'New_SSIS_PM_UD' as TableName,  count(*) 
NDUPS,WHYMODIFIED, CORPNAME, STORE, [GROUP], [NON-PHARMACY], ACCT_NO, ADDR1, ADDR2, CITY, COUNTY, STATE, ZIP, ATTEND, COUNCIL, 
                      [COUNCIL NAME], AREACODE, PHONE1, [EMERGENCY PHONE], FAXAREACODE, FAX, EMAILADDRESS, WEBADDRESS, CONTACT_F, CONTACT_L, 
                      [CONTACT PERSON'S TITLE], BoardOfDirectors, [OFFICERS/YEAR], [BOARD POSITION], NSTERRITORY, MDMTERRITORY, RESIGNED, ARCHIVE, 
                      FEE_PD, NPP_MBR, FOREIGN_GRP, FEDID, DEA, [STATE MED #], RURAL, [STATE LIC #], [ON CALL], [OBRA 90], [COUNSELING AREA], [PATIENT MR], 
                      [DRUG INFORMATION], [FRAUD?], FRD_FEL_EXPLAN, [RX LICENSE SUS/REV], SUS_REV_EXPLAN, [UNRESTRICTED LIC], UNRES_LIC_EXPLAN, 
                      [INV/SANC BY MEDICARE], JUDGEMENTS, [COMPLY WITH ADA ACT], [UAI COVERAGE], [PROF LIAB INS], [PROF LIAB CARRIER], [PROF POL #], 
                      [PROF LIAB LIMIT 1], [PROF LIAB LIMIT 2], [PROF LIAB INS COF], [GEN LIAB INS], [GEN LIAB INS CARRIER], [GEN LIAB INS POLICY #], 
                      [GEN LIAB LIMIT 1], [GEN LIAB LIMIT 2], [PHAR LIAB INS], [AVE WAIT TIME], [MEDICATION ERRORS DOCUMENTED], [RESOLUTION POLICY], 
                      [COMPOUND PRESCRIPTIONS], [UNIT DOSING], [DUR MED EQ SVC], [CERTIFIED DISEASE MGMT], [CDM EXPLANATION], [GROUP PRESENTATIONS], 
                      [CONTINUING EDUCATION], [ST BOARD INSP], [COPY RELEASE INFO], NABP, BULLETIN, [STORE SIZE CLASSIFICATION], [HOLIDAY HOURS], HOURS, 
                      [DELIVERY SERVICE], [EMERGENCY SERVICES], [ANS MACH/ANS SERVICE], [ALTERNATIVE LANGUAGES], [SPECIALTY SERVICES], 
                      [COMPUTER SOFTWARE], [OUTSIDE ID], [WHOLESALER NAME], [WHOLESALER ACCT#], DC_NBR, COMPETITIVEACCT, GPPFORM, GPPLETTER, 
                      [LEAST EXP GEN], [HEALTH PLAN CONTACTS], [UNITED ASSURANCE], [MEMO LIT SIGN], [INDOOR LIGHTED SIGN], [RX CARE PROGRAM], [PCS FORM], 
                      [GROUP DESIGNATION], IPCFORM, SWITCHEDFROM, [PRE-POST], [ARGUS AGREE], AFFILIATION, [BBC SECONDARY ACCT], GNP, MSR, PASSWORD, 
                      LOGIN, [AVERAGE VOLUME], PLUSCARE, STEP_UP, ADDCHG, CHAIN_CODE, PAYEE_ID, STORE_ID, LASTMODIFIED, QUITDATE, EFFECTIVE, DEAEXP, 
                      [ST LIC EXP DATE], [PROF LIAB INS EXP DATE], [GEN LIAB INS EXP DATE], GRPEFFDATE, NPI

  FROM SSIS_PharmacyMasterUD_ALL  B
   GROUP BY WHYMODIFIED, CORPNAME, STORE, [GROUP], [NON-PHARMACY], ACCT_NO, ADDR1, ADDR2, CITY, COUNTY, STATE, ZIP, ATTEND, COUNCIL, 
                      [COUNCIL NAME], AREACODE, PHONE1, [EMERGENCY PHONE], FAXAREACODE, FAX, EMAILADDRESS, WEBADDRESS, CONTACT_F, CONTACT_L, 
                      [CONTACT PERSON'S TITLE], BoardOfDirectors, [OFFICERS/YEAR], [BOARD POSITION], NSTERRITORY, MDMTERRITORY, RESIGNED, ARCHIVE, 
                      FEE_PD, NPP_MBR, FOREIGN_GRP, FEDID, DEA, [STATE MED #], RURAL, [STATE LIC #], [ON CALL], [OBRA 90], [COUNSELING AREA], [PATIENT MR], 
                      [DRUG INFORMATION], [FRAUD?], FRD_FEL_EXPLAN, [RX LICENSE SUS/REV], SUS_REV_EXPLAN, [UNRESTRICTED LIC], UNRES_LIC_EXPLAN, 
                      [INV/SANC BY MEDICARE], JUDGEMENTS, [COMPLY WITH ADA ACT], [UAI COVERAGE], [PROF LIAB INS], [PROF LIAB CARRIER], [PROF POL #], 
                      [PROF LIAB LIMIT 1], [PROF LIAB LIMIT 2], [PROF LIAB INS COF], [GEN LIAB INS], [GEN LIAB INS CARRIER], [GEN LIAB INS POLICY #], 
                      [GEN LIAB LIMIT 1], [GEN LIAB LIMIT 2], [PHAR LIAB INS], [AVE WAIT TIME], [MEDICATION ERRORS DOCUMENTED], [RESOLUTION POLICY], 
                      [COMPOUND PRESCRIPTIONS], [UNIT DOSING], [DUR MED EQ SVC], [CERTIFIED DISEASE MGMT], [CDM EXPLANATION], [GROUP PRESENTATIONS], 
                      [CONTINUING EDUCATION], [ST BOARD INSP], [COPY RELEASE INFO], NABP, BULLETIN, [STORE SIZE CLASSIFICATION], [HOLIDAY HOURS], HOURS, 
                      [DELIVERY SERVICE], [EMERGENCY SERVICES], [ANS MACH/ANS SERVICE], [ALTERNATIVE LANGUAGES], [SPECIALTY SERVICES], 
                      [COMPUTER SOFTWARE], [OUTSIDE ID], [WHOLESALER NAME], [WHOLESALER ACCT#], DC_NBR, COMPETITIVEACCT, GPPFORM, GPPLETTER, 
                      [LEAST EXP GEN], [HEALTH PLAN CONTACTS], [UNITED ASSURANCE], [MEMO LIT SIGN], [INDOOR LIGHTED SIGN], [RX CARE PROGRAM], [PCS FORM], 
                      [GROUP DESIGNATION], IPCFORM, SWITCHEDFROM, [PRE-POST], [ARGUS AGREE], AFFILIATION, [BBC SECONDARY ACCT], GNP, MSR, PASSWORD, 
                      LOGIN, [AVERAGE VOLUME], PLUSCARE, STEP_UP, ADDCHG, CHAIN_CODE, PAYEE_ID, STORE_ID, LASTMODIFIED, QUITDATE, EFFECTIVE, DEAEXP, 
                      [ST LIC EXP DATE], [PROF LIAB INS EXP DATE], [GEN LIAB INS EXP DATE], GRPEFFDATE, NPI
) tmp

GROUP BY  
NDUPS,WHYMODIFIED, CORPNAME, STORE, [GROUP], [NON-PHARMACY], ACCT_NO, ADDR1, ADDR2, CITY, COUNTY, STATE, ZIP, ATTEND, COUNCIL, 
                      [COUNCIL NAME], AREACODE, PHONE1, [EMERGENCY PHONE], FAXAREACODE, FAX, EMAILADDRESS, WEBADDRESS, CONTACT_F, CONTACT_L, 
                      [CONTACT PERSON'S TITLE], BoardOfDirectors, [OFFICERS/YEAR], [BOARD POSITION], NSTERRITORY, MDMTERRITORY, RESIGNED, ARCHIVE, 
                      FEE_PD, NPP_MBR, FOREIGN_GRP, FEDID, DEA, [STATE MED #], RURAL, [STATE LIC #], [ON CALL], [OBRA 90], [COUNSELING AREA], [PATIENT MR], 
                      [DRUG INFORMATION], [FRAUD?], FRD_FEL_EXPLAN, [RX LICENSE SUS/REV], SUS_REV_EXPLAN, [UNRESTRICTED LIC], UNRES_LIC_EXPLAN, 
                      [INV/SANC BY MEDICARE], JUDGEMENTS, [COMPLY WITH ADA ACT], [UAI COVERAGE], [PROF LIAB INS], [PROF LIAB CARRIER], [PROF POL #], 
                      [PROF LIAB LIMIT 1], [PROF LIAB LIMIT 2], [PROF LIAB INS COF], [GEN LIAB INS], [GEN LIAB INS CARRIER], [GEN LIAB INS POLICY #], 
                      [GEN LIAB LIMIT 1], [GEN LIAB LIMIT 2], [PHAR LIAB INS], [AVE WAIT TIME], [MEDICATION ERRORS DOCUMENTED], [RESOLUTION POLICY], 
                      [COMPOUND PRESCRIPTIONS], [UNIT DOSING], [DUR MED EQ SVC], [CERTIFIED DISEASE MGMT], [CDM EXPLANATION], [GROUP PRESENTATIONS], 
                      [CONTINUING EDUCATION], [ST BOARD INSP], [COPY RELEASE INFO], NABP, BULLETIN, [STORE SIZE CLASSIFICATION], [HOLIDAY HOURS], HOURS, 
                      [DELIVERY SERVICE], [EMERGENCY SERVICES], [ANS MACH/ANS SERVICE], [ALTERNATIVE LANGUAGES], [SPECIALTY SERVICES], 
                      [COMPUTER SOFTWARE], [OUTSIDE ID], [WHOLESALER NAME], [WHOLESALER ACCT#], DC_NBR, COMPETITIVEACCT, GPPFORM, GPPLETTER, 
                      [LEAST EXP GEN], [HEALTH PLAN CONTACTS], [UNITED ASSURANCE], [MEMO LIT SIGN], [INDOOR LIGHTED SIGN], [RX CARE PROGRAM], [PCS FORM], 
                      [GROUP DESIGNATION], IPCFORM, SWITCHEDFROM, [PRE-POST], [ARGUS AGREE], AFFILIATION, [BBC SECONDARY ACCT], GNP, MSR, PASSWORD, 
                      LOGIN, [AVERAGE VOLUME], PLUSCARE, STEP_UP, ADDCHG, CHAIN_CODE, PAYEE_ID, STORE_ID, LASTMODIFIED, QUITDATE, EFFECTIVE, DEAEXP, 
                      [ST LIC EXP DATE], [PROF LIAB INS EXP DATE], [GEN LIAB INS EXP DATE], GRPEFFDATE, NPI

HAVING COUNT(*) = 1
) tmp
END


	BEGIN
 
 
-- Compare for API Data

   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'CompareAAP')
          DROP TABLE CompareAAP
 

SELECT * into aap..CompareAAP from (

SELECT MIN(TableName) as TableName,  count(*) 
NDUPS,AccountID,CorpName,StoreName,AAPID,ParentAAPID,Addr1,Addr2,City,State,Zip,
AreaCode,Phone,FaxAreaCode,Fax,NSTerritory,FeePaid,NppMbr,DEA,DEAEXP,NCPDP,
NPI,ArgusAgree,CompetitiveAcct,Email,GroupDesignation,IsMember,IsAffiliateGroup,IsBuyingGroup,
IsNPP,IsWarehouse,IsPVA,IsPOS,AffiliateGroupName,County,OwnerFirst,OwnerLast,Effective,AvgWholesaleVolume,
EffectiveAAP,IsStartUpStore,IsPharmacy,ChainCode,FedID,AAPPreviousGroup,SwitchedFrom,QuitDate,PreviousAcctNo,
APIPreviousAcctNo,APIWarehouseAcctNo,Bulletin,TS,StateLicNo,StateMedicaidNo,StateLicExpDate,Payee_id,EmergencyPhone,
Hours,HolidayHours,GenLiabCarrier,GenLiabPolicyNumber,GenLiabilityLimit1,GenLiabilityLimit2,GenInsExpDate,ProfLiabCarrier,ProfLiabInsExpDate,
ProfPolicyNumber,ProfLiabLimit1,ProfLiabLimit2,DeliveryService,EmergencyServices,AnsweringServiceOrMachine,AlternativeLanguages,SpecialtyServices,
ComputerSoftware,Obra90,CounselingArea,PatientMR,DrugInformation,FraudFelonyConviction,FraudFelonyExplanation,RxLicenseSuspendedOrRevoked,
SuspensionRevokationExplanation,UnrestrictedLicense,UnrestrictedLicenseExplanation,InvestigatedByMedicareMedicaid,UAICoverage,Judgements,CompliesWithADAAct,
AverageWaitTime,MedicationErrorsDocumented,ErrorCount12Months,HasResolutionPolicy,doesCompoundPrescriptions,UnitDosing,ProvidesDME,ProvidesIV,CertifiedDiseaseMgmt,CDMExplanation,GroupPresentations,ContinuingEducationRequired,StoreSizeClassification,CopyReleaseInfo,DBA,Website,Resigned,ContactFirst,ContactLast,
ContactTitle,WhyResigned,AccountDescription,MCEffectiveDate,MCQuitDate,Created,Modified,RowVersion
FROM
(

  SELECT 'Outdated_AAPData' as TableName, count(*) NDUPS, AccountID,CorpName,StoreName,AAPID,ParentAAPID,Addr1,Addr2,City,State,Zip,
AreaCode,Phone,FaxAreaCode,Fax,NSTerritory,FeePaid,NppMbr,DEA,DEAEXP,NCPDP,
NPI,ArgusAgree,CompetitiveAcct,Email,GroupDesignation,IsMember,IsAffiliateGroup,IsBuyingGroup,
IsNPP,IsWarehouse,IsPVA,IsPOS,AffiliateGroupName,County,OwnerFirst,OwnerLast,Effective,AvgWholesaleVolume,
EffectiveAAP,IsStartUpStore,IsPharmacy,ChainCode,FedID,AAPPreviousGroup,SwitchedFrom,QuitDate,PreviousAcctNo,
APIPreviousAcctNo,APIWarehouseAcctNo,Bulletin,TS,StateLicNo,StateMedicaidNo,StateLicExpDate,Payee_id,EmergencyPhone,
Hours,HolidayHours,GenLiabCarrier,GenLiabPolicyNumber,GenLiabilityLimit1,GenLiabilityLimit2,GenInsExpDate,ProfLiabCarrier,ProfLiabInsExpDate,
ProfPolicyNumber,ProfLiabLimit1,ProfLiabLimit2,DeliveryService,EmergencyServices,AnsweringServiceOrMachine,AlternativeLanguages,SpecialtyServices,
ComputerSoftware,Obra90,CounselingArea,PatientMR,DrugInformation,FraudFelonyConviction,FraudFelonyExplanation,RxLicenseSuspendedOrRevoked,
SuspensionRevokationExplanation,UnrestrictedLicense,UnrestrictedLicenseExplanation,InvestigatedByMedicareMedicaid,UAICoverage,Judgements,CompliesWithADAAct,
AverageWaitTime,MedicationErrorsDocumented,ErrorCount12Months,HasResolutionPolicy,doesCompoundPrescriptions,UnitDosing,ProvidesDME,ProvidesIV,CertifiedDiseaseMgmt,CDMExplanation,GroupPresentations,ContinuingEducationRequired,StoreSizeClassification,CopyReleaseInfo,DBA,Website,Resigned,ContactFirst,ContactLast,
ContactTitle,WhyResigned,AccountDescription,MCEffectiveDate,MCQuitDate,Created,Modified,RowVersion

  FROM aapaccount_bkp2 A
    GROUP BY 
AccountID,CorpName,StoreName,AAPID,ParentAAPID,Addr1,Addr2,City,State,Zip,
AreaCode,Phone,FaxAreaCode,Fax,NSTerritory,FeePaid,NppMbr,DEA,DEAEXP,NCPDP,
NPI,ArgusAgree,CompetitiveAcct,Email,GroupDesignation,IsMember,IsAffiliateGroup,IsBuyingGroup,
IsNPP,IsWarehouse,IsPVA,IsPOS,AffiliateGroupName,County,OwnerFirst,OwnerLast,Effective,AvgWholesaleVolume,
EffectiveAAP,IsStartUpStore,IsPharmacy,ChainCode,FedID,AAPPreviousGroup,SwitchedFrom,QuitDate,PreviousAcctNo,
APIPreviousAcctNo,APIWarehouseAcctNo,Bulletin,TS,StateLicNo,StateMedicaidNo,StateLicExpDate,Payee_id,EmergencyPhone,
Hours,HolidayHours,GenLiabCarrier,GenLiabPolicyNumber,GenLiabilityLimit1,GenLiabilityLimit2,GenInsExpDate,ProfLiabCarrier,ProfLiabInsExpDate,
ProfPolicyNumber,ProfLiabLimit1,ProfLiabLimit2,DeliveryService,EmergencyServices,AnsweringServiceOrMachine,AlternativeLanguages,SpecialtyServices,
ComputerSoftware,Obra90,CounselingArea,PatientMR,DrugInformation,FraudFelonyConviction,FraudFelonyExplanation,RxLicenseSuspendedOrRevoked,
SuspensionRevokationExplanation,UnrestrictedLicense,UnrestrictedLicenseExplanation,InvestigatedByMedicareMedicaid,UAICoverage,Judgements,CompliesWithADAAct,
AverageWaitTime,MedicationErrorsDocumented,ErrorCount12Months,HasResolutionPolicy,doesCompoundPrescriptions,UnitDosing,ProvidesDME,ProvidesIV,CertifiedDiseaseMgmt,CDMExplanation,GroupPresentations,ContinuingEducationRequired,StoreSizeClassification,CopyReleaseInfo,DBA,Website,Resigned,ContactFirst,ContactLast,
ContactTitle,WhyResigned,AccountDescription,MCEffectiveDate,MCQuitDate,Created,Modified,RowVersion

  UNION ALL

  SELECT 'New_AAPData' as TableName,  count(*) 
NDUPS,AccountID,CorpName,StoreName,AAPID,ParentAAPID,Addr1,Addr2,City,State,Zip,
AreaCode,Phone,FaxAreaCode,Fax,NSTerritory,FeePaid,NppMbr,DEA,DEAEXP,NCPDP,
NPI,ArgusAgree,CompetitiveAcct,Email,GroupDesignation,IsMember,IsAffiliateGroup,IsBuyingGroup,
IsNPP,IsWarehouse,IsPVA,IsPOS,AffiliateGroupName,County,OwnerFirst,OwnerLast,Effective,AvgWholesaleVolume,
EffectiveAAP,IsStartUpStore,IsPharmacy,ChainCode,FedID,AAPPreviousGroup,SwitchedFrom,QuitDate,PreviousAcctNo,
APIPreviousAcctNo,APIWarehouseAcctNo,Bulletin,TS,StateLicNo,StateMedicaidNo,StateLicExpDate,Payee_id,EmergencyPhone,
Hours,HolidayHours,GenLiabCarrier,GenLiabPolicyNumber,GenLiabilityLimit1,GenLiabilityLimit2,GenInsExpDate,ProfLiabCarrier,ProfLiabInsExpDate,
ProfPolicyNumber,ProfLiabLimit1,ProfLiabLimit2,DeliveryService,EmergencyServices,AnsweringServiceOrMachine,AlternativeLanguages,SpecialtyServices,
ComputerSoftware,Obra90,CounselingArea,PatientMR,DrugInformation,FraudFelonyConviction,FraudFelonyExplanation,RxLicenseSuspendedOrRevoked,
SuspensionRevokationExplanation,UnrestrictedLicense,UnrestrictedLicenseExplanation,InvestigatedByMedicareMedicaid,UAICoverage,Judgements,CompliesWithADAAct,
AverageWaitTime,MedicationErrorsDocumented,ErrorCount12Months,HasResolutionPolicy,doesCompoundPrescriptions,UnitDosing,ProvidesDME,ProvidesIV,CertifiedDiseaseMgmt,CDMExplanation,GroupPresentations,ContinuingEducationRequired,StoreSizeClassification,CopyReleaseInfo,DBA,Website,Resigned,ContactFirst,ContactLast,
ContactTitle,WhyResigned,AccountDescription,MCEffectiveDate,MCQuitDate,Created,Modified,RowVersion

  FROM aapaccount  B
   GROUP BY AccountID,CorpName,StoreName,AAPID,ParentAAPID,Addr1,Addr2,City,State,Zip,
AreaCode,Phone,FaxAreaCode,Fax,NSTerritory,FeePaid,NppMbr,DEA,DEAEXP,NCPDP,
NPI,ArgusAgree,CompetitiveAcct,Email,GroupDesignation,IsMember,IsAffiliateGroup,IsBuyingGroup,
IsNPP,IsWarehouse,IsPVA,IsPOS,AffiliateGroupName,County,OwnerFirst,OwnerLast,Effective,AvgWholesaleVolume,
EffectiveAAP,IsStartUpStore,IsPharmacy,ChainCode,FedID,AAPPreviousGroup,SwitchedFrom,QuitDate,PreviousAcctNo,
APIPreviousAcctNo,APIWarehouseAcctNo,Bulletin,TS,StateLicNo,StateMedicaidNo,StateLicExpDate,Payee_id,EmergencyPhone,
Hours,HolidayHours,GenLiabCarrier,GenLiabPolicyNumber,GenLiabilityLimit1,GenLiabilityLimit2,GenInsExpDate,ProfLiabCarrier,ProfLiabInsExpDate,
ProfPolicyNumber,ProfLiabLimit1,ProfLiabLimit2,DeliveryService,EmergencyServices,AnsweringServiceOrMachine,AlternativeLanguages,SpecialtyServices,
ComputerSoftware,Obra90,CounselingArea,PatientMR,DrugInformation,FraudFelonyConviction,FraudFelonyExplanation,RxLicenseSuspendedOrRevoked,
SuspensionRevokationExplanation,UnrestrictedLicense,UnrestrictedLicenseExplanation,InvestigatedByMedicareMedicaid,UAICoverage,Judgements,CompliesWithADAAct,
AverageWaitTime,MedicationErrorsDocumented,ErrorCount12Months,HasResolutionPolicy,doesCompoundPrescriptions,UnitDosing,ProvidesDME,ProvidesIV,CertifiedDiseaseMgmt,CDMExplanation,GroupPresentations,ContinuingEducationRequired,StoreSizeClassification,CopyReleaseInfo,DBA,Website,Resigned,ContactFirst,ContactLast,
ContactTitle,WhyResigned,AccountDescription,MCEffectiveDate,MCQuitDate,Created,Modified,RowVersion
) tmp

GROUP BY  
NDUPS,AccountID,CorpName,StoreName,AAPID,ParentAAPID,Addr1,Addr2,City,State,Zip,
AreaCode,Phone,FaxAreaCode,Fax,NSTerritory,FeePaid,NppMbr,DEA,DEAEXP,NCPDP,
NPI,ArgusAgree,CompetitiveAcct,Email,GroupDesignation,IsMember,IsAffiliateGroup,IsBuyingGroup,
IsNPP,IsWarehouse,IsPVA,IsPOS,AffiliateGroupName,County,OwnerFirst,OwnerLast,Effective,AvgWholesaleVolume,
EffectiveAAP,IsStartUpStore,IsPharmacy,ChainCode,FedID,AAPPreviousGroup,SwitchedFrom,QuitDate,PreviousAcctNo,
APIPreviousAcctNo,APIWarehouseAcctNo,Bulletin,TS,StateLicNo,StateMedicaidNo,StateLicExpDate,Payee_id,EmergencyPhone,
Hours,HolidayHours,GenLiabCarrier,GenLiabPolicyNumber,GenLiabilityLimit1,GenLiabilityLimit2,GenInsExpDate,ProfLiabCarrier,ProfLiabInsExpDate,
ProfPolicyNumber,ProfLiabLimit1,ProfLiabLimit2,DeliveryService,EmergencyServices,AnsweringServiceOrMachine,AlternativeLanguages,SpecialtyServices,
ComputerSoftware,Obra90,CounselingArea,PatientMR,DrugInformation,FraudFelonyConviction,FraudFelonyExplanation,RxLicenseSuspendedOrRevoked,
SuspensionRevokationExplanation,UnrestrictedLicense,UnrestrictedLicenseExplanation,InvestigatedByMedicareMedicaid,UAICoverage,Judgements,CompliesWithADAAct,
AverageWaitTime,MedicationErrorsDocumented,ErrorCount12Months,HasResolutionPolicy,doesCompoundPrescriptions,UnitDosing,ProvidesDME,ProvidesIV,CertifiedDiseaseMgmt,CDMExplanation,GroupPresentations,ContinuingEducationRequired,StoreSizeClassification,CopyReleaseInfo,DBA,Website,Resigned,ContactFirst,ContactLast,
ContactTitle,WhyResigned,AccountDescription,MCEffectiveDate,MCQuitDate,Created,Modified,RowVersion

HAVING COUNT(*) = 1
) tmp

END

BEGIN

-- PM_Update ALL table

   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'ComparePMUpdate_All')
          DROP TABLE ComparePMUpdate_All

select * into aap..ComparePMUpdate_All from (

SELECT MIN(TableName) as TableName,  count(*) 
NDUPS,AccountName,AAPAccountNo,AAPParentNo,APIAccountNo,UDAccountNo,UDParentNo,Addr1,
Addr2,City,State,Zip,ContactFullName,ContactFirst,ContactLast,Territory,QPS,
APIMemberNo,BusinessClass,AreaCode,Phone,FaxAreaCode,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,Status,CAHStatus,CardinalDC,PrimaryCAAccountNo,
ContractDate,StateLicNo,StateLicExpDate,FedID,Source,AllowDupDEA,ChainCode,CustPayTermsAPI,APIStatus,UDStatus,AAPStatus,UDQuitDate,
AAPQuitDate,UDNonPharmacy,AAPEffectiveDate,MCQuitDate,MCEffectiveDate,EffectiveDate
FROM
(

  SELECT 'Outdated_PMUpdate_All' as TableName, count(*) NDUPS, 
AccountName,AAPAccountNo,AAPParentNo,APIAccountNo,UDAccountNo,UDParentNo,Addr1,
Addr2,City,State,Zip,ContactFullName,ContactFirst,ContactLast,Territory,QPS,
APIMemberNo,BusinessClass,AreaCode,Phone,FaxAreaCode,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,Status,CAHStatus,CardinalDC,PrimaryCAAccountNo,
ContractDate,StateLicNo,StateLicExpDate,FedID,Source,AllowDupDEA,ChainCode,CustPayTermsAPI,APIStatus,UDStatus,AAPStatus,UDQuitDate,
AAPQuitDate,UDNonPharmacy,AAPEffectiveDate,MCQuitDate,MCEffectiveDate,EffectiveDate

  FROM PMUpdate_All_bkp A
    GROUP BY 
AccountName,AAPAccountNo,AAPParentNo,APIAccountNo,UDAccountNo,UDParentNo,Addr1,
Addr2,City,State,Zip,ContactFullName,ContactFirst,ContactLast,Territory,QPS,
APIMemberNo,BusinessClass,AreaCode,Phone,FaxAreaCode,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,Status,CAHStatus,CardinalDC,PrimaryCAAccountNo,
ContractDate,StateLicNo,StateLicExpDate,FedID,Source,AllowDupDEA,ChainCode,CustPayTermsAPI,APIStatus,UDStatus,AAPStatus,UDQuitDate,
AAPQuitDate,UDNonPharmacy,AAPEffectiveDate,MCQuitDate,MCEffectiveDate,EffectiveDate

  UNION ALL

  SELECT 'New_PMUpdate_All' as TableName,  count(*) 
NDUPS,AccountName,AAPAccountNo,AAPParentNo,APIAccountNo,UDAccountNo,UDParentNo,Addr1,
Addr2,City,State,Zip,ContactFullName,ContactFirst,ContactLast,Territory,QPS,
APIMemberNo,BusinessClass,AreaCode,Phone,FaxAreaCode,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,Status,CAHStatus,CardinalDC,PrimaryCAAccountNo,
ContractDate,StateLicNo,StateLicExpDate,FedID,Source,AllowDupDEA,ChainCode,CustPayTermsAPI,APIStatus,UDStatus,AAPStatus,UDQuitDate,
AAPQuitDate,UDNonPharmacy,AAPEffectiveDate,MCQuitDate,MCEffectiveDate,EffectiveDate

  FROM PMUpdate_All  B
   GROUP BY AccountName,AAPAccountNo,AAPParentNo,APIAccountNo,UDAccountNo,UDParentNo,Addr1,
Addr2,City,State,Zip,ContactFullName,ContactFirst,ContactLast,Territory,QPS,
APIMemberNo,BusinessClass,AreaCode,Phone,FaxAreaCode,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,Status,CAHStatus,CardinalDC,PrimaryCAAccountNo,
ContractDate,StateLicNo,StateLicExpDate,FedID,Source,AllowDupDEA,ChainCode,CustPayTermsAPI,APIStatus,UDStatus,AAPStatus,UDQuitDate,
AAPQuitDate,UDNonPharmacy,AAPEffectiveDate,MCQuitDate,MCEffectiveDate,EffectiveDate
) tmp

GROUP BY  
NDUPS,AccountName,AAPAccountNo,AAPParentNo,APIAccountNo,UDAccountNo,UDParentNo,Addr1,
Addr2,City,State,Zip,ContactFullName,ContactFirst,ContactLast,Territory,QPS,
APIMemberNo,BusinessClass,AreaCode,Phone,FaxAreaCode,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,Status,CAHStatus,CardinalDC,PrimaryCAAccountNo,
ContractDate,StateLicNo,StateLicExpDate,FedID,Source,AllowDupDEA,ChainCode,CustPayTermsAPI,APIStatus,UDStatus,AAPStatus,UDQuitDate,
AAPQuitDate,UDNonPharmacy,AAPEffectiveDate,MCQuitDate,MCEffectiveDate,EffectiveDate

HAVING COUNT(*) = 1
) tmp

 
END


BEGIN
-- PM_Update ALL table

   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'ComparePharmacyMaster')
          DROP TABLE ComparePharmacyMaster

select * into aap..ComparePharmacyMaster from (

SELECT MIN(TableName) as TableName,  count(*) 
NDUPS,AccountName,AAPAccountNo,AAPParentNo,APIAccountNo,UDAccountNo,UDParentNo,Addr1,
Addr2,City,State,Zip,ContactFullName,ContactFirst,ContactLast,Territory,QPS,
APIMemberNo,BusinessClass,AreaCode,Phone,FaxAreaCode,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,Status,CAHStatus,CardinalDC,PrimaryCAAccountNo,
ContractDate,StateLicNo,StateLicExpDate,FedID,Source,AllowDupDEA,ChainCode,CustPayTermsAPI,APIStatus,UDStatus,AAPStatus,UDQuitDate,
AAPQuitDate,UDNonPharmacy,AAPEffectiveDate,MCQuitDate,MCEffectiveDate,EffectiveDate
FROM
(

  SELECT 'Outdated_PM' as TableName, count(*) NDUPS, 
AccountName,AAPAccountNo,AAPParentNo,APIAccountNo,UDAccountNo,UDParentNo,Addr1,
Addr2,City,State,Zip,ContactFullName,ContactFirst,ContactLast,Territory,QPS,
APIMemberNo,BusinessClass,AreaCode,Phone,FaxAreaCode,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,Status,CAHStatus,CardinalDC,PrimaryCAAccountNo,
ContractDate,StateLicNo,StateLicExpDate,FedID,Source,AllowDupDEA,ChainCode,CustPayTermsAPI,APIStatus,UDStatus,AAPStatus,UDQuitDate,
AAPQuitDate,UDNonPharmacy,AAPEffectiveDate,MCQuitDate,MCEffectiveDate,EffectiveDate

  FROM PharmacyMaster_bkp A
    GROUP BY 
AccountName,AAPAccountNo,AAPParentNo,APIAccountNo,UDAccountNo,UDParentNo,Addr1,
Addr2,City,State,Zip,ContactFullName,ContactFirst,ContactLast,Territory,QPS,
APIMemberNo,BusinessClass,AreaCode,Phone,FaxAreaCode,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,Status,CAHStatus,CardinalDC,PrimaryCAAccountNo,
ContractDate,StateLicNo,StateLicExpDate,FedID,Source,AllowDupDEA,ChainCode,CustPayTermsAPI,APIStatus,UDStatus,AAPStatus,UDQuitDate,
AAPQuitDate,UDNonPharmacy,AAPEffectiveDate,MCQuitDate,MCEffectiveDate,EffectiveDate

  UNION ALL

  SELECT 'New_PM' as TableName,  count(*) 
NDUPS,AccountName,AAPAccountNo,AAPParentNo,APIAccountNo,UDAccountNo,UDParentNo,Addr1,
Addr2,City,State,Zip,ContactFullName,ContactFirst,ContactLast,Territory,QPS,
APIMemberNo,BusinessClass,AreaCode,Phone,FaxAreaCode,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,Status,CAHStatus,CardinalDC,PrimaryCAAccountNo,
ContractDate,StateLicNo,StateLicExpDate,FedID,Source,AllowDupDEA,ChainCode,CustPayTermsAPI,APIStatus,UDStatus,AAPStatus,UDQuitDate,
AAPQuitDate,UDNonPharmacy,AAPEffectiveDate,MCQuitDate,MCEffectiveDate,EffectiveDate

  FROM PharmacyMaster  B
   GROUP BY AccountName,AAPAccountNo,AAPParentNo,APIAccountNo,UDAccountNo,UDParentNo,Addr1,
Addr2,City,State,Zip,ContactFullName,ContactFirst,ContactLast,Territory,QPS,
APIMemberNo,BusinessClass,AreaCode,Phone,FaxAreaCode,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,Status,CAHStatus,CardinalDC,PrimaryCAAccountNo,
ContractDate,StateLicNo,StateLicExpDate,FedID,Source,AllowDupDEA,ChainCode,CustPayTermsAPI,APIStatus,UDStatus,AAPStatus,UDQuitDate,
AAPQuitDate,UDNonPharmacy,AAPEffectiveDate,MCQuitDate,MCEffectiveDate,EffectiveDate
) tmp

GROUP BY  
NDUPS,AccountName,AAPAccountNo,AAPParentNo,APIAccountNo,UDAccountNo,UDParentNo,Addr1,
Addr2,City,State,Zip,ContactFullName,ContactFirst,ContactLast,Territory,QPS,
APIMemberNo,BusinessClass,AreaCode,Phone,FaxAreaCode,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,Status,CAHStatus,CardinalDC,PrimaryCAAccountNo,
ContractDate,StateLicNo,StateLicExpDate,FedID,Source,AllowDupDEA,ChainCode,CustPayTermsAPI,APIStatus,UDStatus,AAPStatus,UDQuitDate,
AAPQuitDate,UDNonPharmacy,AAPEffectiveDate,MCQuitDate,MCEffectiveDate,EffectiveDate

HAVING COUNT(*) = 1
) tmp

END
GO
