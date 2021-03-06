USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[usp_RebateAPIBrand]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_RebateAPIBrand]
	-- Add the parameters for the stored procedure here
	@PMIDList varchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    declare @monthsInNewTable int
	declare @startDateNewTable datetime
	declare @latestDateNewTable datetime
	declare @startDateOldTable datetime

	select @startDateNewTable = min([date]) from pharmacymaster..PM_BrandCredits_APIMonthly
	select @latestDateNewTable= max([date]) from pharmacymaster..PM_BrandCredits_APIMonthly
	select @monthsInNewTable = datediff(mm,@startDateNewTable,@latestDateNewTable)
	select @startDateOldTable = dateadd(mm,(@monthsInNewTable-6),@startDateNewTable)

	select
	max([Credit For]) [CreditFor]
	,max([API Brand Rx Purchases]) [APIBrandRxPurchases]
	, max([API Brand Rx Incentive Credit]) [APIBrandRxIncentiveCredit]
	from
	(
	select  
	[date],
	[date]  as [Credit For],
	[API Brand Sales] as [API Brand Rx Purchases],
	[Brand Credits Disbursed] as [API Brand Rx Incentive Credit]
	from pharmacymaster..v_web_PM_Rebates_APIMonthly --changed to use view 9/2014, view sums multiple api accounts
	where [date] > @startDateOldTable
	and pmid in (select * from ufn_CommaListToTable(@PMIDList))
 
 
	UNION
	select top 6
	[date],
	[date]  as [Credit For],
	[BrandSales] as [API Brand Rx Purchases],
	[BrandCredits] as [API Brand Rx Incentive Credit]
	from pharmacymaster..PM_BrandCredits_APIMonthly --changed to use new table 4/2016
	where pmid in (select * from ufn_CommaListToTable(@PMIDList))
 
	) dt group by [date] 
	order by [date] desc

END
GO
