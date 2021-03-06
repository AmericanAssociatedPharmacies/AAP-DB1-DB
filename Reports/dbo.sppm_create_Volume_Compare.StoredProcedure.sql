USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_Volume_Compare]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <05/03/2011>
-- Description:	Create table for Comparing percentage of API and Cardinal Sales to total Sales
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_Volume_Compare]
(@endDate varchar(10) )

AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @startMonth varchar(2);
	DECLARE @startCount int;
    DECLARE @startCombCount int;

	DECLARE @startCount2 int;
    DECLARE @startCombCount2 int;

	DECLARE @startCountComb int;
    DECLARE @startCombCountComb int;

    DECLARE @SQL varchar(max);
    DECLARE @SQL2 varchar(max);
    DECLARE @SQL3 varchar(max);


    DECLARE @SQLWHCol varchar(max);
    DECLARE @SQLCHCol varchar(max);
    DECLARE @SQLCombCol varchar(max);

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

	DECLARE @SQLCHBrandTotal varchar(max);
	DECLARE @SQLCHGenTotSrcTotal varchar(max);
	DECLARE @SQLCHOtherTotal varchar(max);
	DECLARE @SQLCHTotalTotal varchar(max);

	 

	DECLARE @SQLToZero varchar(max);
    DECLARE @SQLUpdateTotal varchar(max);
	DECLARE @SQLAllCol varchar(max);

	--Used to create select statement for the By Territory
	DECLARE @SQLWHColSelect varchar(max);
	DECLARE @SQLCHColSelect varchar(max);
    DECLARE @SQLMLColSelect varchar(max);
    DECLARE @SQLCombColSelect varchar(max);


  

    DECLARE @varDate varchar(20);
    DECLARE @varCombDate varchar(20);
    DECLARE @startCHDate varchar(10);
    DECLARE @mo_currYR_start int;
    DECLARE @SQLMo_Curr_YR varchar(50);
    DECLARE @SQLMo_Prev_YR varchar(50);
	DECLARE @SQLMo_Next_YR varchar(50);
    DECLARE @mo_prevYR_start int;
    DECLARE @startYR varchar(50);
    DECLARE @prevYR varchar(50);
    DECLARE @varWh_PrevYrDate  varchar(12);
    DECLARE @mo_prevYR_end int;

    DECLARE @ch_startYR varchar(50);
    DECLARE @ch_prevYR varchar(50);

    SET @startYR = year(@endDate);
    SET @prevYR = @startYR -1;

 
  
    SET @SQLWHCol = '';
    SET @SQLCHCol = '';
    SET @SQLCombCol = '';

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
	SET @SQLUpdateTotal = '';
	SET @SQLAllCol = '';

	SET @SQLWHColSelect = '';
	SET @SQLCHColSelect = '';
    SET @SQLMLColSelect = '';
    SET @SQLCombColSelect = '';

 

	SET @startMonth = cast(month(@endDate) as varchar(2)); -- Because start month and end month are the same we can you the endate month

	SET @startCount = -12;  
    SET @startCombCount = -12;  --- Here if the dates are the same we will span 13 months
 	SET @startCount2 = -12;   
	SET @startCountComb = -12;  
    SET @startCombCount2 = -12;  --- Here if the dates are the same we will span 13 months
	SET @startCombCountComb = -12;  --- Here if the dates are the same we will span 13 months
 
 
  

  --  SET @startCHDate = '01/01/' + cast(year(@ch_endDate) as varchar(4)); -- FYTD so start at 01/01 of whatever year
    SET @SQLMo_Curr_YR = '';
    SET @SQLMo_Prev_YR = '';
    SET @mo_currYR_start = 1;

     
    SET @mo_prevYR_start = month(@endDate); -- Here we use the ch becuase it will always be the earliest
    SET @mo_prevYR_end  = 12;
 
  
    -- Build the API WH Sales fields for 13 Months
	WHILE @startCount < 1
	BEGIN
		SET  @varDate = dbo.fDate1(DATEADD(m,@startCount,@endDate));
		SET @SQLWHCol = @SQLWHCol +  ' MAX([API ' + @varDate +  ' Brand])  as [API ' +@varDate + ' Brand], ';
		SET @SQLWHCol = @SQLWHCol +  ' MAX([API ' + @varDate +  ' Generic])  as [API ' + @varDate + ' Generic], ';
		SET @SQLWHCol = @SQLWHCol +  ' MAX([API ' + @varDate +  ' OTC])  as [API ' +@varDate + ' OTC], ';
		SET @SQLWHCol = @SQLWHCol +  ' MAX([API ' + @varDate +  ' Total Whse])  as [API ' + @varDate + ' Total Whse], ';
        
       	SET @SQLWHBrand = @SQLWHBrand + ' [API ' +@varDate + ' Brand], '; 
		SET @SQLWHGen = @SQLWHGen + ' [API ' + @varDate + ' Generic], ';  
		SET @SQLWHOTC = @SQLWHOTC + ' [API ' +@varDate + ' OTC], ';
		SET @SQLWHTotal = @SQLWHTotal + ' [API ' + @varDate + ' Total Whse], ';
		-- Used to calculate totals for Update below (way at bottom of code)
        SET @SQLWHBrandTotal = @SQLWHBrandTotal + ' [API ' +@varDate + ' Brand] + '; 
		SET @SQLWHGenTotal = @SQLWHGenTotal + ' [API ' + @varDate + ' Generic] + ';  
		SET @SQLWHOTCTotal = @SQLWHOTCTotal + ' [API ' +@varDate + ' OTC] + ';
		SET @SQLWHTotalTotal = @SQLWHTotalTotal + ' [API ' + @varDate + ' Total Whse] + ';

		-- Used to create select statement for By Territory
		SET @SQLWHColSelect = @SQLWHColSelect +  ' Sum([API ' + @varDate +  ' Brand])  as [API ' +@varDate + ' Brand], ';
		SET @SQLWHColSelect = @SQLWHColSelect +  ' Sum([API ' + @varDate +  ' Generic])  as [API ' + @varDate + ' Generic], ';
		SET @SQLWHColSelect = @SQLWHColSelect +  ' Sum([API ' + @varDate +  ' OTC])  as [API ' +@varDate + ' OTC], ';
		SET @SQLWHColSelect = @SQLWHColSelect +  ' Sum([API ' + @varDate +  ' Total Whse])  as [API ' + @varDate + ' Total Whse], ';

		-- Now Build the Cardinal
		 
--		SET @varDate2 =  dbo.fDate2(DATEADD(m,@startCount,@endDate));
		SET @SQLCHCol = @SQLCHCol + ' MAX([CAH ' + @varDate + ' AAP Brand])  as [CAH ' + @varDate + ' AAP Brand],';
		SET @SQLCHCol = @SQLCHCol + ' MAX([CAH ' + @varDate + ' AAP Src Generics])  as [CAH ' + @varDate + ' AAP Src Generics],';
		SET @SQLCHCol = @SQLCHCol + ' MAX([CAH ' + @varDate + ' AAP Other Sales])  as [CAH ' + @varDate + ' AAP Other Sales],';
		SET @SQLCHCol = @SQLCHCol + ' MAX([CAH ' + @varDate + ' AAP Total Sales])  as [CAH ' + @varDate + ' AAP Total Sales],';
        
		SET @SQLCHBrand = @SQLCHBrand + ' [CAH ' + @varDate + ' AAP Brand],';
		SET @SQLCHGenTotSrc = @SQLCHGenTotSrc + ' [CAH ' + @varDate + ' AAP Src Generics],';
		SET @SQLCHOther  = @SQLCHOther + '[CAH ' + @varDate + ' AAP Other Sales],';
		SET @SQLCHTotal = @SQLCHTotal + ' [CAH ' + @varDate + ' AAP Total Sales],'; 

		-- Used to calculate totals for Update below (way at bottom of code)
		SET @SQLCHBrandTotal = @SQLCHBrandTotal + ' [CAH ' + @varDate + ' AAP Brand] + ';
		SET @SQLCHGenTotSrcTotal = @SQLCHGenTotSrcTotal + ' [CAH ' + @varDate + ' AAP Src Generics] +';
		SET @SQLCHOtherTotal  = @SQLCHOtherTotal + '[CAH ' + @varDate + ' AAP Other Sales] + ';
		SET @SQLCHTotalTotal = @SQLCHTotalTotal + ' [CAH ' + @varDate + ' AAP Total Sales] + '; 

        --Used to select By Territory

		SET @SQLCHColSelect = @SQLCHColSelect + ' Sum([CAH ' + @varDate + ' AAP Brand])  as [CAH ' + @varDate + ' AAP Brand],';
		SET @SQLCHColSelect = @SQLCHColSelect + ' Sum([CAH ' + @varDate + ' AAP Src Generics])  as [CAH ' + @varDate + ' AAP Src Generics],';
		SET @SQLCHColSelect = @SQLCHColSelect + ' Sum([CAH ' + @varDate + ' AAP Other Sales])  as [CAH ' + @varDate + ' AAP Other Sales],';
		SET @SQLCHColSelect = @SQLCHColSelect + ' Sum([CAH ' + @varDate + ' AAP Total Sales])  as [CAH ' + @varDate + ' AAP Total Sales],';
 
    	SET @startCount = @startCount + 1;
	END
   -- Now take of trailing comma
       SET @SQLWHBrand = substring(@SQLWHBrand,0,len(@SQLWHBrand) );
       SET @SQLWHGen = substring(@SQLWHGen,0,len(@SQLWHGen) );
       SET @SQLWHOTC = substring(@SQLWHOTC,0,len(@SQLWHOTC) );
       SET @SQLWHTotal = substring(@SQLWHTotal,0,len(@SQLWHTotal) );

       SET @SQLWHBrandTotal = substring(@SQLWHBrandTotal,0,len(@SQLWHBrandTotal) );
       SET @SQLWHGenTotal = substring(@SQLWHGenTotal,0,len(@SQLWHGenTotal) );
       SET @SQLWHOTCTotal = substring(@SQLWHOTCTotal,0,len(@SQLWHOTCTotal) );
       SET @SQLWHTotalTotal = substring(@SQLWHTotalTotal,0,len(@SQLWHTotalTotal) );
   
       SET @SQLCHBrand = substring(@SQLCHBrand,0,len(@SQLCHBrand) );
       SET @SQLCHGenTotSrc = substring(@SQLCHGenTotSrc,0,len(@SQLCHGenTotSrc) );
       SET @SQLCHOther = substring(@SQLCHOther,0,len(@SQLCHOther) );
       SET @SQLCHTotal = substring(@SQLCHTotal,0,len(@SQLCHTotal) );

       SET @SQLCHBrandTotal = substring(@SQLCHBrandTotal,0,len(@SQLCHBrandTotal) );
       SET @SQLCHGenTotSrcTotal = substring(@SQLCHGenTotSrcTotal,0,len(@SQLCHGenTotSrcTotal) );
       SET @SQLCHOtherTotal = substring(@SQLCHOtherTotal,0,len(@SQLCHOtherTotal) );
       SET @SQLCHTotalTotal = substring(@SQLCHTotalTotal,0,len(@SQLCHTotalTotal) );

  

    --- Loop through Months to build the Combined Mnthly Sales -this uses range of WH Sales as this is the greater

	WHILE @startCombCount < 1
	BEGIN
		SET  @varCombDate = dbo.fDate1(DATEADD(m,@startCombCount,@endDate));
		SET @SQLCombCol = @SQLCombCol +  ' cast(0 as float) as [Total ' + @varCombDate +  ' Combined Mthly Sales], ';
        SET @SQLCombColSelect = @SQLCombColSelect + ' Sum([Total ' + @varCombDate + ' Combined Mthly Sales]) as [Total ' + @varCombDate + ' Combined Mthly Sales],';
		SET @startCombCount = @startCombCount + 1;
	END
     

     -- Loop through months in current year to tell which ones we need to select
 

       BEGIN
			WHILE @mo_currYR_start < = month(@endDate)
			BEGIN
			  SET @SQLMo_Curr_YR = @SQLMo_Curr_YR + cast(@mo_currYR_start as varchar(2)) + ',';
			  SET @mo_currYR_start = @mo_currYR_start + 1;
			END 
			-- Take off the last comma
			SET @SQLMo_Curr_YR = substring(@SQLMo_Curr_YR,0,len(@SQLMo_Curr_YR) );
		END


   --Loop through months in previous years - not using the commented out version - I realized the start month was same as the month of the @wh_endDate passed in
       
 
	WHILE @mo_prevYR_start < = @mo_prevYR_end
	BEGIN
		SET @SQLMo_Prev_YR = @SQLMo_Prev_YR + cast(@mo_prevYR_start as varchar(2)) + ','
		SET @mo_prevYR_start = @mo_prevYR_start + 1;
	END 
	-- Take off the last comma
	SET @SQLMo_Prev_YR = substring(@SQLMo_Prev_YR,0,len(@SQLMo_Prev_YR) )

  

	 IF EXISTS(SELECT name FROM sys.tables
		 WHERE name = 'tmp_CompareVol_jmw')
	 BEGIN
      DROP TABLE tmp_CompareVol_jmw
     END

--- Here is where the fun begins

 SET @SQL = 'SELECT * INTO tmp_CompareVol_jmw from ( ' +
	        '  SELECT  cast('''' as varchar(10)) as TM , '+
            ' PMID, ' +  
			'  cast(null as varchar(20)) as AAP# , '+
			'  cast(null as varchar(20)) as Parent# , '+
			'  cast(null as varchar(20)) as API# , '+
			'  cast(null as varchar(10)) as [AAP Eff] , '+
			'  cast(null as varchar(10)) as [AAP Quit] , '+
			'  cast(null as  varchar(200)) as Description , '+
			'  cast(null as  varchar(200)) as Affiliate , '+
            '  cast(null as varchar(20)) as [ChainCode] ,  '+
			'  cast(null as  varchar(100)) as [Account DBA Name] , '+
			'  cast(null as  varchar(100)) as [Account Corporate Name] , '+
			'  cast(null as  varchar(100)) as [Address] , '+
			'  cast(null as  varchar(100)) as [City] , '+
			'  cast(null as  varchar(100)) as ST , '+
			'  cast(null as  varchar(100)) as Contact , '+
			'  cast(null as  varchar(10)) as [Whse Acct Date Opened] , '+
			'  cast(null as  varchar(100)) as Status , '+
			'  cast(null as  varchar(100)) as Wholesaler , '+
            '  cast(null as  varchar(4)) as QPS , '+
             @SQLWHCol  + 
		    ' cast(0 as float) as [API Total Brand Sales], ' +
		    ' cast(0 as float) as [API Total Generic Sales], ' +
		    ' cast(0 as float) as [API Total OTC Sales], ' +
		    ' cast(0 as float) as [API TOTAL SALES], ' +	 
            @SQLCHCol +
		    ' cast(0 as float) as [CAH Total Brand Sales], ' +
		    ' cast(0 as float) as [CAH Total Src Generic Sales], ' +
		    ' cast(0 as float) as [CAH Total Other Sales], ' +
		    ' cast(0 as float) as [CAH TOTAL SALES], ' +
           @SQLCombCol    +
		   ' cast(0 as float) as [TOTAL COMBINED SALES] ' ;

--print @SQL


 SET @SQL2 = ' FROM ( ' +
	         '  SELECT PMID,date, ' +
		     '''API '' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' Brand'' as dateWAB,' +
		     ' sum(isnull(WHAPIBrand,0))as WHAPIBrand  , ' +
		     '''API '' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' Generic'' as dateWAG, ' +
		     ' sum(isnull(WHAPIGeneric,0))as WHAPIGeneric , ' +
		     '''API '' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' OTC'' as dateWAO, '+
		     ' sum(isnull(WHAPIOTC,0))as WHAPIOTC  , ' +
		     '''API '' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' Total Whse'' as dateWAT, '+
		     ' sum(isnull(WHAPITotal,0))as WHAPITotal , ' +
		     '''CAH ''+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' AAP Brand''    AS dateCAB , '+
		     ' sum(isnull(AAPBrand,0)) as AAPBrand, '+
		     '''CAH ''+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' AAP Src Generics''    AS dateSRCG , '+
		     ' sum(isnull(AAPGENTotalSrc,0)) as AAPGENTotalSrc, '+
		     '''CAH ''+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' AAP Other Sales''    AS dateCOS , '+
		     ' sum(isnull(AAPNetSales ,0)) - sum(isnull(AAPBrand ,0))-sum(isnull(AAPGENTotalSrc,0)) as AAPOther, '+
		     '''CAH ''+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' AAP Total Sales''    AS dateCTS , '+
		     ' sum(isnull(AAPNetSales,0)) as AAPNetSales '+
       	     ' FROM pharmacymaster..all_volume  where ( month(date) in ( ' +
             @SQLMo_Curr_YR + ')'+
             ' and year(date) = ' + @startYR + ') '+ 
			 '	 or (month(date) in ( ' +
	         @SQLMo_Prev_YR + ')' +
		     ' and year(date) =  ' + @prevYR + ')' ;
       
			SET @SQL2 = @SQL2  + ' group by PMID ,date ' +
	         ' ) as TableDate ' +


	' PIVOT ' +
	' ( '+
	' SUM(WHAPIBrand) ' +
	' FOR dateWAB IN  ( ' + @SQLWHBrand + ')' + 
	' ) as P1 ' +
	' PIVOT ' +
	' ( '+
	' SUM(WHAPIGeneric) ' +
	'  FOR dateWAG IN  ( ' + @SQLWHGen + ')' +  
	' ) as P2 ' +
	' PIVOT ' + 
	' ( '+
	'  SUM(WHAPIOTC) ' + 
	'  FOR dateWAO IN ( ' +  @SQLWHOTC + ')' +  
	' )as P3 '+
	' PIVOT ' +  
	' ( '+
	'  SUM(WHAPITotal)  ' + 
	'  FOR dateWAT IN ( ' +  @SQLWHTotal + ')' +
	' )as P4 '+
	' PIVOT ' +  
	' ( '+
	'  SUM(AAPBrand) '+
	'  FOR dateCAB IN  ( ' + @SQLCHBrand + ')' +
	' )as P5 '+

	' PIVOT ' +  
	' ( '+
	'  SUM(AAPGENTotalSrc) '+
	'  FOR dateSRCG IN ( ' +  @SQLCHGenTotSrc + ')' + 
	' )as P6 '+

	' PIVOT ' +  
	' ( '+
	'  SUM(AAPOther)  '+
	'  FOR dateCOS IN  ( ' + @SQLCHOther + ')' + 
	' )as P7  '+

	' PIVOT ' +  
	' ( '+
	'  SUM(AAPNetSales)  '+
	'  FOR dateCTS IN  ( ' +  @SQLCHTotal + ')' +   
	' )as P8 '+

	' group by PMID  '+

    ' )vol ';
print @sql2

EXEC (@SQL + @SQL2)

-- Set where null to zero so we can do  totals
-- Set Warehouse columns to zero where null
	WHILE @startCount2 < 1
	BEGIN
		SET  @varDate = dbo.fDate1(DATEADD(m,@startCount2,@endDate));
		SET @SQLToZero = ' UPDATE tmp_CompareVol_jmw SET [API ' + @varDate +  ' Brand] = 0.0 where    [API ' +@varDate + ' Brand] is null ';
        Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_CompareVol_jmw SET [API ' + @varDate +  ' Generic] = 0.0 where  [API ' + @varDate + ' Generic] is null ';
        Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_CompareVol_jmw SET [API ' + @varDate +  ' OTC] = 0.0 where [API ' +@varDate + ' OTC]  is null ';
        Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_CompareVol_jmw SET [API ' + @varDate +  ' Total Whse]= 0.0 where [API ' + @varDate + ' Total Whse] is null ';
        Exec (@SQLToZero);
 
		SET @SQLToZero = ' UPDATE tmp_CompareVol_jmw SET [CAH ' + @varDate + ' AAP Brand] = 0.0 where  [CAH ' + @varDate + ' AAP Brand] is null';
        Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_CompareVol_jmw SET [CAH ' + @varDate + ' AAP Src Generics] = 0.0 where [CAH ' + @varDate + ' AAP Src Generics] is null';
        Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_CompareVol_jmw SET [CAH ' + @varDate + ' AAP Other Sales] = 0.0 where [CAH ' + @varDate + ' AAP Other Sales] is null';
        Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_CompareVol_jmw SET [CAH ' + @varDate + ' AAP Total Sales] = 0.0 where [CAH ' + @varDate + ' AAP Total Sales] is null';
        Exec (@SQLToZero);

		SET @startCount2 = @startCount2 + 1;
	END


 
--Update the totals now
	 SET @SQLUpdateTotal = ' UPDATE tmp_CompareVol_jmw set [API Total Brand Sales] = ' + @SQLWHBrandTotal;
     Exec (@SQLUpdateTotal);
	 SET @SQLUpdateTotal = ' UPDATE tmp_CompareVol_jmw set [API Total Generic Sales] = ' + @SQLWHGenTotal;
     Exec (@SQLUpdateTotal);
     SET @SQLUpdateTotal = ' UPDATE tmp_CompareVol_jmw set [API Total OTC Sales] = ' + @SQLWHOTCTotal;
     Exec (@SQLUpdateTotal);
     SET @SQLUpdateTotal = ' UPDATE tmp_CompareVol_jmw set [API Total Sales] = ' + @SQLWHTotalTotal;
     Exec (@SQLUpdateTotal);

	 SET @SQLUpdateTotal = ' UPDATE tmp_CompareVol_jmw set [CAH Total Brand Sales] = ' + @SQLCHBrandTotal;
     Exec (@SQLUpdateTotal);
	 SET @SQLUpdateTotal = ' UPDATE tmp_CompareVol_jmw set [CAH Total Src Generic Sales] = ' + @SQLCHGenTotSrcTotal;
     Exec (@SQLUpdateTotal);
     SET @SQLUpdateTotal = ' UPDATE tmp_CompareVol_jmw set [CAH Total Other Sales] = ' + @SQLCHOtherTotal;
     Exec (@SQLUpdateTotal);
     SET @SQLUpdateTotal = ' UPDATE tmp_CompareVol_jmw set [CAH TOTAL SALES] = ' + @SQLCHTotalTotal;
     Exec (@SQLUpdateTotal);

     UPDATE tmp_CompareVol_jmw set  [TOTAL COMBINED SALES] = [API Total Sales] +  [CAH TOTAL SALES];

--Update Monthly Combined Totals for WH
   	WHILE @startCountComb < 1
	BEGIN
		SET  @varCombDate = dbo.fDate1(DATEADD(m,@startCountComb,@endDate));
		SET @SQLUpdateTotal = ' UPDATE  tmp_CompareVol_jmw set [Total ' + @varCombDate +  ' Combined Mthly Sales] =  [Total ' + @varCombDate +  ' Combined Mthly Sales] + [API ' + @varCombDate + ' Total Whse] ';
        Exec (@SQLUpdateTotal);

 
        SET @SQLUpdateTotal = ' UPDATE  tmp_CompareVol_jmw set [Total ' + @varCombDate +  ' Combined Mthly Sales] =  [Total ' + @varCombDate +  ' Combined Mthly Sales] +   [CAH ' + @varCombDate + ' AAP Total Sales]';
        Exec (@SQLUpdateTotal);
    	SET @startCountComb = @startCountComb + 1;
	END


BEGIN
--Delete these PMID's - don't know if need to - but Bruce did so I did -- DO THIS AFTER QA - easier to QA with this in

	 IF EXISTS(SELECT name FROM sys.tables
		 WHERE name = 'tmp_CompareVol_jmw_BD')
	 BEGIN
      DROP TABLE tmp_CompareVol_jmw_BD
     END

      SELECT * into tmp_CompareVol_jmw_BD from tmp_CompareVol_jmw;
	  DELETE FROM tmp_CompareVol_jmw  where pmid = 900000 or pmid < 99
  
	 -- DELETE FROM tmp_CompareVol_jmw where  [TOTAL COMBINED SALES] = 0;
      DELETE FROM tmp_CompareVol_jmw where [API TOTAL SALES] = 0 and [CAH TOTAL SALES] = 0 ;
END
-- Now update all the other stuff
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
        ChainCode = case when p.mcquitdate is null and p.chaincode is not null and p.aapquitdate is  null then p.chaincode else null end ,
		City = p.City, 
		ST = p.State ,
		Contact = (select case when ownername is null then 
			(select distinct contactfullname from pharmacymaster..v_Address_Mailing_Financials where pharmacymaster..v_Address_Mailing_Financials.pmid=p.pmid) 
			else ownername end ) ,
		 [Whse Acct Date Opened] = CONVERT(VARCHAR(10), p.dateopened, 101) ,
		Status = p.APIStatus ,
		Wholesaler = case when w.vendor is null then 'CH' else w.vendor end  ,
        QPS = case when   p.qps  = 'QPS' then 'Yes' else 'No' end  
	FROM tmp_CompareVol_jmw v
	left join pharmacymaster..v_PM_AllWithAffiliates p on v.pmid=p.pmid
	left join pharmacymaster..v_wholesaler_primary w on v.pmid=w.pmid

-- Now build the table where we group by territory for totals
END

END
 







GO
