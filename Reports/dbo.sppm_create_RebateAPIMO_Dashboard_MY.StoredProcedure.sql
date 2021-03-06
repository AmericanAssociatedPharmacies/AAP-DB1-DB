USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_RebateAPIMO_Dashboard_MY]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Cardinal Generic Rebates for Dashboard
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_RebateAPIMO_Dashboard_MY]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
DECLARE @year int;
DECLARE @prevYear int;

SET @year = (select max(year(date))  from pharmacymaster..PM_rebates_APIMonthly);
SET @prevYear = @year - 1 ; 


   SELECT year(date) as Year, SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 3) as Month ,sum([Rebate to Pay Acct/Admin]   * [Pay Account]  )   as 'API Warehouse Rebate'  
from pharmacymaster..PM_rebates_APIMonthly
	where year(date) in (@year,@prevYear)  group by  date order by  date
END








GO
