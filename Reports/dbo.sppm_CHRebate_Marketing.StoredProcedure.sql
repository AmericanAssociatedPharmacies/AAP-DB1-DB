USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_CHRebate_Marketing]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LeeAnn and Syreeta
-- Create date: 3/1/2018
-- Description:	Send marketing the rebate data 
-- =============================================
CREATE PROCEDURE [dbo].[sppm_CHRebate_Marketing]

AS

BEGIN

	SET NOCOUNT ON;

	SELECT pm.PMID
	, pm.AAPAccountNo
	, pm.ACHEmail AS FinancialEmail
	, pm.Email AS GeneralEmail
	, pm.AccountName AS StoreName
	, pm.OwnerName AS PharmacyOwner
	, r.Amount AS AAPRebateAmount
	, r.[Date Due] AS PaymentDate
	FROM tmp_CHRebates_Journal_JMW AS r--table a
	LEFT JOIN PharmacyMaster.dbo.v_PM_AllWithAffiliates AS pm--table b
	ON r.[Vendor ID] = pm.PMID

END
GO
