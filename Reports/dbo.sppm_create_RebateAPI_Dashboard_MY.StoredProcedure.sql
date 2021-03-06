USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_RebateAPI_Dashboard_MY]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Volume for Dashboard
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_RebateAPI_Dashboard_MY]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
    DECLARE @SQL varchar(max);
	DECLARE @QtrYear varchar(5);
	DECLARE @Qtr varchar(1);
	DECLARE @Year varchar(4);
	DECLARE @prevYear varchar(4);


	SET @Year =  (SELECT max(substring(period,1,4))  from pharmacymaster..PM_rebates_APIQuarterly );
	SET @QtrYear = (SELECT max(replace(period,'Q',''))  from pharmacymaster..PM_rebates_APIQuarterly );
    --SET @Qtr = (SELECT substring(max(replace(period,'Q','')),5,1) from pharmacymaster..PM_rebates_APIQuarterly );
SET @Qtr = 4;
--	SET @returnQtrYear = @QtrYear;
	SET @prevYear = @Year - 1;


 SELECT Year, Period, sum((round(isnull(APIWhseReb ,0),2))) as 'API Warehouse Rebate'   from  
                   (  
   SELECT [Rebate to Pay Acct/Admin]   * [Pay Account]  as APIWhseReb ,  
  substring(period,1,4) as year,  
                   substring( period,5,2)   as Period  
   from pharmacymaster..PM_rebates_APIQuarterly where substring(period,1,4)  =   @Year  
      and  substring( replace(period,'Q',''),5,1)  between 1 and @Qtr
 )reb  group by year ,Period

union

 SELECT Year, Period, sum((round(isnull(APIWhseReb ,0),2))) as 'API Warehouse Rebate'   from  
                   (  
   SELECT [Rebate to Pay Acct/Admin]   * [Pay Account]  as APIWhseReb ,  
  substring(period,1,4) as year,  
                   substring( period,5,2)   as Period  
   from pharmacymaster..PM_rebates_APIQuarterly where substring(period,1,4)  =   @prevYear  
      and  substring( replace(period,'Q',''),5,1)  between 1 and @Qtr
 )reb  group by year ,Period

END








GO
