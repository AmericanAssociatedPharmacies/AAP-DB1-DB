USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[spaap_create_NEW_PM_Compare_Tables]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <03/05/2010>
-- Description:	Create Compare tables from the backups
-- =============================================
CREATE PROCEDURE [dbo].[spaap_create_NEW_PM_Compare_Tables]

AS

BEGIN
-- PM_Update ALL table

   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'CompareNewPharmacyMaster')
          DROP TABLE CompareNewPharmacyMaster

select * into aap..CompareNewPharmacyMaster from (

SELECT MIN(TableName) as TableName,  count(*) 
NDUPS,AccountName,AAPAccountNo,AAPParentNo,APIAccountNo,UDAccountNo,UDParentNo,Addr1,
Addr2,City,State,Zip,ContactFullName,ContactFirst,ContactLast,Territory,QPS,
APIMemberNo,BusinessClass,AreaCode,Phone,FaxAreaCode,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,Status,CAHStatus,CardinalDC,PrimaryCAAccountNo,
ContractDate,StateLicNo,StateLicExpDate,FedID,Source,AllowDupDEA,ChainCode,CustPayTermsAPI,APIStatus,UDStatus,AAPStatus,UDQuitDate,
AAPQuitDate,UDNonPharmacy,AAPEffectiveDate,MCQuitDate,MCEffectiveDate,EffectiveDate,CorporateName,NCPDP,NPI,Hours,HolidayHours,
AvgWholesaleVolume,OwnerName,IsStartUpStore,AAPPreviousGroup,Payee_id,EmergencyPhone,Website,AccountDescription,ComputerSoftware,DBA,Resigned,WhyResigned,CompetitiveAcct 
FROM
(

  SELECT 'Outdated_PM' as TableName, count(*) NDUPS, 
AccountName,AAPAccountNo,AAPParentNo,APIAccountNo,UDAccountNo,UDParentNo,Addr1,
Addr2,City,State,Zip,ContactFullName,ContactFirst,ContactLast,Territory,QPS,
APIMemberNo,BusinessClass,AreaCode,Phone,FaxAreaCode,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,Status,CAHStatus,CardinalDC,PrimaryCAAccountNo,
ContractDate,StateLicNo,StateLicExpDate,FedID,Source,AllowDupDEA,ChainCode,CustPayTermsAPI,APIStatus,UDStatus,AAPStatus,UDQuitDate,
AAPQuitDate,UDNonPharmacy,AAPEffectiveDate,MCQuitDate,MCEffectiveDate,EffectiveDate,CorporateName,NCPDP,NPI,Hours,HolidayHours,
AvgWholesaleVolume,OwnerName,IsStartUpStore,AAPPreviousGroup,Payee_id,EmergencyPhone,Website,AccountDescription,ComputerSoftware,DBA,Resigned,WhyResigned,CompetitiveAcct 

  FROM NEW_PharmacyMaster_bkp A
    GROUP BY 
AccountName,AAPAccountNo,AAPParentNo,APIAccountNo,UDAccountNo,UDParentNo,Addr1,
Addr2,City,State,Zip,ContactFullName,ContactFirst,ContactLast,Territory,QPS,
APIMemberNo,BusinessClass,AreaCode,Phone,FaxAreaCode,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,Status,CAHStatus,CardinalDC,PrimaryCAAccountNo,
ContractDate,StateLicNo,StateLicExpDate,FedID,Source,AllowDupDEA,ChainCode,CustPayTermsAPI,APIStatus,UDStatus,AAPStatus,UDQuitDate,
AAPQuitDate,UDNonPharmacy,AAPEffectiveDate,MCQuitDate,MCEffectiveDate,EffectiveDate,CorporateName,NCPDP,NPI,Hours,HolidayHours,
AvgWholesaleVolume,OwnerName,IsStartUpStore,AAPPreviousGroup,Payee_id,EmergencyPhone,Website,AccountDescription,ComputerSoftware,DBA,Resigned,WhyResigned,CompetitiveAcct 

  UNION ALL

  SELECT 'New_PM' as TableName,  count(*) 
NDUPS,AccountName,AAPAccountNo,AAPParentNo,APIAccountNo,UDAccountNo,UDParentNo,Addr1,
Addr2,City,State,Zip,ContactFullName,ContactFirst,ContactLast,Territory,QPS,
APIMemberNo,BusinessClass,AreaCode,Phone,FaxAreaCode,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,Status,CAHStatus,CardinalDC,PrimaryCAAccountNo,
ContractDate,StateLicNo,StateLicExpDate,FedID,Source,AllowDupDEA,ChainCode,CustPayTermsAPI,APIStatus,UDStatus,AAPStatus,UDQuitDate,
AAPQuitDate,UDNonPharmacy,AAPEffectiveDate,MCQuitDate,MCEffectiveDate,EffectiveDate,CorporateName,NCPDP,NPI,Hours,HolidayHours,
AvgWholesaleVolume,OwnerName,IsStartUpStore,AAPPreviousGroup,Payee_id,EmergencyPhone,Website,AccountDescription,ComputerSoftware,DBA,Resigned,WhyResigned,CompetitiveAcct 

  FROM NEW_PharmacyMaster  B
   GROUP BY AccountName,AAPAccountNo,AAPParentNo,APIAccountNo,UDAccountNo,UDParentNo,Addr1,
Addr2,City,State,Zip,ContactFullName,ContactFirst,ContactLast,Territory,QPS,
APIMemberNo,BusinessClass,AreaCode,Phone,FaxAreaCode,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,Status,CAHStatus,CardinalDC,PrimaryCAAccountNo,
ContractDate,StateLicNo,StateLicExpDate,FedID,Source,AllowDupDEA,ChainCode,CustPayTermsAPI,APIStatus,UDStatus,AAPStatus,UDQuitDate,
AAPQuitDate,UDNonPharmacy,AAPEffectiveDate,MCQuitDate,MCEffectiveDate,EffectiveDate,CorporateName,NCPDP,NPI,Hours,HolidayHours,
AvgWholesaleVolume,OwnerName,IsStartUpStore,AAPPreviousGroup,Payee_id,EmergencyPhone,Website,AccountDescription,ComputerSoftware,DBA,Resigned,WhyResigned,CompetitiveAcct 
) tmp

GROUP BY  
NDUPS,AccountName,AAPAccountNo,AAPParentNo,APIAccountNo,UDAccountNo,UDParentNo,Addr1,
Addr2,City,State,Zip,ContactFullName,ContactFirst,ContactLast,Territory,QPS,
APIMemberNo,BusinessClass,AreaCode,Phone,FaxAreaCode,Fax,Email,DateOpened,OrigStartDate,NumReactivated,
Wholesaler,WholesalerAccountNo,DEA,DEAEXP,Status,CAHStatus,CardinalDC,PrimaryCAAccountNo,
ContractDate,StateLicNo,StateLicExpDate,FedID,Source,AllowDupDEA,ChainCode,CustPayTermsAPI,APIStatus,UDStatus,AAPStatus,UDQuitDate,
AAPQuitDate,UDNonPharmacy,AAPEffectiveDate,MCQuitDate,MCEffectiveDate,EffectiveDate,CorporateName,NCPDP,NPI,Hours,HolidayHours,
AvgWholesaleVolume,OwnerName,IsStartUpStore,AAPPreviousGroup,Payee_id,EmergencyPhone,Website,AccountDescription,ComputerSoftware,DBA,Resigned,WhyResigned,CompetitiveAcct 

HAVING COUNT(*) = 1
) tmp

END
GO
