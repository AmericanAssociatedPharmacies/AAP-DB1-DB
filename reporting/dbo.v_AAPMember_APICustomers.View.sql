USE [reporting]
GO
/****** Object:  View [dbo].[v_AAPMember_APICustomers]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_AAPMember_APICustomers] as
select * from PharmacyMaster.[dbo].[v_PM_AllWithAffiliates] where
	(AAPAccountNo is not null and AAPAccountNo != '' and AAPQuitDate is null)
	or
	(APIAccountNo is not null and APIAccountNo not like'%-%' and APIStatus in ('ACTIVE'))
GO
