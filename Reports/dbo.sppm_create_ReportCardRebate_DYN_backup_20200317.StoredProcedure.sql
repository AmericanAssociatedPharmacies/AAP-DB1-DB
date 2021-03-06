USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_ReportCardRebate_DYN_backup_20200317]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <07/08/2011>
-- Description:	Create table for Report Card for Wayne
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_ReportCardRebate_DYN_backup_20200317]

		@in_month varchar(2)
		, @in_year varchar(4) 


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

	DECLARE @prev_year varchar(4);
	SET @prev_year = @in_year - 1;

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

-- The variables that end in TblCol are the columns that are created when we are create our temp tables - they need to be defined as 
-- as certain type - in this case they are floats.

-- The variables that end just in Col (not TblCol) are used when we do a select into to create our tmp tables in the pivot  - they have a
-- MAX wrapped around them because they are grouped by PMID - so instead of putting in group by for each column name I use MAX

-- The variables that end in Sel are used when we are pivoting the data for the select in portion 

-- The variables that end in Total are used for totaling the column names - it builds the column names plus a plus sign



-- Preferred Partners Rebate - these are yearly now but I never changed the variable name - only the logic

    DECLARE @SQLPPQtrCol varchar(max);
    DECLARE @SQLPPQtrTblCol varchar(max);
	DECLARE @SQLPPQtrColVolSel varchar(max);
	DECLARE @SQLPPQtrColRebSel varchar(max);

	DECLARE @SQLPPQtrRebTotal varchar(max);
-- API Quarterly rebates no longer used
    DECLARE @SQLAPIQtrCol varchar(max);
    DECLARE @SQLAPIQtrTblCol varchar(max);
    DECLARE @SQLAPIQtrColWhsSel varchar(max);
    DECLARE @SQLAPIQtrColGenSel varchar(max);
    DECLARE @SQLAPIQtrColBCDSel varchar(max);
    DECLARE @SQLAPIQtrColAPDSel varchar(max);
    DECLARE @SQLAPIQtrWhsRebTotal varchar(max);
    
    DECLARE @SQLAPIQtrBCDTotal varchar(max);
	DECLARE @SQLAPIQtrAPDTotal varchar(max);

-- High Volume Rebates

    DECLARE @SQLHVCol varchar(max);
    DECLARE @SQLHVTblCol varchar(max);
    DECLARE @SQLHVColIncSel varchar(max);
    DECLARE @SQLHVColCogSel varchar(max);
    DECLARE @SQLHVIncTotal varchar(max);
    DECLARE @SQLAPIMoWhsRebTotal varchar(max);

-- API Monthly Rebates

    DECLARE @SQLAPImoCol varchar(max);
    DECLARE @SQLAPImoTblCol varchar(max);
    --DECLARE @SQLAPImoColAGSSel varchar(max);
	DECLARE @SQLAPImoColAGSSelTier1 varchar(max); -- Added RSE 10/25/2019
	DECLARE @SQLAPImoColAGSSelTier2 varchar(max); -- Added RSE 10/25/2019
	DECLARE @SQLAPImoColAICSel varchar(max);
    DECLARE @SQLAPImoColNRSSel varchar(max);
	DECLARE @SQLAPImoColARPSel varchar(max);
    DECLARE @SQLAPImoColBCDSel varchar(max);
    DECLARE @SQLAPImoColAPDSel varchar(max);
    DECLARE @SQLAPIMoNRSTotal varchar(max);
	DECLARE @SQLAPIMoNRSTotal2014 varchar(max); -- added for 2014 only (not adding in all months in 2014)
    DECLARE @SQLAPImoGenSalesTotalTier1 varchar(max); -- Added RSE 10/25/2019
	DECLARE @SQLAPImoGenSalesTotalTier2 varchar(max); -- Added RSE 10/25/2019
	DECLARE @SQLAPImoInvCreditTotal varchar(max);
    DECLARE @SQLAPIMoBCDTotal varchar(max);
	DECLARE @SQLAPIMoBCDTotal2014 varchar(max);
	DECLARE @SQLAPIMoAPDTotal varchar(max);
	DECLARE @SQLAPIMoAPDTotal2014 varchar(max);

-- Conference Rebates
    DECLARE @SQLConfCol varchar(max);
    DECLARE @SQLConfTblCol varchar(max);
    DECLARE @SQLConfColVolSel varchar(max);
    DECLARE @SQLConfColRebSel varchar(max);
    DECLARE @SQLConfVolTotal varchar(max);
    DECLARE @SQLConfRebTotal varchar(max);

--NEW TRUE 10

	--DECLARE @SQLTrue10Col varchar(max);
 --   DECLARE @SQLTrue10TblCol varchar(max);
 --   DECLARE @SQLTrue10ColVolSel varchar(max);
 --   DECLARE @SQLTrue10ColRebSel varchar(max);
 --   DECLARE @SQLTrue10VolTotal varchar(max);
 --   DECLARE @SQLTrue10RebTotal varchar(max);

--NEW Arete

	DECLARE @SQLAreteCol varchar(max);
    DECLARE @SQLAreteTblCol varchar(max);
    DECLARE @SQLAreteColRebSel varchar(max);
    DECLARE @SQLAreteRebTotal varchar(max);

-- MSI and Leader Quarterly rebates - column name for these are Cardinal Rebates
    DECLARE @SQLLeaderMSIQtrCol varchar(max);
    DECLARE @SQLLeaderMSIQtrTblCol varchar(max);
    DECLARE @SQLLeaderMSIQtrColSel varchar(max);
    DECLARE @SQLLeaderMSIQtrTotal varchar(max);

--NEW API Arete

	DECLARE @SQLAPIAreteCol varchar(max);
    DECLARE @SQLAPIAreteTblCol varchar(max);
    DECLARE @SQLAPIAreteColRebSel varchar(max);
    DECLARE @SQLAPIAreteRebTotal varchar(max);
 

--    DECLARE @SQLMSIQtrCol varchar(max);
--    DECLARE @SQLMSIQtrTblCol varchar(max);
--    DECLARE @SQLMSIQtrColSel varchar(max);
--    DECLARE @SQLMSIQtrTotal varchar(max);

-- Cardinal AAP Rebates
	DECLARE @SQLAAPRebCol varchar(max);
	DECLARE @SQLAAPRebTblCol varchar(max);
	DECLARE @SQLAAPRebColSSSel varchar(max);
	DECLARE @SQLAAPRebColGenSel varchar(max);
    DECLARE @SQLAAPRebColCPPSel varchar(max);
	DECLARE @SQLAAPRebColCOGSel varchar(max); --added by LA, COG Rebate
	DECLARE @SQLAAPRebColAvgSel varchar(max);
	--DECLARE @SQLAAPRebColHRTASel varchar(max); Removed RSE 10/25/2019
	DECLARE @SQLAAPRebGenTotal varchar(max);
	DECLARE @SQLAAPRebCPPTotal varchar(max);
	DECLARE @SQLAAPRebCOGTotal varchar(max);	--added by LA, COG Rebate
	DECLARE @SQLAAPRebCOGEligibleSales VARCHAR(MAX); -- Added by RSE "Cost of Goods Eligibile Sales"

	

	DECLARE @SQLToZero varchar(max);
    DECLARE @SQLUpdateTotal varchar(max);
    DECLARE @SQLUpdateTable varchar(max);
	DECLARE @SQLAllCol varchar(max);

	DECLARE @SQLContractPerfRebate varchar(500);

 
    DECLARE @startDate varchar(20);
    DECLARE @startConfDate varchar(20);
	DECLARE @nextYearDate varchar(20);
	DECLARE @moBuildDate varchar(20);

	DECLARE @next_year  varchar(4);
	SET @next_year = @in_year + 1;
  
-- Preferred Partners Rebate - these are yearly now but I never changed the variable name - only the logic
    SET @SQLPPQtrCol = '';
    SET @SQLPPQtrTblCol = '';
	SET @SQLPPQtrColVolSel  = '';
	SET @SQLPPQtrColRebSel   = '';

	SEt @SQLPPQtrRebTotal = '';

-- API Quarterly Rebates - no longer used
    SET @SQLAPIQtrCol = '';
    SET @SQLAPIQtrTblCol = '';
    SET @SQLAPIQtrColWhsSel  = '';
    SET @SQLAPIQtrColGenSel  = '';
	SET @SQLAPIQtrWhsRebTotal = '';
    SET @SQLAPIQtrColBCDSel = '';
    SET @SQLAPIQtrColAPDSel = '';
    SET @SQLAPIQtrBCDTotal = '';
	SET @SQLAPIQtrAPDTotal = '';

--High Volume Rebates

    SET @SQLHVCol = '';
    SET @SQLHVTblCol = '';
    SET @SQLHVColIncSel  = '';
    SET @SQLHVColCogSel  = '';
	SET @SQLHVIncTotal = '';

-- API Monthly Rebates
    SET @SQLAPImoCol = '';
    SET @SQLAPImoTblCol = '';
    --SET @SQLAPImoColAGSSel = '';
	SET @SQLAPImoColAGSSelTier1 = '';
	SET @SQLAPImoColAGSSelTier2 = '';
	SET @SQLAPImoColAICSel = '';
    SET @SQLAPImoColNRSSel = '';
	SET @SQLAPImoColARPSel = '';
    SET @SQLAPImoColBCDSel  = '';
    SET @SQLAPImoColAPDSel  = '';
    SET @SQLAPIMoNRSTotal = '';
	SET @SQLAPIMoNRSTotal2014 = '';
    SET @SQLAPImoGenSalesTotalTier1 = ''; -- Changed RSE 10/25/2019
	SET @SQLAPImoGenSalesTotalTier2 = ''; -- Added RSE 10/25/2019
	SET @SQLAPImoInvCreditTotal = '';
    SET @SQLAPIMoBCDTotal = '';
	SET @SQLAPIMoBCDTotal2014 = '';
	SET @SQLAPIMoAPDTotal =  '';
	SET @SQLAPIMoAPDTotal2014 = '';

--Conference Rebates
    SET @SQLConfCol = '';
    SET @SQLConfTblCol = '';
    SET @SQLConfColVolSel  = '';
    SET @SQLConfColRebSel  = '';
    SET @SQLConfVolTotal = '';
    SET @SQLConfRebTotal = '';

--NEW TRUE 10

	--SET @SQLTrue10Col = '';
 --   SET @SQLTrue10TblCol = '';
 --   SET @SQLTrue10ColVolSel = '';
 --   SET @SQLTrue10ColRebSel = '';
 --   SET @SQLTrue10VolTotal = '';
 --   SET @SQLTrue10RebTotal = '';
-- New Arete
	SET @SQLAreteCol  = '';
    SET @SQLAreteTblCol = '';
     SET @SQLAreteColRebSel = '';
     SET @SQLAreteRebTotal = '';

-- New API Arete
	SET @SQLAPIAreteCol  = '';
    SET @SQLAPIAreteTblCol = '';
     SET @SQLAPIAreteColRebSel = '';
     SET @SQLAPIAreteRebTotal = '';

-- MSI and Leader Quarterly rebates - column name for these are Cardinal Rebates
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
	--SET @SQLAAPRebColHRTASel  = '';  Removed RSE 10/25/2019
    SET @SQLAAPRebGenTotal = '';

    SET @SQLAAPRebColCPPSel  = '';
    SET @SQLAAPRebCPPTotal = '';

    SET @SQLAAPRebColCOGSel  = '';	--added by LA, COG Rebate
    SET @SQLAAPRebCOGTotal = '';	--added by LA, COG Rebate
	SET @SQLAAPRebCOGEligibleSales = ''; --added by RSE COG Eligible Sales
 
	SET @dateQtr1 = '01/01/' + cast(year(@in_year) as varchar(4)); -- FYTD so start at 01/01 of whatever year
	SET @dateQtr2 = '03/01/' + cast(year(@in_year) as varchar(4)); -- FYTD so start at 01/01 of whatever year
	SET @dateQtr3 = '06/01/' + cast(year(@in_year) as varchar(4)); -- FYTD so start at 01/01 of whatever year
	SET @dateQtr4 = '09/01/' + cast(year(@in_year) as varchar(4)); -- FYTD so start at 01/01 of whatever year


	SET @startMoCount = 0;
	SET @startQtrCount = 1;
 
  
    SET @startDate = '01/01/' + @in_year; -- FYTD so start at 01/01 of whatever year
	SET @nextYearDate = '01/01/' + @next_year; -- FYTD so start at 01/01 of whatever year

 
	IF(@in_year = '2013')  -- this was only done in 2013
		BEGIN
		   SET @SQLContractPerfRebate = 'cast (0 as float) as [Contract Performance Rebate ' +@in_year +'],+';
print @SQLContractPerfRebate;
		END
	ELSE
		BEGIN
		    SET @SQLContractPerfRebate = '';
		END
  
    -- Build the Preferred Partner Quarter Columns
-- CHANGING THIS TO YEAR FOR PREFFERED PARTNER CHANGES - Only goes through once as these are done yearly now
 
--	WHILE @startQtrCount < 5
   WHILE @startQtrCount < 2
	BEGIN
		SET @SQLPPQtrCol = @SQLPPQtrCol +  ' MAX([Preferred Partners Volume ' + @in_year   +'])  as [Preferred Partners Volume ' + @in_year  +'], ';
 		SET @SQLPPQtrCol = @SQLPPQtrCol +  ' MAX([Preferred Partners Rebate ' + @in_year  +'])  as [Preferred Partners Rebate ' + @in_year   +'], ';

-- Table Columns to build final table
		SET @SQLPPQtrTblCol = @SQLPPQtrTblCol +  ' cast (0 as float)   as [Preferred Partners Volume ' + @in_year +  '], ';
 		SET @SQLPPQtrTblCol = @SQLPPQtrTblCol +  ' cast (0 as float)   as [Preferred Partners Rebate ' + @in_year   +'], ';

-- Columns for Select In 

		SET @SQLPPQtrColVolSel = @SQLPPQtrColVolSel +  '[Preferred Partners Volume ' + @in_year +  '], ';
 		SET @SQLPPQtrColRebSel = @SQLPPQtrColRebSel +  '[Preferred Partners Rebate ' + @in_year +  '], ';

--Totals
		SET @SQLPPQtrRebTotal = @SQLPPQtrRebTotal + '[Preferred Partners Rebate ' + @in_year  +'] +  ';

   
    	SET @startQtrCount = @startQtrCount + 1;
	END
   -- Now take off trailing comma (not for final table)
       SET @SQLPPQtrCol = substring(@SQLPPQtrCol,0,len(@SQLPPQtrCol) );
       SET @SQLPPQtrColVolSel = substring(@SQLPPQtrColVolSel,0,len(@SQLPPQtrColVolSel) );
       SET @SQLPPQtrColRebSel = substring(@SQLPPQtrColRebSel,0,len(@SQLPPQtrColRebSel) );
       SET @SQLPPQtrRebTotal = substring(@SQLPPQtrRebTotal,0,len(@SQLPPQtrRebTotal) );
    
   -- Build the API Quarter Columns
    SET @startQtrCount = 1;

	WHILE @startQtrCount < 5
	BEGIN
		SET @SQLAPIQtrCol = @SQLAPIQtrCol +  ' MAX([Q'  +cast(@startQtrCount as varchar(1)) + ' API Whse Rebate])  as [Q'  +cast(@startQtrCount as varchar(1)) + ' API Whse Rebate], ';
		SET @SQLAPIQtrCol = @SQLAPIQtrCol +  ' MAX([Q'  +cast(@startQtrCount as varchar(1)) + ' API Generic Rebate%])  as [Q'  + cast(@startQtrCount as varchar(1))+ ' API Generic Rebate%], ';
        SET @SQLAPIQtrCol = @SQLAPIQtrCol +  ' MAX([Q'  +cast(@startQtrCount as varchar(1)) + ' API Brand Credits Disbursed])  as [Q'  + cast(@startQtrCount as varchar(1))+ ' API Brand Credits Disbursed], ';
        SET @SQLAPIQtrCol = @SQLAPIQtrCol +  ' MAX([Q'  +cast(@startQtrCount as varchar(1)) + ' API Accelerated Pay Discount])  as [Q'  + cast(@startQtrCount as varchar(1))+ ' API Accelerated Pay Discount], ';
-- Table Columns to build final table
		SET @SQLAPIQtrTblCol = @SQLAPIQtrTblCol +  ' cast (0 as float)   as [Q'  + cast(@startQtrCount as varchar(1)) +' API Whse Rebate], ';
		SET @SQLAPIQtrTblCol = @SQLAPIQtrTblCol +  ' cast (0 as float)   as [Q'  +cast(@startQtrCount as varchar(1)) +' API Generic Rebate%], ';
        SET @SQLAPIQtrTblCol = @SQLAPIQtrTblCol +  ' cast (0 as float)   as [Q'  + cast(@startQtrCount as varchar(1)) +' API Brand Credits Disbursed], ';
		SET @SQLAPIQtrTblCol = @SQLAPIQtrTblCol +  ' cast (0 as float)   as [Q'  +cast(@startQtrCount as varchar(1)) +' API Accelerated Pay Discount], ';

-- Columns for Select In 

		SET @SQLAPIQtrColWhsSel = @SQLAPIQtrColWhsSel +  '[Q'  +cast(@startQtrCount as varchar(1)) + ' API Whse Rebate], ';
		SET @SQLAPIQtrColGenSel = @SQLAPIQtrColGenSel +  '[Q'  + cast(@startQtrCount as varchar(1))+ ' API Generic Rebate%], ';
        SET @SQLAPIQtrColBCDSel = @SQLAPIQtrColBCDSel +  '[Q'  +cast(@startQtrCount as varchar(1)) + ' API Brand Credits Disbursed], ';
		SET @SQLAPIQtrColAPDSel = @SQLAPIQtrColAPDSel +  '[Q'  + cast(@startQtrCount as varchar(1))+ ' API Accelerated Pay Discount], ';
-- Totals
		SET @SQLAPIQtrWhsRebTotal = @SQLAPIQtrWhsRebTotal + '[Q'  +cast(@startQtrCount as varchar(1)) + ' API Whse Rebate] + ';
        SET @SQLAPIQtrBCDTotal = @SQLAPIQtrBCDTotal + '[Q'  +cast(@startQtrCount as varchar(1)) + ' API Brand Credits Disbursed] + ';
        SET @SQLAPIQtrAPDTotal = @SQLAPIQtrAPDTotal + '[Q'  +cast(@startQtrCount as varchar(1)) + ' API Accelerated Pay Discount] + ';
 
		SET @startQtrCount  = @startQtrCount + 1;
    END
   -- Now take of trailing comma (not for the table columns though)
       SET @SQLAPIQtrCol = substring(@SQLAPIQtrCol,0,len(@SQLAPIQtrCol) );
       SET @SQLAPIQtrColWhsSel = substring(@SQLAPIQtrColWhsSel,0,len(@SQLAPIQtrColWhsSel) );
       SET @SQLAPIQtrColGenSel = substring(@SQLAPIQtrColGenSel,0,len(@SQLAPIQtrColGenSel) );
       SET @SQLAPIQtrColBCDSel = substring(@SQLAPIQtrColBCDSel,0,len(@SQLAPIQtrColBCDSel) );
       SET @SQLAPIQtrColAPDSel = substring(@SQLAPIQtrColAPDSel,0,len(@SQLAPIQtrColAPDSel) );
       SET @SQLAPIQtrWhsRebTotal = substring(@SQLAPIQtrWhsRebTotal,0,len(@SQLAPIQtrWhsRebTotal) );
	   SET @SQLAPIQtrBCDTotal = substring(@SQLAPIQtrBCDTotal,0,len(@SQLAPIQtrBCDTotal) );
       SET @SQLAPIQtrAPDTotal = substring(@SQLAPIQtrAPDTotal,0,len(@SQLAPIQtrAPDTotal) );
       
   SET @startMoCount =  0; 
     -- Build the API High Volume Columns
	WHILE @startMoCount < 12
	BEGIN
		SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));
		SET @SQLHVCol = @SQLHVCol + ' MAX([HV Incentive ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']) as [HV Incentive ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '],';
		SET @SQLHVCol = @SQLHVCol + ' MAX([HV COG Reduction ' + replace(str(datepart(month,@moBuildDate),2),' ','0') +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) +']) as [HV COG Reduction ' + replace(str(datepart(month,@moBuildDate),2),' ','0') +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) +'],';
 
  		SET @SQLHVTblCol = @SQLHVTblCol + '  cast (0 as float ) as [HV Incentive ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2)  + '],';
		SET @SQLHVTblCol = @SQLHVTblCol + '  cast (0 as float ) as [HV COG Reduction ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '],';

-- Columns for Select In 
		SET @SQLHVColIncSel = @SQLHVColIncSel + '[HV Incentive ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '],';
		SET @SQLHVColCogSel = @SQLHVColCogSel + '[HV COG Reduction ' + replace(str(datepart(month,@moBuildDate),2),' ','0') +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) +'],';

-- Totals
		SET @SQLHVIncTotal = @SQLHVIncTotal + '[HV Incentive ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] + ';

	    SET @startMoCount  = @startMoCount + 1;
    END
       -- Now take of trailing comma (not for the columns though)
       SET @SQLHVCol = substring(@SQLHVCol,0,len(@SQLHVCol) );
       SET @SQLHVColIncSel = substring(@SQLHVColIncSel,0,len(@SQLHVColIncSel) );
       SET @SQLHVColCogSel = substring(@SQLHVColCogSel,0,len(@SQLHVColCogSel) );
       SET @SQLHVIncTotal = substring(@SQLHVIncTotal,0,len(@SQLHVIncTotal) );




--   SET @startMoCount =  0; 
--   --Build the True 10 columns  
--	WHILE @startMoCount < 12
--	BEGIN
--		SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));
--		SET @SQLTrue10Col = @SQLTrue10Col + ' MAX([True 10 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']) as [True 10 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '],';
--		SET @SQLTrue10Col = @SQLTrue10Col + ' MAX([True 10 Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0') +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) +']) as [True 10 Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0') +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) +'],';
 
--  		SET @SQLTrue10TblCol = @SQLTrue10TblCol + '  cast (0 as float ) as [True 10 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2)  + '],';
--		SET @SQLTrue10TblCol = @SQLTrue10TblCol + '  cast (0 as float ) as [True 10 Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '],';

---- Columns for Select In 
--		SET @SQLTrue10ColVolSel = @SQLTrue10ColVolSel + '[True 10 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '],';
--		SET @SQLTrue10ColRebSel = @SQLTrue10ColRebSel + '[True 10 Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0') +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) +'],';

---- Totals
--   		SET @SQLTrue10VolTotal = @SQLTrue10VolTotal + '[True 10 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] + ';
--		SET @SQLTrue10RebTotal = @SQLTrue10RebTotal + '[True 10 Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] + ';

--	    SET @startMoCount  = @startMoCount + 1;
--    END
--       -- Now take of trailing comma (not for the columns though)
--       SET @SQLTrue10Col = substring(@SQLTrue10Col,0,len(@SQLTrue10Col) );
--       SET @SQLTrue10ColVolSel = substring(@SQLTrue10ColVolSel,0,len(@SQLTrue10ColVolSel) );
--       SET @SQLTrue10ColRebSel = substring(@SQLTrue10ColRebSel,0,len(@SQLTrue10ColRebSel) );
--       SET @SQLTrue10VolTotal = substring(@SQLTrue10VolTotal,0,len(@SQLTrue10VolTotal) );
--       SET @SQLTrue10RebTotal = substring(@SQLTrue10RebTotal,0,len(@SQLTrue10RebTotal) );

------------------------------------------------  Before changed display date  to add 2 months
--   SET @startMoCount =  0; 
--   --Build the Arete columns  
--	WHILE @startMoCount < 12
--	BEGIN
--		SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));
--		SET @SQLAreteCol = @SQLAreteCol + ' MAX([Arete-AAP Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0') +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) +']) as [Arete-AAP Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0') +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) +'],';
-- 
--		SET @SQLAreteTblCol = @SQLAreteTblCol + '  cast (0 as float ) as [Arete-AAP Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '],';
--
---- Columns for Select In 
--		SET @SQLAreteColRebSel = @SQLAreteColRebSel + '[Arete-AAP Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0') +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) +'],';
--
---- Totals
--		SET @SQLAreteRebTotal = @SQLAreteRebTotal + '[Arete-AAP Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] + ';
--
--	    SET @startMoCount  = @startMoCount + 1;
--    END
--       -- Now take of trailing comma (not for the columns though)
--       SET @SQLAreteCol = substring(@SQLAreteCol,0,len(@SQLAreteCol) );
--       SET @SQLAreteColRebSel = substring(@SQLAreteColRebSel,0,len(@SQLAreteColRebSel) );
--       SET @SQLAreteRebTotal = substring(@SQLAreteRebTotal,0,len(@SQLAreteRebTotal) );

-----------------------------------------------

--New AAP Arete
----------------------------------------------
   SET @startMoCount =  0; 
   --Build the Arete columns  
	WHILE @startMoCount < 12
	BEGIN
-- changed this to add two to @startMoCount to add 2 months to the display 
		SET @moBuildDate =   (DATEADD(m,@startMoCount +2 ,@startDate));
		SET @SQLAreteCol = @SQLAreteCol + ' MAX([Arete-AAP Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0') +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) +']) as [Arete-AAP Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0') +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) +'],';
 
		SET @SQLAreteTblCol = @SQLAreteTblCol + '  cast (0 as float ) as [Arete-AAP Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '],';

-- Columns for Select In 
		SET @SQLAreteColRebSel = @SQLAreteColRebSel + '[Arete-AAP Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0') +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) +'],';

-- Totals
		SET @SQLAreteRebTotal = @SQLAreteRebTotal + '[Arete-AAP Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] + ';

	    SET @startMoCount  = @startMoCount + 1;
    END
       -- Now take of trailing comma (not for the columns though)
       SET @SQLAreteCol = substring(@SQLAreteCol,0,len(@SQLAreteCol) );
       SET @SQLAreteColRebSel = substring(@SQLAreteColRebSel,0,len(@SQLAreteColRebSel) );
       SET @SQLAreteRebTotal = substring(@SQLAreteRebTotal,0,len(@SQLAreteRebTotal) );
---------------------------------------------

------------------------------------------------------------------

--New API Arete
----------------------------------------------
   SET @startMoCount =  0; 
   --Build the Arete columns  
	WHILE @startMoCount < 12
	BEGIN
-- changed this to add two to @startMoCount to add 2 months to the display 
		SET @moBuildDate =   (DATEADD(m,@startMoCount +2 ,@startDate));
		SET @SQLAPIAreteCol = @SQLAPIAreteCol + ' MAX([Arete-API Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0') +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) +']) as [Arete-API Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0') +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) +'],';
 
		SET @SQLAPIAreteTblCol = @SQLAPIAreteTblCol + '  cast (0 as float ) as [Arete-API Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '],';

-- Columns for Select In 
		SET @SQLAPIAreteColRebSel = @SQLAPIAreteColRebSel + '[Arete-API Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0') +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) +'],';

-- Totals
		SET @SQLAPIAreteRebTotal = @SQLAPIAreteRebTotal + '[Arete-API Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] + ';

	    SET @startMoCount  = @startMoCount + 1;
    END
       -- Now take of trailing comma (not for the columns though)
       SET @SQLAPIAreteCol = substring(@SQLAPIAreteCol,0,len(@SQLAPIAreteCol) );
       SET @SQLAPIAreteColRebSel = substring(@SQLAPIAreteColRebSel,0,len(@SQLAPIAreteColRebSel) );
       SET @SQLAPIAreteRebTotal = substring(@SQLAPIAreteRebTotal,0,len(@SQLAPIAreteRebTotal) );
---------------------------------------------


---------------------------------------------------------------------

----
   SET @startMoCount =  0; 
     -- Build the API Monthly Rebate Columns
	WHILE @startMoCount < 12
	BEGIN
		SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));
		--SET @SQLAPIMoCol = @SQLAPIMoCol + ' MAX([API Generic Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']) as [API Generic Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '],';
		SET @SQLAPIMoCol = @SQLAPIMoCol + ' MAX([API Tier 1 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']) as [API Tier 1 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '],'; -- Changed RSE 10/25/2019
		SET @SQLAPIMoCol = @SQLAPIMoCol + ' MAX([API Tier 2 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']) as [API Tier 2 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '],'; -- Added RSE 10/25/2019
		--add inv credit 
		SET @SQLAPIMoCol = @SQLAPIMoCol + ' MAX([API Inv Credit ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']) as [API Inv Credit ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '],';
		SET @SQLAPIMoCol = @SQLAPIMoCol + ' MAX([API Net Rebate to Store ' + replace(str(datepart(month,@moBuildDate),2),' ','0') +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) +']) as [API Net Rebate to Store ' + replace(str(datepart(month,@moBuildDate),2),' ','0') +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) +'],';
    	SET @SQLAPIMoCol = @SQLAPIMoCol + ' MAX([API Avg Rebate Percentage ' + replace(str(datepart(month,@moBuildDate),2),' ','0') +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) +']) as [API Avg Rebate Percentage ' + replace(str(datepart(month,@moBuildDate),2),' ','0') +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) +'],';
    	SET @SQLAPIMoCol = @SQLAPIMoCol + ' MAX([API Brand Credits Disbursed ' + replace(str(datepart(month,@moBuildDate),2),' ','0') +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) +']) as [API Brand Credits Disbursed ' + replace(str(datepart(month,@moBuildDate),2),' ','0') +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) +'],';
    	SET @SQLAPIMoCol = @SQLAPIMoCol + ' MAX([API Accelerated Pay Discount ' + replace(str(datepart(month,@moBuildDate),2),' ','0') +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) +']) as [API Accelerated Pay Discount ' + replace(str(datepart(month,@moBuildDate),2),' ','0') +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) +'],';

  		--SET @SQLAPIMOTblCol = @SQLAPIMOTblCol + '  cast (0 as float ) as [API Generic Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2)  + '],';
		SET @SQLAPIMOTblCol = @SQLAPIMOTblCol + '  cast (0 as float ) as [API Tier 1 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2)  + '],'; -- Added RSE 10/25/2019
		SET @SQLAPIMOTblCol = @SQLAPIMOTblCol + '  cast (0 as float ) as [API Tier 2 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2)  + '],'; -- Added RSE 10/25/2019
		--add inv credit
		SET @SQLAPIMOTblCol = @SQLAPIMOTblCol + '  cast (0 as float ) as [API Inv Credit ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2)  + '],';
		SET @SQLAPIMOTblCol = @SQLAPIMOTblCol + '  cast (0 as float ) as [API Net Rebate to Store ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '],';
		SET @SQLAPIMOTblCol = @SQLAPIMOTblCol + '  cast (0 as float ) as [API Avg Rebate Percentage ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '],';
		SET @SQLAPIMOTblCol = @SQLAPIMOTblCol + '  cast (0 as float ) as [API Brand Credits Disbursed ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '],';
		SET @SQLAPIMOTblCol = @SQLAPIMOTblCol + '  cast (0 as float ) as [API Accelerated Pay Discount ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '],';

-- Columns for Select In 
		--SET @SQLAPIMoColAGSSel = @SQLAPIMoColAGSSel + '[API Generic Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '],';
		SET @SQLAPIMoColAGSSelTier1 = @SQLAPIMoColAGSSelTier1 + '[API Tier 1 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '],'; -- Added RSE 10/25/2019
		SET @SQLAPIMoColAGSSelTier2 = @SQLAPIMoColAGSSelTier2 + '[API Tier 2 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '],'; -- Added RSE 10/25/2019
		--add inv credit
		SET @SQLAPIMoColAICSel = @SQLAPIMoColAICSel + '[API Inv Credit ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '],';
		SET @SQLAPIMoColNRSSel = @SQLAPIMoColNRSSel + '[API Net Rebate to Store ' + replace(str(datepart(month,@moBuildDate),2),' ','0') +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) +'],';
		SET @SQLAPIMoColARPSel = @SQLAPIMoColARPSel + '[API Avg Rebate Percentage ' + replace(str(datepart(month,@moBuildDate),2),' ','0') +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) +'],';
		SET @SQLAPIMoColBCDSel = @SQLAPIMoColBCDSel + '[API Brand Credits Disbursed ' + replace(str(datepart(month,@moBuildDate),2),' ','0') +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) +'],';
		SET @SQLAPIMoColAPDSel = @SQLAPIMoColAPDSel + '[API Accelerated Pay Discount ' + replace(str(datepart(month,@moBuildDate),2),' ','0') +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) +'],';

		SET @SQLAPIMoBCDTotal = @SQLAPIMoBCDTotal + '[API Brand Credits Disbursed ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] + ';
		SET @SQLAPIMoAPDTotal = @SQLAPIMoAPDTotal + '[API Accelerated Pay Discount ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] + ';

---WANT TO CHANGE THIS TO ADD THIS ONE TO TOTALS AND REMOVE THE TOTAL2014 one
-- Totals  -- This is not getting added to Totals as the Quarterly for API rebates already is
		SET @SQLAPIMoNRSTotal = @SQLAPIMoNRSTotal + '[API Net Rebate to Store ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] + ';
-- Totals  -- This is  getting added to Totals in 2014 from April through December,  Jan through March will pull from Quarterly data 
	IF (@startMoCount Not in (0,1,2) and @in_year = 2014)
		BEGIN
			SET @SQLAPIMoNRSTotal2014 = @SQLAPIMoNRSTotal2014 + '[API Net Rebate to Store ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] + ';
		SET @SQLAPIMoBCDTotal2014 = @SQLAPIMoBCDTotal2014 + '[API Brand Credits Disbursed ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] + ';
		SET @SQLAPIMoAPDTotal2014 = @SQLAPIMoAPDTotal2014 + '[API Accelerated Pay Discount ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] + ';

		END 

		SET @SQLAPIMoGenSalesTotalTier1 = @SQLAPIMoGenSalesTotalTier1 + '[API Tier 1 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] + '; -- Changed RSE 10/25/2019
		SET @SQLAPIMoGenSalesTotalTier2 = @SQLAPIMoGenSalesTotalTier2 + '[API Tier 2 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] + '; -- Changed RSE 10/25/2019
		--add inv credit
		SET @SQLAPIMoInvCreditTotal = @SQLAPIMoInvCreditTotal + '[API Inv Credit ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + +  substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] + ';

	    SET @startMoCount  = @startMoCount + 1;
    END
       -- Now take of trailing comma (not for the columns though)
       SET @SQLAPIMoCol = substring(@SQLAPIMoCol,0,len(@SQLAPIMoCol) );
       SET @SQLAPIMoColAGSSelTier1 = substring(@SQLAPIMoColAGSSelTier1,0,len(@SQLAPIMoColAGSSelTier1) ); -- Changed RSE 10/25/2019
	   SET @SQLAPIMoColAGSSelTier2 = substring(@SQLAPIMoColAGSSelTier2,0,len(@SQLAPIMoColAGSSelTier2) ); -- Changed RSE 10/25/2019
	   SET @SQLAPIMoColAICSel = substring(@SQLAPIMoColAICSel,0,len(@SQLAPIMoColAICSel) );
       SET @SQLAPIMoColNRSSel = substring(@SQLAPIMoColNRSSel,0,len(@SQLAPIMoColNRSSel) );
	   SET @SQLAPIMoColARPSel = substring(@SQLAPIMoColARPSel,0,len(@SQLAPIMoColARPSel) );
	   SET @SQLAPIMoColBCDSel = substring(@SQLAPIMoColBCDSel,0,len(@SQLAPIMoColBCDSel) );
	   SET @SQLAPIMoColAPDSel = substring(@SQLAPIMoColAPDSel,0,len(@SQLAPIMoColAPDSel) );

       SET @SQLAPIMoNRSTotal = substring(@SQLAPIMoNRSTotal,0,len(@SQLAPIMoNRSTotal) );
	   SET @SQLAPIMoBCDTotal = substring(@SQLAPIMoBCDTotal,0,len(@SQLAPIMoBCDTotal) );
	   SET @SQLAPIMoAPDTotal = substring(@SQLAPIMoAPDTotal,0,len(@SQLAPIMoAPDTotal) );
	   SET @SQLAPIMoNRSTotal2014 = substring(@SQLAPIMoNRSTotal2014,0,len(@SQLAPIMoNRSTotal2014) );
	   SET @SQLAPIMoBCDTotal2014 = substring(@SQLAPIMoBCDTotal2014,0,len(@SQLAPIMoBCDTotal2014) );
       SET @SQLAPIMoAPDTotal2014 = substring(@SQLAPIMoAPDTotal2014,0,len(@SQLAPIMoAPDTotal2014) );
       SET @SQLAPIMoGenSalesTotalTier1 = substring(@SQLAPIMoGenSalesTotalTier1,0,len(@SQLAPIMoGenSalesTotalTier1) ); -- Changed RSE 10/25/2019
	   SET @SQLAPIMoGenSalesTotalTier2 = substring(@SQLAPIMoGenSalesTotalTier2,0,len(@SQLAPIMoGenSalesTotalTier2) ); -- Added RSE 10/25/2019
	   SET @SQLAPIMoInvCreditTotal = substring(@SQLAPIMoInvCreditTotal,0,len(@SQLAPIMoInvCreditTotal) );

 print @SQLAPIMoNRSTotal2014;

    --- Build the Conf rebate Columns
    SET @startMoCount =  3;  --  start in April instead of January and end in May - will have to change start date too
	WHILE @startMoCount < 5
	BEGIN
		SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));
		SET @SQLConfCol = @SQLConfCol + ' MAX([Conf Volume ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']) as [Conf Volume ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '],';
        SET @SQLConfCol = @SQLConfCol + ' MAX([Conf Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']) as [Conf Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')  + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2)+ '],';

  		SET @SQLConfTblCol = @SQLConfTblCol + '  cast (0 as float ) as [Conf Volume ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '],';
		SET @SQLConfTblCol = @SQLConfTblCol + '  cast (0 as float) as [Conf Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '],';
 
-- Columns for Select In 
		SET @SQLConfColVolSel = @SQLConfColVolSel + '[Conf Volume ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '],';
        SET @SQLConfColRebSel = @SQLConfColRebSel + '[Conf Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')  + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2)+ '],';

--Totals
		SET @SQLConfVolTotal = @SQLConfVolTotal + '[Conf Volume ' + replace(str(datepart(month,@moBuildDate),2),' ','0') + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] + ';
		SET @SQLConfRebTotal = @SQLConfRebTotal + '[Conf Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')  + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2)+ '] + ';
		SET @startMoCount = @startMoCount + 1;
	END
       -- Now take of trailing comma (not for the columns though)
        SET @SQLConfCol = substring(@SQLConfCol,0,len(@SQLConfCol) );
        SET @SQLConfColVolSel = substring(@SQLConfColVolSel,0,len(@SQLConfColVolSel) );
        SET @SQLConfColRebSel = substring(@SQLConfColRebSel,0,len(@SQLConfColRebSel) );
        SET @SQLConfVolTotal = substring(@SQLConfVolTotal,0,len(@SQLConfVolTotal) );
        SET @SQLConfRebTotal = substring(@SQLConfRebTotal,0,len(@SQLConfRebTotal) );

-- The MSI and Leader Rebates were merged together to form the Cardinal Rebates - these are quarterly rebates
     -- Build the Leader and MSI Rebate columns - now called Cardinal Rebates
	SET @startQtrCount = 1;
   	WHILE @startQtrCount < 5
	BEGIN
		SET @SQLLeaderMSIQtrCol = @SQLLeaderMSIQtrCol +  ' MAX([Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'])  as [Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'], ';
  		SET @SQLLeaderMSIQtrTblCol = @SQLLeaderMSIQtrTblCol +  '  cast (0 as float ) as [Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'], ';
-- Columns for Select In 
		SET @SQLLeaderMSIQtrColSel = @SQLLeaderMSIQtrColSel +  '[Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'], ';
-- Totals
		SET @SQLLeaderMSIQtrTotal = @SQLLeaderMSIQtrTotal + '[Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] + ';

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
		SET @SQLAAPRebCol = @SQLAAPRebCol + ' MAX([' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Source Sales]) as ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Source Sales],';
		SET @SQLAAPRebCol = @SQLAAPRebCol + ' MAX([' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' AAP Gen Rebate]) as  [' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' AAP Gen Rebate],';
		SET @SQLAAPRebCol = @SQLAAPRebCol + ' MAX([' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' COG Eligible Sales]) as  [' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' COG Eligible Sales],'; 
		SET @SQLAAPRebCol = @SQLAAPRebCol + ' MAX([' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Price Protection Rebate]) as ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Price Protection Rebate],';
		SET @SQLAAPRebCol = @SQLAAPRebCol + ' MAX([' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' COG Rebate]) as ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' COG Rebate],';

 		SET @SQLAAPRebCol = @SQLAAPRebCol + ' MAX([' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Avg%] ) as  [' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Avg%],';
		--SET @SQLAAPRebCol = @SQLAAPRebCol + ' MAX([' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' HRTA%] ) as  [' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' HRTA%],'; --Removed RSE 10/25/2019


		SET @SQLAAPRebTblCol = @SQLAAPRebTblCol + ' cast (0 as float ) as [' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Source Sales],';
		SET @SQLAAPRebTblCol = @SQLAAPRebTblCol + ' cast (0 as float ) as [' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' AAP Gen Rebate],';
		SET @SQLAAPRebTblCol = @SQLAAPRebTblCol + ' cast (0 as float ) as [' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' COG Eligible Sales],'; --Added RSE, COG Eligibile Sales
		SET @SQLAAPRebTblCol = @SQLAAPRebTblCol + ' cast (0 as float ) as [' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Price Protection Rebate],';
		SET @SQLAAPRebTblCol = @SQLAAPRebTblCol + ' cast (0 as float ) as [' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' COG Rebate],';

 		SET @SQLAAPRebTblCol = @SQLAAPRebTblCol + ' cast (0 as float ) as [' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Avg%],';
		SET @SQLAAPRebTblCol = @SQLAAPRebTblCol + ' cast (0 as float ) as [' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' HRTA%],'; -- Removed RSE 10/25/2019
   		SET @SQLAAPRebTblCol = @SQLAAPRebTblCol + ' cast ('''' as varchar(50) ) as [' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' PaymentMethod],';
-- Columns for Select

		SET @SQLAAPRebColSSSel = @SQLAAPRebColSSSel + '['+ replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Source Sales],';
		SET @SQLAAPRebColGenSel = @SQLAAPRebColGenSel + '['+  replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' AAP Gen Rebate],';
		SET @SQLAAPRebCOGEligibleSales = @SQLAAPRebCOGEligibleSales + '['+  replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' COG Eligible Sales],'; --Added RSE, COG Eligibile Sales
		SET @SQLAAPRebColCPPSel = @SQLAAPRebColCPPSel + '['+  replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Price Protection Rebate],';
		SET @SQLAAPRebColCOGSel = @SQLAAPRebColCOGSel + '['+  replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' COG Rebate],';

 		SET @SQLAAPRebColAvgSel = @SQLAAPRebColAvgSel  +  '['+ replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Avg%],';
		--SET @SQLAAPRebColHRTASel = @SQLAAPRebColHRTASel + '['+  replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' HRTA%],'; Removed RSE 10/25/2019

--Totals
		SET @SQLAAPRebGenTotal = @SQLAAPRebGenTotal + '['+  replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' AAP Gen Rebate] + ';
		SET @SQLAAPRebCPPTotal = @SQLAAPRebCPPTotal + '['+  replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Price Protection Rebate] + ';
		SET @SQLAAPRebCOGTotal = @SQLAAPRebCOGTotal + '['+  replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' COG Rebate] + ';

		SET @startMoCount = @startMoCount + 1;
	END
       -- Now take of trailing comma (not for the table columns though)
     SET @SQLAAPRebCol = substring(@SQLAAPRebCol,0,len(@SQLAAPRebCol) );
     SET @SQLAAPRebColSSSel = substring(@SQLAAPRebColSSSel,0,len(@SQLAAPRebColSSSel) );
     SET @SQLAAPRebColGenSel = substring(@SQLAAPRebColGenSel,0,len(@SQLAAPRebColGenSel) );

	 SET @SQLAAPRebCOGEligibleSales = substring(@SQLAAPRebCOGEligibleSales,0,len(@SQLAAPRebCOGEligibleSales) ); --Added RSE, COG Eligibile Sales

     SET @SQLAAPRebColCPPSel = substring(@SQLAAPRebColCPPSel,0,len(@SQLAAPRebColCPPSel) );
     SET @SQLAAPRebColCOGSel = substring(@SQLAAPRebColCOGSel,0,len(@SQLAAPRebColCOGSel) );

     SET @SQLAAPRebColAvgSel = substring(@SQLAAPRebColAvgSel,0,len(@SQLAAPRebColAvgSel) );
     --SET @SQLAAPRebColHRTASel = substring(@SQLAAPRebColHRTASel,0,len(@SQLAAPRebColHRTASel) ); Removed RSE 10/25/2019
     SET @SQLAAPRebGenTotal = substring(@SQLAAPRebGenTotal,0,len(@SQLAAPRebGenTotal) );
     SET @SQLAAPRebCPPTotal = substring(@SQLAAPRebCPPTotal,0,len(@SQLAAPRebCPPTotal) );
     SET @SQLAAPRebCOGTotal = substring(@SQLAAPRebCOGTotal,0,len(@SQLAAPRebCOGTotal) );

  
--- Here is where the fun begins
 ---- TO DO  create as dynamic

--------------------------

 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_RCRebate_jmw')
 BEGIN
  DROP TABLE tmp_RCRebate_jmw
 END

SET @SQL = '	SELECT *  into tmp_RCRebate_jmw from  (' + 
        ' SELECT '+
        ' cast('''' as varchar(20)) as TM ,' +
        ' a.PMID , '+ 
        ' cast('''' as varchar(25)) as [AAP#] ,' +
        ' cast('''' as varchar(25)) as [Parent#] ,' +
' cast('''' as varchar(25)) as [Group#] ,' +
        ' cast('''' as varchar(25)) as [API#] ,' +
        ' cast('''' as varchar(25)) as [AAP Eff] ,' +
        ' cast('''' as varchar(25)) as [AAP Quit] ,' +
        ' cast('''' as varchar(100)) as [Description] ,' +
        ' cast('''' as varchar(100)) as [Affiliate] ,' +
        ' cast('''' as varchar(100)) as [Account DBA Name] ,' +
        ' cast('''' as varchar(100)) as [Account Corporate Name] ,' +
        ' cast('''' as varchar(250)) as [Address] ,' +
        ' cast('''' as varchar(100)) as [City] ,' +
        ' cast('''' as varchar(100)) as [St] ,' +
        ' cast('''' as varchar(150)) as [Contact] ,' +
		--' cast('''' as varchar(150)) as [Email] ,' + Removed RSE 10/25/2019 Request #379
		--' cast('''' as varchar(150)) as [Financial Email] ,' + Removed RSE 10/25/2019 Request #379
        ' cast('''' as varchar(150)) as [MC Network] ,' +
		@SQLPPQtrTblCol +
		' cast (0 as float)   as [Total Preferred Partners Rebate ' +@in_year +'], ';
--Do not include next four lines if year >= 2014


IF (@in_year <= 2014)
		BEGIN

		SET @SQL = @SQL +  @SQLAPIQtrTblCol +
		' cast (0 as float) as [Total API Whse Rebate ' +@in_year +'], '+
        ' cast (0 as float) as [Total API Brand Credits Disbursed ' +@in_year +'],' +
        ' cast (0 as float) as [Total API Accelerated Pay Discount ' +@in_year +'],';
		END 
 
		SET @SQL = @SQL + @SQLAPIMoTblCol +
        ' cast (0 as float) as [Total Monthly API Tier 1 Sales ' +@in_year +'], '+  -- Changed RSE 10/25/2019
		' cast (0 as float) as [Total Monthly API Tier 2 Sales ' +@in_year +'], '+ -- Added RSE 10/25/2019
		' cast (0 as float) as [Total Monthly API Inv Credit ' +@in_year +'], '+
		' cast (0 as float) as [Total Monthly API Net Rebate to Store ' +@in_year +'], '+
        ' cast (0 as float) as [Total Monthly API Brand Credits Disbursed ' +@in_year +'], '+
        ' cast (0 as float) as [Total Monthly API Accelerated Pay Discount ' +@in_year +'], '+
		--+ @SQLTrue10TblCol  +
		--' cast (0 as float) as [Total True 10 Sales ' +@in_year +'],'+
		--' cast (0 as float) as  [Total True 10 Rebate ' +@in_year +'],'+

        + @SQLAPIAreteTblCol  +
		' cast (0 as float) as  [Total Arete-API Rebate ' +@in_year +'],'+
		+ @SQLAreteTblCol  +
		' cast (0 as float) as  [Total Arete-AAP Rebate ' +@in_year +'],'+

		 + @SQLHVTblCol +
		' cast (0 as float)  as [Total HV Incentive ' +@in_year +'], '+
		+ @SQLConfTblCol  +
		' cast (0 as float) as [Total Conf Volume ' +@in_year +'],'+
		' cast (0 as float) as  [Total Conf Rebate ' +@in_year +'],'+
		+ @SQLLeaderMSIQtrTblCol +
		' cast (0 as float) as [Total Cardinal Rebates ' +@in_year +'], '+
        --+ @SQLMSIQtrTblCol +
		--' cast (0 as float) as [Total MSI AAP ' +@in_year +'], '+
		+ @SQLAAPRebTblCol +
		' cast (0 as float) as [Total CH AAP Gen Rebate ' +@in_year +'], '+
		' cast (0 as float) as [Total Price Protection Rebate ' +@in_year +'], '+
		' cast (0 as float) as [Total COG Rebate ' +@in_year +'], '+

        -- This next one is one time only for April 2013
		+@SQLContractPerfRebate +
		' cast (0 as float) as [Planogram Rebate ' +@in_year +'],'+
		' cast (0 as float) as [API Generic Incentive ' +@in_year +'],'+
		' cast (0 as float) as [AAP Patronage Dividend ' +@in_year +'],'+
		' cast (0 as float)   as [Total YTD All Rebates ' +@in_year +']'+


		' FROM '+
		' (SELECT  DISTINCT cast(pmid as int) as pmid  FROM '+
		' 	(SELECT DISTINCT pmid from pharmacymaster..PM_rebates_PPartner where period in (''' + @prev_year +  ''')'+
		' 		union ';

IF (@in_year <= 2014)
		BEGIN
PRINT 'BEfore PMID';
		SET @SQL = @SQL + ' 	 SELECT DISTINCT pmid from pharmacymaster..PM_rebates_APIQuarterly where period in (''' + @in_year + @Q1 + ''','''+ @in_year + @Q2 + ''',''' + @in_year + @Q3 + ''',''' + @in_year + @Q4 + ''')' +
		' 		union ';
		END
		SET @SQL = @SQL + ' 	 SELECT DISTINCT pmid from pharmacymaster..PM_Rebates_CHAAP where date >= ''' + @startDate + ''' and date < ''' + @nextYearDate  + '''' +
		' 		union '+
        ' 	 SELECT DISTINCT pmid from reports..import_Rebates_CAHDirect where date >= ''' + @startDate + ''' and date < ''' + @nextYearDate  + '''' +
		' 		union '+
		' 	 SELECT DISTINCT pmid from pharmacymaster..pm_rebates_HighVolume where date >= ''' + @startDate + ''' and date < ''' + @nextYearDate + '''' +
		' 		union '+
		' 	 SELECT DISTINCT pmid from pharmacymaster..PM_rebates_APIMonthly where date >= ''' + @startDate + ''' and date < ''' + @nextYearDate + '''' +
		' 		union '+
		' 	 SELECT DISTINCT pmid from pharmacymaster..pm_rebates_Conference where date >= ''' + @startDate + ''' and date < ''' + @nextYearDate +  '''' +
        ' 		union '+
		' 	 SELECT DISTINCT pmid from pharmacymaster..PM_AnnualRebates where year  = ''' + @in_year  + '''' +
		' 	) p '+
		'  ) a ' +
        ')ch ';

PRINT 'After PMID';
PRINT @SQL;
EXEC(@SQL);

 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_RCRebate_PP_jmw')
 BEGIN
  DROP TABLE tmp_RCRebate_PP_jmw 
 END
 

--WHAT TO DO WITH THIS ??????
--	  FROM reports..tmp_PPartner2011Q1_rollup  where ( period in ('2011Q1'))
--			 group by PMID ,period


-- Create temp table for pivoted PP Rebates
SET @SQL =  ' SELECT * INTO tmp_RCRebate_PP_jmw from ( '+
	' SELECT   '+
	'  PMID, '+
	 @SQLPPQtrCol +
 
	' FROM ( '+
	'  SELECT PMID,period, '+

	'''Preferred Partners Volume '' + period as datePPV,'+
	' sum(isnull(VolumeAmt,0.00)  )as PPQtrVolume , '+
	'''Preferred Partners Rebate '' + period as datePPR, '+
	'sum(round(isnull([paid to store],0.00)+isnull([paid to affiliate],0.00),2) ) PPQtrRebate '+
    '  	  FROM  pharmacymaster..PM_rebates_PPartner  where  ( period in  (''' + @in_year + '''))' +
	'		 group by PMID ,period '+
	' ) as PPTable '+


	' PIVOT '+
	' ( '+
	'  SUM(PPQtrVolume)  '+
	'  FOR datePPV IN  ( ' + @SQLPPQtrColVolSel   + ') '+
	' ) as P1 '+
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
	 WHERE name = 'tmp_RCRebate_APIQtr_jmw')
 BEGIN
  DROP TABLE tmp_RCRebate_APIQtr_jmw
 END
 
------Do not execute next part if year >= 2014
-- Create temp table for pivoted API Quarterly
IF (@in_year <= 2014)
		BEGIN
SET @SQL = ' SELECT * INTO tmp_RCRebate_APIQtr_jmw from ( '+
	 ' SELECT   '+
	 ' PMID, '+

	  @SQLAPIQtrCol +
 
	 ' FROM ( '+
	 ' SELECT PMID,period, '+

	 '  substring(period,5,2) + '' API Whse Rebate''  as dateWReb, '+
	 '	sum((round(isnull([Rebate to Pay Acct/Admin] - [Less Group Admin],0),2) * [Pay Account]))as APIWhseReb , '+
	 '  substring(period,5,2)  + '' API Generic Rebate%'' as dateGReb, '+
	 '	avg([Avg Rebate Percentage]) as APIGenReb, '+
	 '  substring(period,5,2) + '' API Brand Credits Disbursed''  as dateBCD, '+
	 '	sum((round(isnull([Brand Credits Disbursed] ,0),2)))as APIBCD , '+
	 '  substring(period,5,2)  + '' API Accelerated Pay Discount'' as dateAPD, '+
	 '	sum((round(isnull([Accelerated Pay Discount] ,0),2))) as APIAPD '+
 

     ' 	  FROM  pharmacymaster..PM_rebates_APIQuarterly where  ( period in  (''' + @in_year + @Q1 + ''','''+ @in_year + @Q2 + ''',''' + @in_year + @Q3 + ''',''' + @in_year + @Q4 + '''))' +
	 '		 group by PMID ,period '+
	 ' ) as PPTable  '+


	 ' PIVOT  '+
	 '(  '+
	 ' SUM(APIWhseReb)   '+
	 ' FOR dateWReb IN  (' + @SQLAPIQtrColWhsSel  + ')  '+
	 ' ) as P1  '+
	 ' PIVOT '+
	 '( '+
	 ' SUM(APIGenReb) '+
	 ' FOR dateGReb IN  (' + @SQLAPIQtrColGenSel    + ') '+
	 ' ) as P2 '+
	 ' PIVOT  '+
	 '(  '+
	 ' SUM(APIBCD)   '+
	 ' FOR dateBCD IN  (' + @SQLAPIQtrColBCDSel  + ')  '+
	 ' ) as P3  '+
	 ' PIVOT '+
	 '( '+
	 ' SUM(APIAPD) '+
	 ' FOR dateAPD IN  (' + @SQLAPIQtrColAPDSel    + ') '+
	 ' ) as P4 '+

	' group by PMID '+

   ' )vol ';
PRINT @SQL;
EXEC(@SQL);
END
----------------------

 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_RCRebate_HV_jmw')
 BEGIN
  DROP TABLE tmp_RCRebate_HV_jmw
 END

-- Create temp table for pivoted High Volume
SET @SQL = ' SELECT * INTO tmp_RCRebate_HV_jmw from ( '+
	   ' SELECT   '+
	   ' PMID, '+
       @SQLHVCol +
 
	   ' FROM ( '+
	   ' SELECT PMID,date, '+

		'''HV Incentive '' +  replace(str(datepart(month,date),2),'' '',''0'')  +  substring(cast(datepart(year,date) as varchar(4)),3,2)    as dateHVI, '+
		' sum(round(isnull([High Volume Incentive],0.00),2))as HVI , '+
		'''HV COG Reduction '' + replace(str(datepart(month,date),2),'' '',''0'')  +  substring(cast(datepart(year,date) as varchar(4)),3,2)   as dateHVC, '+
		' sum( [COG Reduction]) as HVC '+
      	'  FROM  pharmacymaster..pm_rebates_HighVolume where   date >= ''' + @startDate + ''' and date < ''' + @nextYearDate + '''' + 
		'	 group by PMID ,date '+
	    ' ) as PPTable '+
	 ' PIVOT '+
	 '( '+
	  ' SUM(HVI) '+
	  ' FOR dateHVI IN  (' + @SQLHVColIncSel  + ') '+
	 ' ) as P1 '+
	 ' PIVOT '+
	 ' ( '+
	 ' SUM(HVC) ' +
	 ' FOR dateHVC IN  ( ' + @SQLHVColCogSel  + ' )  ' +
	 ' ) as P2  ' +
	 ' group by PMID  ' +

     ' )vol  ' ;

PRINT @SQL;
EXEC(@SQL);
----------------------

----True 10 New

-- IF EXISTS(SELECT name FROM sys.tables
--	 WHERE name = 'tmp_RCRebate_TT_jmw')
-- BEGIN
--  DROP TABLE tmp_RCRebate_TT_jmw
-- END

---- Create temp table for pivoted High Volume
--SET @SQL = ' SELECT * INTO tmp_RCRebate_TT_jmw from ( '+
--	   ' SELECT   '+
--	   ' PMID, '+
--       @SQLTrue10Col +
 
--	   ' FROM ( '+
--	   ' SELECT PMID,date, '+

--		'''True 10 Sales '' +  replace(str(datepart(month,date),2),'' '',''0'')  +  substring(cast(datepart(year,date) as varchar(4)),3,2)    as dateTTS, '+
--		' sum(round(isnull([True10Sales],0.00),2))as TTS , '+
--		'''True 10 Rebate '' + replace(str(datepart(month,date),2),'' '',''0'')  +  substring(cast(datepart(year,date) as varchar(4)),3,2)   as dateTTR, '+
--		' sum( [True10Rebate]) as TTR '+
--      	'  FROM  pharmacymaster..pm_rebates_APIMonthly where   date >= ''' + @startDate + ''' and date < ''' + @nextYearDate + '''' + 
--		'	 group by PMID ,date '+
--	    ' ) as PPTable '+
--	 ' PIVOT '+
--	 '( '+
--	  ' SUM(TTS) '+
--	  ' FOR dateTTS IN  (' + @SQLTrue10ColVolSel  + ') '+
--	 ' ) as P1 '+
--	 ' PIVOT '+
--	 ' ( '+
--	 ' SUM(TTR) ' +
--	 ' FOR dateTTR IN  ( ' + @SQLTrue10ColRebSel  + ' )  ' +
--	 ' ) as P2  ' +
--	 ' group by PMID  ' +

--     ' )vol  ' ;

--PRINT @SQL;
--EXEC(@SQL);
----------------------
----------------------------------------------------------------- // Before changed to add 2 months to display value
----Arete New
--
-- IF EXISTS(SELECT name FROM sys.tables
--	 WHERE name = 'tmp_RCRebate_Arete_jmw')
-- BEGIN
--  DROP TABLE tmp_RCRebate_Arete_jmw
-- END
--
---- Create temp table for pivoted Arete
--SET @SQL = ' SELECT * INTO tmp_RCRebate_Arete_jmw from ( '+
--	   ' SELECT   '+
--	   ' PMID, '+
--       @SQLAreteCol +
-- 
--	   ' FROM ( '+
--	   ' SELECT PMID,date, '+
--
--		'''Arete-AAP Rebate '' + replace(str(datepart(month,date),2),'' '',''0'')  +  substring(cast(datepart(year,date) as varchar(4)),3,2)   as dateAreteR, '+
--		' sum( [AretePerformanceRebate]) as AreteR '+
--      	'  FROM  pharmacymaster..pm_rebates_chaap where   date >= ''' + @startDate + ''' and date < ''' + @nextYearDate + '''' + 
--		'	 group by PMID ,date '+
--	    ' ) as PPTable '+
--	 ' PIVOT '+
--	 ' ( '+
--	 ' SUM(AreteR) ' +
--	 ' FOR dateAreteR IN  ( ' + @SQLAreteColRebSel  + ' )  ' +
--	 ' ) as P1  ' +
--	 ' group by PMID  ' +
--
--     ' )vol  ' ;
--
--PRINT 'Check Here ' + @SQL;
--EXEC(@SQL);
------------------------
------------------------------------------------------------------- Changed to add 2 months to display date

--Arete New

 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_RCRebate_Arete_jmw')
 BEGIN
  DROP TABLE tmp_RCRebate_Arete_jmw
 END

-- Create temp table for pivoted Arete
SET @SQL = ' SELECT * INTO tmp_RCRebate_Arete_jmw from ( '+
	   ' SELECT   '+
	   ' PMID, '+
       @SQLAreteCol +
 
	   ' FROM ( '+
	   ' SELECT PMID,date, '+

		'''Arete-AAP Rebate '' + replace(str(datepart(month,dateadd(month,2,date)),2),'' '',''0'')  +  substring(cast(datepart(year,dateadd(month,2,date)) as varchar(4)),3,2)   as dateAreteR, '+
		' sum( [AretePerformanceRebate]) as AreteR '+
      	'  FROM  pharmacymaster..pm_rebates_chaap where   date >= ''' + @startDate + ''' and date < ''' + @nextYearDate + '''' + 
		'	 group by PMID ,date '+
	    ' ) as PPTable '+
	 ' PIVOT '+
	 ' ( '+
	 ' SUM(AreteR) ' +
	 ' FOR dateAreteR IN  ( ' + @SQLAreteColRebSel  + ' )  ' +
	 ' ) as P1  ' +
	 ' group by PMID  ' +

     ' )vol  ' ;

PRINT 'Check Here ' + @SQL;
PRINT @SQL
EXEC(@SQL);
----------------------
-----------------------------------------------------------------
--API Arete New

 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_RCRebate_AreteAPI_jmw')
 BEGIN
  DROP TABLE tmp_RCRebate_AreteAPI_jmw
 END

-- Create temp table for pivoted Arete
SET @SQL = ' SELECT * INTO tmp_RCRebate_AreteAPI_jmw from ( '+
	   ' SELECT   '+
	   ' PMID, '+
       @SQLAPIAreteCol +
 
	   ' FROM ( '+
	   ' SELECT PMID,date, '+

		'''Arete-API Rebate '' + replace(str(datepart(month,dateadd(month,2,date)),2),'' '',''0'')  +  substring(cast(datepart(year,dateadd(month,2,date)) as varchar(4)),3,2)   as dateAreteRF, '+
		' sum( [AreteRebateFee]) as AreteRF '+
      	'  FROM  pharmacymaster..pm_rebates_apimonthly where   date >= ''' + @startDate + ''' and date < ''' + @nextYearDate + '''' + 
		'	 group by PMID ,date '+
	    ' ) as PPTable '+
	 ' PIVOT '+
	 ' ( '+
	 ' SUM(AreteRF) ' +
	 ' FOR dateAreteRF IN  ( ' + @SQLAPIAreteColRebSel  + ' )  ' +
	 ' ) as P1  ' +
	 ' group by PMID  ' +

     ' )vol  ' ;

PRINT 'Check Here ' + @SQL;
PRINT @SQL
EXEC(@SQL);
----------------------

-----------------------------------------------------------------

 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_RCRebate_MW_jmw')
 BEGIN
  DROP TABLE tmp_RCRebate_MW_jmw
 END
-- Create temp table for pivoted API Monthly Warehouse Rebates
SET @SQL = ' SELECT * INTO tmp_RCRebate_MW_jmw from ( '+
	   ' SELECT   '+
	   ' PMID, '+
       @SQLAPIMoCol +
 
	   ' FROM ( '+
	   ' SELECT PMID,date, '+

		'''API Tier 1 Sales '' +  replace(str(datepart(month,date),2),'' '',''0'')  +  substring(cast(datepart(year,date) as varchar(4)),3,2)    as dateAGST1, '+ --Changed RSE 10/25/2019
		' sum(round(isnull([APIGenericSalesTier1],0.00),2))as AGST1 , '+
				'''API Inv Credit '' +  replace(str(datepart(month,date),2),'' '',''0'')  +  substring(cast(datepart(year,date) as varchar(4)),3,2)    as dateAIC, '+
		' sum(round(isnull([APIInstantRebate],0.00),2))as AIC , '+
        '''API Net Rebate to Store '' +  replace(str(datepart(month,date),2),'' '',''0'')  +  substring(cast(datepart(year,date) as varchar(4)),3,2)    as dateNRS, '+
		' sum(round(isnull([Net Rebate to Store],0.00),2))as NRS , '+
		'''API Avg Rebate Percentage '' + replace(str(datepart(month,date),2),'' '',''0'')  +  substring(cast(datepart(year,date) as varchar(4)),3,2)   as dateARP, '+
		--' avg(PostAveRebatePerc) as ARP, '+  -- see Ticket # 572
		' avg(CalcAPIRebatePercentage) as ARP, '+ -- see Ticket # 572
		'''API Brand Credits Disbursed '' + replace(str(datepart(month,date),2),'' '',''0'')  +  substring(cast(datepart(year,date) as varchar(4)),3,2)   as dateBCD, '+
		' sum( [Brand Credits Disbursed]) as BCD, '+
		'''API Accelerated Pay Discount '' + replace(str(datepart(month,date),2),'' '',''0'')  +  substring(cast(datepart(year,date) as varchar(4)),3,2)   as dateAPD, '+
		' sum( [Accelerated Pay Discount]) as APD, '+
		'''API Tier 2 Sales '' +  replace(str(datepart(month,date),2),'' '',''0'')  +  substring(cast(datepart(year,date) as varchar(4)),3,2)    as dateAGST2, '+ --  Added RSE 10/25/2019
		' sum(round(isnull([APIGenericSalesTier2],0.00),2))as AGST2  '+
		'  FROM  Reports.dbo.vw_pm_rebates_APIMonthly_2 where   date >= ''' + @startDate + ''' and date < ''' + @nextYearDate + '''' + -- Added RSE 20181204
      	--'  FROM  pharmacymaster..pm_rebates_APIMonthly where   date >= ''' + @startDate + ''' and date < ''' + @nextYearDate + '''' + 
		'	 group by PMID ,date '+
	    ' ) as PPTable '+
	 ' PIVOT '+
	 '( '+
	  ' SUM(AGST1) '+
	  ' FOR dateAGST1 IN  (' + @SQLAPIMoColAGSSelTier1  + ') '+
	 ' ) as P1 '+
	 ' PIVOT '+
	 '( '+
	  ' SUM(AIC) '+
	  ' FOR dateAIC IN  (' + @SQLAPIMoColAICSel  + ') '+
	 ' ) as P6 '+
	 ' PIVOT '+
	 ' ( '+
	 ' SUM(NRS) ' +
	 ' FOR dateNRS IN  ( ' + @SQLAPIMoColNRSSel  + ' )  ' +
	 ' ) as P2  ' +
     ' PIVOT '+
	 ' ( '+
	 ' SUM(ARP) ' +
	 ' FOR dateARP IN  ( ' + @SQLAPIMoColARPSel  + ' )  ' +
	 ' ) as P3  ' +
	' PIVOT '+
		 ' ( '+
		 ' SUM(BCD) ' +
		 ' FOR dateBCD IN  ( ' + @SQLAPIMoColBCDSel  + ' )  ' +
		 ' ) as P4  ' +
	' PIVOT '+
		 ' ( '+
		 ' SUM(APD) ' +
		 ' FOR dateAPD IN  ( ' + @SQLAPIMoColAPDSel  + ' )  ' +
		 ' ) as P5  ' +
	' PIVOT '+
		 ' ( '+
		 ' SUM(AGST2) ' +
		 ' FOR dateAGST2 IN  ( ' + @SQLAPIMoColAGSSelTier2  + ' )  ' +
		 ' ) as P7  ' +
		 ' group by PMID  ' +

     ' )vol  ' ;

INSERT INTO PharmacyMaster.dbo.DynamicSQL(C1)
VALUES(@SQL)

PRINT @SQL;
EXEC(@SQL);
----------------------

 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_RCRebate_Conf_jmw')
 BEGIN
  DROP TABLE tmp_RCRebate_Conf_jmw
 END

-- Create temp table for pivoted Conference Rebates fields
SET @SQL = ' SELECT * INTO tmp_RCRebate_Conf_jmw from ( '+
	  ' SELECT   '+
	  ' PMID, '+

       @SQLConfCol +
 
	  ' FROM ( '+
	  ' SELECT PMID,date, '+

		'''Conf Volume '' +  replace(str(datepart(month,date),2),'' '',''0'')  +  substring(cast(datepart(year,date) as varchar(4)),3,2)    as dateCFV, '+
		' sum(round(isnull(Volume,0.00),2))as CFV , '+
		'''Conf Rebate '' + replace(str(datepart(month,date),2),'' '',''0'')  +  substring(cast(datepart(year,date) as varchar(4)),3,2)   as dateCFR, '+
		' sum( round(isnull(Rebate,0.00),2)) as CFR '+ 

      	'  FROM  pharmacymaster..PM_Rebates_Conference  where  date >= ''' + @startDate + ''' and date < ''' + @nextYearDate + '''' + 
		'	 group by PMID ,date '+
	  ' ) as PPTable '+
	' PIVOT '+
	' ( '+
	' SUM(CFV) '+
	'  FOR dateCFV IN  ( '+ @SQLConfColVolSel   + ' ) '+
	' ) as P1 '+
	' PIVOT '+
	' ( '+
	' SUM(CFR) '+
	'  FOR dateCFR IN  ( '+ @SQLConfColRebSel   + ' ) '+
	' ) as P2 '+
	' group by PMID '+
    ' )vol ';

PRINT @SQL;
EXEC(@SQL);
----------------------

 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_RCRebate_Leader_jmw')
 BEGIN
  DROP TABLE tmp_RCRebate_Leader_jmw
 END

-- Create temp table for Leader Rebates fields
SET @SQL =  ' SELECT * INTO tmp_RCRebate_Leader_jmw from ( '+
	      ' SELECT   '+
	      ' PMID, '  +
           @SQLLeaderMSIQtrCol +
	      ' FROM ( '+
	      ' SELECT PMID,date, '+

		   '''Cardinal Rebates '' +  cast(datepart(year,date) as varchar(4)) + '+
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
	 WHERE name = 'tmp_RCRebate_MSI_jmw')
 BEGIN
  DROP TABLE tmp_RCRebate_MSI_jmw
 END
-- Create temp table for MSI Rebates fields
SET @SQL =  ' SELECT * INTO tmp_RCRebate_MSI_jmw from ( '+
	      ' SELECT   '+
	      ' PMID, '  +
           @SQLLeaderMSIQtrCol +
	      ' FROM ( '+
	      ' SELECT PMID,date, '+

		   '''Cardinal Rebates '' +  cast(datepart(year,date) as varchar(4)) + '+
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

 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_RCRebate_AAP_jmw')
 BEGIN
  DROP TABLE tmp_RCRebate_AAP_jmw
 END

-- Create temp table for pivoted AAP Rebates
SET @SQL = ' SELECT * INTO tmp_RCRebate_AAP_jmw from ( '+
	      ' SELECT   '+
	      ' PMID, '+

		 @SQLAAPRebCol +
 
	     ' FROM ( '+
	     '  SELECT pm.PMID,pm.date, '+

		 '   replace(str(datepart(month,pm.date),2),'' '',''0'')  + ''/'' +  substring(cast(datepart(year,pm.date) as varchar(4)),3,2) + '' Source Sales''   as dateSS, '+
		 ' sum(round(isnull(pm.SourceGenericSales,0.00),2))as SS , '+

		 '  replace(str(datepart(month,pm.date),2),'' '',''0'')  + ''/'' +  substring(cast(datepart(year,pm.date) as varchar(4)),3,2)  + '' AAP Gen Rebate''  as dateGR, '+
		 ' sum( round(pm.GenericRebate,2)) as GR , '+
		 
		 -- Added RSE
		 '  replace(str(datepart(month,pm.date),2),'' '',''0'')  + ''/'' +  substring(cast(datepart(year,pm.date) as varchar(4)),3,2)  + '' COG Eligible Sales'' as dateCOGES, '+
		 ' sum( round(pm.COGEligibleSales,2)) as COGES , '+

		 '  replace(str(datepart(month,pm.date),2),'' '',''0'')  + ''/'' +  substring(cast(datepart(year,pm.date) as varchar(4)),3,2)  + '' Price Protection Rebate''  as datePPR, '+
		 ' sum( round(pm.PriceProtectionRebate,2)) as PPR , '+

			--added by LA
		 '  replace(str(datepart(month,pm.date),2),'' '',''0'')  + ''/'' +  substring(cast(datepart(year,pm.date) as varchar(4)),3,2)  + '' COG Rebate''  as dateCOGR, '+
		 ' sum( round(pm.COGRebate,2)) as COGR , '+
--
		 '  replace(str(datepart(month,pm.date),2),'' '',''0'')  + ''/'' +  substring(cast(datepart(year,pm.date) as varchar(4)),3,2) + '' Avg%''   as dateAvg, '+
		 ' sum(round(pm.EffRebatePerc,2))as AVGPerc  '+

		 --'  replace(str(datepart(month,pm.date),2),'' '',''0'')  + ''/'' +  substring(cast(datepart(year,pm.date) as varchar(4)),3,2)  + '' HRTA%''  as dateHRTA, '+
		 --' sum(  round(pm.HRTA,2)) as HRTA  '+ --Removed RSE 10/25/2019

      	 ' FROM   pharmacymaster..PM_Rebates_CHAAP as pm '+
		' where ( year(pm.date) in (' + @in_year + ')) ' +
		'	 group by pm.PMID ,pm.date '+
	' ) as PPTable '+
	' PIVOT '+
	' ( '+
	'  SUM(SS) '+
	'  FOR dateSS IN  (' + @SQLAAPRebColSSSel  + ') '+
	' ) as P1 '+
	' PIVOT '+
	' ( '+
	' SUM(GR) '+
	'  FOR dateGR IN  ( ' + @SQLAAPRebColGenSel  + ' ) '+ 
	' ) as P2 '+
	' PIVOT '+
	' ( '+
	' SUM(COGES) '+
	'  FOR dateCOGES IN  ( ' + @SQLAAPRebCOGEligibleSales  + ' ) '+ --@SQLAAPRebCOGEligibleSales Added RSE
	' ) as P11 '+
	
	' PIVOT '+
	' ( '+
	' SUM(PPR) '+
	'  FOR datePPR IN  ( ' + @SQLAAPRebColCPPSel  + ' ) '+
	' ) as P9 '+

	' PIVOT '+
	' ( '+
	' SUM(COGR) '+
	'  FOR dateCOGR IN  ( ' + @SQLAAPRebColCOGSel  + ' ) '+
	' ) as P10 '+

	' PIVOT '+
	' ( '+
	' SUM(AVGPerc) '+
	'  FOR dateAvg IN  (' + @SQLAAPRebColAvgSel  + ' ) '+
	' ) as P3 '+
	--' PIVOT '+
	--' ( '+
	--'  SUM(HRTA) '+
	--'  FOR dateHRTA IN  (' + @SQLAAPRebColHRTASel  + ' ) '+
	--' ) as P4 '+ Removed RSE 10/25/2019
	' group by PMID '+
   ' )vol ';

PRINT @SQL;
EXEC(@SQL);


-- Set where null to zero so we can do  totals
 

-- PP table - Preferred Partner
	SET @startQtrCount = 1
	WHILE @startQtrCount < 2
	BEGIN
		SET @SQLToZero = ' UPDATE tmp_RCRebate_PP_jmw SET [Preferred Partners Volume ' + @in_year  +'] = 0.0 where   [Preferred Partners Volume ' + @in_year +  '] is null ';
		PRINT @SQLToZero
			Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_RCRebate_PP_jmw SET [Preferred Partners Rebate ' + @in_year   +'] = 0.0 where   [Preferred Partners Rebate ' + @in_year +  '] is null ';
		PRINT @SQLToZero
			Exec (@SQLToZero);
        SET @startQtrCount = @startQtrCount + 1;
	END
-- API Qtr Table
IF (@in_year <= 2014)
BEGIN
	SET @startQtrCount = 1
	WHILE @startQtrCount < 5
	BEGIN
		SET @SQLToZero = ' UPDATE tmp_RCRebate_APIQtr_jmw SET [Q'  + cast(@startQtrCount as varchar(1)) +' API Whse Rebate] = 0.0 where   [Q'  + cast(@startQtrCount as varchar(1)) +' API Whse Rebate] is null ';
		PRINT @SQLToZero
			Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_RCRebate_APIQtr_jmw SET [Q'  + cast(@startQtrCount as varchar(1)) +' API Generic Rebate%] = 0.0 where   [Q'  + cast(@startQtrCount as varchar(1)) +' API Generic Rebate%] is null ';
		PRINT @SQLToZero
			Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_RCRebate_APIQtr_jmw SET [Q'  + cast(@startQtrCount as varchar(1)) +' API Brand Credits Disbursed] = 0.0 where   [Q'  + cast(@startQtrCount as varchar(1)) +' API Brand Credits Disbursed] is null ';
		PRINT @SQLToZero
			Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_RCRebate_APIQtr_jmw SET [Q'  + cast(@startQtrCount as varchar(1)) +' API Accelerated Pay Discount] = 0.0 where   [Q'  + cast(@startQtrCount as varchar(1)) +' API Accelerated Pay Discount] is null ';
		PRINT @SQLToZero
			Exec (@SQLToZero);
		SET @startQtrCount = @startQtrCount + 1;
	END
END
-- High Volume   Table
	SET @startMoCount = 0
	WHILE @startMoCount < 12
	BEGIN
		SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));
		SET @SQLToZero = ' UPDATE tmp_RCRebate_HV_jmw SET [HV Incentive ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] = 0.0 where   [HV Incentive ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] is null ';
		PRINT @SQLToZero
			Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_RCRebate_HV_jmw SET [HV COG Reduction ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] = 0.0 where   [HV COG Reduction ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] is null ';
		PRINT @SQLToZero
			Exec (@SQLToZero);
		SET @startMoCount = @startMoCount + 1;
	END

-- True 10 
	--SET @startMoCount = 0
	--WHILE @startMoCount < 12
	--BEGIN
	--	SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));
	--	SET @SQLToZero = ' UPDATE tmp_RCRebate_TT_jmw SET [True 10 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] = 0.0 where   [True 10 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] is null ';
	--		Exec (@SQLToZero);
	--	SET @SQLToZero = ' UPDATE tmp_RCRebate_TT_jmw SET [True 10 Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] = 0.0 where   [True 10 Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] is null ';
	--		Exec (@SQLToZero);
	--	SET @startMoCount = @startMoCount + 1;
	--END
--
----------------------------------------------------------- --Before changed to add 2 months to display date
---- Arete New 
--	SET @startMoCount = 0
--	WHILE @startMoCount < 12
--	BEGIN
--		SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));
--		SET @SQLToZero = ' UPDATE tmp_RCRebate_Arete_jmw SET [Arete-AAP Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] = 0.0 where   [Arete-AAP Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] is null ';
--			Exec (@SQLToZero);
--		SET @startMoCount = @startMoCount + 1;
--	END
----------------------------------------------------------

---------------------------------------------------------
-- Arete New Changed to add 2 months to display date
	SET @startMoCount = 0
	WHILE @startMoCount < 12
	BEGIN
		SET @moBuildDate =   (DATEADD(m,@startMoCount + 2,@startDate));
		SET @SQLToZero = ' UPDATE tmp_RCRebate_Arete_jmw SET [Arete-AAP Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] = 0.0 where   [Arete-AAP Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] is null ';
		PRINT @SQLToZero
			Exec (@SQLToZero);
		SET @startMoCount = @startMoCount + 1;
	END
--------------------------------------------------------
--------------------------------------------------------


---------------------------------------------------------
-- API Arete New Changed to add 2 months to display date
	SET @startMoCount = 0
	WHILE @startMoCount < 12
	BEGIN
		SET @moBuildDate =   (DATEADD(m,@startMoCount + 2,@startDate));
		SET @SQLToZero = ' UPDATE tmp_RCRebate_AreteAPI_jmw SET [Arete-API Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] = 0.0 where   [Arete-API Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] is null ';
		PRINT @SQLToZero
			Exec (@SQLToZero);
		SET @startMoCount = @startMoCount + 1;
	END
--------------------------------------------------------
-------------------------------------------------------------------
-- API Monthly Rebate  Table
	SET @startMoCount = 0
	WHILE @startMoCount < 12
	BEGIN

		SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));
		SET @SQLToZero = ' UPDATE tmp_RCRebate_MW_jmw SET [API Tier 1 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] = 0.0 where   [API Tier 1 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] is null ';
		PRINT @SQLToZero
			Exec (@SQLToZero);

		SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));
		SET @SQLToZero = ' UPDATE tmp_RCRebate_MW_jmw SET [API Tier 2 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] = 0.0 where   [API Tier 2 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] is null ';
		PRINT @SQLToZero
			Exec (@SQLToZero);

		SET @SQLToZero = ' UPDATE tmp_RCRebate_MW_jmw SET [API Inv Credit ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] = 0.0 where   [API Inv Credit ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] is null ';
		PRINT @SQLToZero
			Exec (@SQLToZero);

		SET @SQLToZero = ' UPDATE tmp_RCRebate_MW_jmw SET [API Net Rebate to Store ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] = 0.0 where   [API Net Rebate to Store ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] is null ';
		PRINT @SQLToZero
			Exec (@SQLToZero);

		SET @SQLToZero = ' UPDATE tmp_RCRebate_MW_jmw SET [API Brand Credits Disbursed ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] = 0.0 where   [API Brand Credits Disbursed ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] is null ';
			PRINT @SQLToZero
			Exec (@SQLToZero);

		SET @SQLToZero = ' UPDATE tmp_RCRebate_MW_jmw SET [API Accelerated Pay Discount ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] = 0.0 where   [API Accelerated Pay Discount ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] is null ';
			PRINT @SQLToZero
			Exec (@SQLToZero);

     	SET @SQLToZero = ' UPDATE tmp_RCRebate_MW_jmw SET [API Avg Rebate Percentage ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] = 0.0 where   [API Avg Rebate Percentage ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] is null ';
		PRINT @SQLToZero
			Exec (@SQLToZero);

		SET @startMoCount = @startMoCount + 1;

	END

-- Conference   Table
	SET @startMoCount = 3
	WHILE @startMoCount < 5
	BEGIN
		SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));
		SET @SQLToZero = ' UPDATE tmp_RCRebate_Conf_jmw SET [Conf Volume ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] = 0.0 where   [Conf Volume ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] is null ';
		PRINT @SQLToZero
			Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_RCRebate_Conf_jmw SET [Conf Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] = 0.0 where   [Conf Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] is null ';
		PRINT @SQLToZero
			Exec (@SQLToZero);
		SET @startMoCount = @startMoCount + 1;
	END
 
--Leader table
	SET @startQtrCount = 1
	WHILE @startQtrCount < 5
	BEGIN
		SET @SQLToZero = ' UPDATE tmp_RCRebate_Leader_jmw SET [Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] = 0.0 where   [Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] is null ';
		PRINT @SQLToZero
			Exec (@SQLToZero);
		SET @startQtrCount = @startQtrCount + 1;
	END

--MSI table
	SET @startQtrCount = 1
	WHILE @startQtrCount < 5
	BEGIN
		SET @SQLToZero = ' UPDATE tmp_RCRebate_MSI_jmw SET [Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] = 0.0 where   [Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] is null ';
		PRINT @SQLToZero
			Exec (@SQLToZero);
		SET @startQtrCount = @startQtrCount + 1;
	END

-- AAP Rebate  Table
	SET @startMoCount = 0
	WHILE @startMoCount < 12
	BEGIN
		SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));
		SET @SQLToZero = ' UPDATE tmp_RCRebate_AAP_jmw SET ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Source Sales] = 0.0 where  ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Source Sales] is null ';
		PRINT @SQLToZero
			Exec (@SQLToZero);

		SET @SQLToZero = ' UPDATE tmp_RCRebate_AAP_jmw SET ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' AAP Gen Rebate] = 0.0 where  ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' AAP Gen Rebate] is null ';
		PRINT @SQLToZero
			Exec (@SQLToZero);

		SET @SQLToZero = ' UPDATE tmp_RCRebate_AAP_jmw SET ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Price Protection Rebate] = 0.0 where  ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Price Protection Rebate] is null ';
		PRINT @SQLToZero
			Exec (@SQLToZero);

		SET @SQLToZero = ' UPDATE tmp_RCRebate_AAP_jmw SET ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' COG Rebate] = 0.0 where  ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' COG Rebate] is null ';
		PRINT @SQLToZero
			Exec (@SQLToZero);

		SET @SQLToZero = ' UPDATE tmp_RCRebate_AAP_jmw SET ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Avg%] = 0.0 where  ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Avg%] is null ';
		PRINT @SQLToZero
			Exec (@SQLToZero);

		--SET @SQLToZero = ' UPDATE tmp_RCRebate_AAP_jmw SET ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' HRTA%] = 0.0 where  ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' HRTA%] is null ';
		--PRINT @SQLToZero
		--	Exec (@SQLToZero); --Removed RSE 10/25/2019

		SET @startMoCount = @startMoCount + 1;
	END


--Update the final table with all the tmp table data
 	  
-- Update from PP table
	SET @startQtrCount = 1
	WHILE @startQtrCount < 2
	BEGIN
		SET @SQLUpdateTable = ' UPDATE final set [Preferred Partners Volume ' + @in_year  +'] '+
             ' = tmp.[Preferred Partners Volume ' + @in_year +  '] ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[Preferred Partners Volume ' + @in_year   +'] from tmp_RCRebate_PP_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			Exec (@SQLUpdateTable);
		SET @SQLUpdateTable = ' UPDATE final set [Preferred Partners Rebate ' + @in_year   +'] '+
             ' = tmp.[Preferred Partners Rebate ' + @in_year + '] ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[Preferred Partners Rebate ' + @in_year  +'] from tmp_RCRebate_PP_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			Exec (@SQLUpdateTable);
        SET @startQtrCount = @startQtrCount + 1;
	END

-- Update from API Qtr table
IF (@in_year <= 2014)
  BEGIN
	SET @startQtrCount = 1
	WHILE @startQtrCount < 5
	BEGIN
		SET @SQLUpdateTable = ' UPDATE final set [Q'  + cast(@startQtrCount as varchar(1)) +' API Whse Rebate]  '+
             ' = tmp.[Q'  + cast(@startQtrCount as varchar(1)) +' API Whse Rebate]  ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[Q'  + cast(@startQtrCount as varchar(1)) +' API Whse Rebate]  from tmp_RCRebate_APIQtr_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			 PRINT @SQLUpdateTable
			Exec (@SQLUpdateTable);
		SET @SQLUpdateTable = ' UPDATE final set [Q'  + cast(@startQtrCount as varchar(1)) +' API Generic Rebate%]  '+
             ' = tmp.[Q'  + cast(@startQtrCount as varchar(1)) +' API Generic Rebate%]  ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[Q'  + cast(@startQtrCount as varchar(1)) +' API Generic Rebate%]  from tmp_RCRebate_APIQtr_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			PRINT @SQLUpdateTable
			Exec (@SQLUpdateTable);
		SET @SQLUpdateTable = ' UPDATE final set [Q'  + cast(@startQtrCount as varchar(1)) +' API Brand Credits Disbursed]  '+
             ' = tmp.[Q'  + cast(@startQtrCount as varchar(1)) +' API Brand Credits Disbursed]  ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[Q'  + cast(@startQtrCount as varchar(1)) +' API Brand Credits Disbursed]  from tmp_RCRebate_APIQtr_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			PRINT @SQLUpdateTable
			Exec (@SQLUpdateTable);
		SET @SQLUpdateTable = ' UPDATE final set [Q'  + cast(@startQtrCount as varchar(1)) +' API Accelerated Pay Discount]  '+
             ' = tmp.[Q'  + cast(@startQtrCount as varchar(1)) +' API Accelerated Pay Discount]  ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[Q'  + cast(@startQtrCount as varchar(1)) +' API Accelerated Pay Discount]  from tmp_RCRebate_APIQtr_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			PRINT @SQLUpdateTable
			Exec (@SQLUpdateTable);
        SET @startQtrCount = @startQtrCount + 1;
	END

END
-- UPdate from High Volume   Table
	SET @startMoCount = 0
	WHILE @startMoCount < 12
	BEGIN
		SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));

		SET @SQLUpdateTable = ' UPDATE final set [HV Incentive ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  '+
             ' = tmp.[HV Incentive ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[HV Incentive ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  from tmp_RCRebate_HV_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			PRINT @SQLUpdateTable
			Exec (@SQLUpdateTable);

		SET @SQLUpdateTable = ' UPDATE final set [HV COG Reduction ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  '+
             ' = tmp.[HV COG Reduction ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[HV COG Reduction ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  from tmp_RCRebate_HV_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			PRINT @SQLUpdateTable
			Exec (@SQLUpdateTable);

		SET @startMoCount = @startMoCount + 1;
	END

-- UPdate from True 10   Table
	--SET @startMoCount = 0
	--WHILE @startMoCount < 12
	--BEGIN
	--	SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));

	--	SET @SQLUpdateTable = ' UPDATE final set [True 10 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  '+
	--			' = tmp.[True 10 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  ' +
	--			' FROM tmp_RCRebate_jmw final inner join (select pmid,[True 10 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  from tmp_RCRebate_TT_jmw )tmp' +
	--			' on final.pmid = tmp.pmid;'
	--		Exec (@SQLUpdateTable);

	--	SET @SQLUpdateTable = ' UPDATE final set [True 10 Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  '+
	--			' = tmp.[True 10 Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  ' +
	--			' FROM tmp_RCRebate_jmw final inner join (select pmid,[True 10 Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  from tmp_RCRebate_TT_jmw )tmp' +
	--			' on final.pmid = tmp.pmid;'
	--		Exec (@SQLUpdateTable);

	--	SET @startMoCount = @startMoCount + 1;
	--END

------------------------------------------------------------------------ Before change to add 2 columns to display date
---- Arete New
---- Update from Arete   Table
--	SET @startMoCount = 0
--	WHILE @startMoCount < 12
--	BEGIN
--		SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));
--
--		SET @SQLUpdateTable = ' UPDATE final set [Arete-AAP Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  '+
--             ' = tmp.[Arete-AAP Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  ' +
--             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[Arete-AAP Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  from tmp_RCRebate_Arete_jmw )tmp' +
--             ' on final.pmid = tmp.pmid;'
--			Exec (@SQLUpdateTable);
--
--		SET @startMoCount = @startMoCount + 1;
--	END
---------------------------------------------------------------------------

----------------------------------------------------------------------
-- Arete New
-- Update from Arete   Table
	SET @startMoCount = 0
	WHILE @startMoCount < 12
	BEGIN
		SET @moBuildDate =   (DATEADD(m,@startMoCount +2,@startDate));

		SET @SQLUpdateTable = ' UPDATE final set [Arete-AAP Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  '+
             ' = tmp.[Arete-AAP Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[Arete-AAP Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  from tmp_RCRebate_Arete_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			PRINT @SQLUpdateTable
			Exec (@SQLUpdateTable);

		SET @startMoCount = @startMoCount + 1;
	END
-------------------------------------------------------------------------

------------------------------------------------------------------------------------
----------------------------------------------------------------------
-- Arete API New
-- Update from Arete   Table
	SET @startMoCount = 0
	WHILE @startMoCount < 12
	BEGIN
		SET @moBuildDate =   (DATEADD(m,@startMoCount +2,@startDate));

		SET @SQLUpdateTable = ' UPDATE final set [Arete-API Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  '+
             ' = tmp.[Arete-API Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[Arete-API Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  from tmp_RCRebate_AreteAPI_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			PRINT @SQLUpdateTable
			Exec (@SQLUpdateTable);

		SET @startMoCount = @startMoCount + 1;
	END
-------------------------------------------------------------------------
------------------------------------------------------------------------------------


-- UPdate from API MOnthly Rebate Table   Table
	SET @startMoCount = 0
	WHILE @startMoCount < 12
	BEGIN
		SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));

		SET @SQLUpdateTable = ' UPDATE final set [API Tier 1 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  '+
             ' = tmp.[API Tier 1 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[API Tier 1 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  from tmp_RCRebate_MW_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			 PRINT @SQLUpdateTable
			Exec (@SQLUpdateTable);

		SET @SQLUpdateTable = ' UPDATE final set [API Tier 2 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  '+
             ' = tmp.[API Tier 2 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[API Tier 2 Sales ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  from tmp_RCRebate_MW_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			 PRINT @SQLUpdateTable
			Exec (@SQLUpdateTable); -- Added RSE 10/25/2019

		SET @SQLUpdateTable = ' UPDATE final set [API Inv Credit ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  '+
            ' = tmp.[API Inv Credit ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  ' +
            ' FROM tmp_RCRebate_jmw final inner join (select pmid,[API Inv Credit ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  from tmp_RCRebate_MW_jmw )tmp' +
            ' on final.pmid = tmp.pmid;'
		PRINT @SQLUpdateTable
		Exec (@SQLUpdateTable);

		SET @SQLUpdateTable = ' UPDATE final set [API Net Rebate to Store ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  '+
             ' = tmp.[API Net Rebate to Store ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[API Net Rebate to Store ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  from tmp_RCRebate_MW_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			 PRINT @SQLUpdateTable
			Exec (@SQLUpdateTable);

		SET @SQLUpdateTable = ' UPDATE final set [API Brand Credits Disbursed ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  '+
             ' = tmp.[API Brand Credits Disbursed ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[API Brand Credits Disbursed ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  from tmp_RCRebate_MW_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			 PRINT @SQLUpdateTable
			Exec (@SQLUpdateTable);

		SET @SQLUpdateTable = ' UPDATE final set [API Accelerated Pay Discount ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  '+
             ' = tmp.[API Accelerated Pay Discount ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[API Accelerated Pay Discount ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  from tmp_RCRebate_MW_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			 PRINT @SQLUpdateTable
			Exec (@SQLUpdateTable);


		SET @SQLUpdateTable = ' UPDATE final set [API Avg Rebate Percentage ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  '+
             ' = tmp.[API Avg Rebate Percentage ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[API Avg Rebate Percentage ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  from tmp_RCRebate_MW_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			 PRINT @SQLUpdateTable
			Exec (@SQLUpdateTable);

		SET @startMoCount = @startMoCount + 1;
	END

-- Update from Conference   Table
	SET @startMoCount = 3
	WHILE @startMoCount < 5
	BEGIN
		SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));

		SET @SQLUpdateTable = ' UPDATE final set [Conf Volume ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  '+
             ' = tmp.[Conf Volume ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[Conf Volume ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  from tmp_RCRebate_Conf_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			 PRINT @SQLUpdateTable
			Exec (@SQLUpdateTable);

		SET @SQLUpdateTable = ' UPDATE final set [Conf Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  '+
             ' = tmp.[Conf Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[Conf Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  from tmp_RCRebate_Conf_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			 PRINT @SQLUpdateTable
			Exec (@SQLUpdateTable);
		SET @startMoCount = @startMoCount + 1;
	END
 
-- Update from Leader table
	SET @startQtrCount = 1
	WHILE @startQtrCount < 5
	BEGIN

--		SET @SQLUpdateTable = ' UPDATE final set [Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +']  '+
--             ' = tmp.[Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] + final.[Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +']   ' +
--             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +']  from tmp_RCRebate_Leader_jmw )tmp' +
--             ' on final.pmid = tmp.pmid;'
--			Exec (@SQLUpdateTable);
--		SET @startQtrCount = @startQtrCount + 1;

		SET @SQLUpdateTable = ' UPDATE final set [Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +']  '+
             ' = tmp.[Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +']    ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +']  from tmp_RCRebate_Leader_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			 PRINT @SQLUpdateTable
			Exec (@SQLUpdateTable);
		SET @startQtrCount = @startQtrCount + 1;
	END
 
-- Update from MSI table
	SET @startQtrCount = 1
	WHILE @startQtrCount < 5
	BEGIN


		SET @SQLUpdateTable = ' UPDATE final set [Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +']  '+
             ' = tmp.[Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +']  + final.[Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +']  ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +']  from tmp_RCRebate_MSI_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			 PRINT @SQLUpdateTable
			Exec (@SQLUpdateTable);
		SET @startQtrCount = @startQtrCount + 1;
	END



-- Update from AAP Rebate  Table
	SET @startMoCount = 0
	WHILE @startMoCount < 12
	BEGIN
		SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));


		SET @SQLUpdateTable = ' UPDATE final set ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Source Sales]   '+
             ' = tmp.['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Source Sales]   ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Source Sales]   from tmp_RCRebate_AAP_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			 PRINT @SQLUpdateTable
			Exec (@SQLUpdateTable);

		SET @SQLUpdateTable = ' UPDATE final set ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' AAP Gen Rebate]   '+
             ' = tmp.['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' AAP Gen Rebate]   ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' AAP Gen Rebate]   from tmp_RCRebate_AAP_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			 PRINT @SQLUpdateTable
			Exec (@SQLUpdateTable);

---
		SET @SQLUpdateTable = ' UPDATE final set ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Price Protection Rebate]   '+
             ' = tmp.['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Price Protection Rebate]   ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Price Protection Rebate]   from tmp_RCRebate_AAP_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			 PRINT @SQLUpdateTable
			Exec (@SQLUpdateTable);
--added by LA, COG Rebate
		SET @SQLUpdateTable = ' UPDATE final set ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' COG Rebate]   '+
             ' = tmp.['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' COG Rebate]   ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' COG Rebate]   from tmp_RCRebate_AAP_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			 PRINT @SQLUpdateTable
			Exec (@SQLUpdateTable);
--

		SET @SQLUpdateTable = ' UPDATE final set ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Avg%]   '+
             ' = tmp.['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Avg%]   ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Avg%]   from tmp_RCRebate_AAP_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			 PRINT @SQLUpdateTable
			Exec (@SQLUpdateTable);

		--SET @SQLUpdateTable = ' UPDATE final set ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' HRTA%]   '+
  --           ' = tmp.['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' HRTA%]   ' +
  --           ' FROM tmp_RCRebate_jmw final inner join (select pmid,['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' HRTA%]   from tmp_RCRebate_AAP_jmw )tmp' +
  --           ' on final.pmid = tmp.pmid;'
		--	 PRINT @SQLUpdateTable
		--	Exec (@SQLUpdateTable); --Removed RSE 10/25/2019

		--added by RSE, COG Eligible Sales
		SET @SQLUpdateTable = ' UPDATE final set ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' COG Eligible Sales]   '+
             ' = tmp.['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' COG Eligible Sales]   ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' COG Eligible Sales]   from tmp_RCRebate_AAP_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			 PRINT @SQLUpdateTable
			Exec (@SQLUpdateTable);

		SET @startMoCount = @startMoCount + 1;
	END


-- UPDATE from the import_WA_CHRebate table

--	UPDATE  t  set 
--		t.[06/11 AAP Gen Rebate] = w.[Cumulative Rebate],
--        t.[06/11 Avg%]  =  w.[Effective  Rebate %],
--        t.[06/11 HRTA%] =  case when w.HRTA is null then 0 else w.HRTA end  
--	FROM tmp_RCRebate_jmw   t 
--	inner join 
--		( select * from import_WA_CHRebate where month(date) = 06 and year(date) = 2011 ) w
--	on t.pmid = w.pmid   


	SET @startMoCount = 0
	WHILE @startMoCount < 12
	BEGIN
		SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));
 
--		SET @SQL  = ' UPDATE t SET ['  +
--                        replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' AAP Gen Rebate] = ' + 
--                       ' w.[GenericRebate], ' + 
--                       ' [' +
----                        replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Avg%] =  '+ 
----                       'case when w.[EffRebatePerc] is null then 0 else  (w.[EffRebatePerc] * 100) end , ' +
----                        ' [' +
--                         replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' PaymentMethod] =  '+ 
--                       ' w.[PaymentMethod]  ' + 
-- --                        ' [' +
-- --                      replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '  Cardinal Rebates] = '+
----                    ' case when w.LeaderRebate + w.MSIRebate is null then 0 else (w.LeaderRebate + w.MSIRebate ) end  '+
--					' FROM tmp_RCRebate_jmw   t '+
--					'  inner join  '+
--                    '   ( select * from import_Rebates_CAHDirect where month(date) = '+ replace(str(datepart(month,@moBuildDate),2),' ','0') + ' and year(date) = ' + cast(datepart(year,@moBuildDate) as varchar(4)) + ' ) w '+
--                    ' on t.pmid = w.pmid ';

--		SET @SQL  = ' UPDATE t SET ['  +
--                        replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' AAP Gen Rebate] = ' + 
--                       ' ['  +
--                        replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' AAP Gen Rebate] + ' + 
--                       ' w.[GenericRebate], ' + 
--                       ' [' +
----                        replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Avg%] =  '+ 
----                       'case when w.[EffRebatePerc] is null then 0 else  (w.[EffRebatePerc] * 100) end , ' +
----                        ' [' +
--                         replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' PaymentMethod] =  '+ 
--                       ' w.[PaymentMethod]  ' + 
-- --                        ' [' +
-- --                      replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '  Cardinal Rebates] = '+
----                    ' case when w.LeaderRebate + w.MSIRebate is null then 0 else (w.LeaderRebate + w.MSIRebate ) end  '+
--					' FROM tmp_RCRebate_jmw   t '+
--					'  inner join  '+
--                    '   ( select * from import_Rebates_CAHDirect where month(date) = '+ replace(str(datepart(month,@moBuildDate),2),' ','0') + ' and year(date) = ' + cast(datepart(year,@moBuildDate) as varchar(4)) + ' ) w '+
--                    ' on t.pmid = w.pmid ';
--------- ????????? Do I need to get Price Protection
		SET @SQL  = ' UPDATE t SET ['  +
                        replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' AAP Gen Rebate] = ' + 
                       ' ['  +
                        replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' AAP Gen Rebate] + ' + 
                       ' w.[GenericRebate], ' + 

---------
                        ' ['  +
                        replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Price Protection Rebate] = ' + 
                       ' ['  +
                        replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Price Protection Rebate] + ' + 
                       ' w.[PriceProtectionRebate], ' + 
---------
--added by LA, COG Rebate
                        ' ['  +
                        replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' COG Rebate] = ' + 
                       ' ['  +
                        replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' COG Rebate] + ' + 
                       ' w.[COGRebate], ' + 
--
                       ' [' +
                       replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Avg%] =  '+ 
                       'case when w.[EffRebatePerc] is null then 0 else  (w.[EffRebatePerc] * 100) end , ' +

					 --' [' +
      --                 replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' HRTA%] =  '+ 
      --                 'case when w.[HRTA] is null then 0 else  (w.[HRTA] * 100) end , ' + -- Removed RSE 10/25/2019

                         ' [' +
                         replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' PaymentMethod] =  '+ 
                       ' w.[PaymentMethod]  ' + 
 --                        ' [' +
 --                      replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '  Cardinal Rebates] = '+
--                    ' case when w.LeaderRebate + w.MSIRebate is null then 0 else (w.LeaderRebate + w.MSIRebate ) end  '+
					' FROM tmp_RCRebate_jmw   t '+
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
                        ' [Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] = ' +
                    ' case when w.LeaderRebate + w.MSIRebate is null then 0 else (w.LeaderRebate + w.MSIRebate ) end  + [Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +']'+
					' FROM tmp_RCRebate_jmw   t '+
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
 

		SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set  [Total Preferred Partners Rebate ' +@in_year +'] = ' + @SQLPPQtrRebTotal;
		PRINT @SQLUpdateTable
		EXEC (@SQLUpdateTable);

		--Here we will only have Q1 in the quarterly for 2014 so need to add in the rest of the 2014 monthly - next year should just be monthly

		IF (@in_year <= 2014)
		BEGIN
		SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set [Total API Whse Rebate ' +@in_year +'] = ' + @SQLAPIQtrWhsRebTotal;

		PRINT @SQLUpdateTable
		EXEC (@SQLUpdateTable);

		SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set [Total API Brand Credits Disbursed ' +@in_year +'] = ' + @SQLAPIQTRBCDTotal;
		PRINT @SQLUpdateTable
		EXEC (@SQLUpdateTable);
		SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set [Total API Accelerated Pay Discount ' +@in_year +'] = ' + @SQLAPIQTRAPDTotal;
		PRINT @SQLUpdateTable
		EXEC (@SQLUpdateTable);
		END

        --- Combine the = and > ot just pull from monthly once reconcile Jan and Feb in montly table
--	IF(@in_year  = 2014)
--	BEGIN
----			SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set [Total API Whse Rebate ' +@in_year +'] = [Total API Whse Rebate ' +@in_year +']  + ' + @SQLAPIMoNRSTotal2014;
----			SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set [Total API Whse Rebate ' +@in_year +'] = ' + @SQLAPIQtrWhsRebTotal  + ' + ' +  @SQLAPIMoNRSTotal2014;
--			SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set [Total API Whse Rebate ' +@in_year +'] = ' + @SQLAPIQtrWhsRebTotal  + ' + ' +  @SQLAPIMoNRSTotal2014;
--
--          print @SQLUpdateTable;
--			EXEC (@SQLUpdateTable);
--		END

--		IF(@in_year  > 2014)
--		BEGIN
--			SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set [Total API Whse Rebate ' +@in_year +'] = '  + @SQLAPIMoNRSTotal;
--			EXEC (@SQLUpdateTable);
--		END
 -- When get Q1 this and one above should be equal -probably take out Q1 above if they are - I don't know

--IF(@in_year= '2014')
--	BEGIN
--        SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set [Total Monthly API Net Rebate to Store ' +@in_year +'] = ' + @SQLAPIMoNRSTotal2014;
--		PRINT @SQLUpdateTable
--		EXEC (@SQLUpdateTable);
--   --print @SQLUpdateTable;

--		SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set [Total Monthly API Brand Credits Disbursed ' +@in_year +'] = ' + @SQLAPIMoBCDTotal2014;
--		print @SQLUpdateTable;
--		EXEC (@SQLUpdateTable);
--		SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set [Total Monthly API Accelerated Pay Discount ' +@in_year +'] = ' + @SQLAPIMoAPDTotal2014;
--		EXEC (@SQLUpdateTable);


--       print @SQLUpdateTable;
--	END

IF(@in_year > '2014')
	BEGIN
        SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set [Total Monthly API Net Rebate to Store ' +@in_year +'] = ' + @SQLAPIMoNRSTotal;
		PRINT @SQLUpdateTable
		EXEC (@SQLUpdateTable);
   

		SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set [Total Monthly API Brand Credits Disbursed ' +@in_year +'] = ' + @SQLAPIMoBCDTotal;
		print @SQLUpdateTable;
		EXEC (@SQLUpdateTable);

		SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set [Total Monthly API Accelerated Pay Discount ' +@in_year +'] = ' + @SQLAPIMoAPDTotal;
		PRINT @SQLUpdateTable
		EXEC (@SQLUpdateTable);

       print @SQLUpdateTable;

	END

        SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set [Total Monthly API Tier 1 Sales ' +@in_year +'] = ' + @SQLAPImoGenSalesTotalTier1;
		PRINT @SQLUpdateTable
		EXEC (@SQLUpdateTable);

		SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set [Total Monthly API Tier 2 Sales ' +@in_year +'] = ' + @SQLAPImoGenSalesTotalTier2;
		PRINT @SQLUpdateTable
		EXEC (@SQLUpdateTable);

		SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set [Total Monthly API Inv Credit ' +@in_year +'] = ' + @SQLAPImoInvCreditTotal;
		PRINT @SQLUpdateTable
		EXEC (@SQLUpdateTable);

		SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set  [Total HV Incentive ' +@in_year +']  = ' +  @SQLHVIncTotal;
		PRINT @SQLUpdateTable
		EXEC (@SQLUpdateTable);

		SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set [Total Conf Volume ' +@in_year +']  = ' + @SQLConfVolTotal;
		PRINT @SQLUpdateTable
		EXEC (@SQLUpdateTable);

		--SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set  [Total True 10 Sales ' +@in_year +']  = ' +  @SQLTrue10VolTotal;
		--EXEC (@SQLUpdateTable);
		--SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set [Total True 10 Rebate ' +@in_year +']  = ' + @SQLTrue10RebTotal;
		--EXEC (@SQLUpdateTable);


		SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set [Total Arete-AAP Rebate ' +@in_year +']  = ' + @SQLAreteRebTotal;
		PRINT @SQLUpdateTable
		EXEC (@SQLUpdateTable);

		SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set [Total Arete-API Rebate ' +@in_year +']  = ' + @SQLAPIAreteRebTotal;
		PRINT @SQLUpdateTable
		EXEC (@SQLUpdateTable);


		SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set [Total Conf Rebate ' +@in_year +']  = ' + @SQLConfRebTotal;
		PRINT @SQLUpdateTable
		EXEC (@SQLUpdateTable);
		SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set  [Total Cardinal Rebates ' +@in_year +']  = ' +  @SQLLeaderMSIQtrTotal;
		PRINT @SQLUpdateTable
		EXEC (@SQLUpdateTable);
 
		SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set   [Total CH AAP Gen Rebate ' +@in_year +']  = ' + @SQLAAPRebGenTotal;
		PRINT @SQLUpdateTable
		EXEC (@SQLUpdateTable);
		SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set   [Total Price Protection Rebate ' +@in_year +']  = ' + @SQLAAPRebCPPTotal;
		PRINT @SQLUpdateTable
		EXEC (@SQLUpdateTable);
		SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set   [Total COG Rebate ' +@in_year +']  = ' + @SQLAAPRebCOGTotal;
		PRINT @SQLUpdateTable
		EXEC (@SQLUpdateTable);


 

		SET @SQLUpdateTable = ' UPDATE t set    [Planogram Rebate ' +@in_year +']  = v.PlanOgramRebate' +
				       ' FROM   reports..tmp_RCRebate_jmw t  ' +
                       ' inner join ( '+
                       ' SELECT SUM(PlanOgramRebate) as PlanOgramRebate ,  pmid from pharmacymaster..PM_AnnualRebates where year = ' +@in_year + 
				       '  GROUP BY   pmid '+
			           ' ) v '+
		               '  on t.pmid =v.pmid  ';
		PRINT @SQLUpdateTable
		EXEC (@SQLUpdateTable);
 

		SET @SQLUpdateTable = ' UPDATE t set    [API Generic Incentive ' +@in_year +']  = v.GenericIncentive' +
				       ' FROM   reports..tmp_RCRebate_jmw t  ' +
                       ' inner join ( '+
                       ' SELECT SUM(GenericIncentive) as GenericIncentive ,  pmid from pharmacymaster..PM_AnnualRebates where year = ' +@in_year + 
				       '  GROUP BY   pmid '+
			           ' ) v '+
		               '  on t.pmid =v.pmid  ';
		PRINT @SQLUpdateTable
		 EXEC (@SQLUpdateTable);

		--SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set  [AAP Patronage Dividend ' +@in_year +']  = ' +
		SET @SQLUpdateTable = ' UPDATE t set    [AAP Patronage Dividend ' +@in_year +']  = v.PatronageDividend' +
				       ' FROM   reports..tmp_RCRebate_jmw t  ' +
                       ' inner join ( '+
                       ' SELECT SUM(PatronageDividend) as PatronageDividend ,  pmid from pharmacymaster..PM_AnnualRebates where year = ' +@in_year + 
				       '  GROUP BY   pmid '+
			           ' ) v '+
		               '  on t.pmid =v.pmid  ';
		 PRINT @SQLUpdateTable
		 EXEC (@SQLUpdateTable);

		--ONly do if this is 2013
		IF(@in_year = '2013')
			BEGIN 
              		SET @SQLUpdateTable = ' UPDATE t set    [Contract Performance Rebate ' +@in_year +']  = v.ContractPerformanceRebate' +
				       ' FROM   reports..tmp_RCRebate_jmw t  ' +
                       ' inner join ( '+
                       ' SELECT SUM(ContractPerformanceRebate) as ContractPerformanceRebate ,  pmid from pharmacymaster..PM_Rebates_CHAAP where year(date) = ' +@in_year + 
				       '  GROUP BY   pmid '+
			           ' ) v '+
		               '  on t.pmid =v.pmid  ';
					PRINT @SQLUpdateTable
					EXEC (@SQLUpdateTable);

       -- Now do the ContractPerformanceRebate for Direct Pay
					SET @SQLUpdateTable = ' UPDATE t set    [Contract Performance Rebate ' +@in_year +']  =  [Contract Performance Rebate ' +@in_year +'] + v.ContractPerformanceRebate' +
				       ' FROM   reports..tmp_RCRebate_jmw t  ' +
                       ' inner join ( '+
                       ' SELECT SUM(ContractPerformanceRebate) as ContractPerformanceRebate ,  pmid from reports..import_Rebates_CAHDirect where year(date) = ' +@in_year + 
				       '  GROUP BY   pmid '+
			           ' ) v '+
		               '  on t.pmid =v.pmid  ';
					PRINT @SQLUpdateTable
					EXEC (@SQLUpdateTable);
			END

--Only do if this is 2013 - this one adds in the Contract Performance Rebate
		IF(@in_year <= '2013')
		BEGIN
			SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set   [Total YTD All Rebates ' +@in_year +']  = ' +  
									' [Total Preferred Partners Rebate ' +@in_year +'] + ' + 
									' [Total API Whse Rebate ' +@in_year +'] + ' + 
									' [Total API Brand Credits Disbursed ' +@in_year +'] + ' + 
									' [Total API Accelerated Pay Discount ' +@in_year +'] + ' + 
									' [Total HV Incentive ' +@in_year +'] + ' +
                                   
									' [Total Conf Rebate ' +@in_year +'] + ' + 
									' [Total Cardinal Rebates ' +@in_year +'] + ' + 
									--' [Total MSI AAP ' +@in_year +'] + ' + 
									' [Total CH AAP Gen Rebate ' +@in_year +'] + ' + 
									' [Planogram Rebate ' +@in_year +'] + ' + 
									' [API Generic Incentive ' +@in_year +'] + ' + 
									' [Contract Performance Rebate ' +@in_year +'] + ' + 
									' [AAP Patronage Dividend ' +@in_year +']   '  ;
			PRINT @SQLUpdateTable
			EXEC (@SQLUpdateTable);
		END
		IF(@in_year = '2014') --TO do - put in bc dispursed and accelerated pay discount for month 4-12
			BEGIN
							SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set   [Total YTD All Rebates ' +@in_year +']  = ' +  
									' [Total Preferred Partners Rebate ' +@in_year +'] + ' + 
									' [Total API Whse Rebate ' +@in_year +'] + ' + 
									' [Total API Brand Credits Disbursed ' +@in_year +'] + ' + 
									' [Total API Accelerated Pay Discount ' +@in_year +'] + ' +                                    
                                    ' [Total Monthly API Net Rebate to Store ' +@in_year +'] + ' + 
                                    ' [Total Monthly API Brand Credits Disbursed ' +@in_year +'] + ' + 
                                    ' [Total Monthly API Accelerated Pay Discount ' +@in_year +'] + ' +
 
									' [Total HV Incentive ' +@in_year +'] + ' + 
									' [Total Conf Rebate ' +@in_year +'] + ' + 
									' [Total Cardinal Rebates ' +@in_year +'] + ' + 
									--' [Total MSI AAP ' +@in_year +'] + ' + 
									' [Total CH AAP Gen Rebate ' +@in_year +'] + ' + 
									' [Total Price Protection Rebate ' +@in_year +'] + ' + 
									' [Total COG Rebate ' +@in_year +'] + ' +

									' [Planogram Rebate ' +@in_year +'] + ' + 
									' [API Generic Incentive ' +@in_year +'] + ' + 
									' [AAP Patronage Dividend ' +@in_year +']   '  ;
			PRINT @SQLUpdateTable
			EXEC (@SQLUpdateTable);
			END

		IF(@in_year > 2014) --TO do - take out quarterly totals for API and add in monthly
			BEGIN
							SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set   [Total YTD All Rebates ' +@in_year +']  = ' +  
									' [Total Preferred Partners Rebate ' +@in_year +'] + ' + 
--                                    ' [Total Monthly API Net Rebate to Store ' +@in_year +'] + ' + 
--									' [Total API Brand Credits Disbursed ' +@in_year +'] + ' + 
--									' [Total API Accelerated Pay Discount ' +@in_year +'] + ' + 
                                    ' [Total Monthly API Net Rebate to Store ' +@in_year +'] + ' + 
                                    ' [Total Monthly API Brand Credits Disbursed ' +@in_year +'] + ' + 
                                    ' [Total Monthly API Accelerated Pay Discount ' +@in_year +'] + ' +

									' [Total HV Incentive ' +@in_year +'] + ' + 
                                     --' [Total True 10 Rebate ' +@in_year +'] + ' +
									' [Total Arete-API Rebate ' +@in_year +'] + ' +
									' [Total Arete-AAP Rebate ' +@in_year +'] + ' +
									' [Total Conf Rebate ' +@in_year +'] + ' + 
									' [Total Cardinal Rebates ' +@in_year +'] + ' + 
									--' [Total MSI AAP ' +@in_year +'] + ' + 
									' [Total CH AAP Gen Rebate ' +@in_year +'] + ' + 
									' [Total Price Protection Rebate ' +@in_year +'] + ' + 
									' [Total COG Rebate ' +@in_year +'] + ' + --added by LA, COG Rebate
									' [Planogram Rebate ' +@in_year +'] + ' + 
									' [API Generic Incentive ' +@in_year +'] + ' + 
									' [AAP Patronage Dividend ' +@in_year +']   '  ;
			PRINT @SQLUpdateTable
			EXEC (@SQLUpdateTable);
			END


 
-- Now update all the other stuff
BEGIN
	UPDATE v set
		TM = p.territory  ,
		[AAP#] = p.aapaccountno,
		[Parent#] = p.aapparentno ,
		[Group#] = p.Groupno ,
		[API#] = p.apiaccountno ,
		[AAP Eff] =    CONVERT(VARCHAR(10), p.AAPEffectiveDate, 101) ,
		[AAP Quit] =   CONVERT(VARCHAR(10), p.AAPQuitDate, 101),
		[Description] = p.AccountDescription ,
		Affiliate = p.Affiliate,
		[Account DBA Name] = p.[accountname],
		[Account Corporate Name] = p.[corporatename],
		[Address] = p.Addr1,
        [MC Network] = case when p.mcquitdate is null and p.chaincode is not null and p.aapquitdate is  null then p.chaincode else null end ,
		City = p.City, 
		ST = p.State ,
		Contact = (select case when p.ownername is null or ltrim(p.ownername)=''  then 
--			(select distinct contactfullname from pharmacymaster..v_Address_Mailing_Financials where pharmacymaster..v_Address_Mailing_Financials.pmid=p.pmid) 
--			else ownername end ) 
		case when (select distinct contactfullname from pharmacymaster..v_Address_Mailing_Financials 
			where pharmacymaster..v_Address_Mailing_Financials.pmid=p.pmid) is null then p.contactfullname
			else (select distinct contactfullname from pharmacymaster..v_Address_Mailing_Financials 
			where pharmacymaster..v_Address_Mailing_Financials.pmid=p.pmid) end
			else p.ownername end )
		--Email =  ISNULL(p.Email, ''),
		--[Financial Email] = ISNULL(p.ACHEmail, '')
	FROM tmp_RCRebate_jmw v
	left join pharmacymaster..v_PM_AllWithAffiliates p on v.pmid=p.pmid


---- Now build the table where we group by territory for totals
END

END

























GO
