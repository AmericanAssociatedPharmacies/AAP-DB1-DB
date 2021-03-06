USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PlanOGram_Journal]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE procedure [dbo].[sppm_PlanOGram_Journal]

		(@in_month varchar(2)
		,@in_year varchar(4))

AS

SET NOCOUNT ON;
  
 
BEGIN
 

	DECLARE @monthName varchar(20);
	DECLARE @monthName_ABBR varchar(10);
	DECLARE @date  varchar(10);
    DECLARE @tableName varchar(100);
	DECLARE @SQL   varchar(8000);
    DECLARE @colInvNo varchar(20);
	DECLARE @next_month varchar(2);
	DECLARE @dueDateBuild varchar(25);
	DECLARE @dueDateMonth varchar(25);
	DECLARE @dueDateYear varchar(25);
	DECLARE @dueDate  varchar(25);
    DECLARE @colDate varchar(25);

	DECLARE @dateBuild varchar(25);
	DECLARE @dateBuildMonth varchar(02);
	DECLARE @dateBuildYear varchar(04);
	DECLARE @dateBuildDay varchar(02);
	DECLARE @year_PatDiv_int int;
	DECLARE @year_PatDiv  varchar(4);

	DECLARE @daysInMonth varchar(2);

	SET @date = @in_month + '/1/' + @in_year;
    SET  @monthName_ABBR = dbo.fDate2(DATEADD(m,0,@date));
    SET  @monthName = datename(mm,@date) ;
	SET @next_month = @in_month + 1;
	SET @year_PatDiv_int = cast(@in_year as int) -1;
	SET @year_PatDiv = cast( @year_PatDiv_int as varchar(4));


	SET @tableName = 'tmp_POG_Journal' ;
	SET @colInvNo = @in_year + 'Planogram' ;

	SET @daysInMonth = dbo.DaysInMonth(@in_month,@in_year);
 
			SET  @dateBuild = DATEADD(m,0,GetDate()) 
			SET @dateBuildMonth = cast(datepart(month,@dateBuild) as varchar(2));
			SET @dateBuildDay = cast(datepart(day,@dateBuild) as varchar(2));
			SET @dateBuildYear = cast(datepart(year,@dateBuild) as varchar(4));
 
	--SET @colDate = @dateBuildMonth + '/' + @dateBuildDay + '/' + @dateBuildYear;
    SET @colDate = '04/02/2020';

    --SET @dueDateBuild = DATEADD(m,1,@colDate) 
    --SET @dueDateYear = cast(datepart(year,@dueDateBuild) as varchar(4));
    --SET @dueDateMonth = cast(datepart(month,@dueDateBuild) as varchar(2));
	--SET @dueDate = @dateBuildMonth  + '/' + @daysInMonth + '/' + @dateBuildYear;
     SET @dueDate = '04/02/2020';
 

	SET @SQL = '	 IF EXISTS(SELECT name FROM sys.tables ' +
				'  WHERE name = ''' + @tableName + ''')' +
				'	BEGIN '+
				'		DROP TABLE '+ @tableName +
				'   END ';

	EXEC (@SQL);


 
	SET @SQL = '	SELECT  r.pmid  as [Vendor ID], '+
	'''' + @colInvNo + ''' as [Invoice #], '+
	'''' + @colDate + '''  as [Date], '+
	'''' + @dueDate + '''  as [Date Due], '+
	'''00-2100'' as [Accounts Payable Account],  '+
	' 1 as [Number Of Distributions],  '+
	'''00-2290'' as [GL Account], ' +
  '  r.planogramrebate   as Amount,   ' +
  --    '  r.[3mrebate]   as Amount,   ' +
    ' 0 as [Recur Number],  '+
	' 0 as [Recur Frequency] '+

	' INTO ' + @tableName + 

	' FROM pharmacymaster..PM_AnnualRebates r  '+
	     ' where r.planogramrebate > 0 and year = ''' + @year_PatDiv + '''' ;
     --' where r.planogramrebate > 0 and r.affiliate not like ''%LEGEND%''and r.affiliate != ''Keystone'' and r.affiliate != ''PFOA'' and r.affiliate != ''Pipco'' and year = ''' + @year_PatDiv + '''' ;
 	-- ' where r.[3mrebate] > 0 and p.affiliate not like ''%LEGEND%''and p.affiliate != ''Keystone'' and p.affiliate != ''PFOA'' and p.affiliate != ''Pipco'' and year = ''' + @year_PatDiv + '''' ;

    
     print @sql
   	EXEC (@SQL);


-- Use something like this is I need to add in 3MRebates only if they had planogramrebates
--select PMID,AccountName ,case when planogramrebate > 0 then [3MRebate]  + planogramrebate 
--else planogramrebate end as Amount from  pharmacymaster..PM_AnnualRebates 
--where year = 2012 and planogramrebate > 0


	SET @SQL = 'SELECT * from ' + @tableName + ' order by [vendor id]';
	EXEC (@SQL);

 
 END
	 





GO
