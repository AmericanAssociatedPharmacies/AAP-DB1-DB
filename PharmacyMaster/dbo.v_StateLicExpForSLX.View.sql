USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_StateLicExpForSLX]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create VIEW [dbo].[v_StateLicExpForSLX]
AS
SELECT   DEA, apiaccountno,statelicexpdate  from  v_pm_allwithaffiliates
 where  statelicexpdate is not null and statelicexpdate !='' and(DEA is not null or apiaccountno is not null)
 
GO
