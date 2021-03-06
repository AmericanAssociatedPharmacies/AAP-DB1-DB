USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_ClaimGuard_DB_ADHOC2013]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Compliance Report for Chriss S.
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_ClaimGuard_DB_ADHOC2013]
 (  @in_year varchar(4) )
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

 	DECLARE @tmpTable varchar(50);
	SET @tmpTable = 'UPCAdHoc'
    DECLARE @SQL nvarchar(max);
 

 	SET @SQL = 'IF EXISTS(SELECT name FROM sys.tables ' +
			' WHERE name =  ''' + @tmpTable + ''' ) ' +
		 'BEGIN ' +
          ' DROP TABLE  ' + @tmpTable +  
         ' END ';
	EXEC (@SQL);

	DECLARE @SQL2  varchar(max);
    DECLARE @PBM varchar(max);
	DECLARE @HeaderTotal varchar(255);
    DECLARE @PBMCol varchar(max);
	DECLARE @UPCCountCol varchar(max);
    DECLARE @PercUPCCountCol varchar(max);
	DECLARE @AvgRespTimeCol varchar(max);
    DECLARE @DiffRespTimeCol varchar(max);

	SET @HeaderTotal = '''All Claims''';
    SET @PBMCol = '[Plan Name]';
    SET @UPCCountCol = '[' + @in_year + ' UPC Count]';
    SET @PercUPCCountCol = '[' + @in_year + ' % of Total UPC Count]';
    SET @AvgRespTimeCol = '[' + @in_year + ' Avg. Response Time in Days]';
    SET @DiffRespTimeCol = '[' + @in_year + ' Difference From All Avg. Response Time]'
	SET @PBM = '''Catamaran'',''ARGUS'',''CVS CAREMARK'',''OptumRx'',''US SCRIPT'',''Medimpact'',''PRIME THERAPEUTICS'',''Express Scripts'',''Medco'',''NAVITUS''';

 
 
	DECLARE @manualTable varchar(50);
	DECLARE @autoTable varchar(50);
 

	SET @manualTable = 'claims..v_UPWebStatus_Web';
	SET @autoTable =   'claims..v_UPAutoStatus';
 


 

		SET ANSI_NULLS ON
		SET QUOTED_IDENTIFIER ON
		SET ANSI_PADDING ON
		SET @SQL = 'CREATE TABLE [dbo].[' + @tmpTable + ']( '+
			   @PBMCol +' [varchar](255) NULL, '+
			   @UPCCountCol +' [int]  NULL, '+
			   @PercUPCCountCol  +' [float]  NULL , '+
               @AvgRespTimeCol  +' [float]  NULL , '+
			   @DiffRespTimeCol  +' [float]  NULL , '+
		' ) ON [PRIMARY] ';
		EXEC (@SQL);
		SET ANSI_PADDING OFF



--Total		
		DECLARE @TCCC   int;
		DECLARE @TotalClaimCountCurr   int;
		SET @TCCC =0;

		SET @TotalClaimCountCurr =0;

        SET @SQL = 'Insert into Reports..' + @tmpTable + ' (' + @PBMCol +') Values (' +@HeaderTotal + ');';
		EXEC(@SQL);

----Current Year

	SET @SQL = '	SET @TCCC =  '+
			' (SELECT SUM(countV) as CountTotal from '+
				' ( '+
				    'SELECT    count(*)  as countV  from '+ @autoTable +
				' WHERE  Year(CreatedOn)=   ' + @in_year + ' and PlanName in (' +@PBM +')' +
					' and PlanName is not null and PlanName != ''''' +
		            ' UNION ALL '+
					 ' SELECT    count(*)  as countV  from ' + @manualTable +
				  ' WHERE Year(CreatedOn)=   ' + @in_year + ' and PlanName in (' +@PBM +')' +
                   '  and PlanName is not null and PlanName != ''''' +
				' ) ch ' +
			' );' ;

	EXEC sp_executesql @SQL, N'@TCCC int out', @TotalClaimCountCurr out
    DECLARE @TotalClaimCountCurrOut varchar(50)	;
	SET  @TotalClaimCountCurrOut = @TotalClaimCountCurr;
	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ' +  @UPCCountCol +'  =  ' +  @TotalClaimCountCurrOut + '   WHERE ' + @PBMCol +' = ' +@HeaderTotal ;
    PRINT @SQL;
	EXEC(@SQL);

--Claim Counts for each PBM

 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_2013ClaimCountByPBM')
 BEGIN
  DROP TABLE tmp_2013ClaimCountByPBM
 END


SET @SQL = ' SELECT *  into tmp_2013ClaimCountByPBM   from ( '+
	' SELECT PlanName, sum(plancount)  as planCount from  '+
	' ( '+
		' SELECT PlanName,   count(*)  as planCount   FROM ' + @autoTable +
		 ' WHERE   Year(CreatedOn)= ' + @in_year + '   and PlanName in (' +@PBM +')' +
		' group by PlanName   '+
		 
		' UNION ALL '+
		' SELECT PlanName, count(*) as planCount   FROM ' + @manualTable +
		' WHERE  Year(CreatedOn)= ' + @in_year + ' and PlanName in (' +@PBM +')' +
		' group by PlanName  '+
	' )ch '+
' group by PlanName '+
' )cy ';
PRINT @SQL;
EXEC (@SQL);
 
-- Update Final table with Response Times

SET @SQL =  'Insert into Reports..' + @tmpTable + ' (' + @PBMCol +',' +  @UPCCountCol +',' +  @PercUPCCountCol  +' )  ' +
        ' select PlanName,planCount,   round(cast(planCount as float)/cast('+@TotalClaimCountCurrOut+ ' as float),4) as PBMCount  '+
        '  from tmp_2013ClaimCountByPBM ';
 
PRINT @SQL;
EXEC (@SQL);

--SET @SQL = ' UPDATE t set '+
--        ' t.' +  @UPCCountCol +'  =  v.planCount,   '+
--        ' t.' +  @PercUPCCountCol  +'  =  round(cast(v.planCount as float)/cast('+@TotalClaimCountCurrOut+ ' as float),2) '+
--	    ' FROM  ' + @tmpTable +' t  '+
--			' inner join '+
--			 ' (   '+
--              	'SELECT PlanName,planCount from tmp_2013ClaimCountByPBM '+
--			 ' ) v  '+
--		    ' on t.PBM =v.PlanName   ';
--PRINT @SQL;
--EXEC (@SQL);

--Response Times
 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_2013Response')
 BEGIN
  DROP TABLE tmp_2013Response
 END



----Get Response times and put in temp table
SET @SQL = ' SELECT *  into tmp_2013Response   from ( '+
	' SELECT PlanName, round(cast(sum(diff) as float) / cast(sum(plancount) as float),2) as ' +  @AvgRespTimeCol  +' from  '+
	' ( '+
		' SELECT PlanName, (sum( DATEDIFF(day,CreatedOn,updatedon))) as diff , count(*)  as planCount   FROM ' + @autoTable +
		 ' WHERE   Year(CreatedOn)= ' + @in_year + ' and updatedon is not null and PlanName in (' +@PBM +')' +
		' group by PlanName   '+
		 
		' UNION ALL '+
		' SELECT PlanName, (sum( DATEDIFF(day,CreatedOn,updatedon))) as diff , count(*) as planCount   FROM ' + @manualTable +
		' WHERE  Year(CreatedOn)= ' + @in_year + ' and updatedon is not null and PlanName in (' +@PBM +')' +
		' group by PlanName  '+
	' )ch '+
' group by PlanName '+
' )cy ';
PRINT @SQL;
EXEC (@SQL);

-- Update Final table with Response Times
SET @SQL = ' UPDATE t set '+
        ' t.' +  @AvgRespTimeCol  +'  =  v.' +  @AvgRespTimeCol  +'    '+
	    ' FROM  ' + @tmpTable +' t  '+
			' inner join '+
			 ' (   '+
              	'SELECT PlanName,' +  @AvgRespTimeCol  +'  from tmp_2013Response '+
			 ' ) v  '+
		    ' on t.[Plan Name] =v.PlanName   ';
PRINT @SQL;
EXEC (@SQL);


-- Update Final table with Response Times
SET @SQL = ' UPDATE  ' + @tmpTable + 
        ' set ' +  @AvgRespTimeCol  +'  = (   '+
	    ' SELECT   round(cast(sum(diff) as float) / cast(sum(plancount) as float),2) as ' +  @AvgRespTimeCol  +' from  '+
	   ' ( '+
		' SELECT   (sum( DATEDIFF(day,CreatedOn,updatedon))) as diff , count(*)  as planCount   FROM ' + @autoTable +
		 ' WHERE   Year(CreatedOn)= ' + @in_year + ' and updatedon is not null and PlanName in (' +@PBM +')' +
 
		 
		' UNION ALL '+
		' SELECT  (sum( DATEDIFF(day,CreatedOn,updatedon))) as diff , count(*) as planCount   FROM ' + @manualTable +
		' WHERE  Year(CreatedOn)= ' + @in_year + ' and updatedon is not null and PlanName in (' +@PBM +')' +
 
	   ' )ch ) where ' + @PBMCol +' = ' +@HeaderTotal ;
PRINT @SQL;
EXEC (@SQL);


SET @SQL = ' UPDATE  ' + @tmpTable + 
	' set ' +  @DiffRespTimeCol  +' =  ' +  @AvgRespTimeCol  +' - (select ' +  @AvgRespTimeCol  +' ' +
    ' from  '+ @tmpTable + ' where [Plan Name] = ' +@HeaderTotal + ') '+
    ' where [Plan Name] != ' +@HeaderTotal  ;
EXEC (@SQL);

END








GO
