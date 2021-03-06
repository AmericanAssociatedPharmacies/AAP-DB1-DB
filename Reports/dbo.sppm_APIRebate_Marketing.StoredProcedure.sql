USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_APIRebate_Marketing]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LeeAnn and Syreeta
-- Create date: 3/1/2018
-- Description:	Send marketing the rebate data 
-- =============================================
CREATE PROCEDURE [dbo].[sppm_APIRebate_Marketing]
	@Date DATETIME
AS

BEGIN

	SET NOCOUNT ON;

	TRUNCATE TABLE Reports.dbo.PaymentAmounts_API

	INSERT INTO Reports.dbo.PaymentAmounts_API(PMID, AAPAccountNo, FinancialEmail, GeneralEmail, StoreName, PharmacyOwner, APIRebatePaymentAmount, RebateMonth)
	SELECT pm.PMID
	, pm.AAPAccountNo
	, pm.ACHEmail AS FinancialEmail
	, pm.Email AS GeneralEmail
	, pm.AccountName AS StoreName
	, pm.OwnerName AS PharmacyOwner
	, api.[Net Rebate to Store] as APIRebatePaymentAmount
	, api.Date as RebateMonth
	FROM Reports.dbo.Import_APIMonthlyRebates AS api--table a
	LEFT JOIN PharmacyMaster.dbo.v_PM_AllWithAffiliates AS pm--table b
	ON api.PMID = pm.PMID
	WHERE api.Date = @Date

END

GO
