USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_ClaimGuard_DB_PlanImprov_NEW]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Compliance Report for Chriss S.
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_ClaimGuard_DB_PlanImprov_NEW]
(@in_qtr varchar(2), @in_year varchar(4))
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  	DECLARE @SQL nvarchar(max);
	DECLARE @SQL2  varchar(max);
	DECLARE @SQL3  varchar(max);
	DECLARE @months varchar(50);
	DECLARE @qtr_months varchar(50);
	DECLARE @prev_months varchar(50);
	DECLARE @prev_qtr varchar(2);
	DECLARE @prev_year varchar(4);
	DECLARE @qtr_prev_year varchar(4);
	DECLARE @col_curr varchar(50);
	DECLARE @col_prev varchar(50);

	DECLARE @qtr_col_curr varchar(50);
	DECLARE @qtr_col_prev varchar(50);
 
	DECLARE @manualTable varchar(50);
	DECLARE @autoTable varchar(50);
	DECLARE @autoTable_PrevYear varchar(50);

	SET @manualTable = 'tmp_UPWebStatus_Web';
	SET @autoTable =   'tmp_UPAutoStatusCurr';
    SET @autoTable_PrevYear =   'tmp_UPAutoStatusPrev';
	   --- Drop the previous runs table

	IF(@in_qtr = 'Q1')
		BEGIN
			SET @months = '(01,02,03)';
			SET @prev_qtr = 'Q4';
			SET @qtr_prev_year = @in_year - 1;
		END


	IF(@in_qtr = 'Q2'  )
		BEGIN
			SET @months = '(01,02,03,04,05,06)';
			SET @prev_qtr = 'Q1';
			SET @qtr_prev_year = @in_year;
		END


	IF(@in_qtr = 'Q3')
		BEGIN
			SET @months = '(01,02,03,04,05,06,07,08,09)';	
			SET @prev_qtr = 'Q2';
			SET @qtr_prev_year = @in_year;
		END

	IF(@in_qtr = 'Q4')

		BEGIN
			SET @months = '(01,02,03,04,05,06,07,08,09,10,11,12)';	
			SET @prev_qtr = 'Q3';
			SET @qtr_prev_year = @in_year;
		END



	SET @prev_year = @in_year - 1;
	SET @prev_months = @months;
	--SET @prev_qtr = @in_qtr;
	SET @col_curr = 'YTD ' + @in_qtr + ' ' + @in_year;
	SET @col_prev = 'YTD ' + @in_qtr + ' ' + @prev_year;
	SET @qtr_col_curr =   @in_qtr + ' ' + @in_year;
	SET @qtr_col_prev =  @prev_qtr + ' ' + @qtr_prev_year;
 
		 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'UPCClaimDBPlanImprov')
		 BEGIN
          DROP TABLE UPCClaimDBPlanImprov
         END

 

SET @SQL = ' SELECT * INTO UPCClaimDBPlanImprov from ( '+
		' SELECT    '+
 
		' PlanName  , '+
		' SUM(['+ @col_curr +' - TotalClaims])  as ['+ @col_curr +' - Total Claims], '+
		' SUM(round(['+ @col_curr +' - TotalGPI],2))  as ['+ @col_curr +' - Total GPI],	'+	    
		' SUM(round(['+ @col_curr +' - TotalImprov],2))  as ['+ @col_curr +' - # Improvements],	'+	 
		' CAST(0 AS float) as ['+ @col_curr +' - SuccessRate] , '+
		' SUM(['+ @col_prev +' - TotalClaims])  as ['+ @col_prev +' - Total Claims], '+
		' SUM(round(['+ @col_prev +' - TotalGPI],2))  as ['+ @col_prev +' - Total GPI],	'+	 
		' SUM(round(['+ @col_prev +' - TotalImprov],2))  as ['+ @col_prev +' - # Improvements],	'+	 
		' CAST(0 AS float) as ['+ @col_prev +' - SuccessRate], '+
		' CAST(0 AS float) as ['+@qtr_col_curr+' - AvgResponseTime], '+
		' CAST(0 AS float) as ['+@qtr_col_prev+' - AvgResponseTime], '+
		' CAST(0 AS float) as ['+ @col_curr +' - AvgResponseTime], '+
		' CAST(0 AS float) as ['+ @col_prev +' - AvgResponseTime] '+
 
 
	' FROM ( '+
 
			' SELECT  PlanName, '+
			''''+ @col_curr +' - TotalClaims'' as dateCurrTotalClaims,'+
						  ' SUM(TotalClaimsCurr) as CurrYTDCurrTotalClaims, '+
			''''+ @col_curr +' - TotalGPI'' as dateCurrTotalGPI, '+
						  ' SUM(TotalGPICurr) as CurrYTDCurrTotalGPI, '+
			''''+ @col_curr +' - TotalImprov'' as dateCurrTotalImprovCount, '+
						  ' SUM(TotalImprovCountCurr) as CurrYTDCurrTotalImprovCount, '+
			''''+ @col_prev +' - TotalClaims'' as datePrevTotalClaims, '+
						  ' SUM(TotalClaimsPrev) as PrevYTDPrevTotalClaims, '+

			''''+ @col_prev +' - TotalGPI'' as datePrevTotalGPI, '+
						  ' SUM(TotalGPIPrev) as PrevYTDPrevTotalGPI, '+
			''''+ @col_prev +' - TotalImprov'' as datePrevTotalImprovCount, '+
						  ' SUM(TotalImprovCountPrev) as PrevYTDPrevTotalImprovCount    ';

	print(@SQL);
			
			 
 
      SET @SQL2 =      ' FROM   ( '+
				' SELECT PlanName  ,Sum(TotalClaimsCurr)as TotalClaimsCurr,count ( distinct TotalGPICurrV) as TotalGPICurr, '+
						 ' count ( distinct TotalImprovCountCurrV) as TotalImprovCountCurr, '+
						 ' Sum(TotalClaimsPrev)as TotalClaimsPrev,count ( distinct TotalGPIPrevV) as TotalGPIPrev,count ( distinct TotalImprovCountPrevV) as TotalImprovCountPrev '+
				 
				' FROM ( '+
						--Total Claim Count from v_UPAutoStatus CURRENT
						 'SELECT  PlanName, count(*) as TotalClaimsCurr,cast(null as varchar(50) ) as TotalGPICurrV,  cast(null as varchar(50) )as TotalImprovCountCurrV,  '+
							' cast(0 as int )as TotalClaimsPrev, cast(null as varchar(50))as TotalGPIPrevV,  cast(null as varchar(50))as TotalImprovCountPrevV '+
						  
							 ' FROM '+ @autoTable +
						     ' WHERE (Month(CreatedOn) in '+  @months + ' ) AND Year(CreatedOn)= ' + @in_year + '  and PlanName is not null '+
						' GROUP BY PlanName  '+
                        ' UNION ALL '+
						--Total Claim Count from v_UPWebStatus_Web CURRENT
						' SELECT  PlanName, count(*) as TotalClaimsCurr,cast(null as varchar(50) ) as TotalGPICurrV,  cast(null as varchar(50) )as TotalImprovCountCurrV,  '+
							 ' cast(0 as int )as TotalClaimsPrev,cast(null as varchar(50))as TotalGPIPrevV,  cast(null as varchar(50))as TotalImprovCountPrevV '+
						  
							 ' FROM '+ @manualTable +
						     ' WHERE (Month(CreatedOn) in '+  @months + ' ) AND Year(CreatedOn)= ' + @in_year + '    and PlanName is not null '+
						' GROUP BY PlanName '+
						' UNION ALL '+
						-- Total Improvement from v_UPAutoStatus CURRENT
						' SELECT   PlanName,  cast(0 as  int)as  TotalClaimsCurr,cast(null as varchar(50) ) as TotalGPICurrV,gpi as TotalImprovCountCurrV, '+
							 ' cast(0 as int )as TotalClaimsPrev,cast(null as varchar(50))as TotalGPIPrevV,  cast(null as varchar(50))as TotalImprovCountPrevV '+
							' FROM '+ @autoTable +
							' WHERE (Month(CreatedOn) in '+  @months + ' ) AND Year(CreatedOn)=' + @in_year + '   and PlanName is not null '+
							' and ResultID in ( '+
							' SELECT ResultID from UPResult where DashBoardCategory = ''Positive Outcome'') '+
						' GROUP BY PlanName  ,GPI '+
                        -- Total Improvement from v_UPWebStatus_Web CURRENT
						 ' UNION ALL '+
						' SELECT   PlanName,  cast(0 as  int)as  TotalClaimsCurr,cast(null as varchar(50) ) as TotalGPICurrV,gpi as TotalImprovCountCurr, '+
							 ' cast(0 as int )as TotalClaimsPrev,cast(null as varchar(50))as TotalGPIPrevV,  cast(null as varchar(50))as TotalImprovCountPrevV '+
							' FROM '+ @manualTable +
							' WHERE (Month(CreatedOn) in '+  @months + ' ) AND Year(CreatedOn)= ' + @in_year + '  and PlanName is not null '+
							' and ResultID in ( '+
							' SELECT ResultID from UPResult where DashBoardCategory = ''Positive Outcome'')'+
							' GROUP BY PlanName  ,GPI '+

						' UNION ALL '+
						--Total GPI Count from v_UPAutoStatus CURRENT
						' SELECT   PlanName,  cast(0 as  int)as  TotalClaimsCurr,gpi as TotalGPICurrV,cast(null as varchar(50) )as TotalImprovCountCurrV,  '+
							 ' cast(0 as int )as TotalClaimsPrev,cast(null as varchar(50))as TotalGPIPrevV,  cast(null as varchar(50))as TotalImprovCountPrevV '+
							' FROM '+ @autoTable +
							' WHERE (Month(CreatedOn) in '+  @months + ') AND Year(CreatedOn)= ' + @in_year + '    and PlanName is not null '+
							' GROUP BY PlanName  ,GPI '+
                       ' UNION ALL '+
					--Total GPI Count from v_UPWebStatus_Web CURRENT
						' SELECT   PlanName,  cast(0 as  int)as  TotalClaimsCurr,gpi as TotalGPICurrV,cast(null as varchar(50) )as TotalImprovCountCurrV,  '+
							 ' cast(0 as int )as TotalClaimsPrev,cast(null as varchar(50))as TotalGPIPrevV,  cast(null as varchar(50))as TotalImprovCountPrevV '+
							' FROM '+ @manualTable +
							' WHERE (Month(CreatedOn) in '+  @months + ' ) AND Year(CreatedOn)= ' + @in_year + '    and PlanName is not null '+
						' GROUP BY PlanName  ,GPI '+
			-- Previous	
			 'UNION ALL '+
					--Total Claim Count from v_UPAutoStatus2012 PREVIOUS
						' SELECT  PlanName, cast(0 as int) as TotalClaimsCurr,cast(null as varchar(50) ) as TotalGPICurrV, cast(null as varchar(50) )as TotalImprovCountCurrV,  '+
							 ' count(*) as TotalClaimsPrev,cast(null as varchar(50))as TotalGPIPrevV,  cast(null as varchar(50))as TotalImprovCountPrevV '+
						  
							 ' FROM '+ @autoTable_PrevYear +
						     ' WHERE (Month(CreatedOn) in '+  @months + ' ) AND Year(CreatedOn)= ' + @prev_year + '     and PlanName is not null '+
						' GROUP BY PlanName '+
						' UNION ALL '+
					--Total Claim Count from v_UPWebStatus_Web PREVIOUS
						' SELECT  PlanName, cast(0 as int) as TotalClaimsCurr,cast(null as varchar(50) ) as TotalGPICurrV,cast(null as varchar(50) )as TotalImprovCountCurrV,  '+
							 ' count(*) as TotalClaimsPrev,cast(null as varchar(50))as TotalGPIPrevV,  cast(null as varchar(50))as TotalImprovCountPrevV  '+
							 ' FROM  '+ @manualTable +
						     ' WHERE (Month(CreatedOn) in '+  @months + ' ) AND Year(CreatedOn)= ' + @prev_year + '   and PlanName is not null '+
						' GROUP BY PlanName '+
						 ' UNION ALL '+
					-- Total Improvement from v_UPAutoStatus2012 PREVIOUS
						' SELECT   PlanName,  cast(0 as  int)as  TotalClaimsCurr,cast(null as varchar(50) ) as TotalGPICurrV, cast(null as varchar(50) )as TotalImprovCountCurrV, '+
							' cast(0 as int ) as TotalClaimsPrev, cast(null as varchar(50))as TotalGPIPrevV, gpi as TotalImprovCountPrevV '+
							' FROM '+ @autoTable_PrevYear +
							' WHERE (Month(CreatedOn) in '+  @months + ' ) AND Year(CreatedOn)= ' + @prev_year + ' and PlanName is not null '+
							' and ResultID in ( '+
							' SELECT ResultID from UPResult where DashBoardCategory = ''Positive Outcome'')  '+
						' GROUP BY PlanName  ,GPI '+
                       -- Total Improvement from v_UPWebStatus_Web PREVIOUS
						 ' UNION ALL '+
						' SELECT   PlanName, cast(0 as  int)as  TotalClaimsCurr,cast(null as varchar(50) ) as TotalGPICurrV, cast(null as varchar(50) )as TotalImprovCountCurrV, '+
							' cast(0 as int ) as TotalClaimsPrev, cast(null as varchar(50))as TotalGPIPrevV, gpi as TotalImprovCountPrevV '+
							' FROM '+ @manualTable +
							' WHERE (Month(CreatedOn) in '+  @months + ' ) AND Year(CreatedOn)= ' + @prev_year + '   and PlanName is not null '+
							' and ResultID in ( '+
							' SELECT ResultID from UPResult where DashBoardCategory = ''Positive Outcome'') '+
						' GROUP BY PlanName   ,GPI '+
						' UNION ALL '+
                      --Total GPI Count from v_UPAutoStatus2012 PREVIOUS
						' SELECT   PlanName,  cast(0 as  int)as  TotalClaimsCurr,cast(null as varchar(50) ) as TotalGPICurrV, cast(null as varchar(50) )as TotalImprovCountCurrV, '+
							 ' cast(0 as int )as TotalClaimsPrev, gpi as TotalGPIPrevV,  cast(null as varchar(50))as TotalImprovCountPrevV '+
							' FROM '+ @autoTable_PrevYear +
							' WHERE (Month(CreatedOn) in '+  @months + ' ) AND Year(CreatedOn)= ' + @prev_year + '   and PlanName is not null '+
							' GROUP BY PlanName  ,GPI' +  

					' UNION ALL '+
                      --Total GPI Count from v_UPWebStatus_Web PREVIOUS
						' SELECT   PlanName,  cast(0 as  int)as  TotalClaimsCurr,cast(null as varchar(50) ) as TotalGPICurrV, cast(null as varchar(50) )as TotalImprovCountCurrV, '+
							 ' cast(0 as int )as TotalClaimsPrev,gpi as TotalGPIPrevV, cast(null as varchar(50))as TotalImprovCountPrevV '+
							' FROM '+ @manualTable +
							' WHERE (Month(CreatedOn) in '+  @months + ' ) AND Year(CreatedOn)= ' + @prev_year + '     and PlanName is not null '+
							' GROUP BY PlanName  ,GPI '+
				' ) ch GROUP BY PlanName '+
			' )curr GROUP BY  PlanName    '+
  
	' )  as TableDate     ';
	print(@SQL2);


	SET @SQL3 = ' PIVOT '+
	' ( '+
	  ' SUM(CurrYTDCurrTotalClaims) '+
	  ' FOR dateCurrTotalClaims IN  ( ['+ @col_curr +' - TotalClaims] ) '+
	' )as P1 '+

	' PIVOT '+
	' ( '+
	  ' SUM(CurrYTDCurrTotalGPI) '+
	  ' FOR dateCurrTotalGPI IN  ( [' + @col_curr +' - TotalGPI] ) '+
	' )as P1a '+


	' PIVOT  '+
	' ( '+
	  ' SUM(CurrYTDCurrTotalImprovCount) '+
	  ' FOR dateCurrTotalImprovCount IN  (['+ @col_curr +' - TotalImprov]   )  '+
	' )as P2 '+

	' PIVOT '+
	' ( '+
	 ' SUM(PrevYTDPrevTotalClaims) '+
	  ' FOR datePrevTotalClaims IN  ( ['+ @col_prev +' - TotalClaims] ) '+
	' )as P3 '+

	' PIVOT '+
	' ( '+
	  ' SUM(PrevYTDPrevTotalGPI) '+
	  ' FOR datePrevTotalGPI IN  ( ['+ @col_prev +' - TotalGPI] ) '+
	' )as P3a '+

	' PIVOT  '+
	' ( '+
	  ' SUM(PrevYTDPrevTotalImprovCount) '+
	  ' FOR datePrevTotalImprovCount IN  (['+ @col_prev +' - TotalImprov]   )  '+
	' )as P4 '+
 
' GROUP BY PlanName  '+
' )vol ';
PRINT @SQL3;
EXEC (@SQL +@SQL2 + @SQL3);

SET @SQL = 'UPDATE UPCClaimDBPlanImprov set ['+ @col_curr +' - SuccessRate] = cast(['+ @col_curr +' - # Improvements] as float)/cast(['+ @col_curr +' - Total GPI] as float) where '+
   ' ['+ @col_curr +' - Total GPI] != 0 ; ';
PRINT @SQL;
EXEC (@SQL);

SET @SQL = 'UPDATE UPCClaimDBPlanImprov set ['+ @col_prev +' - SuccessRate] = cast(['+ @col_prev +' - # Improvements] as float)/cast(['+ @col_prev +' - Total GPI] as float) where '+
		'['+ @col_prev +' - Total GPI] != 0 ;';
PRINT @SQL;
EXEC (@SQL);
--TO ADD the average response times

-- DO YTD FIRST
--Current YTD
 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_CurrYTDResponse')
 BEGIN
  DROP TABLE tmp_CurrYTDResponse
 END

SET @SQL = ' SELECT *  into tmp_CurrYTDResponse   from ( '+
	' SELECT PlanName, round(cast(sum(diff) as float) / cast(sum(plancount) as float),2) as ['+ @col_curr +' - AvgResponseTime] from  '+
	' ( '+
		' SELECT PlanName, (sum( DATEDIFF(day,CreatedOn,updatedon))) as diff , count(*)  as planCount   FROM ' + @autoTable +
		 ' WHERE (Month(CreatedOn) in '+  @months + '  ) AND Year(CreatedOn)= ' + @in_year + ' and updatedon is not null and PlanName is not null '+
		' group by PlanName   '+
		 
		' UNION ALL '+
		' SELECT PlanName, (sum( DATEDIFF(day,CreatedOn,updatedon))) as diff , count(*) as planCount   FROM ' + @manualTable +
		' WHERE (Month(CreatedOn) in '+  @months + '  ) AND Year(CreatedOn)= ' + @in_year + ' and updatedon is not null and PlanName is not null '+
		' group by PlanName  '+
	' )ch '+
' group by PlanName '+
' )cy ';
PRINT @SQL;
EXEC (@SQL);



--Previous YTD
 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_PrevYTDResponse')
 BEGIN
  DROP TABLE tmp_PrevYTDResponse
 END

SET @SQL = ' SELECT *  into tmp_PrevYTDResponse   from ( '+
	' SELECT PlanName, round(cast(sum(diff) as float) / cast(sum(plancount) as float),2) as ['+ @col_prev +' - AvgResponseTime] from '+
	' ( '+
		' SELECT PlanName, (sum( DATEDIFF(day,CreatedOn,updatedon))) as diff , count(*)  as planCount   FROM ' + @autoTable_PrevYear +
		 ' WHERE (Month(CreatedOn) in '+  @months + ' ) AND Year(CreatedOn)= ' + @prev_year + '  and updatedon is not null and PlanName is not null '+
		' group by PlanName   '+
		 
		' UNION ALL '+
		' SELECT PlanName, (sum( DATEDIFF(day,CreatedOn,updatedon))) as diff , count(*) as planCount   FROM ' + @manualTable +
		' WHERE (Month(CreatedOn) in '+  @months + ' ) AND Year(CreatedOn)=  ' + @prev_year + ' and updatedon is not null and PlanName is not null '+
		' group by PlanName  '+
	' )ch  '+
' group by PlanName '+
' )py ';
PRINT @SQL;
EXEC (@SQL);

--Now update the main table with Current YTD

SET @SQL = ' UPDATE t set '+
        ' t.['+ @col_curr +' - AvgResponseTime] =  v.['+ @col_curr +' - AvgResponseTime]   '+
	    ' FROM   UPCClaimDBPlanImprov t  '+
			' inner join '+
			 ' (   '+
              	'SELECT PlanName,['+ @col_curr +' - AvgResponseTime] from tmp_CurrYTDResponse '+
			 ' ) v  '+
		    ' on t.PlanName =v.PlanName   ';
PRINT @SQL;
EXEC (@SQL);
--INSERT   WHERE  PlanName doesn't already exist in UPCClaimDBPlanImprov
SET @SQL = '  INSERT  into UPCClaimDBPlanImprov (PlanName,['+ @col_curr +' - AvgResponseTime]   )    '+ 

     	' SELECT PlanName,['+ @col_curr +' - AvgResponseTime] from tmp_CurrYTDResponse t   '+
	 ' WHERE not exists  (select PlanName from UPCClaimDBPlanImprov where PlanName = t.PlanName );    ';
PRINT @SQL;
EXEC (@SQL);
--Now update the main table with Previous YTD

SET @SQL = '  UPDATE t set '+
        ' t.['+ @col_prev +' - AvgResponseTime] =  v.['+ @col_prev +' - AvgResponseTime]  '+  
	    ' FROM   UPCClaimDBPlanImprov t  '+
			' inner join  '+
			 ' (   '+
              	' SELECT PlanName,['+ @col_prev +' - AvgResponseTime] from tmp_PrevYTDResponse '+
			 ' ) v  '+
		    ' on t.PlanName =v.PlanName   ';
PRINT @SQL;
EXEC (@SQL);
--INSERT   WHERE  PlanName doesn't already exist in UPCClaimDBPlanImprov
 SET @SQL = ' INSERT  into UPCClaimDBPlanImprov (PlanName,['+ @col_prev +' - AvgResponseTime]   )   '+   

     	' SELECT PlanName,['+ @col_prev +' - AvgResponseTime] from tmp_PrevYTDResponse t  '+  
	 ' WHERE not exists  (select PlanName from UPCClaimDBPlanImprov where PlanName = t.PlanName );  ';
PRINT @SQL;
EXEC (@SQL);
----
-----------------------------------------
IF(@in_qtr = 'Q1')
 
	BEGIN
		SET @months = '(01,02,03)';
		SET @prev_year = @in_year - 1;
		SET @prev_months = '(10,11,12)';
		SET @prev_qtr = 'Q4'; 
	END

--
	IF(@in_qtr = 'Q2'  )		
		BEGIN
			SET @months = '(04,05,06)';
			SET @prev_year = @in_year;
			SET @prev_months = '(01,02,03)';
			SET @prev_qtr = 'Q1';
			SET @autoTable_PrevYear =   @autoTable;
		END

--
	IF(@in_qtr = 'Q3')
		BEGIN
			SET @months = '(07,08,09)';
			SET @prev_year = @in_year;
			SET @prev_months = '(04,05,06)';
			SET @prev_qtr = 'Q2';
			SET @autoTable_PrevYear =   @autoTable;
		END

--
--
--
	IF(@in_qtr = 'Q4')
		BEGIN
			SET @months = '(10,11,12)';
			SET @prev_year = @in_year;
			SET @prev_months = '(07,08,09)';
			SET @prev_qtr = 'Q3';
			SET @autoTable_PrevYear =   @autoTable;
		END


--Current Qtr
 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_CurrQtrResponse')
 BEGIN
  DROP TABLE tmp_CurrQtrResponse
 END

SET @SQL = ' SELECT *  into tmp_CurrQtrResponse   from ( '+
	' SELECT PlanName, round(cast(sum(diff) as float) / cast(sum(plancount) as float),2) as ['+@qtr_col_curr+' - AvgResponseTime] from  '+
	'( '+
		' SELECT PlanName, (sum( DATEDIFF(day,CreatedOn,updatedon))) as diff , count(*)  as planCount   FROM ' +@autoTable  +
		 ' WHERE (Month(CreatedOn) in '+@months+' ) AND Year(CreatedOn)= '+@in_year +'  and updatedon is not null and PlanName is not null '+
		' group by PlanName   '+
		 
		' UNION ALL '+
		' SELECT PlanName, (sum( DATEDIFF(day,CreatedOn,updatedon))) as diff , count(*) as planCount   FROM ' +@manualTable  +
		 ' WHERE (Month(CreatedOn) in  '+@months+' ) AND Year(CreatedOn)= '+@in_year +' and updatedon is not null and PlanName is not null '+
		' group by PlanName   '+
	' )ch  '+
' group by PlanName '+
' )cq ';
PRINT @SQL;
EXEC (@SQL);


--Previous Qtr
 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_PrevQtrResponse')
 BEGIN
  DROP TABLE tmp_PrevQtrResponse
 END

SET @SQL = ' SELECT *  into tmp_PrevQtrResponse   from ( '+
	' SELECT PlanName, round(cast(sum(diff) as float) / cast(sum(plancount) as float),2) as ['+@qtr_col_prev+' - AvgResponseTime] from  '+
	' ( '+
		' SELECT PlanName, (sum( DATEDIFF(day,CreatedOn,updatedon))) as diff , count(*)  as planCount   FROM ' + @autoTable_PrevYear +
		' WHERE (Month(CreatedOn) in ' +@prev_months+' ) AND Year(CreatedOn)= '+ @prev_year+' and updatedon is not null and PlanName is not null  '+
		' group by PlanName   '+
		 
		' UNION ALL '+
		' SELECT PlanName, (sum( DATEDIFF(day,CreatedOn,updatedon))) as diff , count(*) as planCount   FROM ' +@manualTable  +
		' WHERE (Month(CreatedOn) in ' +@prev_months+' ) AND Year(CreatedOn)= '+ @prev_year+' and updatedon is not null and PlanName is not null  '+
		' group by PlanName    '+
	' )ch   '+
' group by PlanName  '+
' )pq  ';
PRINT @SQL;
EXEC (@SQL);
-----------




--Now update the main table with Current Quarter

SET @SQL = ' UPDATE t set '+
        ' t.['+@qtr_col_curr+' - AvgResponseTime] =  v.['+@qtr_col_curr+' - AvgResponseTime]    '+
	    ' FROM   UPCClaimDBPlanImprov t  '+
			' inner join  '+
			 ' (   '+
              	' SELECT PlanName,['+@qtr_col_curr+' - AvgResponseTime] from tmp_CurrQtrResponse '+
			 ' ) v  '+
		    ' on t.PlanName =v.PlanName   ';
PRINT @SQL;
EXEC (@SQL);
--INSERT   WHERE  PlanName doesn't already exist in UPCClaimDBPlanImprov
 SET @SQL = ' INSERT  into UPCClaimDBPlanImprov (PlanName,['+@qtr_col_curr+' - AvgResponseTime]   )    '+

     	' SELECT PlanName,['+@qtr_col_curr+' - AvgResponseTime] from tmp_CurrQtrResponse t  '+
	 ' WHERE not exists  (select PlanName from UPCClaimDBPlanImprov where PlanName = t.PlanName );   ';
PRINT @SQL;
EXEC (@SQL);
--Now update the main table with Previous Quarter

SET @SQL = ' UPDATE t set  '+
        ' t.['+@qtr_col_prev+' - AvgResponseTime] =  v.['+@qtr_col_prev+' - AvgResponseTime]    '+
	    ' FROM   UPCClaimDBPlanImprov t  '+
			' inner join  '+
			 ' (   '+
              	' SELECT PlanName,['+@qtr_col_prev+' - AvgResponseTime] from tmp_PrevQtrResponse '+
			 ' ) v  '+
		    ' on t.PlanName =v.PlanName   ';
PRINT @SQL;
EXEC (@SQL);
--INSERT   WHERE  PlanName doesn't already exist in UPCClaimDBPlanImprov
SET @SQL = '  INSERT  into UPCClaimDBPlanImprov (PlanName,['+@qtr_col_prev+' - AvgResponseTime]   )    '+

     	' SELECT PlanName,['+@qtr_col_prev+' - AvgResponseTime] from tmp_PrevQtrResponse t  '+
	 ' WHERE not exists  (select PlanName from UPCClaimDBPlanImprov where PlanName = t.PlanName );   ';
PRINT @SQL;
EXEC (@SQL);
--DO you want to include those that have a null updatedon date?? Is this for improvements only??




 
END






GO
