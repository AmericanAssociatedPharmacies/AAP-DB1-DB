USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_PriceProtection_Load]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[usp_PriceProtection_Load]

	@Date VARCHAR(25)

AS

SET NOCOUNT ON;

BEGIN

	DECLARE @ReportDate DATETIME 

	SET @ReportDate = CONVERT(DATETIME,@Date)

	INSERT INTO [dbo].[import_PriceProtection](
	Date
	, RebateReportMonth
	, L01AfltnName
	, DCNumber
	, CustomerNumber
	, CustomerName
	, CorpItemNumber
	, Description
	, NDC
	, Supplier
	, Size
	, ProtectedSelPrice
	, NewSellPrice
	, ProtectionStartDate
	, ProtectionEndDate
	, Prev3MonthUsage
	, AvgMonthlyUsage
	, UnitSellDlr
	, ActualUsageToDate
	, PriceProtectionDueToDate
	, State
	, SubAffiliation
	, CustomerUnique
	, Usage
	, Returns
	, PriorMonthUsage
	, Available
	, OverageLastMonth
	, TotalOwed
	, UsageForCalculation
	, Comment
	, RebatePerc
	, FinalPriceProtectionDue
	)
	SELECT @ReportDate AS Date
	, @ReportDate AS RebateReportMonth
	, L01AfltnName
	, DCNumber
	, CustomerNumber
	, CustomerName
	, CorpItemNumber
	, Description
	, NDC
	, Supplier
	, Size
	, ProtectedSelPrice
	, NewSellPrice
	, ProtectionStartDate
	, ProtectionEndDate
	, Prev3MonthUsage
	, AvgMonthlyUsage
	, UnitSellDlr
	, ActualUsageToDate
	, PriceProtectionDueToDate
	, State
	, SubAffiliation
	, CustomerUnique
	, Usage
	, Returns
	, PriorMonthUsage
	, Available
	, OverageLastMonth
	, TotalOwed
	, UsageForCalculation
	, Comment
	, NULL AS RebatePerc
	, NULL AS FinalPriceProtectionDue
	FROM dbo.vwPriceProtection


END





GO
