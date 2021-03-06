USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[usp_RebateAretePerformance]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_RebateAretePerformance]
	-- Add the parameters for the stored procedure here
	@PMID Int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select 
 --datename(month,dateadd(month,2,[Date])) + ' ' + convert(varchar(4),year(dateadd(month,2,[Date]))) as [Rebate Date]
[Date] as [RebateDate]
,case when [Arete - AAP Rebate] = -1.0 then 'Pending' else dbo.fnFormatCurrency([Arete - AAP Rebate]) end as [AreteAAPRebate]
,case when [Arete - API Rebate] = -1.0 then 'Pending' else dbo.fnFormatCurrency([Arete - API Rebate]) end as [AreteAPIRebate]

from
(
select
[date]
,sum([Arete - AAP Rebate]) as [Arete - AAP Rebate]
,sum([Arete - API Rebate]) as [Arete - API Rebate]

from
(
	select top 4
	[date] 
	,isnull([AretePerformanceRebate],-1.0) as [Arete - AAP Rebate] --use negative as a null flag
	,0.00 as [Arete - API Rebate]
	from
	pharmacymaster..PM_Rebates_CHAAP
	where pmid=@PMID
	--and [date] >= '6/1/2016'
	order by [date] desc
UNION

	select top 4
	[date]
	,0.00 as [Arete - AAP Rebate]
	,isnull(AreteRebateFee,-1.0) as [Arete - API Rebate]  --use negative as a null flag
	from
	pharmacymaster..v_web_PM_Rebates_APIMonthly
	where pmid=@PMID
	--and [date] >= '6/1/2016'
	order by [date] desc
) dt
	group by [Date]
) dt2
	order by [Date] desc
END
GO
