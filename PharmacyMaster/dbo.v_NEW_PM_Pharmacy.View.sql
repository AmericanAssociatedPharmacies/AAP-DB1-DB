USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_NEW_PM_Pharmacy]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_NEW_PM_Pharmacy]
AS

SELECT 
p.PMID,PMParentID,AAPAccountNo,AAPEffectiveDate,AAPParentNo,AAPPreviousGroup,AAPQuitDate,AAPStatus,AccountDescription,AccountName,APIAccountNo,
APIMemberNo,APIStatus,AvgWholesaleVolume,
a.address as Addr1,a.address2 as Addr2,BusinessClass,CAHStatus,m.ChainCode, a.City,a.ContactFullName,
CustPayTermsAPI,
CompetitiveAcct,ComputerSoftware,ContractDate,CorporateName,DateOpened,DBA,
DEA,DEAEXP,Email,EmergencyPhone,a.Fax,FedID,HolidayHours,Hours,IsStartUpStore,m.MCEffectiveDate,m.MCQuitDate,NCPDP,
NPI,NumReactivated,OrigStartDate,OwnerName,Payee_id,a.Phone,QPS,Resigned,Source,a.State,
c.StateLicExpDate,c.StateLicNo,
Territory,UDAccountNo,UDNonPharmacy,UDParentNo,UDQuitDate,UDStatus,Website,Wholesaler,WholesalerAccountNo,WhyResigned,
a.Zip 

from PM_Pharmacy p
left outer join 
(
select pmid,address,address2,ContactFullName,City,State,Zip,Phone,Fax from pm_addressmaster where address_type_id = 1
) a
on p.pmid = a.pmid
left outer join
(
select pmid,ChainCode,MCEffectiveDate,MCQuitDate from PM_ManagedCare
) m
on p.pmid = m.pmid
left outer join
(
select pmid,StateLicExpDate,StateLicNo from PM_Cred
) c
on p.pmid = c.pmid

--	SELECT 
--PMID,PMParentID,AAPAccountNo,AAPEffectiveDate,AAPParentNo,AAPPreviousGroup,AAPQuitDate,AAPStatus,AccountDescription,AccountName,
--Addr1,Addr2,AllowDupDEA,APIAccountNo,APIMemberNo,APIStatus,AreaCode,AvgWholesaleVolume,BusinessClass,CAHStatus,CardinalDC,ChainCode,
--City,CompetitiveAcct,ComputerSoftware,ContactFirst,ContactFullName,ContactLast,ContractDate,CorporateName,CustPayTermsAPI,DateOpened,DBA,
--DEA,DEAEXP,EffectiveDate,Email,EmergencyPhone,Fax,FaxAreaCode,FedID,HolidayHours,Hours,IsStartUpStore,MCEffectiveDate,MCQuitDate,NCPDP,
--NPI,NumReactivated,OrigStartDate,OwnerName,Payee_id,Phone,PrimaryCAAccountNo,QPS,Rank,Resigned,Source,State,StateLicExpDate,StateLicNo,
--Status,Territory,UDAccountNo,UDNonPharmacy,UDParentNo,UDQuitDate,UDStatus,Website,Wholesaler,WholesalerAccountNo,WhyResigned,Zip
--from PM_Pharmacy
GO
