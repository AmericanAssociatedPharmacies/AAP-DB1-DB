USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_WarehouseVolume_6MO]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Report Card for Wayne
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_WarehouseVolume_6MO]
(
	@ch_endDate varchar(10)
)
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	
	DECLARE @chStartMonth varchar(2);
	DECLARE @startCHCount int;
	DECLARE @startWHCount int;
    DECLARE @startMLCount int;
	DECLARE @startCPCount int;
    DECLARE @startRXCount int;
    DECLARE @startCombCount int;

	DECLARE @startCHCount2 int;
	DECLARE @startWHCount2 int;
    DECLARE @startMLCount2 int;
	DECLARE @startCPCount2 int;
    DECLARE @startRXCount2 int;
    DECLARE @startCombCount2 int;

	DECLARE @startCHCountComb int;
	DECLARE @startWHCountComb int;
    DECLARE @startMLCountComb int;
	DECLARE @startCPCountComb int;
	DECLARE @startRXCountComb int;
    DECLARE @startCombCountComb int;

    DECLARE @SQL varchar(max);
    DECLARE @SQL2 varchar(max);
    DECLARE @SQL3 varchar(max);

	DECLARE @SQLUpdateTable varchar(max);

    DECLARE @SQLWHCol varchar(max);
    DECLARE @SQLCHCol varchar(max);
    DECLARE @SQLMLCol varchar(max);
	DECLARE @SQLCPCol varchar(max);
	DECLARE @SQLRXCol varchar(max);
    DECLARE @SQLCombCol varchar(max);
	DECLARE @SQLCPColTblCol varchar(max);
	DECLARE @SQLRxColTblCol varchar(max);

	DECLARE @SQLWHBrand varchar(max);
	DECLARE @SQLWHGen varchar(max);
	DECLARE @SQLWHOTC varchar(max);
	DECLARE @SQLWHTotal varchar(max);

	DECLARE @SQLWHBrandTotal varchar(max);
	DECLARE @SQLWHGenTotal varchar(max);
	DECLARE @SQLWHOTCTotal varchar(max);
	DECLARE @SQLWHTotalTotal varchar(max);

	DECLARE @SQLCHBrand varchar(max);
	DECLARE @SQLCHGenTotSrc varchar(max);
	DECLARE @SQLCHOther varchar(max);
	DECLARE @SQLCHTotal varchar(max);

    DECLARE @SQLMLTOtal varchar(max);

	DECLARE @SQLCPAmountTotal varchar(max);
	DECLARE @SQLCPAmountTotalTotal varchar(max);

	DECLARE @SQLCPPercTotal varchar(max);
	DECLARE @SQLCPPercTotalTotal varchar(max);
	DECLARE @SQLRxAmountTotal varchar(max);
	DECLARE @SQLRxAmountTotalTotal varchar(max);
    DECLARE @SQLRxCountTotal varchar(max);
    DECLARE @SQLRxCountTotalTotal varchar(max);

	DECLARE @SQLCHBrandTotal varchar(max);
	DECLARE @SQLCHGenTotSrcTotal varchar(max);
	DECLARE @SQLCHOtherTotal varchar(max);
	DECLARE @SQLCHTotalTotal varchar(max);

	DECLARE @SQLMLTOtalTotal varchar(max);

	DECLARE @SQLToZero varchar(max);
    DECLARE @SQLUpdateTotal varchar(max);
	DECLARE @SQLAllCol varchar(max);

    DECLARE @varWHDate varchar(20);
    DECLARE @varPrevYrDate datetime;
    DECLARE @varCHDate varchar(20);
    DECLARE @varCHDate2 varchar(20);
    DECLARE @varMLDate varchar(20);
	DECLARE @varCPDate varchar(20);
	DECLARE @varRXDate varchar(20);
    DECLARE @varCombDate varchar(20);
    DECLARE @startCHDate varchar(10);
    DECLARE @mo_currYR_start int;
    DECLARE @SQLMo_Curr_YR varchar(50);
    DECLARE @SQLMo_Prev_YR varchar(50);
	DECLARE @SQLMo_Next_YR varchar(50);
    DECLARE @mo_prevYR_start int;
    DECLARE @mo_prevYR_end int;

    DECLARE @ch_startYR varchar(50);
    DECLARE @ch_prevYR varchar(50);

    SET @ch_startYR = year(@ch_endDate);
    SET @ch_prevYR = @ch_startYR -1;
  
	SET @SQLUpdateTable = '';
    SET @SQLWHCol = '';
    SET @SQLCHCol = '';
    SET @SQLMLCol = '';
    SET @SQLCombCol = '';
	SET @SQLCPCol = '';
	SET @SQLRxCol = '';

	SET @SQLCPColTblCol = '';
	SET @SQLRxColTblCol = '';

	SET @SQLWHBrand = '';  
	SET @SQLWHGen = '';  
	SET @SQLWHOTC = '';
	SET @SQLWHTotal = '';
	SET @SQLCHBrand = '';
	SET @SQLCHGenTotSrc = '';
	SET @SQLCHOther  = '';
	SET @SQLCHTotal = '';
	SET @SQLMLTOtal  = '';

	SET @SQLWHBrandTotal = '';  
	SET @SQLWHGenTotal = '';  
	SET @SQLWHOTCTotal = '';
	SET @SQLWHTotalTotal = '';
	SET @SQLCHBrandTotal = '';
	SET @SQLCHGenTotSrcTotal = '';
	SET @SQLCHOtherTotal  = '';
	SET @SQLCHTotalTotal = '';
	SET @SQLMLTOtalTotal  = '';
	SET @SQLUpdateTotal = '';
	SET @SQLAllCol = '';

	SET @SQLCPAmountTotal = '';
	SET @SQLRxAmountTotal = '';
    SET @SQLRxCountTotal = '';
	SET @SQLCPPercTotal = '';

	SET @SQLCPAmountTotalTotal = '';
	SET @SQLRxAmountTotalTotal = '';
    SET @SQLRxCountTotalTotal = '';

 

	SET @chStartMonth = cast(month(@ch_endDate) as varchar(2)); -- Because start month and end month are the same we can you the endate month
	SET @startCHCount = -5;  
    SET @startMLCount = -5; 
	SET @startWHCount = -5;
    SET @startCPCount = -5;
    SET @startRxCount = -5;
    --- Here if the dates are the same we will span 6 months
    
   SET @startCombCount = -5;  --- Here if the dates are the same we will span 6 months

	SET @startCHCount2 = -5;  
    SET @startMLCount2 = -5; 
	SET @startWHCount2 = -5;
   --- Here if the dates are the same we will span 6 months
 
   SET @startCombCount2 = -5;  --- Here if the dates are the same we will span 6 months

	SET @startCHCountComb = -5;  
    SET @startMLCountComb = -5; 
	SET @startWHCountComb = -5;
      --- Here if the dates are the same we will span 6 months
 
   SET @startCombCountComb = -5;  --- Here if the dates are the same we will span 6 months
 

    SET @SQLMo_Curr_YR = '';
    SET @SQLMo_Prev_YR = '';
    SET @mo_currYR_start = 1;

    SET  @varWHDate =   month(DATEADD(m,-5,@ch_endDate) );
    SET @mo_prevYR_start =  @varWHDate  -- Here we use the ch becuase it will always be the earliest
    SET @mo_prevYR_end  = 12;
 
  
    -- Build the API WH Sales fields for 6 Months
	WHILE @startWHCount < 1
	BEGIN
		SET  @varWHDate = dbo.fDate1(DATEADD(m,@startWHCount,@ch_endDate));
--		SET @SQLWHCol = @SQLWHCol +  ' MAX([API ' + @varWHDate +  ' Brand])  as [API ' +@varWHDate + ' Brand], ';
--		SET @SQLWHCol = @SQLWHCol +  ' MAX([API ' + @varWHDate +  ' Generic])  as [API ' + @varWHDate + ' Generic], ';
--		SET @SQLWHCol = @SQLWHCol +  ' MAX([API ' + @varWHDate +  ' OTC])  as [API ' +@varWHDate + ' OTC], ';
		SET @SQLWHCol = @SQLWHCol +  ' MAX([API ' + @varWHDate +  ' Total Whse])  as [API ' + @varWHDate + ' Total Whse], ';
--        
--       	SET @SQLWHBrand = @SQLWHBrand + ' [API ' +@varWHDate + ' Brand], '; 
--		SET @SQLWHGen = @SQLWHGen + ' [API ' + @varWHDate + ' Generic], ';  
--		SET @SQLWHOTC = @SQLWHOTC + ' [API ' +@varWHDate + ' OTC], ';
    	SET @SQLWHTotal = @SQLWHTotal + ' [API ' + @varWHDate + ' Total Whse], ';
--		-- Used to calculate totals for Update below (way at bottom of code)
--        SET @SQLWHBrandTotal = @SQLWHBrandTotal + ' [API ' +@varWHDate + ' Brand] + '; 
--		SET @SQLWHGenTotal = @SQLWHGenTotal + ' [API ' + @varWHDate + ' Generic] + ';  
--		SET @SQLWHOTCTotal = @SQLWHOTCTotal + ' [API ' +@varWHDate + ' OTC] + ';
--		SET @SQLWHTotalTotal = @SQLWHTotalTotal + ' [API ' + @varWHDate + ' Total Whse] + ';


    	SET @startWHCount = @startWHCount + 1;
	END
   -- Now take of trailing comma
--       SET @SQLWHBrand = substring(@SQLWHBrand,0,len(@SQLWHBrand) );
--       SET @SQLWHGen = substring(@SQLWHGen,0,len(@SQLWHGen) );
--       SET @SQLWHOTC = substring(@SQLWHOTC,0,len(@SQLWHOTC) );
       SET @SQLWHTotal = substring(@SQLWHTotal,0,len(@SQLWHTotal) );
        SET @SQLWHCol = substring(@SQLWHCol,0,len(@SQLWHCol) );

 
  
 



    --- Loop through Months to build the Combined Mnthly Sales  

	WHILE @startCombCount < 1
	BEGIN
		SET  @varCombDate = dbo.fDate1(DATEADD(m,@startCombCount,@ch_endDate));
		SET @SQLCombCol = @SQLCombCol +  ' cast(0 as float) as [Total ' + @varCombDate +  ' Combined Mthly Sales], ';
		SET @startCombCount = @startCombCount + 1;
	END


     -- Loop through months in current year to tell which ones we need to select (for the in statement in the SQL)
        
       BEGIN
			WHILE @mo_currYR_start < = month(@ch_endDate)
			BEGIN
			  SET @SQLMo_Curr_YR = @SQLMo_Curr_YR + cast(@mo_currYR_start as varchar(2)) + ',';
			  SET @mo_currYR_start = @mo_currYR_start + 1;
			END 
			-- Take off the last comma
			SET @SQLMo_Curr_YR = substring(@SQLMo_Curr_YR,0,len(@SQLMo_Curr_YR) );
		END


   --Loop through months in previous years - not using the commented out version  
       
 
	WHILE @mo_prevYR_start < = @mo_prevYR_end
	BEGIN
		SET @SQLMo_Prev_YR = @SQLMo_Prev_YR + cast(@mo_prevYR_start as varchar(2)) + ','
		SET @mo_prevYR_start = @mo_prevYR_start + 1;
	END 
	-- Take off the last comma
	SET @SQLMo_Prev_YR = substring(@SQLMo_Prev_YR,0,len(@SQLMo_Prev_YR) )

  

	 IF EXISTS(SELECT name FROM sys.tables
		 WHERE name = 'tmp_WHVol_6mo')
	 BEGIN
      DROP TABLE tmp_WHVol_6mo
     END

--- Here is where the fun begins

 SET @SQL = 'SELECT * INTO tmp_WHVol_6mo from ( ' +
            '  SELECT PMID, ' +  
	        '    cast (null as varchar(50)) as TM , '+
            
			'  cast (null as varchar(50)) as  Acct# , '+
			'  cast(null as  varchar(250)) as [Pharmacy Name] , '+
	  	    '  cast(null as  varchar(100)) as City , '+
			'   cast(null as  varchar(100)) as ST , '+
			'  cast(null as  varchar(100)) as ZIP , '+
			 
             @SQLWHCol ;
	 

 print @SQL


 SET @SQL2 = ' FROM ( ' +
	          '  SELECT v.PMID,date, ' +
 
 
		     '''API '' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' Total Whse'' as dateWAT, '+
		     ' sum(isnull(WHAPITotal,0))as WHAPITotal  ' +
 

       	  --   ' FROM pharmacymaster..all_volume  where PMID in (select PMID from tmp_warehouse_MM where PMID is not null ) and( month(date) in ( ' +
           ' FROM pharmacymaster..all_volume v join  tmp_warehouse_MM t on v.pmid= t.pmid   where ( month(date) in ( ' +
             @SQLMo_Curr_YR + ')'+
             ' and year(date) = ' + @ch_startYR + ') '+ 
			 '	 or (month(date) in ( ' +
	         @SQLMo_Prev_YR + ')' +
		     ' and year(date) =  ' + @ch_prevYR + ')  ' ;
         
			SET @SQL2 = @SQL2  + ' group by v.PMID ,date ' +
	       ' ) as TableDate ' +
 

 
	' PIVOT ' +  
	' ( '+
	'  SUM(WHAPITotal)  ' + 
 	'  FOR dateWAT IN ( ' +  @SQLWHTotal + ')' +
 
	' )as P4 '+
 
	 ' group by  PMID  '+
  

    ' )vol ';
--print @sql2
print @SQL2;
EXEC (@SQL + @SQL2)

--Set to Zero where null

	WHILE @startWHCount2 < 1
	BEGIN
		SET  @varWHDate = dbo.fDate1(DATEADD(m,@startWHCount2,@ch_endDate));
		SET @SQLToZero = ' UPDATE tmp_WHVol_6mo SET [API ' + @varWHDate +  ' Total Whse]= 0.0 where [API ' + @varWHDate + ' Total Whse] is null ';
        Exec (@SQLToZero);

		SET @startWHCount2 = @startWHCount2 + 1;
	END

-- Now update all the other stuff
BEGIN
	UPDATE v set
		TM = p.TM  ,
		[Acct#] = p.Acct# ,
		[Pharmacy Name] = p.[Pharmacy Name],
		City = p.City, 
		ST = p.ST ,
		Zip = p.Zip
  
	FROM tmp_WHVol_6mo v
	left join tmp_warehouse_MM p on v.pmid=p.pmid
 
 



-- add in ones not in PM yet
END
-- add back on ones not in all_volume
insert into tmp_WHVol_6mo  (PMID,TM,Acct#,[Pharmacy Name],City,ST,Zip  )
 select PMID,TM,Acct#,[Pharmacy Name],City,ST,Zip from tmp_warehouse_MM where pmid not in (select pmid from tmp_WHVol_6mo) 
insert into tmp_WHVol_6mo  ( TM,Acct#,[Pharmacy Name],City,ST,Zip  )
 select  TM,Acct#,[Pharmacy Name],City,ST,Zip from tmp_warehouse_MM where acct# in ('10041010','10147979')
--UPDATE tmp_WHVol_6mo SET [API Oct 12 Total Whse]= 0.0 where [API Oct 12 Total Whse] is null
SET @startWHCount2 = -5; 
--Set to Zero where null

	WHILE @startWHCount2 < 1
	BEGIN
		SET  @varWHDate = dbo.fDate1(DATEADD(m,@startWHCount2,@ch_endDate));
		SET @SQLToZero = ' UPDATE tmp_WHVol_6mo SET [API ' + @varWHDate +  ' Total Whse]= 0.0 where [API ' + @varWHDate + ' Total Whse] is null ';
        Exec (@SQLToZero);

		SET @startWHCount2 = @startWHCount2 + 1;
	END
END








GO
