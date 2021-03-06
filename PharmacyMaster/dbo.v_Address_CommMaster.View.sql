USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_Address_CommMaster]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_Address_CommMaster]
AS

SELECT  distinct p.PMID, Source, AccountName,AccountDescription,AAPEffectiveDate,AAPQuitDate,MCEffectiveDate,MCQuitDate, ChainCode, Addr1,   Addr2, City, State, Zip, ContactFullName,  
	Territory, Phone,  Fax, Email, Status, BusinessClass, 
	AAPAccountNo, AAPParentNo, APIAccountNo,  GroupID, 
	AAPStatus, APIStatus,Group_Name ,DEA,NCPDP,NPI,StateLicNo,ComputerSoftware,GroupNo,
	StateMedicaidNo,StateLicExpDate,DEAExp,FedID,isNPP,DoNotFax,CommunicationPreference,VendorName,dbo.PMProgramNames(p.pmid) as Programs
    

    from pharmacymaster..v_Address_Mailing_ListGen_NEW_PM p

	left join
	(
		select va.vendorid,pmid,vendorname from pm_vendoraccts va
		left join
		(
			select * from pm_vendors 
		) pv on va.vendorid = pv.vendorid
    ) v on p.pmid = v.pmid


  
GO
