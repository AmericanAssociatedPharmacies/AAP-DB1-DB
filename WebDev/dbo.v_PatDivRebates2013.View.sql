USE [WebDev]
GO
/****** Object:  View [dbo].[v_PatDivRebates2013]    Script Date: 12/22/2020 9:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_PatDivRebates2013]
AS

	SELECT PMID,AccountName,
	isnull(PatDivFirstPayment,0.0) as PatDivFirstPayment,
	isnull(PatDivSecondPayment,0.0) as PatDivSecondPayment,
	isnull(PatDivFirstPayment,0.0)+isnull(PatDivSecondPayment,0.0) as PatDivTotalPayment 
	from pharmacymaster.dbo.PM_AnnualRebates
WHERE year= 2013

GO
