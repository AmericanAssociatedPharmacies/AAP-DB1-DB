USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_PatDivRebates2013]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create VIEW [dbo].[v_PatDivRebates2013]
AS

	SELECT PMID,AccountName,PatDivFirstPayment,patDivSecondPayment from pharmacymaster.dbo.PM_AnnualRebates
WHERE year= 2013
GO
