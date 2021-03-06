USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[usp_RebateReport_AuditInfo]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Chris McKinnie
-- Create date: 12/15/2017
-- =============================================
CREATE PROCEDURE [dbo].[usp_RebateReport_AuditInfo]
	-- Add the parameters for the stored procedure here
	@StartDate DATETIME2,
	@EndDate DATETIME2
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @PreferredPartnerID INT = 1
		, @PlanOGramID INT = 2
		, @AAPMonthlyRebateID INT = 3
		, @PatronageDividendID INT = 4
		, @APIMonthlyRebateID INT = 5
		, @BrandCreditID INT = 6
		, @GenericLoyaltyID INT = 7
		, @TotalID INT = 99

	SELECT Date, RebateID, RebateType, Audited
	FROM (
		SELECT Date
			, RebateType
			, CASE WHEN RebateType = 'Preferred Partner' THEN @PreferredPartnerID
				WHEN RebateType = 'Plan O Gram' THEN @PlanOGramID
				WHEN RebateType = 'API Generic Rebate' THEN @APIMonthlyRebateID
				WHEN RebateType = 'Patronage Dividend' THEN @PatronageDividendID
				WHEN RebateType = 'CAH Rebate' THEN @AAPMonthlyRebateID
				WHEN RebateType = 'API Brand Credits' THEN @BrandCreditID
				WHEN RebateType = 'API Generic Incentive' THEN @GenericLoyaltyID
				ELSE NULL
				END AS RebateID
			, Audited
		FROM Reports.dbo.KPIDash_Goal3
		WHERE Date >= @StartDate AND Date <= @EndDate
	) AS k
	WHERE RebateID IS NOT NULL
		

END
GO
