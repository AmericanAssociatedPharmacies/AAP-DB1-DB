USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_RebateHV_Dashboard_MY]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for High Volume Rebates for Dashboard
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_RebateHV_Dashboard_MY]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
DECLARE @year varchar(4);
DECLARE @prevYear varchar(4);


SET @year = (select max(year(date))  from pharmacymaster..pm_rebates_HighVolume);
SET @prevYear = @year - 1 ; 




	 IF EXISTS(SELECT name FROM sys.tables
		 WHERE name = 'tmp_hvReb_DB')
	 BEGIN
      DROP TABLE tmp_hvReb_DB
     END

SELECT * into tmp_hvReb_DB from (
         SELECT year(date) as Year, month(date) as Month ,sum(round(isnull([High Volume Incentive],0.00),2)) as [High Volume Rebate]  
           from pharmacymaster..pm_rebates_HighVolume  
	       where year(date) in (  @year  ,  @prevYear ) group by date 
) ch   
IF(@prevYear = 2011)
	BEGIN
		INSERT into tmp_hvReb_DB values (2011,1,0)
		INSERT into tmp_hvReb_DB values (2011,2,0)
		INSERT into tmp_hvReb_DB values (2011,3,0)
	END

SELECT Year,dbo.MonthFromNumber(month) as MonthOut ,[High Volume Rebate]  from tmp_hvReb_DB order by year,month;
END








GO
