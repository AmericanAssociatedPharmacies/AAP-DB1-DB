USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_YTDAPIRebatesDashboard]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Report Card for Wayne
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_YTDAPIRebatesDashboard]
@returnQtrYear varchar(5) OUTPUT

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

	
	SET @SQL = 'SELECT * from ( ';

	SET @Year =  (SELECT max(substring(period,1,4))  from pharmacymaster..PM_rebates_APIQuarterly );
	SET @QtrYear = (SELECT max(replace(period,'Q',''))  from pharmacymaster..PM_rebates_APIQuarterly );
    SET @Qtr = (SELECT substring(max(replace(period,'Q','')),5,1) from pharmacymaster..PM_rebates_APIQuarterly );
	SET @returnQtrYear = @QtrYear;
	SET @prevYear = @Year - 1;

   
    -- Build the API WH Sales fields for YTD sum
 

		SET @SQL = @SQL + ' SELECT Year,''API Rebate'' as ColumName,  sum((round(isnull(APIWhseReb ,0),2))) as APIWhseReb   from ' +
                          ' ( ' +
                          '  SELECT [Rebate to Pay Acct/Admin]   * [Pay Account]  as APIWhseReb , ' +
                          '  substring(period,1,4) as year, ' +
                          '  substring( replace(period,''Q'',''''),5,1)   as per ' +
                          '  from pharmacymaster..PM_rebates_APIQuarterly where substring(period,1,4)  = ' + @Year +
                          '  and  substring( replace(period,''Q'',''''),5,1)  between 1 and ' + @Qtr +
						  '  )reb  group by year ' ; 
		SET @SQL = @SQL + ' union';



		SET @SQL = @SQL + ' SELECT Year, ''API Rebate'' as ColumName,sum((round(isnull(APIWhseReb ,0),2))) as APIWhseReb   from ' +
                  ' ( ' +
                  '  SELECT [Rebate to Pay Acct/Admin]   * [Pay Account]  as APIWhseReb , ' +
                  '  substring(period,1,4) as year, ' +
                  '  substring( replace(period,''Q'',''''),5,1)   as per ' +
                  '  from pharmacymaster..PM_rebates_APIQuarterly where substring(period,1,4)  = ' + @prevYear +
                  '  and  substring( replace(period,''Q'',''''),5,1)  between 1 and ' + @Qtr +
				  '  )reb  group by year ';

        SET @SQL = @SQL + '  )ch order by year asc';

 
	EXEC (@SQL);


	 
END








GO
