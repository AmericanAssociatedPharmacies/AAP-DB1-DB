USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_RebatePP_Dashboard_MY]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for PP Rebates for Dashboard
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_RebatePP_Dashboard_MY]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
    DECLARE @SQL varchar(max);
	--DECLARE @QtrYear varchar(5);
	DECLARE @Qtr varchar(1);
	DECLARE @Year varchar(4);
	DECLARE @prevYear varchar(4);


    --Uncomment when done testing - setting value for test
 SET @Year =  (SELECT max(substring(period,1,4))  from pharmacymaster..PM_rebates_APIQuarterly );
 --  SET @Year =  2014;
	--SET @QtrYear = (SELECT max(replace(period,'Q',''))  from pharmacymaster..PM_rebates_APIQuarterly );
   -- SET @Qtr = (SELECT substring(max(replace(period,'Q','')),5,1) from pharmacymaster..PM_rebates_APIQuarterly );
	SET @Qtr = 4;
--	SET @returnQtrYear = @QtrYear;
	SET @prevYear = @Year - 1;


-- SELECT Year, Period, sum(round(PPReb,2) ) as 'Preferred Partner Rebate'   from  
--                   (  
--   SELECT isnull([paid to store],0.00)+isnull([paid to affiliate],0.00)  as PPReb ,  
--  substring(period,1,4) as year,  
--                   substring( period,5,2)   as Period  
--   from pharmacymaster..PM_rebates_PPartner where substring(period,1,4)  =   @Year  
--      and  substring( replace(period,'Q',''),5,1)  between 1 and @Qtr
-- )reb  group by year ,Period
--
--union
--
-- SELECT Year, Period, sum(round(PPReb,2) ) as 'Preferred Partner Rebate'   from  
--                   (  
--   SELECT isnull([paid to store],0.00)+isnull([paid to affiliate],0.00)   as PPReb ,  
--  substring(period,1,4) as year,  
--                   substring( period,5,2)   as Period  
--   from pharmacymaster..PM_rebates_PPartner where substring(period,1,4)  =   @prevYear  
--      and  substring( replace(period,'Q',''),5,1)  between 1 and @Qtr
-- )reb  group by year ,Period

IF(@Year <= 2014 and @prevYear <= 2014)

	BEGIN
		SELECT Year, 'Preferred Partner Rebate' as ColumnName , sum(round(PPReb,2) ) as 'PPRebate'   from  
					   (  
		SELECT isnull([paid to store],0.00)+isnull([paid to affiliate],0.00)  as PPReb ,  
		substring(period,1,4) as year 
		from pharmacymaster..PM_rebates_PPartner where substring(period,1,4)  =   @Year  
		  and  substring( replace(period,'Q',''),5,1)  between 1 and @Qtr
		)reb  group by year  

		union

	     SELECT Year, 'Preferred Partner Rebate' as ColumnName , sum(round(PPReb,2) ) as 'PPRebate'   from  
					   (  
		SELECT isnull([paid to store],0.00)+isnull([paid to affiliate],0.00)   as PPReb ,  
		substring(period,1,4) as year 
		from pharmacymaster..PM_rebates_PPartner where substring(period,1,4)  =   @prevYear  
		  and  substring( replace(period,'Q',''),5,1)  between 1 and @Qtr
		)reb  group by year  
	END

IF(@Year = 2015 and @prevYear = 2014)

	BEGIN
		SELECT Year, 'Preferred Partner Rebate' as ColumnName , sum(round(PPReb,2) ) as 'PPRebate'   from  
					   (  
		SELECT isnull([paid to store],0.00)+isnull([paid to affiliate],0.00)  as PPReb ,  
		Period as year 
		from pharmacymaster..PM_rebates_PPartner where Period  =   @Year  
		)reb  group by year  

		union

	     SELECT Year, 'Preferred Partner Rebate' as ColumnName , sum(round(PPReb,2) ) as 'PPRebate'   from  
					   (  
		SELECT isnull([paid to store],0.00)+isnull([paid to affiliate],0.00)   as PPReb ,  
		substring(period,1,4) as year 
		from pharmacymaster..PM_rebates_PPartner where substring(period,1,4)  =   @prevYear  
		  and  substring( replace(period,'Q',''),5,1)  between 1 and @Qtr
		)reb  group by year  
	END

IF(@Year >= 2015 and @prevYear >= 2015)

	BEGIN
		SELECT Year, 'Preferred Partner Rebate' as ColumnName , sum(round(PPReb,2) ) as 'PPRebate'   from  
					   (  
		SELECT isnull([paid to store],0.00)+isnull([paid to affiliate],0.00)  as PPReb ,  
		Period as year 
		from pharmacymaster..PM_rebates_PPartner where Period  =   @Year  
		)reb  group by year  

		union

	     		SELECT Year, 'Preferred Partner Rebate' as ColumnName , sum(round(PPReb,2) ) as 'PPRebate'   from  
					   (  
		SELECT isnull([paid to store],0.00)+isnull([paid to affiliate],0.00)  as PPReb ,  
		Period as year 
		from pharmacymaster..PM_rebates_PPartner where Period  =   @prevYear  
		)reb  group by year   
	END
--
--	SET @SQL = @SQL + ' SELECT ' + @Year + ' as Year, ''API Rebate'' as ColumName,  sum( [Rebate to Pay Acct/Admin]   * [Pay Account] ) as APIWhseReb from pharmacymaster..PM_rebates_APIMonthly ' +
--				  ' where year(date) = ' + @Year + ' and month(date) between 1 and ' + @Month;
--	SET @SQL = @SQL + ' union';
--
--	SET @SQL = @SQL + ' SELECT ' + @prevYear + ' as Year, ''API Rebate'' as ColumName,  sum( [Rebate to Pay Acct/Admin]   * [Pay Account] ) as APIWhseReb from pharmacymaster..PM_rebates_APIMonthly ' +
--				  ' where year(date) = ' + @prevYear + ' and month(date) between 1 and ' + @Month;
--	SET @SQL = @SQL + '  )ch order by year asc';
END








GO
