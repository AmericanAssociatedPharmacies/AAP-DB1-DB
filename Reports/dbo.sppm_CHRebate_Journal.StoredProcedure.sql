USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_CHRebate_Journal]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sppm_CHRebate_Journal]
(@in_month varchar(2),@in_year varchar(4))
AS
  
 

 

	DECLARE @monthName varchar(10);
	DECLARE @date  varchar(10);
    DECLARE @tableName varchar(100);
	DECLARE @SQL   varchar(max);
    DECLARE @colInvNo varchar(10);
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

	SET @date = @in_month + '/1/' + @in_year;
    SET  @monthName = dbo.fDate2(DATEADD(m,0,@date));
	SET @next_month = @in_month + 1;


	SET @tableName = 'tmp_CHRebates_Journal_JMW' ;
	SET @colInvNo = @in_year + @monthName;

 

	SET  @dateBuild = DATEADD(m,0,GetDate()) 
	SET @dateBuildMonth = cast(datepart(month,@dateBuild) as varchar(2));
	SET @dateBuildDay = cast(datepart(day,@dateBuild) as varchar(2));
	SET @dateBuildYear = cast(datepart(year,@dateBuild) as varchar(4));
	SET @colDate = @dateBuildMonth + '/' + @dateBuildDay + '/' + @dateBuildYear;

    SET @dueDateBuild = DATEADD(m,1,@colDate) 
    SET @dueDateYear = cast(datepart(year,@dueDateBuild) as varchar(4));
    SET @dueDateMonth = cast(datepart(month,@dueDateBuild) as varchar(2));
	SET @dueDate = @dueDateMonth  + '/1/' + @dueDateYear

 

	SET @SQL = '	 IF EXISTS(SELECT name FROM sys.tables ' +
				'  WHERE name = ''' + @tableName + ''')' +
				'	BEGIN '+
				'		DROP TABLE '+ @tableName +
				'   END ';

	EXEC (@SQL);

 
 

 
	SET @SQL = '	SELECT r.pmid as [Vendor ID], '+
	'''' + @colInvNo + ''' as [Invoice #], '+
	'''' + @colDate + '''  as [Date], '+
	'''' + @dueDate + '''  as [Date Due], '+
	'''00-2100'' as [Accounts Payable Account],  '+
	' 1 as [Number Of Distributions],  '+
	'''00-2290'' as [GL Account], '+
	' cast(round(r.PayToStore,2) as numeric(18,2)) as Amount, '+
	--r.[Pay to store] as AmountUnrounded,
	' 0 as [Recur Number],  '+
	' 0 as [Recur Frequency] '+

	' INTO ' + @tableName + 

	' FROM pharmacymaster..PM_Rebates_CHAAP r  '+
	' where cast(round(r.PayToStore,2) as numeric(18,2)) >= 15.00 and date = ''' + @date + '''' ;

   --' where PayToStore >= 15.00 and date = ''' + @date + '''' ; --LA 12/21/2017. This was excluding cases where $14.99 should be rounded up to $15. Betty's code includes it, so I edited our code to include it as well.

--    ' where PayToStore >= 15.00 and date = ''' + @date + '''' +
--    '  and r.PMID in ( '+ 
--	 '  102884,103797,107258,107297,107569,107795,107980,107999,  '+ 
--	 '   108000,108013,108053,108058,108120) ';
--' where PayToStore >= 10.00 and (affiliate = ''NAPPSA'' or affiliate = ''VPhA-USA'') and date = ''' + @date + '''' ;
 
    
     print @sql
   	EXEC (@SQL);

 
	  SET @SQL = 'SELECT * from ' + @tableName + ' order by [vendor id]';
 	  --SET @SQL = 'SELECT * from ' + @tableName +  ' where [Vendor ID] = 108629  order by [vendor id]';

	EXEC (@SQL);
 -- ONLY TEMPORARY TAKE OUT AFTER RUN
--select *  from reports..tmp_CHRebates_Journal_JMW  t
--join
--(
--select *  from pharmacymaster..pm_rebates_chaap 
--where month(date) = 05 and year(date) = 2014
--)p on t.[Vendor ID] = p.pmid where buscls = 'C36' or buscls = 'C38' 

 
 
	 


GO
