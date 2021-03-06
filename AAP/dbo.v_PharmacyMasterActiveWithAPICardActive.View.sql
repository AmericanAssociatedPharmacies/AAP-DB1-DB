USE [AAP]
GO
/****** Object:  View [dbo].[v_PharmacyMasterActiveWithAPICardActive]    Script Date: 12/22/2020 9:04:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_PharmacyMasterActiveWithAPICardActive]
AS

SELECT * FROM  PharmacyMasterActive_Distinct
UNION
SELECT o.* FROM  PharmacyMaster o
left outer join PharmacyMasterActive_Distinct am
on o.dea = am.dea where o.cahstatus = 'active'
and am.dea is null  
GO
