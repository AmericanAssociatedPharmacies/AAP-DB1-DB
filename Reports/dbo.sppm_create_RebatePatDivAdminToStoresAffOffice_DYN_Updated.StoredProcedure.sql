USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_RebatePatDivAdminToStoresAffOffice_DYN_Updated]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <07/08/2011>
-- Description:	Create table for Rebates & patr div & admin to stores and affiliate offices report for Paul


-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_RebatePatDivAdminToStoresAffOffice_DYN_Updated]
(@in_year varchar(4) )

AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- For Quarters

	DECLARE @Q1 varchar(2);
	DECLARE @Q2 varchar(2);
	DECLARE @Q3 varchar(2);
	DECLARE @Q4 varchar(2);

	SET @Q1 = 'Q1';
	SET @Q2 = 'Q2';
	SET @Q3 = 'Q3';
	SET @Q4 = 'Q4';

	DECLARE @dateQtr1 varchar(6);
	DECLARE @dateQtr2 varchar(6);
	DECLARE @dateQtr3 varchar(6);
	DECLARE @dateQtr4 varchar(6);
 
	DECLARE @startMoCount int;
	DECLARE @startQtrCount int;
 

 

    DECLARE @SQL varchar(max);
    DECLARE @SQL2 varchar(max);
    DECLARE @SQL3 varchar(max);


    DECLARE @SQLPPQtrCol varchar(max);
    DECLARE @SQLPPQtrTblCol varchar(max);
	DECLARE @SQLPPQtrColVolSel varchar(max);
	DECLARE @SQLPPQtrColRebSel varchar(max);

	DECLARE @SQLPPQtrRebTotal varchar(max);

    DECLARE @SQLAPIQtrCol varchar(max);
    DECLARE @SQLAPIQtrTblCol varchar(max);
    DECLARE @SQLAPIQtrColWhsSel varchar(max);
    DECLARE @SQLAPIQtrColGenSel varchar(max);
    DECLARE @SQLAPIQtrColBCDSel varchar(max);
    DECLARE @SQLAPIQtrColAPDSel varchar(max);
    DECLARE @SQLAPIQtrWhsRebTotal varchar(max);
    DECLARE @SQLAPIQtrBCDTotal varchar(max);
	DECLARE @SQLAPIQtrAPDTotal varchar(max);

    DECLARE @SQLHVCol varchar(max);
    DECLARE @SQLHVTblCol varchar(max);
    DECLARE @SQLHVColIncSel varchar(max);
    DECLARE @SQLHVColCogSel varchar(max);
    DECLARE @SQLHVIncTotal varchar(max);

    DECLARE @SQLConfCol varchar(max);
    DECLARE @SQLConfTblCol varchar(max);
    DECLARE @SQLConfColVolSel varchar(max);
    DECLARE @SQLConfColRebSel varchar(max);
    DECLARE @SQLConfVolTotal varchar(max);
    DECLARE @SQLConfRebTotal varchar(max);

    DECLARE @SQLLeaderMSIQtrCol varchar(max);
    DECLARE @SQLLeaderMSIQtrTblCol varchar(max);
    DECLARE @SQLLeaderMSIQtrColSel varchar(max);
    DECLARE @SQLLeaderMSIQtrTotal varchar(max);

--    DECLARE @SQLMSIQtrCol varchar(max);
--    DECLARE @SQLMSIQtrTblCol varchar(max);
--    DECLARE @SQLMSIQtrColSel varchar(max);
--    DECLARE @SQLMSIQtrTotal varchar(max);


	DECLARE @SQLAAPRebCol varchar(max);
	DECLARE @SQLAAPRebTblCol varchar(max);
	DECLARE @SQLAAPRebColSSSel varchar(max);
	DECLARE @SQLAAPRebColGenSel varchar(max);
	DECLARE @SQLAAPRebColAvgSel varchar(max);
	DECLARE @SQLAAPRebColHRTASel varchar(max);
	DECLARE @SQLAAPRebGenTotal varchar(max);

	

	DECLARE @SQLToZero varchar(500);
    DECLARE @SQLUpdateTotal varchar(500);
    DECLARE @SQLUpdateTable varchar(500);
	DECLARE @SQLAllCol varchar(500);

 
    DECLARE @startDate varchar(20);
    DECLARE @startConfDate varchar(20);
	DECLARE @nextYearDate varchar(20);
	DECLARE @moBuildDate varchar(20);

	DECLARE @next_year  varchar(4);
	SET @next_year = @in_year + 1;
  
    SET @SQLPPQtrCol = '';
    SET @SQLPPQtrTblCol = '';
	SET @SQLPPQtrColVolSel  = '';
	SET @SQLPPQtrColRebSel   = '';

	SEt @SQLPPQtrRebTotal = '';

    SET @SQLAPIQtrCol = '';
    SET @SQLAPIQtrTblCol = '';
    SET @SQLAPIQtrColWhsSel  = '';
    SET @SQLAPIQtrColGenSel  = '';
	SET @SQLAPIQtrWhsRebTotal = '';
    SET @SQLAPIQtrColBCDSel = '';
    SET @SQLAPIQtrColAPDSel = '';
    SET @SQLAPIQtrBCDTotal = '';
	SET @SQLAPIQtrAPDTotal = '';

    SET @SQLHVCol = '';
    SET @SQLHVTblCol = '';
    SET @SQLHVColIncSel  = '';
    SET @SQLHVColCogSel  = '';
	SET @SQLHVIncTotal = '';
--

	SET @SQLLeaderMSIQtrCol = '';  
	SET @SQLLeaderMSIQtrTblCol = ''; 
	SET @SQLLeaderMSIQtrColSel = ''; 
	SET @SQLLeaderMSIQtrTotal = '';

--    SET @SQLMSIQtrCol = ''; 
--    SET @SQLMSIQtrTblCol = ''; 
--    SET @SQLMSIQtrColSel = ''; 
--    SET @SQLMSIQtrTotal = ''; 

	SET @SQLAAPRebCol = '';  
	SET @SQLAAPRebTblCol = '';  
	SET @SQLAAPRebColSSSel  = '';  
	SET @SQLAAPRebColGenSel  = '';  
	SET @SQLAAPRebColAvgSel  = '';  
	SET @SQLAAPRebColHRTASel  = '';  
    SET @SQLAAPRebGenTotal = '';
 
 
	SET @dateQtr1 = '01/01/' + cast(year(@in_year) as varchar(4)); -- FYTD so start at 01/01 of whatever year
	SET @dateQtr2 = '03/01/' + cast(year(@in_year) as varchar(4)); -- FYTD so start at 01/01 of whatever year
	SET @dateQtr3 = '06/01/' + cast(year(@in_year) as varchar(4)); -- FYTD so start at 01/01 of whatever year
	SET @dateQtr4 = '09/01/' + cast(year(@in_year) as varchar(4)); -- FYTD so start at 01/01 of whatever year


	SET @startMoCount = 0;
	SET @startQtrCount = 1;
 
  
    SET @startDate = '01/01/' + @in_year; -- FYTD so start at 01/01 of whatever year
	SET @nextYearDate = '01/01/' + @next_year; -- FYTD so start at 01/01 of whatever year

 
 
    -- Build the Preferred Partner Quarter Columns
 
	WHILE @startQtrCount < 5
	BEGIN
 		SET @SQLPPQtrCol = @SQLPPQtrCol +  ' MAX([PP Rebate ' + @in_year +  'Q'  +cast(@startQtrCount as varchar(1)) +'])  as [PP Rebate ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'], ';

-- Table Columns to build final table
 		SET @SQLPPQtrTblCol = @SQLPPQtrTblCol +  ' cast (0 as float)   as [PP Rebate ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'], ';

-- Columns for Select In 

 		SET @SQLPPQtrColRebSel = @SQLPPQtrColRebSel +  '[PP Rebate ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'], ';

--Totals
		SET @SQLPPQtrRebTotal = @SQLPPQtrRebTotal + '[PP Rebate ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] +  ';

   
    	SET @startQtrCount = @startQtrCount + 1;
	END
   -- Now take of trailing comma (not for final table)
       SET @SQLPPQtrCol = substring(@SQLPPQtrCol,0,len(@SQLPPQtrCol) );
       SET @SQLPPQtrColRebSel = substring(@SQLPPQtrColRebSel,0,len(@SQLPPQtrColRebSel) );
       SET @SQLPPQtrRebTotal = substring(@SQLPPQtrRebTotal,0,len(@SQLPPQtrRebTotal) );
    
   -- Build the API Quarter Columns
    SET @startQtrCount = 1;

	WHILE @startQtrCount < 5
	BEGIN
		SET @SQLAPIQtrCol = @SQLAPIQtrCol +  ' MAX([Q'  +cast(@startQtrCount as varchar(1)) + ' API Whse Rebate])  as [Q'  +cast(@startQtrCount as varchar(1)) + ' API Whse Rebate], ';
-- Table Columns to build final table
		SET @SQLAPIQtrTblCol = @SQLAPIQtrTblCol +  ' cast (0 as float)   as [Q'  + cast(@startQtrCount as varchar(1)) +' API Whse Rebate], ';

-- Columns for Select In 

		SET @SQLAPIQtrColWhsSel = @SQLAPIQtrColWhsSel +  '[Q'  +cast(@startQtrCount as varchar(1)) + ' API Whse Rebate], ';

-- Totals
		SET @SQLAPIQtrWhsRebTotal = @SQLAPIQtrWhsRebTotal + '[Q'  +cast(@startQtrCount as varchar(1)) + ' API Whse Rebate] + ';

		SET @startQtrCount  = @startQtrCount + 1;
    END
   -- Now take of trailing comma (not for the table columns though)
       SET @SQLAPIQtrCol = substring(@SQLAPIQtrCol,0,len(@SQLAPIQtrCol) );
       SET @SQLAPIQtrColWhsSel = substring(@SQLAPIQtrColWhsSel,0,len(@SQLAPIQtrColWhsSel) );
       SET @SQLAPIQtrWhsRebTotal = substring(@SQLAPIQtrWhsRebTotal,0,len(@SQLAPIQtrWhsRebTotal) );
  
 
   SET @startMoCount =  0; 
     -- Build the API High Volume Columns
	WHILE @startMoCount < 12
	BEGIN
		SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));
		SET @SQLHVCol = @SQLHVCol + ' MAX([HV Incentive ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']) as [HV Incentive ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '],';
 
  		SET @SQLHVTblCol = @SQLHVTblCol + '  cast (0 as float ) as [HV Incentive ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2)  + '],';

-- Columns for Select In 
		SET @SQLHVColIncSel = @SQLHVColIncSel + '[HV Incentive ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '],';

-- Totals
		SET @SQLHVIncTotal = @SQLHVIncTotal + '[HV Incentive ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] + ';

	    SET @startMoCount  = @startMoCount + 1;
    END
       -- Now take of trailing comma (not for the columns though)
       SET @SQLHVCol = substring(@SQLHVCol,0,len(@SQLHVCol) );
       SET @SQLHVColIncSel = substring(@SQLHVColIncSel,0,len(@SQLHVColIncSel) );
       SET @SQLHVIncTotal = substring(@SQLHVIncTotal,0,len(@SQLHVIncTotal) );

     -- Build the Leader Rebate columns
	SET @startQtrCount = 1;
   	WHILE @startQtrCount < 5
	BEGIN
		SET @SQLLeaderMSIQtrCol = @SQLLeaderMSIQtrCol +  ' MAX([Leader-MSI Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'])  as [Leader-MSI Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'], ';
  		SET @SQLLeaderMSIQtrTblCol = @SQLLeaderMSIQtrTblCol +  '  cast (0 as float ) as [Leader-MSI Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'], ';
-- Columns for Select In 
		SET @SQLLeaderMSIQtrColSel = @SQLLeaderMSIQtrColSel +  '[Leader-MSI Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'], ';
-- Totals
		SET @SQLLeaderMSIQtrTotal = @SQLLeaderMSIQtrTotal + '[Leader-MSI Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] + ';

    	SET @startQtrCount = @startQtrCount + 1;
	END
       -- Now take of trailing comma (not for the table columns though)
       SET @SQLLeaderMSIQtrCol = substring(@SQLLeaderMSIQtrCol,0,len(@SQLLeaderMSIQtrCol) );
       SET @SQLLeaderMSIQtrColSel = substring(@SQLLeaderMSIQtrColSel,0,len(@SQLLeaderMSIQtrColSel) );
       SET @SQLLeaderMSIQtrTotal = substring(@SQLLeaderMSIQtrTotal,0,len(@SQLLeaderMSIQtrTotal) );

---- Build the MSI Rebate columns
--	SET @startQtrCount = 1;
--   	WHILE @startQtrCount < 5
--	BEGIN
--		SET @SQLMSIQtrCol = @SQLMSIQtrCol +  ' MAX([MSI AAP ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'])  as [MSI AAP ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'], ';
--  		SET @SQLMSIQtrTblCol = @SQLMSIQtrTblCol +  '  cast (0 as float ) as [MSI AAP ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'], ';
---- Columns for Select In 
--		SET @SQLMSIQtrColSel = @SQLMSIQtrColSel +  '[MSI AAP ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'], ';
---- Totals
--		SET @SQLMSIQtrTotal = @SQLMSIQtrTotal + '[MSI AAP ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] + ';
--
--    	SET @startQtrCount = @startQtrCount + 1;
--	END
--       -- Now take of trailing comma (not for the table columns though)
--       SET @SQLMSIQtrCol = substring(@SQLMSIQtrCol,0,len(@SQLMSIQtrCol) );
--       SET @SQLMSIQtrColSel = substring(@SQLMSIQtrColSel,0,len(@SQLMSIQtrColSel) );
--       SET @SQLMSIQtrTotal = substring(@SQLMSIQtrTotal,0,len(@SQLMSIQtrTotal) );

     
 
    --- Build the AAP rebate Columns
    SET @startMoCount =  0;  
	WHILE @startMoCount < 12
	BEGIN
		SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));
		SET @SQLAAPRebCol = @SQLAAPRebCol + ' MAX([' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' CA Monthly Gen Rebate]) as  [' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' CA Monthly Gen Rebate],';
		SET @SQLAAPRebTblCol = @SQLAAPRebTblCol + ' cast (0 as float ) as [' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' CA Monthly Gen Rebate],';
   		SET @SQLAAPRebTblCol = @SQLAAPRebTblCol + ' cast ('''' as varchar(50) ) as [' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' PaymentMethod],';
-- Columns for Select

		SET @SQLAAPRebColGenSel = @SQLAAPRebColGenSel + '['+  replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' CA Monthly Gen Rebate],';

--Totals
		SET @SQLAAPRebGenTotal = @SQLAAPRebGenTotal + '['+  replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' CA Monthly Gen Rebate] + ';
		SET @startMoCount = @startMoCount + 1;
	END
       -- Now take of trailing comma (not for the table columns though)
     SET @SQLAAPRebCol = substring(@SQLAAPRebCol,0,len(@SQLAAPRebCol) );
     SET @SQLAAPRebColGenSel = substring(@SQLAAPRebColGenSel,0,len(@SQLAAPRebColGenSel) );
     SET @SQLAAPRebGenTotal = substring(@SQLAAPRebGenTotal,0,len(@SQLAAPRebGenTotal) );

  
--- Here is where the fun begins
 ---- TO DO  create as dynamic

--------------------------

 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_RPDA_jmw')
 BEGIN
  DROP TABLE tmp_RPDA_jmw
 END

SET @SQL = '	SELECT *  into tmp_RPDA_jmw from  (' + 
        ' SELECT '+
        ' a.PMID , '+ 
        ' cast('''' as varchar(25)) as [AAP#] ,' +
        ' cast('''' as varchar(100)) as [Affiliate] ,' +
        ' cast('''' as varchar(100)) as [Account DBA Name] ,' +
        ' cast('''' as varchar(100)) as [City] ,' +
        ' cast('''' as varchar(100)) as [St] ,' +
		@SQLPPQtrTblCol +
		' cast (0 as float)   as [Total PP Rebate ' +@in_year +'],'+
		+ @SQLAPIQtrTblCol +
		' cast (0 as float) as [Total API Whse Rebate ' +@in_year +'], '+
      --  ' cast (0 as float) as [Total API Brand Credits Disbursed ' +@in_year +'],' +
      --  ' cast (0 as float) as [Total API Accelerated Pay Discount ' +@in_year +'],' +
		 + @SQLHVTblCol +
		' cast (0 as float)  as [Total HV Incentive ' +@in_year +'], '+
		--+ @SQLConfTblCol  +
		--' cast (0 as float) as [Total Conf Volume ' +@in_year +'],'+
		--' cast (0 as float) as  [Total Conf Rebate ' +@in_year +'],'+
		+ @SQLLeaderMSIQtrTblCol +
		' cast (0 as float) as [Total Leader-MSI Rebates ' +@in_year +'], '+
        --+ @SQLMSIQtrTblCol +
		--' cast (0 as float) as [Total MSI AAP ' +@in_year +'], '+
		+ @SQLAAPRebTblCol +
		' cast (0 as float) as [Total CA Monthly Gen Rebate ' +@in_year +'], '+
		' cast (0 as float) as [Planogram Rebate ' +@in_year +'],'+

		' cast (0 as float) as [3M Rebate ' +@in_year +'],'+
		' cast (0 as float) as [Mason Rebate ' +@in_year +'],'+
		' cast (0 as float) as [API Generic Incentive ' +@in_year +'],'+
		' cast (0 as float) as [AAP Patronage Dividend ' +@in_year +'],'+
		' cast (0 as float)   as [Total YTD All Rebates ' +@in_year +']'+


		' FROM '+
		' (SELECT  DISTINCT cast(pmid as int) as pmid  FROM '+
		' 	(SELECT DISTINCT pmid from pharmacymaster..PM_rebates_PPartner where period in (''' + @in_year + @Q1 + ''','''+ @in_year + @Q2 + ''',''' + @in_year + @Q3 + ''',''' + @in_year + @Q4 + ''')'+
		' 		union '+
		' 	 SELECT DISTINCT pmid from pharmacymaster..PM_rebates_APIQuarterly where period in (''' + @in_year + @Q1 + ''','''+ @in_year + @Q2 + ''',''' + @in_year + @Q3 + ''',''' + @in_year + @Q4 + ''')' +
		' 		union '+
		' 	 SELECT DISTINCT pmid from pharmacymaster..PM_Rebates_CHAAP where date >= ''' + @startDate + ''' and date < ''' + @nextYearDate  + '''' +
		' 		union '+
		' 	 SELECT DISTINCT pmid from pharmacymaster..pm_rebates_HighVolume where date >= ''' + @startDate + ''' and date < ''' + @nextYearDate + '''' +
		' 		union '+
		' 	 SELECT DISTINCT pmid from pharmacymaster..PM_AnnualRebates where year  = ''' + @in_year  + '''' +
		' 	) p '+
		'  ) a ' +
        ')ch ';
 

PRINT @SQL;
 EXEC(@SQL);

 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_RPDA_PP_jmw')
 BEGIN
  DROP TABLE tmp_RPDA_PP_jmw 
 END
 

--WHAT TO DO WITH THIS ??????
--	  FROM reports..tmp_PPartner2011Q1_rollup  where ( period in ('2011Q1'))
--			 group by PMID ,period


-- Create temp table for pivoted PP Rebates
SET @SQL =  ' SELECT * INTO tmp_RPDA_PP_jmw from ( '+
	' SELECT   '+
	'  PMID, '+
	 @SQLPPQtrCol +
 
	' FROM ( '+
	'  SELECT PMID,period, '+
	'''PP Rebate '' + period as datePPR, '+
	' sum(round(isnull([paid to store],0.00)+isnull([paid to affiliate],0.00),2) )as PPQtrRebate '+
    '  	  FROM  pharmacymaster..PM_rebates_PPartner  where  ( period in  (''' + @in_year + @Q1 + ''','''+ @in_year + @Q2 + ''',''' + @in_year + @Q3 + ''',''' + @in_year + @Q4 + '''))' +
	'		 group by PMID ,period '+
	' ) as PPTable '+

	' PIVOT '+
	' ( '+
	'  SUM(PPQtrRebate) '+
	'  FOR datePPR IN  (' + @SQLPPQtrColRebSel      + ') '+
	' ) as P2 '+
	' group by PMID '+

   ' )vol';


PRINT @SQL;
EXEC(@SQL);
----------------------

 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_RPDA_APIQtr_jmw')
 BEGIN
  DROP TABLE tmp_RPDA_APIQtr_jmw
 END
 
-- Create temp table for pivoted API Quarterly
SET @SQL = ' SELECT * INTO tmp_RPDA_APIQtr_jmw from ( '+
	 ' SELECT   '+
	 ' PMID, '+

	  @SQLAPIQtrCol +
 
	 ' FROM ( '+
	 ' SELECT PMID,period, '+

	 '  substring(period,5,2) + '' API Whse Rebate''  as dateWReb, '+
	 '	case when [Rebate Administrator] = ''PGNE'' then sum((round(isnull([Rebate to Pay Acct/Admin] -[Less Group Admin] ,0),2) * [Pay Account])) '+
     ' else  sum((round(isnull([Rebate to Pay Acct/Admin]  ,0),2) * [Pay Account])) end as APIWhseReb  '+
	 --'	sum((round(isnull([Rebate to Pay Acct/Admin] ,0),2) * [Pay Account]))as APIWhseReb  '+

     ' 	  FROM  pharmacymaster..PM_rebates_APIQuarterly where  ( period in  (''' + @in_year + @Q1 + ''','''+ @in_year + @Q2 + ''',''' + @in_year + @Q3 + ''',''' + @in_year + @Q4 + '''))' +
	 '		 group by PMID ,period,[Rebate Administrator] '+
	 ' ) as PPTable  '+


	 ' PIVOT  '+
	 '(  '+
	 ' SUM(APIWhseReb)   '+
	 ' FOR dateWReb IN  (' + @SQLAPIQtrColWhsSel  + ')  '+
	 ' ) as P1  '+

	' group by PMID '+

   ' )vol ';
PRINT @SQL;
EXEC(@SQL);
----------------------

 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_RPDA_HV_jmw')
 BEGIN
  DROP TABLE tmp_RPDA_HV_jmw
 END

-- Create temp table for pivoted High Volume
SET @SQL = ' SELECT * INTO tmp_RPDA_HV_jmw from ( '+
	   ' SELECT   '+
	   ' PMID, '+
       @SQLHVCol +
 
	   ' FROM ( '+
	   ' SELECT PMID,date, '+

		'''HV Incentive '' +  replace(str(datepart(month,date),2),'' '',''0'')  +  substring(cast(datepart(year,date) as varchar(4)),3,2)    as dateHVI, '+
		' sum(round(isnull([High Volume Incentive],0.00),2))as HVI  '+
      	'  FROM  pharmacymaster..pm_rebates_HighVolume where   date >= ''' + @startDate + ''' and date < ''' + @nextYearDate + '''' + 
		'	 group by PMID ,date '+
	    ' ) as PPTable '+
	 ' PIVOT '+
	 '( '+
	  ' SUM(HVI) '+
	  ' FOR dateHVI IN  (' + @SQLHVColIncSel  + ') '+
	 ' ) as P1 '+
	 ' group by PMID  ' +

     ' )vol  ' ;

PRINT @SQL;
EXEC(@SQL);
----------------------


----------------------

 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_RPDA_Leader_jmw')
 BEGIN
  DROP TABLE tmp_RPDA_Leader_jmw
 END

-- Create temp table for Leader Rebates fields
SET @SQL =  ' SELECT * INTO tmp_RPDA_Leader_jmw from ( '+
	      ' SELECT   '+
	      ' PMID, '  +
           @SQLLeaderMSIQtrCol +
	      ' FROM ( '+
	      ' SELECT PMID,date, '+

		   '''Leader-MSI Rebates '' +  cast(datepart(year,date) as varchar(4)) + '+
               ' case when date = ''03/01/' + @in_year + ''' then ''Q1'' '+   
               ' when date = ''06/01/' + @in_year + ''' then  ''Q2''  '+  
               ' when date = ''09/01/' + @in_year + ''' then  ''Q3'' ' +
               ' when date = ''12/01/' + @in_year + ''' then ''Q4''   else null end  as dateLR, '+
		   ' sum(round(isnull(LeaderRebate,0),2))as LR  '+ 

      	  ' FROM  pharmacymaster..PM_Rebates_CHAAP where  date  >= ''' + @startDate + ''' and date < ''' + @nextYearDate + '''' + 
		' group by PMID ,date '+
	    ' ) as PPTable '+
		' PIVOT '+
		' ( '+
		'  SUM(LR)  '+
		'  FOR dateLR IN  ( ' + @SQLLeaderMSIQtrColSel + ' ) '+
		') as P1 '+
		' group by PMID '+

	    ' )vol ';
PRINT @SQL;
EXEC(@SQL);
----------------------
 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_RPDA_MSI_jmw')
 BEGIN
  DROP TABLE tmp_RPDA_MSI_jmw
 END
-- Create temp table for MSI Rebates fields
SET @SQL =  ' SELECT * INTO tmp_RPDA_MSI_jmw from ( '+
	      ' SELECT   '+
	      ' PMID, '  +
           @SQLLeaderMSIQtrCol +
	      ' FROM ( '+
	      ' SELECT PMID,date, '+

		   '''Leader-MSI Rebates '' +  cast(datepart(year,date) as varchar(4)) + '+
               ' case when date = ''03/01/' + @in_year + ''' then ''Q1'' '+   
               ' when date = ''06/01/' + @in_year + ''' then  ''Q2''  '+  
               ' when date = ''09/01/' + @in_year + ''' then  ''Q3'' ' +
               ' when date = ''12/01/' + @in_year + ''' then ''Q4''   else null end  as dateMSI, '+
		   ' sum(round(isnull(MSIRebate,0),2))as MSI  '+ 

      	  ' FROM  pharmacymaster..PM_Rebates_CHAAP where  date  >= ''' + @startDate + ''' and date < ''' + @nextYearDate + '''' + 
		' group by PMID ,date '+
	    ' ) as PPTable '+
		' PIVOT '+
		' ( '+
		'  SUM(MSI)  '+
		'  FOR dateMSI IN  ( ' + @SQLLeaderMSIQtrColSel + ' ) '+
		') as P1 '+
		' group by PMID '+

	    ' )vol ';
PRINT @SQL;
EXEC(@SQL);
----------------------


----- CHANGED This to subtract out Leader and MSIRebate
 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_RPDA_AAP_jmw')
 BEGIN
  DROP TABLE tmp_RPDA_AAP_jmw
 END

-- Create temp table for pivoted AAP Rebates
SET @SQL = ' SELECT * INTO tmp_RPDA_AAP_jmw from ( '+
	      ' SELECT   '+
	      ' PMID, '+

		 @SQLAAPRebCol +
 
	     ' FROM ( '+
	     '  SELECT PMID,date, '+

		 '  replace(str(datepart(month,date),2),'' '',''0'')  + ''/'' +  substring(cast(datepart(year,date) as varchar(4)),3,2)  + '' CA Monthly Gen Rebate''  as dateGR, '+
		 ' sum( round(TotalToPayOut,2) - round(LeaderRebate,2) - round(MSIRebate,2)) as GR  '+
      	 ' FROM   pharmacymaster..PM_Rebates_CHAAP  where ( year(date) in (' + @in_year + ')) '+
		 '	 group by PMID ,date '+
	' ) as PPTable '+
	' PIVOT '+
	' ( '+
	' SUM(GR) '+
	'  FOR dateGR IN  ( ' + @SQLAAPRebColGenSel  + ' ) '+
	' ) as P2 '+
	' group by PMID '+
   ' )vol ';

PRINT @SQL;
EXEC(@SQL);


-- Set where null to zero so we can do  totals
 

-- PP table
	SET @startQtrCount = 1
	WHILE @startQtrCount < 5
	BEGIN
		SET @SQLToZero = ' UPDATE tmp_RPDA_PP_jmw SET [PP Rebate ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] = 0.0 where   [PP Rebate ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] is null ';
			Exec (@SQLToZero);
        SET @startQtrCount = @startQtrCount + 1;
	END
-- API Qtr Table
	SET @startQtrCount = 1
	WHILE @startQtrCount < 5
	BEGIN
		SET @SQLToZero = ' UPDATE tmp_RPDA_APIQtr_jmw SET [Q'  + cast(@startQtrCount as varchar(1)) +' API Whse Rebate] = 0.0 where   [Q'  + cast(@startQtrCount as varchar(1)) +' API Whse Rebate] is null ';
			Exec (@SQLToZero);
		SET @startQtrCount = @startQtrCount + 1;
	END

-- High Volume   Table
	SET @startMoCount = 0
	WHILE @startMoCount < 12
	BEGIN
		SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));
		SET @SQLToZero = ' UPDATE tmp_RPDA_HV_jmw SET [HV Incentive ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] = 0.0 where   [HV Incentive ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] is null ';
			Exec (@SQLToZero);
		SET @startMoCount = @startMoCount + 1;
	END


 
--Leader table
	SET @startQtrCount = 1
	WHILE @startQtrCount < 5
	BEGIN
		SET @SQLToZero = ' UPDATE tmp_RPDA_Leader_jmw SET [Leader-MSI Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] = 0.0 where   [Leader-MSI Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] is null ';
			Exec (@SQLToZero);
		SET @startQtrCount = @startQtrCount + 1;
	END

--MSI table
	SET @startQtrCount = 1
	WHILE @startQtrCount < 5
	BEGIN
		SET @SQLToZero = ' UPDATE tmp_RPDA_MSI_jmw SET [Leader-MSI Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] = 0.0 where   [Leader-MSI Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] is null ';
			Exec (@SQLToZero);
		SET @startQtrCount = @startQtrCount + 1;
	END

-- AAP Rebate  Table
	SET @startMoCount = 0
	WHILE @startMoCount < 12
	BEGIN
		SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));

		SET @SQLToZero = ' UPDATE tmp_RPDA_AAP_jmw SET ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' CA Monthly Gen Rebate] = 0.0 where  ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' CA Monthly Gen Rebate] is null ';
			Exec (@SQLToZero);

		SET @startMoCount = @startMoCount + 1;
	END


--Update the final table with all the tmp table data
 	  
-- Update from PP table
	SET @startQtrCount = 1
	WHILE @startQtrCount < 5
	BEGIN
		SET @SQLUpdateTable = ' UPDATE final set [PP Rebate ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] '+
             ' = tmp.[PP Rebate ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] ' +
             ' FROM tmp_RPDA_jmw final inner join (select pmid,[PP Rebate ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] from tmp_RPDA_PP_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			Exec (@SQLUpdateTable);
        SET @startQtrCount = @startQtrCount + 1;
	END

-- Update from API Qtr table
	SET @startQtrCount = 1
	WHILE @startQtrCount < 5
	BEGIN
		SET @SQLUpdateTable = ' UPDATE final set [Q'  + cast(@startQtrCount as varchar(1)) +' API Whse Rebate]  '+
             ' = tmp.[Q'  + cast(@startQtrCount as varchar(1)) +' API Whse Rebate]  ' +
             ' FROM tmp_RPDA_jmw final inner join (select pmid,[Q'  + cast(@startQtrCount as varchar(1)) +' API Whse Rebate]  from tmp_RPDA_APIQtr_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			Exec (@SQLUpdateTable);
        SET @startQtrCount = @startQtrCount + 1;
	END


-- UPdate from High Volume   Table
	SET @startMoCount = 0
	WHILE @startMoCount < 12
	BEGIN
		SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));

		SET @SQLUpdateTable = ' UPDATE final set [HV Incentive ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  '+
             ' = tmp.[HV Incentive ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  ' +
             ' FROM tmp_RPDA_jmw final inner join (select pmid,[HV Incentive ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  from tmp_RPDA_HV_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			Exec (@SQLUpdateTable);

		SET @startMoCount = @startMoCount + 1;
	END


 
-- Update from Leader table
	SET @startQtrCount = 1
	WHILE @startQtrCount < 5
	BEGIN

		SET @SQLUpdateTable = ' UPDATE final set [Leader-MSI Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +']  '+
             ' = tmp.[Leader-MSI Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] + final.[Leader-MSI Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +']   ' +
             ' FROM tmp_RPDA_jmw final inner join (select pmid,[Leader-MSI Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +']  from tmp_RPDA_Leader_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			Exec (@SQLUpdateTable);
		SET @startQtrCount = @startQtrCount + 1;
	END


-- Update from MSI table
	SET @startQtrCount = 1
	WHILE @startQtrCount < 5
	BEGIN

		SET @SQLUpdateTable = ' UPDATE final set [Leader-MSI Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +']  '+
             ' = tmp.[Leader-MSI Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +']  + final.[Leader-MSI Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +']  ' +
             ' FROM tmp_RPDA_jmw final inner join (select pmid,[Leader-MSI Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +']  from tmp_RPDA_MSI_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			Exec (@SQLUpdateTable);
		SET @startQtrCount = @startQtrCount + 1;
	END



-- Update from AAP Rebate  Table
	SET @startMoCount = 0
	WHILE @startMoCount < 12
	BEGIN
		SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));

		SET @SQLUpdateTable = ' UPDATE final set ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' CA Monthly Gen Rebate]   '+
             ' = tmp.['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' CA Monthly Gen Rebate]   ' +
             ' FROM tmp_RPDA_jmw final inner join (select pmid,['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' CA Monthly Gen Rebate]   from tmp_RPDA_AAP_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			Exec (@SQLUpdateTable);

		SET @startMoCount = @startMoCount + 1;
	END



	SET @startMoCount = 0
	WHILE @startMoCount < 12
	BEGIN
		SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));
 
--		SET @SQL  = ' UPDATE t SET ['  +
--                        replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' CA Monthly Gen Rebate] = ' + 
--                       ' w.[GenericRebate], ' + 
--                       ' [' +
----                        replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Avg%] =  '+ 
----                       'case when w.[EffRebatePerc] is null then 0 else  (w.[EffRebatePerc] * 100) end , ' +
----                        ' [' +
--                         replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' PaymentMethod] =  '+ 
--                       ' w.[PaymentMethod]  ' + 
-- --                        ' [' +
-- --                      replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '  Leader-MSI Rebates] = '+
----                    ' case when w.LeaderRebate + w.MSIRebate is null then 0 else (w.LeaderRebate + w.MSIRebate ) end  '+
--					' FROM tmp_RPDA_jmw   t '+
--					'  inner join  '+
--                    '   ( select * from import_Rebates_CAHDirect where month(date) = '+ replace(str(datepart(month,@moBuildDate),2),' ','0') + ' and year(date) = ' + cast(datepart(year,@moBuildDate) as varchar(4)) + ' ) w '+
--                    ' on t.pmid = w.pmid ';

		SET @SQL  = ' UPDATE t SET ['  +
                        replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' CA Monthly Gen Rebate] = ' + 
                       ' ['  +
                        replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' CA Monthly Gen Rebate] + ' + 
                       ' w.[GenericRebate], ' + 
                       ' [' +
--                        replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Avg%] =  '+ 
--                       'case when w.[EffRebatePerc] is null then 0 else  (w.[EffRebatePerc] * 100) end , ' +
--                        ' [' +
                         replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' PaymentMethod] =  '+ 
                       ' w.[PaymentMethod]  ' + 
 --                        ' [' +
 --                      replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '  Leader-MSI Rebates] = '+
--                    ' case when w.LeaderRebate + w.MSIRebate is null then 0 else (w.LeaderRebate + w.MSIRebate ) end  '+
					' FROM tmp_RPDA_jmw   t '+
					'  inner join  '+
                    '   ( select * from import_Rebates_CAHDirect where month(date) = '+ replace(str(datepart(month,@moBuildDate),2),' ','0') + ' and year(date) = ' + cast(datepart(year,@moBuildDate) as varchar(4)) + ' ) w '+
                    ' on t.pmid = w.pmid ';

       Print @SQL
	   Exec (@SQL);
  
		SET @startMoCount = @startMoCount + 1;
	END

	SET @startQtrCount = 1;
	SET @startMoCount = 2;
    SEt @SQL = '';
   	WHILE @startQtrCount < 5
 
	BEGIN
        		SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));
         		SET @SQL  = ' UPDATE t SET '  +
                        ' [Leader-MSI Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] = ' +
                    ' case when w.LeaderRebate + w.MSIRebate is null then 0 else (w.LeaderRebate + w.MSIRebate ) end  + [Leader-MSI Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +']'+
					' FROM tmp_RPDA_jmw   t '+
					'  inner join  '+
                    '   ( select * from import_Rebates_CAHDirect where month(date) = '+ replace(str(datepart(month,@moBuildDate),2),' ','0') + ' and year(date) = ' +  @in_year + ' ) w '+
                    ' on t.pmid = w.pmid ';
       Print @SQL
	   Exec (@SQL);
            SET @startQtrCount = @startQtrCount + 1;
            SET @startMoCount = @startMoCount + 3;
	END
--------------------------------

--- Now do Totals

		SET @SQLUpdateTable = ' UPDATE tmp_RPDA_jmw set  [Total PP Rebate ' +@in_year +'] = ' + @SQLPPQtrRebTotal;
		EXEC (@SQLUpdateTable);
		SET @SQLUpdateTable = ' UPDATE tmp_RPDA_jmw set [Total API Whse Rebate ' +@in_year +'] = ' + @SQLAPIQtrWhsRebTotal;
		EXEC (@SQLUpdateTable);
		SET @SQLUpdateTable = ' UPDATE tmp_RPDA_jmw set  [Total HV Incentive ' +@in_year +']  = ' +  @SQLHVIncTotal;
		EXEC (@SQLUpdateTable);
		SET @SQLUpdateTable = ' UPDATE tmp_RPDA_jmw set  [Total Leader-MSI Rebates ' +@in_year +']  = ' +  @SQLLeaderMSIQtrTotal;
		EXEC (@SQLUpdateTable);
		SET @SQLUpdateTable = ' UPDATE tmp_RPDA_jmw set   [Total CA Monthly Gen Rebate ' +@in_year +']  = ' + @SQLAAPRebGenTotal;
		EXEC (@SQLUpdateTable);

	--TODO - don't know where theses are coming from yet...

		SET @SQLUpdateTable = ' UPDATE t set    [Planogram Rebate ' +@in_year +']  = v.PlanOgramRebate' +
				       ' FROM   reports..tmp_RPDA_jmw t  ' +
                       ' inner join ( '+
                       ' SELECT SUM(PlanOgramRebate) as PlanOgramRebate ,  pmid from pharmacymaster..PM_AnnualRebates where year = ' +@in_year + 
				       '  GROUP BY   pmid '+
			           ' ) v '+
		               '  on t.pmid =v.pmid  ';
		EXEC (@SQLUpdateTable);

		--SET @SQLUpdateTable = ' UPDATE tmp_RPDA_jmw set [API Generic Incentive ' +@in_year +']  = ' +

		SET @SQLUpdateTable = ' UPDATE t set    [API Generic Incentive ' +@in_year +']  = v.GenericIncentive' +
				       ' FROM   reports..tmp_RPDA_jmw t  ' +
                       ' inner join ( '+
                       ' SELECT SUM(GenericIncentive) as GenericIncentive ,  pmid from pharmacymaster..PM_AnnualRebates where year = ' +@in_year + 
				       '  GROUP BY   pmid '+
			           ' ) v '+
		               '  on t.pmid =v.pmid  ';
		 EXEC (@SQLUpdateTable);

		SET @SQLUpdateTable = ' UPDATE t set    [AAP Patronage Dividend ' +@in_year +']  = v.PatronageDividend' +
				       ' FROM   reports..tmp_RPDA_jmw t  ' +
                       ' inner join ( '+
                       ' SELECT SUM(PatronageDividend) as PatronageDividend ,  pmid from pharmacymaster..PM_AnnualRebates where year = ' +@in_year + 
				       '  GROUP BY   pmid '+
			           ' ) v '+
		               '  on t.pmid =v.pmid  ';
		 EXEC (@SQLUpdateTable);
--3M Rebates
		SET @SQLUpdateTable = ' UPDATE t set    [3M Rebate ' +@in_year +']  = v.threeMRebate' +
				       ' FROM   reports..tmp_RPDA_jmw t  ' +
                       ' inner join ( '+
                       ' SELECT SUM([3MRebate]) as threeMRebate ,  pmid from pharmacymaster..PM_AnnualRebates where year = ' +@in_year + 
				       '  GROUP BY   pmid '+
			           ' ) v '+
		               '  on t.pmid =v.pmid  ';
		 EXEC (@SQLUpdateTable);

--Mason Rebates
		SET @SQLUpdateTable = ' UPDATE t set    [Mason Rebate ' +@in_year +']  = v.masonRebate' +
				       ' FROM   reports..tmp_RPDA_jmw t  ' +
                       ' inner join ( '+
                       ' SELECT SUM(MasonRebate) as masonRebate ,  pmid from pharmacymaster..PM_AnnualRebates where year = ' +@in_year + 
				       '  GROUP BY   pmid '+
			           ' ) v '+
		               '  on t.pmid =v.pmid  ';
		 EXEC (@SQLUpdateTable);

		SET @SQLUpdateTable = ' UPDATE tmp_RPDA_jmw set   [Total YTD All Rebates ' +@in_year +']  = ' +  
								' [Total PP Rebate ' +@in_year +'] + ' + 
								' [Total API Whse Rebate ' +@in_year +'] + ' + 
								' [Total HV Incentive ' +@in_year +'] + ' + 
								' [Total Leader-MSI Rebates ' +@in_year +'] + ' + 
								' [Total CA Monthly Gen Rebate ' +@in_year +'] + ' + 
								' [Planogram Rebate ' +@in_year +'] + ' + 
								' [API Generic Incentive ' +@in_year +'] + ' + 
                                ' [3M Rebate ' +@in_year +'] + ' +
                                ' [Mason Rebate ' +@in_year +'] + ' +
								' [AAP Patronage Dividend ' +@in_year +']   '  ;
		EXEC (@SQLUpdateTable);


 
---- Now update all the other stuff
BEGIN
	UPDATE v set
		[AAP#] = p.aapaccountno,
		Affiliate = p.Affiliate,
		[Account DBA Name] = p.[accountname],
		City = p.City, 
		ST = p.State 

	FROM tmp_RPDA_jmw v
	 left join pharmacymaster..v_PM_AllWithAffiliates p on v.pmid=p.pmid


-- Now build the table where we group by territory for totals
END

select * from tmp_RPDA_jmw where pmid > 99;
END








GO
