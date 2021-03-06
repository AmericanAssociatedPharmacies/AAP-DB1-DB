USE [AAP]
GO
/****** Object:  View [dbo].[v_PharmacyTimes_MailingList]    Script Date: 12/22/2020 9:04:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_PharmacyTimes_MailingList]
AS

-- This will select all the API it needs (except Corporate)
 SELECT am.Source,am.AccountName,am.Addr1,am.Addr2,am.City,am.State,am.Zip,am.ContactFullName,am.ContactFirst,am.ContactLast,
	    am.Territory,am.AreaCode,am.Phone,am.FaxAreaCode,am.Fax,am.Email,am.Status,am.BusinessClass,am.AAPAccountNo,AAPParentNo,am.APIAccountNo,am.UDAccountNo,am.UDParentNo 
    FROM PharmacyMasterActive_Distinct am where 
		BusinessClass   not in ('C02','C06','C12','C14','C16','C17','C18', 'C99','SDFT') and am.apiaccountno is not null 
 UNION
-- This will select all the UD except NPP and Pipco
 SELECT am.Source,am.AccountName,am.Addr1,am.Addr2,am.City,am.State,am.Zip,am.ContactFullName,am.ContactFirst,am.ContactLast,
	    am.Territory,am.AreaCode,am.Phone,am.FaxAreaCode,am.Fax,am.Email,am.Status,am.BusinessClass,am.AAPAccountNo,AAPParentNo,am.APIAccountNo,am.UDAccountNo,am.UDParentNo
    FROM PharmacyMasterActive_Distinct am
    JOIN reporting.dbo.active_members_withtypes sm on
		am.udaccountno = sm.acct_no
	WHERE TYPE  not in ('NPP','Pipco')  and am.apiAccountno is null  
 UNION
--This selects the AAP only except for PIPCO and NPP
 SELECT am.Source,am.AccountName,am.Addr1,am.Addr2,am.City,am.State,am.Zip,am.ContactFullName,am.ContactFirst,am.ContactLast,
	    am.Territory,am.AreaCode,am.Phone,am.FaxAreaCode,am.Fax,am.Email,am.Status,am.BusinessClass,am.AAPAccountNo,AAPParentNo,am.APIAccountNo,am.UDAccountNo,am.UDParentNo 
  FROM PharmacyMasterActive_Distinct am
	JOIN aapaccount aap on am.aapaccountno = aap.aapid
	WHERE am.aapaccountno is not null and am.apiAccountno is null and 
       am.udaccountno is null and aap.IsNpp = 0 and (GroupDesignation  != 'PIPCO' or GroupDesignation is null)
 UNION
--This selects the Corporate Information
 SELECT am.Source,am.AccountName,am.Addr1,am.Addr2,am.City,am.State,am.Zip,am.ContactFullName,am.ContactFirst,am.ContactLast,
	    am.Territory,am.AreaCode,am.Phone,am.FaxAreaCode,am.Fax,am.Email,am.Status,am.BusinessClass,am.AAPAccountNo,AAPParentNo,am.APIAccountNo,am.UDAccountNo,am.UDParentNo 
        from AAPCorporateMailList am where am.Source in ('UD-PIPCO','API-NPSC','API-KEYSTONE')
GO
