USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spud_API_SALES_LOAD_SLX_AAP_BU_061614]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spud_API_SALES_LOAD_SLX_AAP_BU_061614]
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
	into tmp_API_SALES_LOAD_SLX_AAP from v_APISalesDetail where whaccountid != '00UNITED'

 
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

-- New Code Here

BEGIN
		DECLARE @id int;
		DECLARE @oldAcctNo   varchar(50);
		DECLARE @newAcctNo   varchar(50);

		SELECT @id = min( id ) from pharmacymaster..SLX_WHAcctID_Merge

		WHILE @id is not null
			BEGIN
				SET @oldAcctNo = (SELECT WHAccountIDOld from pharmacymaster..SLX_WHAcctID_Merge where id = @id);
				SET @newAcctNo = (SELECT WHAccountIDNew from pharmacymaster..SLX_WHAcctID_Merge where id = @id);
 
			 
				SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_1 = otc_mo_1 + 
									case when (select otc_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''' + @oldAcctNo + ''') is null then 0 else 
									(select otc_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''' + @oldAcctNo + ''') end
									where whaccountid = '''+ @newAcctNo + '''';
				EXEC(@SQL)

				SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_2 = otc_mo_2 + 
								case when (select otc_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''' + @oldAcctNo + ''') is null then 0 else 
								(select otc_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''' + @oldAcctNo + ''') end
								where whaccountid = '''+ @newAcctNo + '''';
				EXEC(@SQL)

				SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set otc_mo_3 = otc_mo_3 +  
					            case when (select otc_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''' + @oldAcctNo + ''') is null then 0 else 
								(select otc_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''' + @oldAcctNo + ''') end
								 where whaccountid = '''+ @newAcctNo + '''';
				EXEC(@SQL)


				SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_1 = br_mo_1 +  
								 case when (select br_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''' + @oldAcctNo + ''') is null then 0 else 
								(select br_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''' + @oldAcctNo + ''') end
								 where whaccountid = '''+ @newAcctNo + '''';
				EXEC(@SQL)
				SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_2 = br_mo_2 +
								 case when (select br_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''' + @oldAcctNo + ''') is null then 0 else 
								(select br_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''' + @oldAcctNo + ''') end
								 where whaccountid = '''+ @newAcctNo + '''';
				EXEC(@SQL)
				SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set br_mo_3 = br_mo_3 + 
								 case when (select br_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''' + @oldAcctNo + ''') is null then 0 else 
								(select br_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''' + @oldAcctNo + ''') end
								 where whaccountid = '''+ @newAcctNo + '''';
				EXEC(@SQL)

				SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_1 = gen_mo_1 + 
								 case when (select gen_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''' + @oldAcctNo + ''') is null then 0 else 
								(select gen_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''' + @oldAcctNo + ''') end
								 where whaccountid = '''+ @newAcctNo + '''';
				EXEC(@SQL)
				SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_2 = gen_mo_2 + 
								 case when (select gen_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''' + @oldAcctNo + ''') is null then 0 else 
								(select gen_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''' + @oldAcctNo + ''') end
								 where whaccountid = '''+ @newAcctNo + '''';
				EXEC(@SQL)
				SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set gen_mo_3 = gen_mo_3 + 
								 case when (select gen_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''' + @oldAcctNo + ''') is null then 0 else 
								(select gen_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''' + @oldAcctNo + ''') end
								 where whaccountid = '''+ @newAcctNo + '''';
				EXEC(@SQL)

				SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_1 = tot_mo_1 + 
								 case when (select tot_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''' + @oldAcctNo + ''') is null then 0 else 
								(select tot_mo_1 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''' + @oldAcctNo + ''') end
								 where whaccountid = '''+ @newAcctNo + '''';
				EXEC(@SQL)
				SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_2 = tot_mo_2 +
								 case when (select tot_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''' + @oldAcctNo + ''') is null then 0 else 
								(select tot_mo_2 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''' + @oldAcctNo + ''') end
								 where whaccountid = '''+ @newAcctNo + '''';
				EXEC(@SQL)
				SET @SQL = 'Update tmp_API_SALES_LOAD_SLX_AAP set tot_mo_3 = tot_mo_3 + 
								 case when (select tot_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''' + @oldAcctNo + ''') is null then 0 else 
								(select tot_mo_3 from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''' + @oldAcctNo + ''') end
								 where whaccountid = '''+ @newAcctNo + '''';
				EXEC(@SQL)
		 
				--NOW DELETE old whaccountid  from tmp_API_SALES_LOAD_SLX_AAP
                			--NOW DELETE old dea from tmp_ALLPVA_SLX if new one exists
            SET @SQL = ' IF EXISTS (select * from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''' + @newAcctNo +''') '+
						' BEGIN '+
		 	            ' Delete from tmp_API_SALES_LOAD_SLX_AAP where whaccountid = ''' + @oldAcctNo + ''''+
                        ' END ' +
                        ' ELSE '+
						' BEGIN '+
                        '  UPDATE tmp_API_SALES_LOAD_SLX_AAP set whaccountid = ''' + @newAcctNo +''' where dea = ''' + @oldAcctNo +'''' +
                        ' END ' ;
				 
				print @sql;
				EXEC(@SQL)

			SELECT @id = min( id ) from pharmacymaster..SLX_WHAcctID_Merge where id > @id
		END

	END

--END NEW CODE



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

   
    ( SELECT p.pmid,p.DEA,whaccountid,
		sum(tot_avg_3_mo) as tot_avg_3_mo, 
		sum(gen_avg_3_mo) as gen_avg_3_mo,
		sum(br_avg_3_mo)as br_avg_3_mo,
		sum(otc_avg_3_mo)as  otc_avg_3_mo from  api..tmp_API_SALES_LOAD_SLX_AAP aap
		left outer join pharmacymaster..pm_pharmacy p on aap.whaccountid = p.apiaccountno
		where  aap.whaccountid  > 1000  and aap.dea not in ('DEA - DEA')  group by p.DEA,whaccountid,p.pmid  ) ch

 
END

  
--Chriss wanted these removed so they don't show in exception report ---
BEGIN
SET @SQL = 'Delete from tmp_API_SALES_LOAD_SLX_DEA where whaccountid in( ''01085939'',''02193885'',''03041870'',''03081300'',''05046700'',''09090001'',''17100132'',''19040001'',''29049595'',''36083373'',''17079864'')';
EXEC(@SQL)
END


SET  NOCOUNT OFF




GO
