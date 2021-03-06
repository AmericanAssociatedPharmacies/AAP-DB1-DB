USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_PM_Affiliates]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_PM_Affiliates]
AS

SELECT p.pmid as PMID ,p.accountname As AccountName,p.aapaccountno as AAPAccountNo,
p.apiaccountno as APIAccountNo,p.udaccountno as UD_AccountNo,v.group_name  from PM_Pharmacy p
join v_PM_Groups v on p.pmid = v.pmid where v.AffiliateID is not null

GO
