USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_chaccountpmidaap]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_chaccountpmidaap] as (select v_chaccountpmid.*,v_PM_Allwithaffiliates.aapeffectivedate,v_PM_Allwithaffiliates.aapquitdate,v_PM_Allwithaffiliates.aapaccountno 
from v_chaccountpmid left join v_PM_Allwithaffiliates on v_PM_Allwithaffiliates.pmid = v_chaccountpmid.pmid)
GO
