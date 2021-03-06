USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spud_API_SALES_LOAD_SLX_AAP_BKP_121510]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spud_API_SALES_LOAD_SLX_AAP_BKP_121510]
 (@in_month varchar(2), @in_year varchar(4))
-- @in_month is the last month of the 3 that we will be using
AS
SET NOCOUNT ON

DECLARE @SQL varchar(6000);
DECLARE @MO_1 varchar(2);
DECLARE @MO_2 varchar(2);
DECLARE @MO_3 varchar(2);
DECLARE @MO_1_Year varchar(4);
DECLARE @MO_2_Year varchar(4);
DECLARE @MO_3_Year varchar(4);
DECLARE @prev_year varchar(4);

SET @prev_year = @in_year -1;
SET @MO_1_Year =  @in_year;
SET @MO_2_Year =  @in_year;
SET @MO_3_Year =  @in_year;
 
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
       SET @MO_3 = '08';
       SET @MO_2 = '07';
       SET @MO_1 = '06';
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
   IF EXISTS(SELECT name FROM sys.tables WHERE name = 'tmp_API_SALES_LOAD_SLX_AAP')
		BEGIN
           drop table tmp_API_SALES_LOAD_SLX_AAP;
        END


 

	SELECT distinct whaccountid ,
    cast('' as  varchar(50)) as DEA,
    cast(null as int) as PMID,
	cast(0.0 as numeric(38,2)) as tot_mo_1, 
	cast(0.0 as numeric(38,2)) as tot_mo_2, 
	cast(0.0 as numeric(38,2)) as tot_mo_3, 
	cast(0.0 as numeric(38,2)) as gen_mo_1, 
	cast(0.0 as numeric(38,2)) as gen_mo_2, 
	cast(0.0 as numeric(38,2)) as gen_mo_3, 
	cast(0.0 as numeric(38,2)) as br_mo_1, 
	cast(0.0 as numeric(38,2)) as br_mo_2, 
	cast(0.0 as numeric(38,2)) as br_mo_3,
	cast(0.0 as numeric(38,2)) as otc_mo_1, 
	cast(0.0 as numeric(38,2)) as otc_mo_2, 
	cast(0.0 as numeric(38,2)) as otc_mo_3,
	cast(0.0 as numeric(38,2)) as tot_avg_3_mo, 
	cast(0.0 as numeric(38,2)) as gen_avg_3_mo,
	cast(0.0 as numeric(38,2)) as br_avg_3_mo,
	cast(0.0 as numeric(38,2)) as otc_avg_3_mo 
	into tmp_API_SALES_LOAD_SLX_AAP from v_APISalesDetail

 
-- Totals


BEGIN
	SET @SQL = 'UPDATE  ap  set ' + 	
			'ap.tot_mo_1 =   sa.Total_M1 '+ 
	   ' FROM tmp_API_SALES_LOAD_SLX_AAP ap '+
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
	    ' FROM tmp_API_SALES_LOAD_SLX_AAP ap ' +
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
	    ' FROM tmp_API_SALES_LOAD_SLX_AAP ap ' +
	    ' inner join ' +
	    '	(  select a.whaccountid,sum(a.extsales)as Total_M3  ' +
	    '		from v_APISalesDetail a where month(a.invdate) = '''   + @MO_3 + '''   and year(a.invdate) = '''  + @MO_3_YEAR +  '''' +
	    '		group by whaccountid  ) sa ' +
	    ' on ap.whaccountid = sa.whaccountid  ';
	EXEC(@SQL)
	print(@SQL)
END

-- Generic Totals
BEGIN
	SET @SQL = 'UPDATE  ap  set ' +
			' ap.gen_mo_1 =   sa.GEN_M1 ' + 
	    ' FROM tmp_API_SALES_LOAD_SLX_AAP  ap ' +
	    ' inner join ' +
		'	(  select a.whaccountid,sum(a.extsales)as GEN_M1   ' +
		'	from v_APISalesDetail a where month(a.invdate) = '''   + @MO_1 + '''   and year(a.invdate) = '''  + @MO_1_YEAR +  ''' and type = ''Generic''' +
		'		group by whaccountid ) sa ' +
	    ' on ap.whaccountid = sa.whaccountid  ' ;
	EXEC(@SQL)
	print(@SQL)
END

BEGIN
	SET @SQL = 'UPDATE  ap  set ' +
			' ap.gen_mo_2 =   sa.GEN_M2 ' + 
	   ' FROM tmp_API_SALES_LOAD_SLX_AAP  ap ' +
	   ' inner join ' +
	   '	(  select a.whaccountid,sum(a.extsales)as GEN_M2   ' +
	   '		from v_APISalesDetail a where month(a.invdate) = '''   + @MO_2 + '''   and year(a.invdate) = '''  + @MO_2_YEAR +  ''' and type = ''Generic''' +
	   '		group by whaccountid  ) sa ' +
	   ' on ap.whaccountid = sa.whaccountid  ';
	EXEC(@SQL)
	print(@SQL)
END

BEGIN
	SET @SQL = 'UPDATE  ap  set ' +
			' ap.gen_mo_3 =   sa.GEN_M3 ' + 
	   ' FROM tmp_API_SALES_LOAD_SLX_AAP  ap ' +
	   ' inner join ' +
	   '	(  select a.whaccountid,sum(a.extsales)as GEN_M3   ' +
	   '		from v_APISalesDetail a where month(a.invdate) = '''   + @MO_3 + '''   and year(a.invdate) = '''  + @MO_3_YEAR +  ''' and type = ''Generic''' +
	   '		group by whaccountid  ) sa '+
	   ' on ap.whaccountid = sa.whaccountid  ';
	EXEC(@SQL)
	print(@SQL)
END

-- BRAND
BEGIN
    SET @SQL = 'UPDATE  ap  set '+
			' ap.br_mo_1 =   sa.BR_M1 '+ 
	   ' FROM tmp_API_SALES_LOAD_SLX_AAP ap '+
	   ' inner join '+
	   '	(  select a.whaccountid,sum(a.extsales)as BR_M1   '+
	   '		from v_APISalesDetail a where month(a.invdate) = '''   + @MO_1 + '''   and year(a.invdate) = '''  + @MO_1_YEAR +  ''' and type = ''Brand''' +
	   '		group by whaccountid  ) sa '+
	   ' on ap.whaccountid = sa.whaccountid  ';
    EXEC(@SQL)
	print(@SQL)
END

BEGIN
	SET @SQL = 'UPDATE  ap  set '+
			' ap.br_mo_2 =   sa.BR_M2 '+ 
	   ' FROM tmp_API_SALES_LOAD_SLX_AAP ap '+
	   ' inner join '+
	   '	(  select a.whaccountid,sum(a.extsales)as BR_M2  '+
	   '		from v_APISalesDetail a where month(a.invdate) = '''   + @MO_2 + '''   and year(a.invdate) = '''  + @MO_2_YEAR +  ''' and type = ''Brand''' +
	   '		group by whaccountid  ) sa '+
	   ' on ap.whaccountid = sa.whaccountid  ';
	EXEC(@SQL)
	print(@SQL)
END

BEGIN
	SET @SQL = 'UPDATE  ap  set '+
			' ap.br_mo_3 =   sa.BR_M3 '+ 
	   ' FROM tmp_API_SALES_LOAD_SLX_AAP ap '+
	   ' inner join '+
	   '	(  select a.whaccountid,sum(a.extsales)as BR_M3   '+
	   '		from v_APISalesDetail a where month(a.invdate) =  '''   + @MO_3 + '''   and year(a.invdate) = '''  + @MO_3_YEAR +  ''' and type = ''Brand''' +
	   '		group by whaccountid  ) sa '+
	   ' on ap.whaccountid = sa.whaccountid  ';
	EXEC(@SQL)
	print(@SQL)
END

-- OTC
BEGIN
    SET @SQL = 'UPDATE  ap  set '+
			' ap.otc_mo_1 =   sa.OTC_M1 '+ 
	   ' FROM tmp_API_SALES_LOAD_SLX_AAP ap '+
	   ' inner join '+
	   '	(  select a.whaccountid,sum(a.extsales)as OTC_M1   '+
	   '		from v_APISalesDetail a where month(a.invdate) = '''   + @MO_1 + '''   and year(a.invdate) = '''  + @MO_1_YEAR +  ''' and type = ''OTC''' +
	   '	group by whaccountid  ) sa '+
	   ' on ap.whaccountid = sa.whaccountid  ';
	EXEC(@SQL)
	print(@SQL)
END
BEGIN
	SET @SQL = 'UPDATE  ap  set '+
			' ap.otc_mo_2 =   sa.OTC_M2 '+ 
	   ' FROM tmp_API_SALES_LOAD_SLX_AAP ap '+
	   ' inner join '+
	   '	(  select a.whaccountid,sum(a.extsales)as OTC_M2  '+
	   '		from v_APISalesDetail a where month(a.invdate) = '''   + @MO_2 + '''   and year(a.invdate) = '''  + @MO_2_YEAR +  ''' and type = ''OTC''' +
	   '		group by whaccountid  ) sa '+
	   ' on ap.whaccountid = sa.whaccountid  ';
	EXEC(@SQL)
	print(@SQL)
END

BEGIN
	SET @SQL = 'UPDATE  ap  set '+
			' ap.otc_mo_3 =   sa.OTC_M3 '+ 
	   ' FROM tmp_API_SALES_LOAD_SLX_AAP ap '+
	   ' inner join '+
	   '	(  select a.whaccountid,sum(a.extsales)as OTC_M3   '+
	   '		from v_APISalesDetail a where month(a.invdate) = '''   + @MO_3 + '''   and year(a.invdate) = '''  + @MO_3_YEAR +  ''' and type = ''OTC''' +
	   '		group by whaccountid  ) sa '+
	   ' on ap.whaccountid = sa.whaccountid ';
	EXEC(@SQL)
	print(@SQL)
END

BEGIN

       UPDATE  api  set 
			 DEA = pm.DEA,
             PMID = pm.PMID
	   FROM tmp_API_SALES_LOAD_SLX_AAP api 
		inner join 
			(  SELECT dea,apiaccountno,pmid  from pharmacymaster..pm_pharmacy where dea is not null) pm
	   on api.whaccountid = pm.apiaccountno

	  
END

BEGIN
-- Backup table before Deletes and changes for Chriss


       IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_API_SALES_LOAD_SLX_AAP_BD')
          DROP TABLE tmp_API_SALES_LOAD_SLX_AAP_BD

		SELECT * into tmp_API_SALES_LOAD_SLX_AAP_BD from tmp_API_SALES_LOAD_SLX_AAP
END
BEGIN
--TO DO Need to somehow combine DEA's FJ1782691 and AM6944361 - this is whaccountids '01020099'and '01023426' (this is new one)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_1 = otc_mo_1 + (select otc_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where dea = ''AM6944361'')
	where dea = ''FJ1782691''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_2 = otc_mo_2 + (select otc_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where dea = ''AM6944361'')
	where dea = ''FJ1782691''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_3 = otc_mo_3 + (select otc_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where dea = ''AM6944361'')
	where dea = ''FJ1782691''';
EXEC(@SQL)


SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_1 = br_mo_1 + (select br_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where dea = ''AM6944361'')
	where dea = ''FJ1782691''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_2 = br_mo_2 + (select br_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where dea = ''AM6944361'')
	where dea = ''FJ1782691''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_3 = br_mo_3 + (select br_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where dea = ''AM6944361'')
	where dea = ''FJ1782691''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_1 = gen_mo_1 + (select gen_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where dea = ''AM6944361'')
	where dea = ''FJ1782691''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_2 = gen_mo_2 + (select gen_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where dea = ''AM6944361'')
	where dea = ''FJ1782691''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_3 = gen_mo_3 + (select gen_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where dea = ''AM6944361'')
	where dea = ''FJ1782691''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_1 = tot_mo_1 + (select tot_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where dea = ''AM6944361'')
	where dea = ''FJ1782691''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_2 = tot_mo_2 + (select tot_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where dea = ''AM6944361'')
	where dea = ''FJ1782691''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_3 = tot_mo_3 + (select tot_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where dea = ''AM6944361'')
	where dea = ''FJ1782691''';
EXEC(@SQL)
END
 
BEGIN
--NOW DELETE whaccountid 32196545 from tmp_API_SALES_LOAD_SLX_AAP
SET @SQL = 'Delete from tmp_API_SALES_LOAD_SLX_AAP where dea = ''AM6944361''';
EXEC(@SQL)
END

BEGIN
--TO DO Need to   combine apiaccountno 32196544 and 32196545
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_1 = otc_mo_1 + (select otc_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''32196545'')
	where whaccountid = ''32196544''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_2 = otc_mo_2 + (select otc_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''32196545'')
	where whaccountid = ''32196544''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_3 = otc_mo_3 + (select otc_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''32196545'')
	where whaccountid = ''32196544''';
EXEC(@SQL)


SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_1 = br_mo_1 + (select br_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''32196545'')
	where whaccountid = ''32196544''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_2 = br_mo_2 + (select br_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''32196545'')
	where whaccountid = ''32196544''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_3 = br_mo_3 + (select br_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''32196545'')
	where whaccountid = ''32196544''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_1 = gen_mo_1 + (select gen_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''32196545'')
	where whaccountid = ''32196544''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_2 = gen_mo_2 + (select gen_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''32196545'')
	where whaccountid = ''32196544''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_3 = gen_mo_3 + (select gen_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''32196545'')
	where whaccountid = ''32196544''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_1 = tot_mo_1 + (select tot_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''32196545'')
	where whaccountid = ''32196544''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_2 = tot_mo_2 + (select tot_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''32196545'')
	where whaccountid = ''32196544''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_3 = tot_mo_3 + (select tot_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''32196545'')
	where whaccountid = ''32196544''';
EXEC(@SQL) 

--NOW DELETE whaccountid 32196545 from tmp_API_SALES_LOAD_SLX_AAP
SET @SQL = 'Delete from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''32196545''';
EXEC(@SQL)
END


BEGIN
--TO DO Need to   combine apiaccountno 03130864 and 03130863 - 03130864 is the one in SLX
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_1 = otc_mo_1 + (select otc_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03130863'')
	where whaccountid = ''03130864''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_2 = otc_mo_2 + (select otc_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03130863'')
	where whaccountid = ''03130864''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_3 = otc_mo_3 + (select otc_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03130863'')
	where whaccountid = ''03130864''';
EXEC(@SQL)


SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_1 = br_mo_1 + (select br_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03130863'')
	where whaccountid = ''03130864''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_2 = br_mo_2 + (select br_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03130863'')
	where whaccountid = ''03130864''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_3 = br_mo_3 + (select br_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03130863'')
	where whaccountid = ''03130864''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_1 = gen_mo_1 + (select gen_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03130863'')
	where whaccountid = ''03130864''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_2 = gen_mo_2 + (select gen_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03130863'')
	where whaccountid = ''03130864''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_3 = gen_mo_3 + (select gen_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03130863'')
	where whaccountid = ''03130864''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_1 = tot_mo_1 + (select tot_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03130863'')
	where whaccountid = ''03130864''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_2 = tot_mo_2 + (select tot_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03130863'')
	where whaccountid = ''03130864''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_3 = tot_mo_3 + (select tot_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03130863'')
	where whaccountid = ''03130864''';
EXEC(@SQL) 

--NOW DELETE whaccountid 03130863 from tmp_API_SALES_LOAD_SLX_AAP
SET @SQL = 'Delete from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03130863''';
EXEC(@SQL)
END



BEGIN
--TO DO Need to   combine apiaccountno 03163003 and 03163000 - 03163003 is the one in SLX
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_1 = otc_mo_1 + (select otc_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03163000'')
	where whaccountid = ''03163003''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_2 = otc_mo_2 + (select otc_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03163000'')
	where whaccountid = ''03163003''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_3 = otc_mo_3 + (select otc_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03163000'')
	where whaccountid = ''03163003''';
EXEC(@SQL)


SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_1 = br_mo_1 + (select br_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03163000'')
	where whaccountid = ''03163003''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_2 = br_mo_2 + (select br_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03163000'')
	where whaccountid = ''03163003''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_3 = br_mo_3 + (select br_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03163000'')
	where whaccountid = ''03163003''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_1 = gen_mo_1 + (select gen_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03163000'')
	where whaccountid = ''03163003''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_2 = gen_mo_2 + (select gen_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03163000'')
	where whaccountid = ''03163003''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_3 = gen_mo_3 + (select gen_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03163000'')
	where whaccountid = ''03163003''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_1 = tot_mo_1 + (select tot_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03163000'')
	where whaccountid = ''03163003''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_2 = tot_mo_2 + (select tot_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03163000'')
	where whaccountid = ''03163003''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_3 = tot_mo_3 + (select tot_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03163000'')
	where whaccountid = ''03163003''';
EXEC(@SQL) 

--NOW DELETE whaccountid 03130863 from tmp_API_SALES_LOAD_SLX_AAP
SET @SQL = 'Delete from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03163000''';
EXEC(@SQL)
END

BEGIN
--TO DO Need to   combine apiaccountno 03016997 and 03016998 - 03016998 is the one in SLX
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_1 = otc_mo_1 + (select otc_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03016997'')
	where whaccountid = ''03016998''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_2 = otc_mo_2 + (select otc_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03016997'')
	where whaccountid = ''03016998''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_3 = otc_mo_3 + (select otc_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03016997'')
	where whaccountid = ''03016998''';
EXEC(@SQL)


SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_1 = br_mo_1 + (select br_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03016997'')
	where whaccountid = ''03016998''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_2 = br_mo_2 + (select br_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03016997'')
	where whaccountid = ''03016998''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_3 = br_mo_3 + (select br_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03016997'')
	where whaccountid = ''03016998''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_1 = gen_mo_1 + (select gen_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03016997'')
	where whaccountid = ''03016998''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_2 = gen_mo_2 + (select gen_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03016997'')
	where whaccountid = ''03016998''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_3 = gen_mo_3 + (select gen_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03016997'')
	where whaccountid = ''03016998''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_1 = tot_mo_1 + (select tot_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03016997'')
	where whaccountid = ''03016998''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_2 = tot_mo_2 + (select tot_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03016997'')
	where whaccountid = ''03016998''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_3 = tot_mo_3 + (select tot_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03016997'')
	where whaccountid = ''03016998''';
EXEC(@SQL) 

--NOW DELETE whaccountid 03130863 from tmp_API_SALES_LOAD_SLX_AAP
SET @SQL = 'Delete from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''03016997''';
EXEC(@SQL)
END

BEGIN
--TO DO Need to   combine apiaccountno 28134431 and 28132400 - 28132400 is the one in SLX
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_1 = otc_mo_1 + (select otc_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28134431'')
	where whaccountid = ''28132400''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_2 = otc_mo_2 + (select otc_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28134431'')
	where whaccountid = ''28132400''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_3 = otc_mo_3 + (select otc_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28134431'')
	where whaccountid = ''28132400''';
EXEC(@SQL)


SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_1 = br_mo_1 + (select br_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28134431'')
	where whaccountid = ''28132400''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_2 = br_mo_2 + (select br_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28134431'')
	where whaccountid = ''28132400''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_3 = br_mo_3 + (select br_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28134431'')
	where whaccountid = ''28132400''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_1 = gen_mo_1 + (select gen_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28134431'')
	where whaccountid = ''28132400''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_2 = gen_mo_2 + (select gen_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28134431'')
	where whaccountid = ''28132400''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_3 = gen_mo_3 + (select gen_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28134431'')
	where whaccountid = ''28132400''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_1 = tot_mo_1 + (select tot_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28134431'')
	where whaccountid = ''28132400''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_2 = tot_mo_2 + (select tot_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28134431'')
	where whaccountid = ''28132400''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_3 = tot_mo_3 + (select tot_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28134431'')
	where whaccountid = ''28132400''';
EXEC(@SQL) 

--NOW DELETE whaccountid 03130863 from tmp_API_SALES_LOAD_SLX_AAP
SET @SQL = 'Delete from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28134431''';
EXEC(@SQL)
END


BEGIN
--TO DO Need to   combine apiaccountno 28134458 and 28134460 - 28134460 is the one in SLX
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_1 = otc_mo_1 + (select otc_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28134458'')
	where whaccountid = ''28134460''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_2 = otc_mo_2 + (select otc_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28134458'')
	where whaccountid = ''28134460''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_3 = otc_mo_3 + (select otc_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28134458'')
	where whaccountid = ''28134460''';
EXEC(@SQL)


SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_1 = br_mo_1 + (select br_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28134458'')
	where whaccountid = ''28134460''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_2 = br_mo_2 + (select br_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28134458'')
	where whaccountid = ''28134460''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_3 = br_mo_3 + (select br_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28134458'')
	where whaccountid = ''28134460''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_1 = gen_mo_1 + (select gen_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28134458'')
	where whaccountid = ''28134460''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_2 = gen_mo_2 + (select gen_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28134458'')
	where whaccountid = ''28134460''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_3 = gen_mo_3 + (select gen_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28134458'')
	where whaccountid = ''28134460''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_1 = tot_mo_1 + (select tot_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28134458'')
	where whaccountid = ''28134460''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_2 = tot_mo_2 + (select tot_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28134458'')
	where whaccountid = ''28134460''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_3 = tot_mo_3 + (select tot_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28134458'')
	where whaccountid = ''28134460''';
EXEC(@SQL) 

--NOW DELETE whaccountid 28134458 from tmp_API_SALES_LOAD_SLX_AAP
SET @SQL = 'Delete from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28134458''';
EXEC(@SQL)
END

BEGIN
--TO DO Need to   combine apiaccountno 28188888 and 28138888 - 28138888 is the one in SLX
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_1 = otc_mo_1 + (select otc_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28188888'')
	where whaccountid = ''28138888''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_2 = otc_mo_2 + (select otc_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28188888'')
	where whaccountid = ''28138888''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_3 = otc_mo_3 + (select otc_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28188888'')
	where whaccountid = ''28138888''';
EXEC(@SQL)


SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_1 = br_mo_1 + (select br_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28188888'')
	where whaccountid = ''28138888''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_2 = br_mo_2 + (select br_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28188888'')
	where whaccountid = ''28138888''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_3 = br_mo_3 + (select br_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28188888'')
	where whaccountid = ''28138888''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_1 = gen_mo_1 + (select gen_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28188888'')
	where whaccountid = ''28138888''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_2 = gen_mo_2 + (select gen_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28188888'')
	where whaccountid = ''28138888''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_3 = gen_mo_3 + (select gen_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28188888'')
	where whaccountid = ''28138888''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_1 = tot_mo_1 + (select tot_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28188888'')
	where whaccountid = ''28138888''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_2 = tot_mo_2 + (select tot_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28188888'')
	where whaccountid = ''28138888''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_3 = tot_mo_3 + (select tot_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28188888'')
	where whaccountid = ''28138888''';
EXEC(@SQL) 

--NOW DELETE whaccountid 28188888 from tmp_API_SALES_LOAD_SLX_AAP
SET @SQL = 'Delete from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28188888''';
EXEC(@SQL)
END



BEGIN
--TO DO Need to   combine apiaccountno 28236788 and 28136788 - 28136788 is the one in SLX
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_1 = otc_mo_1 + (select otc_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28236788'')
	where whaccountid = ''28136788''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_2 = otc_mo_2 + (select otc_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28236788'')
	where whaccountid = ''28136788''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_3 = otc_mo_3 + (select otc_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28236788'')
	where whaccountid = ''28136788''';
EXEC(@SQL)


SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_1 = br_mo_1 + (select br_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28236788'')
	where whaccountid = ''28136788''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_2 = br_mo_2 + (select br_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28236788'')
	where whaccountid = ''28136788''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_3 = br_mo_3 + (select br_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28236788'')
	where whaccountid = ''28136788''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_1 = gen_mo_1 + (select gen_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28236788'')
	where whaccountid = ''28136788''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_2 = gen_mo_2 + (select gen_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28236788'')
	where whaccountid = ''28136788''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_3 = gen_mo_3 + (select gen_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28236788'')
	where whaccountid = ''28136788''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_1 = tot_mo_1 + (select tot_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28236788'')
	where whaccountid = ''28136788''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_2 = tot_mo_2 + (select tot_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28236788'')
	where whaccountid = ''28136788''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_3 = tot_mo_3 + (select tot_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28236788'')
	where whaccountid = ''28136788''';
EXEC(@SQL) 

--NOW DELETE whaccountid 28134458 from tmp_API_SALES_LOAD_SLX_AAP
SET @SQL = 'Delete from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28236788''';
EXEC(@SQL)
END



BEGIN
--TO DO Need to   combine apiaccountno 28239444 and 28139444 - 28139444 is the one in SLX
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_1 = otc_mo_1 + (select otc_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28239444'')
	where whaccountid = ''28139444''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_2 = otc_mo_2 + (select otc_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28239444'')
	where whaccountid = ''28139444''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_3 = otc_mo_3 + (select otc_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28239444'')
	where whaccountid = ''28139444''';
EXEC(@SQL)


SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_1 = br_mo_1 + (select br_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28239444'')
	where whaccountid = ''28139444''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_2 = br_mo_2 + (select br_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28239444'')
	where whaccountid = ''28139444''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_3 = br_mo_3 + (select br_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28239444'')
	where whaccountid = ''28139444''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_1 = gen_mo_1 + (select gen_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28239444'')
	where whaccountid = ''28139444''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_2 = gen_mo_2 + (select gen_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28239444'')
	where whaccountid = ''28139444''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_3 = gen_mo_3 + (select gen_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28239444'')
	where whaccountid = ''28139444''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_1 = tot_mo_1 + (select tot_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28239444'')
	where whaccountid = ''28139444''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_2 = tot_mo_2 + (select tot_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28239444'')
	where whaccountid = ''28139444''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_3 = tot_mo_3 + (select tot_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28239444'')
	where whaccountid = ''28139444''';
EXEC(@SQL) 

--NOW DELETE whaccountid 28239444 from tmp_API_SALES_LOAD_SLX_AAP
SET @SQL = 'Delete from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''28239444''';
EXEC(@SQL)
END


--- NEW 12/14/2010

BEGIN
--TO DO Need to   combine apiaccountno 24074831 and 24074850 - 24074850 is the one in SLX
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_1 = otc_mo_1 + (select otc_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''24074831'')
	where whaccountid = ''24074850''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_2 = otc_mo_2 + (select otc_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''24074831'')
	where whaccountid = ''24074850''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_3 = otc_mo_3 + (select otc_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''24074831'')
	where whaccountid = ''24074850''';
EXEC(@SQL)


SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_1 = br_mo_1 + (select br_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''24074831'')
	where whaccountid = ''24074850''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_2 = br_mo_2 + (select br_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''24074831'')
	where whaccountid = ''24074850''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_3 = br_mo_3 + (select br_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''24074831'')
	where whaccountid = ''24074850''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_1 = gen_mo_1 + (select gen_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''24074831'')
	where whaccountid = ''24074850''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_2 = gen_mo_2 + (select gen_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''24074831'')
	where whaccountid = ''24074850''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_3 = gen_mo_3 + (select gen_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''24074831'')
	where whaccountid = ''24074850''';
EXEC(@SQL)

SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_1 = tot_mo_1 + (select tot_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''24074831'')
	where whaccountid = ''24074850''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_2 = tot_mo_2 + (select tot_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''24074831'')
	where whaccountid = ''24074850''';
EXEC(@SQL)
SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_3 = tot_mo_3 + (select tot_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''24074831'')
	where whaccountid = ''24074850''';
EXEC(@SQL) 

--NOW DELETE whaccountid 24074831 from tmp_API_SALES_LOAD_SLX_AAP
SET @SQL = 'Delete from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''24074831''';
EXEC(@SQL)
END



BEGIN
    SET @SQL = 'UPDATE tmp_API_SALES_LOAD_SLX_AAP  '+
		' SET tot_avg_3_mo =  reporting.dbo.AvgNoLeading0s3args(tot_mo_1, tot_mo_2, tot_mo_3)  ';
	EXEC(@SQL)

END

BEGIN
    SET @SQL = 'UPDATE tmp_API_SALES_LOAD_SLX_AAP  '+
		 ' SET gen_avg_3_mo =  reporting.dbo.AvgNoLeading0s3args(gen_mo_1 , gen_mo_2 , gen_mo_3) ';
	EXEC(@SQL)

END

BEGIN
    SET @SQL = 'UPDATE tmp_API_SALES_LOAD_SLX_AAP  '+
        ' SET br_avg_3_mo =  reporting.dbo.AvgNoLeading0s3args(br_mo_1 , br_mo_2 , br_mo_3) ';
	EXEC(@SQL)

END

BEGIN
    SET @SQL = 'UPDATE tmp_API_SALES_LOAD_SLX_AAP  '+
        ' SET otc_avg_3_mo =  reporting.dbo.AvgNoLeading0s3args(otc_mo_1 , otc_mo_2 , otc_mo_3) ';
	EXEC(@SQL)

END

 

BEGIN

-- Drop temp tables
   IF EXISTS(SELECT name FROM sys.tables WHERE name = 'tmp_API_SALES_LOAD_SLX_DEA')
		BEGIN
           drop table tmp_API_SALES_LOAD_SLX_DEA;
        END
 -- Group by DEA - API has some multiple DEA's
	SELECT * into  api..tmp_API_SALES_LOAD_SLX_DEA from 

   
    ( SELECT aap.pmid,p.DEA,whaccountid,
		sum(tot_avg_3_mo) as tot_avg_3_mo, 
		sum(gen_avg_3_mo) as gen_avg_3_mo,
		sum(br_avg_3_mo)as br_avg_3_mo,
		sum(otc_avg_3_mo)as  otc_avg_3_mo from  api..tmp_API_SALES_LOAD_SLX_AAP aap
		left outer join pharmacymaster..pm_pharmacy p on aap.whaccountid = p.apiaccountno
		where  aap.whaccountid  > 1000  and aap.dea not in ('DEA - DEA')  group by p.DEA,whaccountid,aap.pmid  ) ch

 
END

  
--Chriss wanted these removed so they don't show in exception report ---
BEGIN
SET @SQL = 'Delete from tmp_API_SALES_LOAD_SLX_DEA where whaccountid in( ''01085939'',''02193885'',''03041870'',''03081300'',''05046700'',''09090001'',''17100132'',''19040001'',''29049595'',''36083373'',''17079864'')';
EXEC(@SQL)
END


SET  NOCOUNT OFF




GO
