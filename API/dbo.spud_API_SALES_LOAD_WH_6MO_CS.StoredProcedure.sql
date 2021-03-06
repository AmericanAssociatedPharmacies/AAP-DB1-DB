USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spud_API_SALES_LOAD_WH_6MO_CS]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spud_API_SALES_LOAD_WH_6MO_CS]
 (@in_month varchar(2), @in_year varchar(4))
-- @in_month is the last month of the 3 that we will be using
AS
SET NOCOUNT ON

DECLARE @SQL varchar(6000);
DECLARE @MO_1 varchar(2);
DECLARE @MO_2 varchar(2);
DECLARE @MO_3 varchar(2);
DECLARE @MO_4 varchar(2);
DECLARE @MO_5 varchar(2);
DECLARE @MO_6 varchar(2);
DECLARE @MO_1_Year varchar(4);
DECLARE @MO_2_Year varchar(4);
DECLARE @MO_3_Year varchar(4);
DECLARE @MO_4_Year varchar(4);
DECLARE @MO_5_Year varchar(4);
DECLARE @MO_6_Year varchar(4);
DECLARE @prev_year varchar(4);

SET @prev_year = @in_year -1;
SET @MO_1_Year =  @in_year;
SET @MO_2_Year =  @in_year;
SET @MO_3_Year =  @in_year;
SET @MO_4_Year =  @in_year;
SET @MO_5_Year =  @in_year;
SET @MO_6_Year =  @in_year;
 
-- Here we set the months we need to be getting data from
IF( @in_month = '01')
     BEGIN
       SET @MO_3 = '01';
       SET @MO_2 = '12';
       SET @MO_1 = '11';
       SET @MO_2_Year =  @prev_year;
       SET @MO_1_Year =  @prev_year;
     END
IF( @in_month = '02')
     BEGIN
       SET @MO_3 = '02';
       SET @MO_2 = '01';
       SET @MO_1 = '12';
       SET @MO_1_Year =  @prev_year;
     END
IF( @in_month = '03')
     BEGIN
       SET @MO_3 = '03';
       SET @MO_2 = '02';
       SET @MO_1 = '01';
     END
IF( @in_month = '04')
     BEGIN
       SET @MO_3 = '04';
       SET @MO_2 = '03';
       SET @MO_1 = '02';
     END
IF( @in_month = '05')
     BEGIN
       SET @MO_3 = '05';
       SET @MO_2 = '04';
       SET @MO_1 = '03';
     END
IF( @in_month = '06')
     BEGIN
       SET @MO_3 = '06';
       SET @MO_2 = '05';
       SET @MO_1 = '04';
     END
IF( @in_month = '07')
     BEGIN
       SET @MO_3 = '07';
       SET @MO_2 = '06';
       SET @MO_1 = '05';
     END
IF( @in_month = '08')
     BEGIN
       SET @MO_6 = '08';
       SET @MO_5 = '07';
       SET @MO_4 = '06';
       SET @MO_3 = '05';
       SET @MO_2 = '04';
       SET @MO_1 = '03';
     END
IF( @in_month = '09')
     BEGIN
       SET @MO_3 = '09';
       SET @MO_2 = '08';
       SET @MO_1 = '07';
     END
IF( @in_month = '10')
     BEGIN
       SET @MO_3 = '10';
       SET @MO_2 = '09';
       SET @MO_1 = '08';
     END
IF( @in_month = '11')
     BEGIN
       SET @MO_3 = '11';
       SET @MO_2 = '10';
       SET @MO_1 = '09';
     END
IF( @in_month = '12')
     BEGIN
       SET @MO_3 = '12';
       SET @MO_2 = '11';
       SET @MO_1 = '10';
     END
 
 
 






-- Drop temp tables
   IF EXISTS(SELECT name FROM sys.tables WHERE name = 'tmp_API_SALES_LOAD_WH_6MO')
		BEGIN
           drop table tmp_API_SALES_LOAD_WH_6MO;
        END


 

	SELECT distinct whaccountid ,
    cast('' as  varchar(50)) as DEA,
    cast(null as int) as PMID,
	cast(0.0 as numeric(38,2)) as tot_mo_1, 
	cast(0.0 as numeric(38,2)) as tot_mo_2, 
	cast(0.0 as numeric(38,2)) as tot_mo_3, 
	cast(0.0 as numeric(38,2)) as tot_mo_4, 
	cast(0.0 as numeric(38,2)) as tot_mo_5, 
	cast(0.0 as numeric(38,2)) as tot_mo_6 

	into tmp_API_SALES_LOAD_WH_6MO from v_APISalesDetail

 
-- Totals


BEGIN
	SET @SQL = 'UPDATE  ap  set ' + 	
			'ap.tot_mo_1 =   sa.Total_M1 '+ 
	   ' FROM tmp_API_SALES_LOAD_WH_6MO ap '+
	   ' inner join ' +
	   '	(  select a.whaccountid,sum(a.extsales)as Total_M1  ' +
	   '			from v_APISalesDetail a where month(a.invdate) = '''   + @MO_1 + '''   and year(a.invdate) = '''  + @MO_1_YEAR +  '''' +
	   '		group by whaccountid   ) sa ' +
	   ' on ap.whaccountid = sa.whaccountid  ';
	EXEC(@SQL)
	print(@SQL)
END

BEGIN
	SET @SQL = 'UPDATE  ap  set ' +
    		' ap.tot_mo_2 =   sa.Total_M2  ' + 
	    ' FROM tmp_API_SALES_LOAD_WH_6MO ap ' +
	    ' inner join ' +
	    '		(  select a.whaccountid,sum(a.extsales)as Total_M2 ' +
	    '			from v_APISalesDetail a where month(a.invdate) = '''   + @MO_2 + '''   and year(a.invdate) = '''  + @MO_2_YEAR +  '''' +
	    '			group by whaccountid  ) sa ' +
	    ' on ap.whaccountid = sa.whaccountid  ';
	EXEC(@SQL)
	print(@SQL)
END

BEGIN
	SET @SQL = 'UPDATE  ap  set ' +
			' ap.tot_mo_3 =   sa.Total_M3 '+ 
	    ' FROM tmp_API_SALES_LOAD_WH_6MO ap ' +
	    ' inner join ' +
	    '	(  select a.whaccountid,sum(a.extsales)as Total_M3  ' +
	    '		from v_APISalesDetail a where month(a.invdate) = '''   + @MO_3 + '''   and year(a.invdate) = '''  + @MO_3_YEAR +  '''' +
	    '		group by whaccountid  ) sa ' +
	    ' on ap.whaccountid = sa.whaccountid  ';
	EXEC(@SQL)
	print(@SQL)
END

BEGIN
	SET @SQL = 'UPDATE  ap  set ' +
			' ap.tot_mo_4 =   sa.Total_M4 '+ 
	    ' FROM tmp_API_SALES_LOAD_WH_6MO ap ' +
	    ' inner join ' +
	    '	(  select a.whaccountid,sum(a.extsales)as Total_M4  ' +
	    '		from v_APISalesDetail a where month(a.invdate) = '''   + @MO_4 + '''   and year(a.invdate) = '''  + @MO_4_YEAR +  '''' +
	    '		group by whaccountid  ) sa ' +
	    ' on ap.whaccountid = sa.whaccountid  ';
	EXEC(@SQL)
	print(@SQL)
END

BEGIN
	SET @SQL = 'UPDATE  ap  set ' +
			' ap.tot_mo_5 =   sa.Total_M5 '+ 
	    ' FROM tmp_API_SALES_LOAD_WH_6MO ap ' +
	    ' inner join ' +
	    '	(  select a.whaccountid,sum(a.extsales)as Total_M5  ' +
	    '		from v_APISalesDetail a where month(a.invdate) = '''   + @MO_5 + '''   and year(a.invdate) = '''  + @MO_5_YEAR +  '''' +
	    '		group by whaccountid  ) sa ' +
	    ' on ap.whaccountid = sa.whaccountid  ';
	EXEC(@SQL)
	print(@SQL)
END

BEGIN
	SET @SQL = 'UPDATE  ap  set ' +
			' ap.tot_mo_6 =   sa.Total_M6 '+ 
	    ' FROM tmp_API_SALES_LOAD_WH_6MO ap ' +
	    ' inner join ' +
	    '	(  select a.whaccountid,sum(a.extsales)as Total_M6  ' +
	    '		from v_APISalesDetail a where month(a.invdate) = '''   + @MO_6 + '''   and year(a.invdate) = '''  + @MO_6_YEAR +  '''' +
	    '		group by whaccountid  ) sa ' +
	    ' on ap.whaccountid = sa.whaccountid  ';
	EXEC(@SQL)
	print(@SQL)
END

BEGIN

       UPDATE  api  set 
			 DEA = pm.DEA,
             PMID = pm.PMID
	   FROM tmp_API_SALES_LOAD_WH_6MO api 
		inner join 
			(  SELECT dea,apiaccountno,pmid  from pharmacymaster..pm_pharmacy where dea is not null) pm
	   on api.whaccountid = pm.apiaccountno

	  
END



 

BEGIN

-- Drop temp tables
   IF EXISTS(SELECT name FROM sys.tables WHERE name = 'tmp_API_SALES_LOAD_WH_6MO_DEA')
		BEGIN
           drop table tmp_API_SALES_LOAD_WH_6MO_DEA;
        END
 -- Group by DEA - API has some multiple DEA's
	SELECT * into  api..tmp_API_SALES_LOAD_WH_6MO_DEA from 

   
    ( SELECT aap.pmid,p.DEA,whaccountid,
		sum(tot_mo_1) as tot_mo_1, 
		sum(tot_mo_2) as tot_mo_2,
		sum(tot_mo_3)as tot_mo_3,
        sum(tot_mo_4) as tot_mo_4, 
		sum(tot_mo_5) as tot_mo_5,
		sum(tot_mo_6)as tot_mo_6 
         from  api..tmp_API_SALES_LOAD_WH_6MO aap
		left outer join pharmacymaster..pm_pharmacy p on aap.whaccountid = p.apiaccountno
		where  aap.whaccountid  > 1000  and aap.dea not in ('DEA - DEA')  group by p.DEA,whaccountid,aap.pmid  ) ch

 
END




SET  NOCOUNT OFF




GO
