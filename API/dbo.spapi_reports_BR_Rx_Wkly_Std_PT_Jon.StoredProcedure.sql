USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spapi_reports_BR_Rx_Wkly_Std_PT_Jon]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <02/12/2010>
-- Description:	<Aggregate ext-cost for the month by store>
-- =============================================
CREATE PROCEDURE [dbo].[spapi_reports_BR_Rx_Wkly_Std_PT_Jon]
 	(@in_month_1 varchar(20), @in_month_2 varchar(20),@in_month_3 varchar(20),
	 @in_month_4 varchar(20),@in_month_5 varchar(20),@in_month_6_cur varchar(20),
     @in_year_1 varchar(4),@in_year_2 varchar(4),@in_year_3 varchar(4),@in_year_4 varchar(4),
     @in_year_5 varchar(4),@in_year_6_cur varchar(4),@in_pay_terms varchar(4))
AS
SET NOCOUNT ON
	DECLARE @SQL varchar(6000);
    DECLARE @SQL_MONTHS varchar(500);
    DECLARE @SQL_MONTHS_SUM varchar(500);
    DECLARE @SQL_MONTHS_2 varchar(500);
    DECLARE @SQL_MONTHS_2_SUM varchar(500);
    DECLARE @SQL_PAY_TERMS varchar(500);
	DECLARE @MO_1 varchar(20);
	DECLARE @MO_2 varchar(20);
	DECLARE @MO_3 varchar(20);
    DECLARE @MO_4 varchar(20);
	DECLARE @MO_5 varchar(20);
	DECLARE @MO_6 varchar(20);
	DECLARE @MO_1_Year varchar(4);
	DECLARE @MO_2_Year varchar(4);
	DECLARE @prev_year varchar(4);
    DECLARE @usePrevYear int;
    DECLARE @TABLE varchar(20);
    DECLARE @PAY_SUFFIX varchar(10);

     -- Used For Testing
	 SET @in_month_1 = 'September'
	 SET @in_month_2 = 'October' 
	 SET @in_month_3 = 'November'
	 SET @in_month_4 = 'December'
	 SET @in_month_5 = 'January'
	 SET @in_month_6_cur = 'February'
	 SET @in_year_1 = '2009'
	 SET @in_year_2 = '2009' 
	 SET @in_year_3 = '2009'
	 SET @in_year_4 = '2009'
	 SET @in_year_5 = '2010'
	 SET @in_year_6_cur = '2010'
     SET @in_pay_terms = 'STD'
     --- End testing

    IF(@in_pay_terms = 'WKLY')
	BEGIN
		SET @SQL_PAY_TERMS = ' WHERE (aap.custpaytermsapi = ''ATA'' or ' + 
			 ' aap.custpaytermsapi = ''A10'') '  ;
        SET @TABLE = 'tmp_MO_BR_WKLY_test';
        SET @PAY_SUFFIX = ''' - Wkly ''';
    END
	ELSE
	BEGIN
		SET @SQL_PAY_TERMS = ' WHERE aap.custpaytermsapi = ''DAY'' ' ;  
        SET @TABLE = 'tmp_MO_BR_STD_test';
        SET @PAY_SUFFIX = ''' - Std ''';
	END 

    SET @usePrevYear = 0;
    IF(@in_year_6_cur != @in_year_1)
	BEGIN
		 SET @usePrevYear = 1 ;
	END

	SET @prev_year = @in_year_6_cur -1;
	SET @MO_1 =  @in_month_1 + '_br';
	SET @MO_2 =  @in_month_2 + '_br';
	SET @MO_3 =  @in_month_3 + '_br';
	SET @MO_4 =  @in_month_4 + '_br';
	SET @MO_5 =  @in_month_5 + '_br';
	SET @MO_6 =  @in_month_6_cur + '_br';


 
-- Here we set the months we need to be getting data from
	IF(@in_month_6_cur = 'June' or @in_month_6_cur = 'July' or @in_month_6_cur = 'August' or @in_month_6_cur = 'September' or 
		@in_month_6_cur = 'October' or @in_month_6_cur = 'November' or @in_month_6_cur = 'December' ) -- Starts at July - December - going back 7 months from here year is the same
		BEGIN
			SET @SQL_MONTHS_SUM = 'sum(' + @MO_1 + ') as ' + @MO_1 + ',' +
                                  'sum(' + @MO_2 + ') as ' + @MO_2 + ',' +
                                  'sum(' + @MO_3 + ') as ' + @MO_3 + ',' +
                                  'sum(' + @MO_4 + ') as ' + @MO_4 + ',' +
                                  'sum(' + @MO_5 + ') as ' + @MO_5 + ',' +
                                  'sum(' + @MO_6 + ') as ' + @MO_6 + ',' ;
           SET @SQL_MONTHS = @MO_1 + ',' + @MO_2 + ',' + @MO_3 + ',' + @MO_4 + ',' + @MO_5 + ',' + @MO_6 + ',';
		END

	IF(@in_month_6_cur = 'May') -- Starts at May (January - May will be current year - December previous year)
		BEGIN
			SET @SQL_MONTHS_2_SUM = 'sum(' + @MO_1 + ') as ' + @MO_1 + ',';

           SET @SQL_MONTHS_2 = @MO_1 + ',' ;
		   SET @SQL_MONTHS_SUM =  'sum(' + @MO_2 + ') as ' + @MO_2 + ',' +
                                  'sum(' + @MO_3 + ') as ' + @MO_3 + ',' +
                                  'sum(' + @MO_4 + ') as ' + @MO_4 + ',' +
                                  'sum(' + @MO_5 + ') as ' + @MO_5 + ',' +
                                  'sum(' + @MO_6 + ') as ' + @MO_6 + ',' ;
           SET @SQL_MONTHS =  @MO_2 + ',' + @MO_3 + ',' + @MO_4 + ',' + @MO_5 + ',' + @MO_6 + ',';
		END
	IF(@in_month_6_cur = 'April') -- Starts at April (January - April will be current year - November,December previous year)
		BEGIN
			SET @SQL_MONTHS_2_SUM = 'sum(' + @MO_1 + ') as ' + @MO_1 + ',' +
                                    'sum(' + @MO_2 + ') as ' + @MO_2 + ',' ;

           SET @SQL_MONTHS_2 = @MO_1 + ',' +  @MO_2 + ',' ;
		   SET @SQL_MONTHS_SUM =  'sum(' + @MO_3 + ') as ' + @MO_3 + ',' +
                                  'sum(' + @MO_4 + ') as ' + @MO_4 + ',' +
                                  'sum(' + @MO_5 + ') as ' + @MO_5 + ',' +
                                  'sum(' + @MO_6 + ') as ' + @MO_6 + ',' ;
           SET @SQL_MONTHS =  @MO_3 + ',' + @MO_4 + ',' + @MO_5 + ',' + @MO_6 + ',';
        END
	IF(@in_month_6_cur = 'March') -- Starts at March (January - March will be current year - October,November,December previous year)
		BEGIN
		   SET @SQL_MONTHS_2_SUM =  'sum(' + @MO_1 + ') as ' + @MO_1 + ',' +
                                    'sum(' + @MO_2 + ') as ' + @MO_2 + ',' +
                                    'sum(' + @MO_3 + ') as ' + @MO_3 + ',' ;

           SET @SQL_MONTHS_2 = @MO_1 + ',' + @MO_2 + ',' + @MO_3 + ',' ;
		   SET @SQL_MONTHS_SUM =  'sum(' + @MO_4 + ') as ' + @MO_4 + ',' +
                                  'sum(' + @MO_5 + ') as ' + @MO_5 + ',' +
                                  'sum(' + @MO_6 + ') as ' + @MO_6 + ',' ;
           SET @SQL_MONTHS =  @MO_4 + ',' + @MO_5 + ',' + @MO_6 + ',';
		END
	IF(@in_month_6_cur = 'February') -- Starts at February (January - February will be current year - September,October,November,December previous year)
		BEGIN
		   SET @SQL_MONTHS_2_SUM =  'sum(' + @MO_1 + ') as ' + @MO_1 + ',' +
                                    'sum(' + @MO_2 + ') as ' + @MO_2 + ',' +
                                    'sum(' + @MO_3 + ') as ' + @MO_3 + ',' +
                                    'sum(' + @MO_4 + ') as ' + @MO_4 + ',' ;
           SET @SQL_MONTHS_2 = @MO_1 + ',' + @MO_2 + ',' +  @MO_3 + ',' + @MO_4 + ',' ;
		   SET @SQL_MONTHS_SUM =  'sum(' + @MO_5 + ') as ' + @MO_5 + ',' +
                                  'sum(' + @MO_6 + ') as ' + @MO_6 + ',' ;
           SET @SQL_MONTHS =  @MO_5 + ',' + @MO_6 + ',';
		END
	IF(@in_month_6_cur = 'January') -- Starts at March (January  will be current year - August,September,October,November,December previous year)
		BEGIN
		   SET @SQL_MONTHS_2_SUM =  'sum(' + @MO_1 + ') as ' + @MO_1 + ',' +
                                    'sum(' + @MO_2 + ') as ' + @MO_2 + ',' +
                                    'sum(' + @MO_3 + ') as ' + @MO_3 + ',' +
                                    'sum(' + @MO_4 + ') as ' + @MO_4 + ',' +
                                    'sum(' + @MO_5 + ') as ' + @MO_5 + ',';
           SET @SQL_MONTHS_2 = @MO_1 + ',' + @MO_2 + ',' +  @MO_3 + ',' + @MO_4 + ',' + @MO_5 + ',' ;
		   SET @SQL_MONTHS_SUM =    'sum(' + @MO_6 + ') as ' + @MO_6 + ',' ;
           SET @SQL_MONTHS =   @MO_6 + ',';
		END

   



BEGIN
 
   -------- Brand Rx Weekly Pay Terms


SET @SQL = 'IF EXISTS(SELECT name FROM sys.tables ' +
			 ' WHERE name = ''' + @TABLE + ''') ' +
			 ' DROP TABLE ' + @TABLE ;
print @SQL;
EXEC (@SQL);

SET @SQL = 'SELECT * into ' + @TABLE + ' from ( ' +
	 ' SELECT aap.apiaccountno ,aap.AccountName, aap.City, aap.State,aap.Territory, ';
IF (@usePrevYear = 1)
BEGIN 
SET @SQL =  @SQL + @SQL_MONTHS_2_SUM
END	

SET @SQL =  @SQL +  + @SQL_MONTHS_SUM  +
	 ' aap.custpaytermsapi + ' + @PAY_SUFFIX + ' as [Pay Terms] ' +
	 ' from aap..pharmacymaster aap ' +
	 ' left outer join ' +
	 ' ( ' +
	 ' SELECT ' + @SQL_MONTHS + '  whaccountid from API_WHSales_Mnthly_ByType  where year =  ' + @in_year_6_cur +
	 ' ) api1 ' +
	 ' on api1.whaccountid = aap.apiaccountno ' ;
IF (@usePrevYear = 1)
BEGIN 
SET @SQL =  @SQL + 
    ' left outer join ' +
	'( ' +
	' SELECT ' + @SQL_MONTHS_2 + ' whaccountid from API_WHSales_Mnthly_ByType  where year = ' +  @prev_year +
	' ) api2 ' +
	' on api2.whaccountid = aap.apiaccountno ' ;
END
SET @SQL =  @SQL + @SQL_PAY_TERMS +
	 ' and ' + 
	 '( ' + @MO_1 + ' is not null or ' + @MO_2 + ' is not null or ' + @MO_3 + ' is not null or ' +
            @MO_4 + ' is not null or ' + @MO_5 + ' is not null or ' + @MO_6 + ' is not null) ' +
	 ' GROUP by aap.apiaccountno ,aap.AccountName, aap.City, ' +
	 ' aap.State,aap.Territory,aap.custpaytermsapi ' +
     ' ) tw ';

print @SQL;
EXEC (@SQL)
 
	SET @SQL = 'UPDATE ' + @TABLE + ' set ' + @MO_1 + ' = 0.00 where ' + @MO_1 + ' is null';
    EXEC (@SQL);
	SET @SQL = 'UPDATE ' + @TABLE + ' set ' + @MO_2 + ' = 0.00 where ' + @MO_2 + ' is null';
    EXEC (@SQL);
	SET @SQL = 'UPDATE ' + @TABLE + ' set ' + @MO_3 + ' = 0.00 where ' + @MO_3 + ' is null';
    EXEC (@SQL);
	SET @SQL = 'UPDATE ' + @TABLE + ' set ' + @MO_4 + ' = 0.00 where ' + @MO_4 + ' is null';
    EXEC (@SQL);
	SET @SQL = 'UPDATE ' + @TABLE + ' set ' + @MO_5 + ' = 0.00 where ' + @MO_5 + ' is null';
    EXEC (@SQL);
	SET @SQL = 'UPDATE ' + @TABLE + ' set ' + @MO_6 + ' = 0.00 where ' + @MO_6 + ' is null';
    EXEC (@SQL);

END
   -------- Brand Rx Standard Pay Terms

--
--IF EXISTS(SELECT name FROM sys.tables
--    WHERE name = 'tmp_MO_BR_STD')
--      DROP TABLE tmp_MO_BR_STD
--
--SELECT * into tmp_MO_BR_STD from (
--	 SELECT aap.apiaccountno as [WH Acct. No] ,aap.AccountName, aap.City, aap.State,aap.Territory,
--	 sum(august_br )  as [Aug. 2009 Brand Rx],
--	 sum(September_br )  as [Sept. 2009 Brand Rx],
--	 sum(october_br )  as [Oct. 2009 Brand Rx],
--	 sum(november_br )  as [Nov. 2009 Brand Rx],
--	 sum(december_br )  as [Dec. 2009 Brand Rx],
--	 sum(api2.january_br) as [Jan. 2010 Brand Rx], 
--	aap.custpaytermsapi + ' - Std' as [Pay Terms] 
--	 from aap..pharmacymaster aap
--	left outer join
--	(
--	SELECT august_br,September_br,october_br,november_br,december_br ,whaccountid from API_WHSales_Mnthly_ByType  where year = 2009
--	) api1
--	on api1.whaccountid = aap.apiaccountno
--	left outer join
--	(
--	SELECT january_br ,whaccountid from API_WHSales_Mnthly_ByType  where year = 2010
--	) api2
--	on api2.whaccountid = aap.apiaccountno
--	 where aap.custpaytermsapi = 'DAY' 
--	and 
--	(august_br is not null or september_br is not null or october_br is not null or november_br is not null or december_br is not null or
--	january_br is not null)
--	group by aap.apiaccountno ,aap.AccountName, aap.City,
--	 aap.State,aap.Territory,aap.custpaytermsapi 
--)ts
--
--UPDATE tmp_MO_BR_STD set [Aug. 2009 Brand Rx] = 0.00 where [Aug. 2009 Brand Rx] is null;
--UPDATE tmp_MO_BR_STD set [Sept. 2009 Brand Rx] = 0.00 where [Sept. 2009 Brand Rx] is null;
--UPDATE tmp_MO_BR_STD set [Oct. 2009 Brand Rx] = 0.00 where [Oct. 2009 Brand Rx] is null;
--UPDATE tmp_MO_BR_STD set [Nov. 2009 Brand Rx] = 0.00 where [Nov. 2009 Brand Rx] is null;
--UPDATE tmp_MO_BR_STD set [Dec. 2009 Brand Rx] = 0.00 where [Dec. 2009 Brand Rx] is null;
--UPDATE tmp_MO_BR_STD set [Jan. 2010 Brand Rx] = 0.00 where [Jan. 2010 Brand Rx] is null;
--
------------- Generic Rx Non PVA
--
--IF EXISTS(SELECT name FROM sys.tables
--    WHERE name = 'tmp_MO_GEN_Non_PVA')
--      DROP TABLE tmp_MO_GEN_Non_PVA
--
--SELECT * into tmp_MO_GEN_Non_PVA from (
--     SELECT aap.apiaccountno as [WH Acct. No] ,aap.AccountName, aap.City, aap.State,aap.Territory,
--	 sum(august_gen )  as [Aug. 2009 Generic Rx],
--	 sum(September_gen )  as [Sept. 2009 Generic Rx],
--	 sum(october_gen )  as [Oct. 2009 Generic Rx],
--	 sum(november_gen )  as [Nov. 2009 Generic Rx],
--	 sum(december_gen )  as [Dec. 2009 Generic Rx],
--	 sum(api2.january_gen) as [Jan. 2010 Generic Rx] 
--	 from aap..pharmacymaster aap
--	left outer join
--	(
--	SELECT august_gen,September_gen,october_gen,november_gen,december_gen ,whaccountid from API_WHSales_Mnthly_ByType  where year = 2009
--	) api1
--	on api1.whaccountid = aap.apiaccountno
--	left outer join
--	(
--	SELECT january_gen ,whaccountid from API_WHSales_Mnthly_ByType  where year = 2010
--	) api2
--	on api2.whaccountid = aap.apiaccountno
--	 where aap.apiaccountno is not null and
--		aap.cahstatus is null and aap.cardinaldc is null and aap.primarycaaccountno is null
--	and 
--	(august_gen is not null or September_gen is not null or october_gen is not null or november_gen is not null or december_gen is not null or
--	january_gen is not null)
--	group by aap.apiaccountno ,aap.AccountName, aap.City,
--	 aap.State,aap.Territory,aap.custpaytermsapi 
--)tp
--
--UPDATE tmp_MO_GEN_Non_PVA set [Aug. 2009 Generic Rx] = 0.00 where [Aug. 2009 Generic Rx] is null;
--UPDATE tmp_MO_GEN_Non_PVA set [Sept. 2009 Generic Rx] = 0.00 where [Sept. 2009 Generic Rx] is null;
--UPDATE tmp_MO_GEN_Non_PVA set [Oct. 2009 Generic Rx] = 0.00 where [Oct. 2009 Generic Rx] is null;
--UPDATE tmp_MO_GEN_Non_PVA set [Nov. 2009 Generic Rx] = 0.00 where [Nov. 2009 Generic Rx] is null;
--UPDATE tmp_MO_GEN_Non_PVA set [Dec. 2009 Generic Rx] = 0.00 where [Dec. 2009 Generic Rx] is null;
--UPDATE tmp_MO_GEN_Non_PVA set  [Jan. 2010 Generic Rx] = 0.00 where  [Jan. 2010 Generic Rx] is null;


 







GO
