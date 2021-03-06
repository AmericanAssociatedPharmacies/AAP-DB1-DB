USE [AAP]
GO
/****** Object:  View [dbo].[v_PharmacyMaster_MailingList_AAPandUDOnly]    Script Date: 12/22/2020 9:04:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_PharmacyMaster_MailingList_AAPandUDOnly]
AS

 SELECT am.AccountName,am.AAPAccountNo,AAPParentNo,am.UDAccountNo,am.UDParentNo,am.Addr1,am.Addr2,am.City,am.State,am.Zip,am.ContactFirst,am.ContactLast,
	    am.AreaCode,am.Phone,am.FaxAreaCode,am.Fax,am.Email   FROM PharmacyMasterActive_Distinct am
 JOIN reporting.dbo.active_members_withtypes sm on
		am.udaccountno = sm.acct_no
 where type  not in ('NPP','Pipco')  and am.apiAccountno is null  


--TODO need to check if they want AAP Accounts in this even if no UD - if they do this is the one we need

-- SELECT am.AccountName,am.AAPAccountNo,AAPParentNo,am.UDAccountNo,am.UDParentNo,am.Addr1,am.Addr2,am.City,am.State,am.Zip,am.ContactFirst,am.ContactLast,
--	    am.AreaCode,am.Phone,am.FaxAreaCode,am.Fax,am.Email   FROM PharmacyMasterActive_Distinct am
-- left outer JOIN reporting.dbo.active_members_withtypes sm on
--		am.udaccountno = sm.acct_no
-- where type  not in ('NPP','Pipco')  and am.apiAccountno is null  
--and ( aapaccountno is not null or udaccountno is not null )
 
GO
