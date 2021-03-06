USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_YTDNewMemberTermedCount]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Report Card for Wayne
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_YTDNewMemberTermedCount]


AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @SQL varchar(max);
	DECLARE @Month varchar(2);
	DECLARE @Year varchar(4);
	DECLARE @StartMonth int;
	DECLARE @DateStr varchar(10);
	DECLARE @DateStr2 varchar(10);
	DECLARE @Date datetime;
	
	SET  @StartMonth = 1;
	SET @SQL = 'SELECT * from ( ';
	SET @Month = cast((SELECT month(max(aapquitdate)) from pharmacymaster..pm_pharmacy) as varchar(2));
	SET @Year = cast((SELECT year(max(aapquitdate)) from pharmacymaster..pm_pharmacy) as varchar(4));

    SET @DateStr =  '01/01/' + @Year;
	SET @Date =  '01/01/' + @Year;

   
    -- Build the API WH Sales fields for 13 Months
	WHILE @StartMonth <= @Month
	BEGIN

 		--SET @Date =   DATEADD(m,@StartMonth,@DateStr);
		SET @DateStr2 = cast(@StartMonth as varchar(2)) + '/01/' + @Year

		SET @SQL = @SQL + ' SELECT ''New Members'' as Type,year(aapeffectivedate) as Year, ''' + reports.dbo.fdate2( @DateStr2 ) +'''     as Month , count(*) as Count from pharmacymaster..pm_pharmacy ' +
						  ' where year(aapeffectivedate) = ' + @Year + ' and month(aapeffectivedate) = ' + cast(@StartMonth as varchar(2)) + ' group by   month(aapeffectivedate)   ,year(aapeffectivedate) ';
		SET @SQL = @SQL + ' union';
		SET @SQL = @SQL + ' SELECT ''Termed Members'' as Type,year(aapquitdate) as Year, ''' + reports.dbo.fdate2( @DateStr2 ) +'''     as Month , count(*) as Count from pharmacymaster..pm_pharmacy ' +
						  ' where year(aapquitdate) = ' + @Year + ' and month(aapquitdate) = ' + cast(@StartMonth as varchar(2)) + ' group by   month(aapquitdate)   ,year(aapquitdate) ';
		SET @SQL = @SQL + ' union';
    	SET @StartMonth = @StartMonth + 1;
	END

   -- Now take of trailing comma
    SET @SQL = substring(@SQL,0,len(@SQL) - 5 );
    SET @SQL = @SQL + '  )ch  order by type,  reports.dbo.NumberFromMonth( Month)';
print @SQL;
	EXEC (@SQL);


	 
END








GO
