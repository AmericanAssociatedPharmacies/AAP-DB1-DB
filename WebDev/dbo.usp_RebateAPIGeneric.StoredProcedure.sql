USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[usp_RebateAPIGeneric]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_RebateAPIGeneric]
	-- Add the parameters for the stored procedure here
	@PMIDList varchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @DelayTill10th datetime
SELECT @DelayTill10th = case when datepart(day,getdate()) >= 10 -- previously @DelayTill15th changed date from 15th to 10th per Joni  10/5/2016 
	then dateadd(month,-2,getdate()) 
	else dateadd(month,-3,getdate()) end

SELECT 
top 6
[date] as [RebateFor],
[API Generic Sales] as [APIGenericSales],
[Net Rebate to Store] as [RebateAmount],
--convert(varchar(50),round([Avg Rebate Percentage]*100.0,2,1)) + '%' as [Rebate Percentage]
[Avg Rebate Percentage] as [RebatePercentage]
,(select top 1 [PaymentDate] from  pharmacymaster..pm_rebates_paymentdates d 
	where d.RebateMonth=[date] and RebateType='API' order by PaymentDate desc) as [PaymentDate] 

from pharmacymaster..v_web_PM_Rebates_APIMonthly --changed to use view 9/2014, view sums multiple api accounts
where pmid in (select * from ufn_CommaListToTable(@PMIDList))
and [date] <= @DelayTill10th
order by [date] desc
END
GO
