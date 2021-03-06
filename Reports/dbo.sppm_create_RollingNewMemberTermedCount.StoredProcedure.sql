USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_RollingNewMemberTermedCount]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	CRolling 12 month of new termed members for dashboard
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_RollingNewMemberTermedCount]


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
	DECLARE @startCount int;

    DECLARE @strDateStr varchar(50);
 


	SET  @StartMonth = 1;
	SET @SQL = 'SELECT * from ( ';
	SET @Month = cast((SELECT month(max(aapquitdate)) from pharmacymaster..pm_pharmacy) as varchar(2));
	SET @Year = cast((SELECT year(max(aapquitdate)) from pharmacymaster..pm_pharmacy) as varchar(4));
    SET @strDateStr =  @Month + '/01/' + @Year  ;
   -- SET @DateStr =  '01/01/' + @Year;
	--SET @Date =  '01/01/' + @Year;
    SET @startCount = -12;
   
    -- Build the prvious 11 months and current
	WHILE @startCount < 1
	BEGIN

 		SET  @date =  DATEADD(m,@startCount,@strDateStr);
		--SET @DateStr2 = cast(@StartMonth as varchar(2)) + '/01/' + @Year
        SET @Year = cast(year(@date) as varchar(4));
		SET @Month =  cast(month(@date) as varchar(2));
		SET @SQL = @SQL + ' SELECT ''New Members'' as Type,year(aapeffectivedate) as Year, ''' + reports.dbo.fdate2( @date ) +'''     as Month , count(*) as Count from pharmacymaster..pm_pharmacy ' +
						  ' where year(aapeffectivedate) = ' + @Year + ' and month(aapeffectivedate) = ' + cast(@Month as varchar(2)) + ' group by   month(aapeffectivedate)   ,year(aapeffectivedate) ';
		SET @SQL = @SQL + ' union';
		SET @SQL = @SQL + ' SELECT ''Termed Members'' as Type,year(aapquitdate) as Year, ''' + reports.dbo.fdate2( @date ) +'''     as Month , count(*) as Count from pharmacymaster..pm_pharmacy ' +
						  ' where year(aapquitdate) = ' + @Year + ' and month(aapquitdate) = ' + cast(@Month as varchar(2)) + ' group by   month(aapquitdate)   ,year(aapquitdate) ';
		SET @SQL = @SQL + ' union';
    	SET @startCount = @startCount + 1;
	END

   -- Now take of trailing comma
    SET @SQL = substring(@SQL,0,len(@SQL) - 5 );
    SET @SQL = @SQL + '  )ch  order by type,year, reports.dbo.NumberFromMonth( Month)';
print @SQL;
	EXEC (@SQL);


	 
END








GO
