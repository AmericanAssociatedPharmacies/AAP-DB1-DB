USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PriceProtection_ListForReports]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <01/08/2015>
-- Description:	Price Protection reports 
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PriceProtection_ListForReports]
(@in_date varchar(10))
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT L01AfltnName,cast(DCNumber as varchar(10))as DC, CustomerNumber,CustomerName,CorpItemNumber,Description,
		NDC,Supplier,Size,ProtectedSelPrice,NewSellPrice,ProtectionStartDate,ProtectionEndDate,
		cast(Prev3MonthUsage as int) as Prev3MonthUsage,cast(AvgMonthlyUsage  as int) as AvgMonthlyUsage,
        UnitSellDlr,cast(ActualUsageToDate as int) as ActualUsageToDate ,PriceProtectionDueToDate,
		State,SubAffiliation,CustomerUnique,cast(Usage as int) as Usage,cast(Returns as int) as Returns,
        cast(PriorMonthUsage  as int) as PriorMonthUsage,cast(Available as int) as Available,
        cast(OverageLastMonth as int) as OverageLastMonth, cast(TotalOwed as int) as TotalOwed,
        cast(UsageForCalculation as int) as UsageForCalculation
		FROM  pharmacymaster..ca_priceprotection 
			where date = @in_date
END










GO
