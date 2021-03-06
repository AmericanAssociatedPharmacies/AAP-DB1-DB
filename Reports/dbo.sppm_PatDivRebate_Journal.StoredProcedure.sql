USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PatDivRebate_Journal]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sppm_PatDivRebate_Journal]
(@in_month varchar(2),@in_year varchar(4),@in_payment varchar(1))
AS
  
-- Note the @colDate and @dueDate may have to be manually hard coded 
-- They aren't following the same rules as when this was first created so there's no way to tell if this
-- will generate the correct date for these fields - just hard code them if you need to
BEGIN
 

	DECLARE @monthName varchar(20);
	DECLARE @monthName_ABBR varchar(10);
	DECLARE @date  varchar(10);
    DECLARE @tableName varchar(100);
	DECLARE @SQL   varchar(500);
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


	SET @tableName = 'tmp_PatDiv_Journal' ;
	SET @colInvNo = @in_year + 'PDiv' + @monthName_ABBR;

	SET @daysInMonth = dbo.DaysInMonth(@in_month,@in_year);

	IF(@in_payment = 1)
		BEGIN
			--SET  @dateBuild = DATEADD(m,0,GetDate()) 
			SET  @dateBuild = DATEADD(m,0,GetDate()) 
			SET @dateBuildMonth = cast(datepart(month,@dateBuild) as varchar(2));
			SET @dateBuildDay = cast(datepart(day,@dateBuild) as varchar(2));
			SET @dateBuildYear = cast(datepart(year,@dateBuild) as varchar(4));
		END
	ELSE
		BEGIN
			SET  @dateBuild = DATEADD(m,0,@date) 
			SET @dateBuildMonth = cast(datepart(month,@dateBuild) as varchar(2));
			SET @dateBuildDay = cast(datepart(day,@dateBuild) as varchar(2));
			SET @dateBuildYear = cast(datepart(year,@dateBuild) as varchar(4));
		END
	--SET @colDate = @dateBuildMonth + '/' + @dateBuildDay + '/' + @dateBuildYear;
	SET @colDate = @in_month + '/01/' + @in_year;

    --SET @dueDateBuild = DATEADD(m,1,@colDate) 
    --SET @dueDateYear = cast(datepart(year,@dueDateBuild) as varchar(4));
    --SET @dueDateMonth = cast(datepart(month,@dueDateBuild) as varchar(2));
--SET @dueDate = @dateBuildMonth  + '/' + @daysInMonth + '/' + @dateBuildYear;
	SET @dueDate = @in_month  + '/' + @daysInMonth + '/' + @in_year;

 

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
	'''00-2300'' as [GL Account], ';
	IF(@in_payment = '1')
		BEGIN
			SET @SQL =  @SQL + '  r.PatDivFirstPayment   as Amount, ';
		END
	ELSE
		BEGIN
			SET @SQL =  @SQL + '  r.PatDivSecondPayment   as Amount, ';
		END 
	SET @SQL =  @SQL + ' 0 as [Recur Number],  '+
	' 0 as [Recur Frequency] '+

	' INTO ' + @tableName + 

	' FROM pharmacymaster..PM_AnnualRebates r  '+
	' where r.PatronageDividend > 0 and year = ''' + @year_PatDiv + '''' ;
 
    
     print @sql
   	EXEC (@SQL);


	SET @SQL = 'SELECT * from ' + @tableName + ' order by [vendor id]';
	EXEC (@SQL);

 
 END
	 

GO
