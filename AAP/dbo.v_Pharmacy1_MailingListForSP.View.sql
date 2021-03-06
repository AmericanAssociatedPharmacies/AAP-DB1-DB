USE [AAP]
GO
/****** Object:  View [dbo].[v_Pharmacy1_MailingListForSP]    Script Date: 12/22/2020 9:04:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_Pharmacy1_MailingListForSP]
AS

SELECT am.PMID,am.Source,am.AccountName,am.Addr1,am.Addr2,am.City,am.State,am.Zip,am.ContactFullName,am.ContactFirst,am.ContactLast,  
	 am.Territory,am.AreaCode,am.Phone,am.FaxAreaCode,am.Fax,am.Email,am.Status,am.BusinessClass,am.AAPAccountNo,AAPParentNo,
	 am.APIAccountNo,am.UDAccountNo,am.UDParentNo ,am.ChainCode,sm.type,aap.IsNpp,aap.GroupDesignation,am.aapstatus,am.udstatus,am.apistatus
FROM PharmacyMaster..Pharmacy1 am 
left outer join reporting.dbo.active_members_withtypes sm on
		am.udaccountno = sm.acct_no
left outer join  aapaccount aap on am.aapaccountno = aap.aapid
where (  businessclass != 'SDFT'   or businessclass is null) 
					 and ( Territory != 'XX' or Territory is null) 
					 and ((apiaccountNo !=  '_CREATIVE' and apiaccountNo != 'SECRETARY' and apiaccountNo != '00APSLLC' ) or apiaccountNo is null) 
					and (udnonpharmacy != 'C' or udnonpharmacy is null)
GO
