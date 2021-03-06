USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[usp_RebateAPITrue10]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_RebateAPITrue10]
	-- Add the parameters for the stored procedure here
	@PMIDList varchar(255),
	@StartDate datetime2
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select 
top 6
[date] as [RebateFor],
[True10Sales] as [True10Sales],
[True10Rebate] as [RebateAmount]
from pharmacymaster..v_web_PM_Rebates_APIMonthly --changed to use view sums multiple api accounts
where pmid in (select * from ufn_CommaListToTable(@PMIDList))
and [date] > @StartDate
order by [date] desc
END
GO
