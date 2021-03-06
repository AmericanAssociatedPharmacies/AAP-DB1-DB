USE [AAP]
GO
/****** Object:  View [dbo].[v_PharmacyMaster_MailingList]    Script Date: 12/22/2020 9:04:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_PharmacyMaster_MailingList]
AS

 SELECT am.AccountName,am.AAPAccountNo,AAPParentNo,am.APIAccountNo,am.UDAccountNo,am.UDParentNo,am.Addr1,am.Addr2,am.City,am.State,am.Zip,am.ContactFirst,am.ContactLast,am.ContactFullName,
	    am.AreaCode,am.Phone,am.FaxAreaCode,am.Fax,am.Email   FROM PharmacyMasterActive_Distinct am where 
		BusinessClass   not in ('C02','C06','C12','C14','C16','C17','C18', 'C99','SDFT') 
 UNION

 SELECT am.AccountName,am.AAPAccountNo,AAPParentNo,am.APIAccountNo,am.UDAccountNo,am.UDParentNo,am.Addr1,am.Addr2,am.City,am.State,am.Zip,am.ContactFirst,am.ContactLast,am.ContactFullName,
	    am.AreaCode,am.Phone,am.FaxAreaCode,am.Fax,am.Email   FROM PharmacyMasterActive_Distinct am
	JOIN reporting.dbo.active_members_withtypes sm on
		am.udaccountno = sm.acct_no where type  not in ('NPP','Pipco') and am.dea is not null
 UNION

 SELECT am.AccountName,am.AAPAccountNo,AAPParentNo,am.APIAccountNo,am.UDAccountNo,am.UDParentNo,am.Addr1,am.Addr2,am.City,am.State,am.Zip,am.ContactFirst,am.ContactLast,am.ContactFullName,
	    am.AreaCode,am.Phone,am.FaxAreaCode,am.Fax ,am.Email  FROM PharmacyMasterActive_Distinct am
	JOIN aapaccount aap on am.aapaccountno = aap.aapid
 WHERE am.aapaccountno is not null and am.apiAccountno is null and 
       am.udaccountno is null and aap.IsNpp = 0 and (GroupDesignation  != 'PIPCO' or GroupDesignation is null)
GO
