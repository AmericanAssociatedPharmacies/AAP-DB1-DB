USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_webuser]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_webuser]
as
select u.*,p.pmid,p.accountname,p.city,p.state from 
openquery(uniteddb,'select * from truescript.auth_user') u
left join v_pm_allwithaffiliates p
	on u.user_id=p.ncpdp

GO
