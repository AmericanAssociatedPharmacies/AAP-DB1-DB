USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_ReportCardRebate_DYN_B4AddField]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <07/08/2011>
-- Description:	Create table for Report Card for Wayne
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_ReportCardRebate_DYN_B4AddField]
(@in_month varchar(2), @in_year varchar(4) )

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

	DECLARE @SQLContractPerfRebate varchar(500);

 
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

    SET @SQLConfCol = '';
    SET @SQLConfTblCol = '';
    SET @SQLConfColVolSel  = '';
    SET @SQLConfColRebSel  = '';
    SET @SQLConfVolTotal = '';
    SET @SQLConfRebTotal = '';

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

 
	IF(@in_year = '2013')
		BEGIN
		   SET @SQLContractPerfRebate = 'cast (0 as float) as [Contract Performance Rebate ' +@in_year +'],+';
print @SQLContractPerfRebate;
		END
	ELSE
		BEGIN
		    SET @SQLContractPerfRebate = '';
		END
  
    -- Build the Preferred Partner Quarter Columns
 
	WHILE @startQtrCount < 5
	BEGIN
		SET @SQLPPQtrCol = @SQLPPQtrCol +  ' MAX([PP Volume ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'])  as [PP Volume ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'], ';
 		SET @SQLPPQtrCol = @SQLPPQtrCol +  ' MAX([PP Rebate ' + @in_year +  'Q'  +cast(@startQtrCount as varchar(1)) +'])  as [PP Rebate ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'], ';

-- Table Columns to build final table
		SET @SQLPPQtrTblCol = @SQLPPQtrTblCol +  ' cast (0 as float)   as [PP Volume ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'], ';
 		SET @SQLPPQtrTblCol = @SQLPPQtrTblCol +  ' cast (0 as float)   as [PP Rebate ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'], ';

-- Columns for Select In 

		SET @SQLPPQtrColVolSel = @SQLPPQtrColVolSel +  '[PP Volume ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'], ';
 		SET @SQLPPQtrColRebSel = @SQLPPQtrColRebSel +  '[PP Rebate ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'], ';

--Totals
		SET @SQLPPQtrRebTotal = @SQLPPQtrRebTotal + '[PP Rebate ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] +  ';

   
    	SET @startQtrCount = @startQtrCount + 1;
	END
   -- Now take of trailing comma (not for final table)
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

     -- Build the Leader Rebate columns
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
 		SET @SQLAAPRebCol = @SQLAAPRebCol + ' MAX([' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Avg%] ) as  [' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Avg%],';
		SET @SQLAAPRebCol = @SQLAAPRebCol + ' MAX([' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' HRTA%] ) as  [' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' HRTA%],';


		SET @SQLAAPRebTblCol = @SQLAAPRebTblCol + ' cast (0 as float ) as [' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Source Sales],';
		SET @SQLAAPRebTblCol = @SQLAAPRebTblCol + ' cast (0 as float ) as [' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' AAP Gen Rebate],';
 		SET @SQLAAPRebTblCol = @SQLAAPRebTblCol + ' cast (0 as float ) as [' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Avg%],';
		SET @SQLAAPRebTblCol = @SQLAAPRebTblCol + ' cast (0 as float ) as [' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' HRTA%],';
   		SET @SQLAAPRebTblCol = @SQLAAPRebTblCol + ' cast ('''' as varchar(50) ) as [' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' PaymentMethod],';
-- Columns for Select

		SET @SQLAAPRebColSSSel = @SQLAAPRebColSSSel + '['+ replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Source Sales],';
		SET @SQLAAPRebColGenSel = @SQLAAPRebColGenSel + '['+  replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' AAP Gen Rebate],';
 		SET @SQLAAPRebColAvgSel = @SQLAAPRebColAvgSel  +  '['+ replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Avg%],';
		SET @SQLAAPRebColHRTASel = @SQLAAPRebColHRTASel + '['+  replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' HRTA%],';

--Totals
		SET @SQLAAPRebGenTotal = @SQLAAPRebGenTotal + '['+  replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' AAP Gen Rebate] + ';
		SET @startMoCount = @startMoCount + 1;
	END
       -- Now take of trailing comma (not for the table columns though)
     SET @SQLAAPRebCol = substring(@SQLAAPRebCol,0,len(@SQLAAPRebCol) );
     SET @SQLAAPRebColSSSel = substring(@SQLAAPRebColSSSel,0,len(@SQLAAPRebColSSSel) );
     SET @SQLAAPRebColGenSel = substring(@SQLAAPRebColGenSel,0,len(@SQLAAPRebColGenSel) );
     SET @SQLAAPRebColAvgSel = substring(@SQLAAPRebColAvgSel,0,len(@SQLAAPRebColAvgSel) );
     SET @SQLAAPRebColHRTASel = substring(@SQLAAPRebColHRTASel,0,len(@SQLAAPRebColHRTASel) );
     SET @SQLAAPRebGenTotal = substring(@SQLAAPRebGenTotal,0,len(@SQLAAPRebGenTotal) );

  
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
        ' cast('''' as varchar(150)) as [MC Network] ,' +
		@SQLPPQtrTblCol +
		' cast (0 as float)   as [Total PP Rebate ' +@in_year +'],'+
		+ @SQLAPIQtrTblCol +
		' cast (0 as float) as [Total API Whse Rebate ' +@in_year +'], '+
        ' cast (0 as float) as [Total API Brand Credits Disbursed ' +@in_year +'],' +
        ' cast (0 as float) as [Total API Accelerated Pay Discount ' +@in_year +'],' +
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
        -- This next one is one time only for April 2013
		+@SQLContractPerfRebate +
		' cast (0 as float) as [Planogram Rebate ' +@in_year +'],'+
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
        ' 	 SELECT DISTINCT pmid from reports..import_Rebates_CAHDirect where date >= ''' + @startDate + ''' and date < ''' + @nextYearDate  + '''' +
		' 		union '+
		' 	 SELECT DISTINCT pmid from pharmacymaster..pm_rebates_HighVolume where date >= ''' + @startDate + ''' and date < ''' + @nextYearDate + '''' +
		' 		union '+
		' 	 SELECT DISTINCT pmid from pharmacymaster..pm_rebates_Conference where date >= ''' + @startDate + ''' and date < ''' + @nextYearDate +  '''' +
        ' 		union '+
		' 	 SELECT DISTINCT pmid from pharmacymaster..PM_AnnualRebates where year  = ''' + @in_year  + '''' +
		' 	) p '+
		'  ) a ' +
        ')ch ';

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

	'''PP Volume '' + period as datePPV,'+
	' sum(isnull(VolumeAmt,0.00)  )as PPQtrVolume , '+
	'''PP Rebate '' + period as datePPR, '+
	' sum(round(isnull([paid to store],0.00)+isnull([paid to affiliate],0.00),2) )as PPQtrRebate '+
    '  	  FROM  pharmacymaster..PM_rebates_PPartner  where  ( period in  (''' + @in_year + @Q1 + ''','''+ @in_year + @Q2 + ''',''' + @in_year + @Q3 + ''',''' + @in_year + @Q4 + '''))' +
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
 
-- Create temp table for pivoted API Quarterly
SET @SQL = ' SELECT * INTO tmp_RCRebate_APIQtr_jmw from ( '+
	 ' SELECT   '+
	 ' PMID, '+

	  @SQLAPIQtrCol +
 
	 ' FROM ( '+
	 ' SELECT PMID,period, '+

	 '  substring(period,5,2) + '' API Whse Rebate''  as dateWReb, '+
	 '	sum((round(isnull([Rebate to Pay Acct/Admin] - [Less Group Admin],0),2) * [Pay Account]))as APIWhseReb , '+
	 '  substring(period,5,2)  + '' API Generic Rebate%'' as dateGReb, '+
	 '	sum([Avg Rebate Percentage]) as APIGenReb, '+
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
	     '  SELECT PMID,date, '+

		 '   replace(str(datepart(month,date),2),'' '',''0'')  + ''/'' +  substring(cast(datepart(year,date) as varchar(4)),3,2) + '' Source Sales''   as dateSS, '+
		 ' sum(round(isnull([SourceGenericSales],0.00),2))as SS , '+
		 '  replace(str(datepart(month,date),2),'' '',''0'')  + ''/'' +  substring(cast(datepart(year,date) as varchar(4)),3,2)  + '' AAP Gen Rebate''  as dateGR, '+
		 ' sum( round(GenericRebate,2)) as GR , '+
		 '  replace(str(datepart(month,date),2),'' '',''0'')  + ''/'' +  substring(cast(datepart(year,date) as varchar(4)),3,2) + '' Avg%''   as dateAvg, '+
		 ' sum(round(EffRebatePerc,2))as AVGPerc , '+
		 '  replace(str(datepart(month,date),2),'' '',''0'')  + ''/'' +  substring(cast(datepart(year,date) as varchar(4)),3,2)  + '' HRTA%''  as dateHRTA, '+
		 ' sum(  round(HRTA,2)) as HRTA  '+

      	 ' FROM   pharmacymaster..PM_Rebates_CHAAP  where ( year(date) in (' + @in_year + ')) '+
		 '	 group by PMID ,date '+
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
	' SUM(AVGPerc) '+
	'  FOR dateAvg IN  (' + @SQLAAPRebColAvgSel  + ' ) '+
	' ) as P3 '+
	' PIVOT '+
	' ( '+
	'  SUM(HRTA) '+
	'  FOR dateHRTA IN  (' + @SQLAAPRebColHRTASel  + ' ) '+
	' ) as P4 '+
	' group by PMID '+
   ' )vol ';

PRINT @SQL;
EXEC(@SQL);


-- Set where null to zero so we can do  totals
 

-- PP table
	SET @startQtrCount = 1
	WHILE @startQtrCount < 5
	BEGIN
		SET @SQLToZero = ' UPDATE tmp_RCRebate_PP_jmw SET [PP Volume ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] = 0.0 where   [PP Volume ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] is null ';
			Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_RCRebate_PP_jmw SET [PP Rebate ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] = 0.0 where   [PP Rebate ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] is null ';
			Exec (@SQLToZero);
        SET @startQtrCount = @startQtrCount + 1;
	END
-- API Qtr Table
	SET @startQtrCount = 1
	WHILE @startQtrCount < 5
	BEGIN
		SET @SQLToZero = ' UPDATE tmp_RCRebate_APIQtr_jmw SET [Q'  + cast(@startQtrCount as varchar(1)) +' API Whse Rebate] = 0.0 where   [Q'  + cast(@startQtrCount as varchar(1)) +' API Whse Rebate] is null ';
			Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_RCRebate_APIQtr_jmw SET [Q'  + cast(@startQtrCount as varchar(1)) +' API Generic Rebate%] = 0.0 where   [Q'  + cast(@startQtrCount as varchar(1)) +' API Generic Rebate%] is null ';
			Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_RCRebate_APIQtr_jmw SET [Q'  + cast(@startQtrCount as varchar(1)) +' API Brand Credits Disbursed] = 0.0 where   [Q'  + cast(@startQtrCount as varchar(1)) +' API Brand Credits Disbursed] is null ';
			Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_RCRebate_APIQtr_jmw SET [Q'  + cast(@startQtrCount as varchar(1)) +' API Accelerated Pay Discount] = 0.0 where   [Q'  + cast(@startQtrCount as varchar(1)) +' API Accelerated Pay Discount] is null ';
			Exec (@SQLToZero);
		SET @startQtrCount = @startQtrCount + 1;
	END

-- High Volume   Table
	SET @startMoCount = 0
	WHILE @startMoCount < 12
	BEGIN
		SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));
		SET @SQLToZero = ' UPDATE tmp_RCRebate_HV_jmw SET [HV Incentive ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] = 0.0 where   [HV Incentive ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] is null ';
			Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_RCRebate_HV_jmw SET [HV COG Reduction ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] = 0.0 where   [HV COG Reduction ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] is null ';
			Exec (@SQLToZero);
		SET @startMoCount = @startMoCount + 1;
	END

-- Conference   Table
	SET @startMoCount = 3
	WHILE @startMoCount < 5
	BEGIN
		SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));
		SET @SQLToZero = ' UPDATE tmp_RCRebate_Conf_jmw SET [Conf Volume ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] = 0.0 where   [Conf Volume ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] is null ';
			Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_RCRebate_Conf_jmw SET [Conf Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] = 0.0 where   [Conf Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + '] is null ';
			Exec (@SQLToZero);
		SET @startMoCount = @startMoCount + 1;
	END
 
--Leader table
	SET @startQtrCount = 1
	WHILE @startQtrCount < 5
	BEGIN
		SET @SQLToZero = ' UPDATE tmp_RCRebate_Leader_jmw SET [Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] = 0.0 where   [Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] is null ';
			Exec (@SQLToZero);
		SET @startQtrCount = @startQtrCount + 1;
	END

--MSI table
	SET @startQtrCount = 1
	WHILE @startQtrCount < 5
	BEGIN
		SET @SQLToZero = ' UPDATE tmp_RCRebate_MSI_jmw SET [Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] = 0.0 where   [Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] is null ';
			Exec (@SQLToZero);
		SET @startQtrCount = @startQtrCount + 1;
	END

-- AAP Rebate  Table
	SET @startMoCount = 0
	WHILE @startMoCount < 12
	BEGIN
		SET @moBuildDate =   (DATEADD(m,@startMoCount,@startDate));
		SET @SQLToZero = ' UPDATE tmp_RCRebate_AAP_jmw SET ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Source Sales] = 0.0 where  ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Source Sales] is null ';
			Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_RCRebate_AAP_jmw SET ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' AAP Gen Rebate] = 0.0 where  ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' AAP Gen Rebate] is null ';
			Exec (@SQLToZero);

		SET @SQLToZero = ' UPDATE tmp_RCRebate_AAP_jmw SET ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Avg%] = 0.0 where  ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Avg%] is null ';
			Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_RCRebate_AAP_jmw SET ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' HRTA%] = 0.0 where  ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' HRTA%] is null ';
			Exec (@SQLToZero);
		SET @startMoCount = @startMoCount + 1;
	END


--Update the final table with all the tmp table data
 	  
-- Update from PP table
	SET @startQtrCount = 1
	WHILE @startQtrCount < 5
	BEGIN
		SET @SQLUpdateTable = ' UPDATE final set [PP Volume ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] '+
             ' = tmp.[PP Volume ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[PP Volume ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] from tmp_RCRebate_PP_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			Exec (@SQLUpdateTable);
		SET @SQLUpdateTable = ' UPDATE final set [PP Rebate ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] '+
             ' = tmp.[PP Rebate ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[PP Rebate ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] from tmp_RCRebate_PP_jmw )tmp' +
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
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[Q'  + cast(@startQtrCount as varchar(1)) +' API Whse Rebate]  from tmp_RCRebate_APIQtr_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			Exec (@SQLUpdateTable);
		SET @SQLUpdateTable = ' UPDATE final set [Q'  + cast(@startQtrCount as varchar(1)) +' API Generic Rebate%]  '+
             ' = tmp.[Q'  + cast(@startQtrCount as varchar(1)) +' API Generic Rebate%]  ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[Q'  + cast(@startQtrCount as varchar(1)) +' API Generic Rebate%]  from tmp_RCRebate_APIQtr_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			Exec (@SQLUpdateTable);
		SET @SQLUpdateTable = ' UPDATE final set [Q'  + cast(@startQtrCount as varchar(1)) +' API Brand Credits Disbursed]  '+
             ' = tmp.[Q'  + cast(@startQtrCount as varchar(1)) +' API Brand Credits Disbursed]  ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[Q'  + cast(@startQtrCount as varchar(1)) +' API Brand Credits Disbursed]  from tmp_RCRebate_APIQtr_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			Exec (@SQLUpdateTable);
		SET @SQLUpdateTable = ' UPDATE final set [Q'  + cast(@startQtrCount as varchar(1)) +' API Accelerated Pay Discount]  '+
             ' = tmp.[Q'  + cast(@startQtrCount as varchar(1)) +' API Accelerated Pay Discount]  ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[Q'  + cast(@startQtrCount as varchar(1)) +' API Accelerated Pay Discount]  from tmp_RCRebate_APIQtr_jmw )tmp' +
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
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[HV Incentive ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  from tmp_RCRebate_HV_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			Exec (@SQLUpdateTable);

		SET @SQLUpdateTable = ' UPDATE final set [HV COG Reduction ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  '+
             ' = tmp.[HV COG Reduction ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[HV COG Reduction ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  from tmp_RCRebate_HV_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
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
			Exec (@SQLUpdateTable);

		SET @SQLUpdateTable = ' UPDATE final set [Conf Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  '+
             ' = tmp.[Conf Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[Conf Rebate ' + replace(str(datepart(month,@moBuildDate),2),' ','0')+ substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ']  from tmp_RCRebate_Conf_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			Exec (@SQLUpdateTable);
		SET @startMoCount = @startMoCount + 1;
	END
 
-- Update from Leader table
	SET @startQtrCount = 1
	WHILE @startQtrCount < 5
	BEGIN

		SET @SQLUpdateTable = ' UPDATE final set [Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +']  '+
             ' = tmp.[Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +'] + final.[Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +']   ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,[Cardinal Rebates ' + @in_year +  'Q'  + cast(@startQtrCount as varchar(1)) +']  from tmp_RCRebate_Leader_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
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
			Exec (@SQLUpdateTable);

		SET @SQLUpdateTable = ' UPDATE final set ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' AAP Gen Rebate]   '+
             ' = tmp.['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' AAP Gen Rebate]   ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' AAP Gen Rebate]   from tmp_RCRebate_AAP_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			Exec (@SQLUpdateTable);

		SET @SQLUpdateTable = ' UPDATE final set ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Avg%]   '+
             ' = tmp.['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Avg%]   ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Avg%]   from tmp_RCRebate_AAP_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
			Exec (@SQLUpdateTable);

		SET @SQLUpdateTable = ' UPDATE final set ['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' HRTA%]   '+
             ' = tmp.['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' HRTA%]   ' +
             ' FROM tmp_RCRebate_jmw final inner join (select pmid,['  + replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' HRTA%]   from tmp_RCRebate_AAP_jmw )tmp' +
             ' on final.pmid = tmp.pmid;'
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

		SET @SQL  = ' UPDATE t SET ['  +
                        replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' AAP Gen Rebate] = ' + 
                       ' ['  +
                        replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' AAP Gen Rebate] + ' + 
                       ' w.[GenericRebate], ' + 
                       ' [' +
                       replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' Avg%] =  '+ 
                       'case when w.[EffRebatePerc] is null then 0 else  (w.[EffRebatePerc] * 100) end , ' +

					 ' [' +
                       replace(str(datepart(month,@moBuildDate),2),' ','0')+ '/' + substring(cast(datepart(year,@moBuildDate) as varchar(4)),3,2) + ' HRTA%] =  '+ 
                       'case when w.[HRTA] is null then 0 else  (w.[HRTA] * 100) end , ' +

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

		SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set  [Total PP Rebate ' +@in_year +'] = ' + @SQLPPQtrRebTotal;
		EXEC (@SQLUpdateTable);
		SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set [Total API Whse Rebate ' +@in_year +'] = ' + @SQLAPIQtrWhsRebTotal;
		EXEC (@SQLUpdateTable);
		SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set [Total API Brand Credits Disbursed ' +@in_year +'] = ' + @SQLAPIQtrBCDTotal;
		EXEC (@SQLUpdateTable);
		SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set [Total API Accelerated Pay Discount ' +@in_year +'] = ' + @SQLAPIQtrAPDTotal;
		EXEC (@SQLUpdateTable);
		SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set  [Total HV Incentive ' +@in_year +']  = ' +  @SQLHVIncTotal;
		EXEC (@SQLUpdateTable);
		SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set [Total Conf Volume ' +@in_year +']  = ' + @SQLConfVolTotal;
		EXEC (@SQLUpdateTable);
		SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set [Total Conf Rebate ' +@in_year +']  = ' + @SQLConfRebTotal;
		EXEC (@SQLUpdateTable);
		SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set  [Total Cardinal Rebates ' +@in_year +']  = ' +  @SQLLeaderMSIQtrTotal;
		EXEC (@SQLUpdateTable);
		--SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set  [Total MSI AAP ' +@in_year +']  = ' +  @SQLMSIQtrTotal;
		--EXEC (@SQLUpdateTable);
		SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set   [Total CH AAP Gen Rebate ' +@in_year +']  = ' + @SQLAAPRebGenTotal;
		EXEC (@SQLUpdateTable);

	--TODO - don't know where theses are coming from yet...

		SET @SQLUpdateTable = ' UPDATE t set    [Planogram Rebate ' +@in_year +']  = v.PlanOgramRebate' +
				       ' FROM   reports..tmp_RCRebate_jmw t  ' +
                       ' inner join ( '+
                       ' SELECT SUM(PlanOgramRebate) as PlanOgramRebate ,  pmid from pharmacymaster..PM_AnnualRebates where year = ' +@in_year + 
				       '  GROUP BY   pmid '+
			           ' ) v '+
		               '  on t.pmid =v.pmid  ';
		EXEC (@SQLUpdateTable);

		--SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set [API Generic Incentive ' +@in_year +']  = ' +

		SET @SQLUpdateTable = ' UPDATE t set    [API Generic Incentive ' +@in_year +']  = v.GenericIncentive' +
				       ' FROM   reports..tmp_RCRebate_jmw t  ' +
                       ' inner join ( '+
                       ' SELECT SUM(GenericIncentive) as GenericIncentive ,  pmid from pharmacymaster..PM_AnnualRebates where year = ' +@in_year + 
				       '  GROUP BY   pmid '+
			           ' ) v '+
		               '  on t.pmid =v.pmid  ';
		 EXEC (@SQLUpdateTable);

		--SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set  [AAP Patronage Dividend ' +@in_year +']  = ' +
		SET @SQLUpdateTable = ' UPDATE t set    [AAP Patronage Dividend ' +@in_year +']  = v.PatronageDividend' +
				       ' FROM   reports..tmp_RCRebate_jmw t  ' +
                       ' inner join ( '+
                       ' SELECT SUM(PatronageDividend) as PatronageDividend ,  pmid from pharmacymaster..PM_AnnualRebates where year = ' +@in_year + 
				       '  GROUP BY   pmid '+
			           ' ) v '+
		               '  on t.pmid =v.pmid  ';
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
					EXEC (@SQLUpdateTable);

       -- Now do the ContractPerformanceRebate for Direct Pay
					SET @SQLUpdateTable = ' UPDATE t set    [Contract Performance Rebate ' +@in_year +']  =  [Contract Performance Rebate ' +@in_year +'] + v.ContractPerformanceRebate' +
				       ' FROM   reports..tmp_RCRebate_jmw t  ' +
                       ' inner join ( '+
                       ' SELECT SUM(ContractPerformanceRebate) as ContractPerformanceRebate ,  pmid from reports..import_Rebates_CAHDirect where year(date) = ' +@in_year + 
				       '  GROUP BY   pmid '+
			           ' ) v '+
		               '  on t.pmid =v.pmid  ';
					EXEC (@SQLUpdateTable);
			END

--Only do if this is 2013 - this one adds in the Contract Performance Rebate
		IF(@in_year = '2013')
		BEGIN
			SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set   [Total YTD All Rebates ' +@in_year +']  = ' +  
									' [Total PP Rebate ' +@in_year +'] + ' + 
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
			EXEC (@SQLUpdateTable);
		END
		ELSE
			BEGIN
							SET @SQLUpdateTable = ' UPDATE tmp_RCRebate_jmw set   [Total YTD All Rebates ' +@in_year +']  = ' +  
									' [Total PP Rebate ' +@in_year +'] + ' + 
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
									' [AAP Patronage Dividend ' +@in_year +']   '  ;
			EXEC (@SQLUpdateTable);
			END


 
---- Now update all the other stuff
BEGIN
	UPDATE v set
		TM = p.territory  ,
		[AAP#] = p.aapaccountno,
		[Parent#] = p.aapparentno ,
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
	FROM tmp_RCRebate_jmw v
	left join pharmacymaster..v_PM_AllWithAffiliates p on v.pmid=p.pmid


-- Now build the table where we group by territory for totals
END

END








GO
