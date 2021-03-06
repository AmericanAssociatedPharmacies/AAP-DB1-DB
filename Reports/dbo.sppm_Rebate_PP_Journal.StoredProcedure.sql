USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_Rebate_PP_Journal]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sppm_Rebate_PP_Journal]
(@in_Period  varchar(6))
--(@in_month varchar(2),@in_year varchar(4),@in_Period  varchar(6))
AS
  
 

 

	--DECLARE @monthName varchar(10);
	--DECLARE @date  varchar(10);
    DECLARE @tableName varchar(100);
	DECLARE @SQL   varchar(500);
    DECLARE @colInvNo varchar(10);
	DECLARE @dueDateBuild varchar(25);
	DECLARE @dueDateMonth varchar(25);
	DECLARE @dueDateYear varchar(25);
	DECLARE @dueDate  varchar(25);
    DECLARE @colDate varchar(25);

	DECLARE @dateBuild varchar(25);
	DECLARE @dateBuildMonth varchar(02);
	DECLARE @dateBuildYear varchar(04);
	DECLARE @dateBuildDay varchar(02);

	--SET @date = @in_month + '/1/' + @in_year;
    --SET  @monthName = dbo.fDate2(DATEADD(m,0,@date));


	SET @tableName = 'tmp_PPRebates_Journal_JMW' ;
	SET @colInvNo = @in_period + 'PP'; 

 

	SET  @dateBuild = DATEADD(m,0,GetDate()) 
	SET @dateBuildMonth = cast(datepart(month,@dateBuild) as varchar(2));
	SET @dateBuildDay = cast(datepart(day,@dateBuild) as varchar(2));
	SET @dateBuildYear = cast(datepart(year,@dateBuild) as varchar(4));
	--SET @colDate = '08/29/2014' ;
   SET @colDate = @dateBuildMonth + '/' + @dateBuildDay + '/' + @dateBuildYear;

    SET @dueDateBuild = DATEADD(m,1,@colDate) 
    SET @dueDateYear = cast(datepart(year,@dueDateBuild) as varchar(4));
    SET @dueDateMonth = cast(datepart(month,@dueDateBuild) as varchar(2));
	--SET @dueDate =  '09/02/2014' ;
    SET @dueDate = @dueDateMonth  + '/1/' + @dueDateYear

 

	SET @SQL = '	 IF EXISTS(SELECT name FROM sys.tables ' +
				'  WHERE name = ''' + @tableName + ''')' +
				'	BEGIN '+
				'		DROP TABLE '+ @tableName +
				'   END ';

	EXEC (@SQL);

 
 

 
	SET @SQL = '	SELECT cast(r.pmid as int) as [Vendor ID], '+
	'''' + @colInvNo + ''' as [Invoice #], '+
	'''' + @colDate + '''  as [Date], '+
	'''' + @dueDate + '''  as [Date Due], '+
	'''00-2100'' as [Accounts Payable Account],  '+
	' 1 as [Number Of Distributions],  '+
	'''00-6590'' as [GL Account], '+
	' Convert(numeric(8,2),SUM([PaidToStore])) as Amount, '+
	' 0 as [Recur Number],  '+
	' 0 as [Recur Frequency] '+

	' INTO ' + @tableName + 

	' FROM pharmacymaster..v_vendorvolumesales r  '+

	' WHERE Period = ''' + @in_Period + '''' +
' GROUP BY PMID ';
 
    
     print @sql
   	EXEC (@SQL);


	SET @SQL = 'SELECT * from ' + @tableName + ' order by [vendor id]';
 
	EXEC (@SQL);

--		select
--		(select sum(round(PayToStore,2)) from reports..PM_Rebate_CHAAP where PayToStore >= 10.00) as [source amount pts >=10 rounded] ,
--		sum(Amount) as [journal Amount],
--		count(Amount) as [journal count]
--		from reports..tmp_CHGR0511_ptJournal
 
	 

GO
