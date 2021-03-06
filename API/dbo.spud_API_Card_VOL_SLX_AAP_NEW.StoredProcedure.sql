USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spud_API_Card_VOL_SLX_AAP_NEW]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <12/17/2009>
-- Description:	< 3 Month Cardinal Volume Avg.>
-- =============================================
CREATE PROCEDURE [dbo].[spud_API_Card_VOL_SLX_AAP_NEW]
 (@in_month varchar(2), @in_year varchar(4))
AS
	BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   
DECLARE @SQL varchar(6000);
DECLARE @MO_1 varchar(15);
DECLARE @MO_2 varchar(15);
DECLARE @MO_3 varchar(15);
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
   IF EXISTS(SELECT name FROM sys.tables WHERE name = 'tmp_API_Card_VOL_SLX_AAP')
		BEGIN
           drop table tmp_API_Card_VOL_SLX_AAP;
        END

   SET @SQL =	' SELECT distinct  p.dea,a.apiaccountno , '+
  	' cast(0.0 as numeric(38,2)) as tot_mo_1, '+
	' cast(0.0 as numeric(38,2)) as tot_mo_2, '+
	' cast(0.0 as numeric(38,2)) as tot_mo_3, '+
	' cast(0.0 as numeric(38,2)) as Avg_3_MO '+
	' into tmp_API_Card_VOL_SLX_AAP from  pharmacymaster..chapi_sales a '+
    ' join pharmacymaster..PM_Pharmacy p on a.apiaccountno = p.apiaccountno ' +
      	' WHERE p.dea is not null and a.apiaccountno is not null and year(date) in ( '''+ @MO_1_YEAR +''' ,  '''+ @MO_2_YEAR +''' , '''+ @MO_3_YEAR +''' )' +
	' GROUP BY p.dea,a.apiaccountno';
   print (@SQL)
   EXEC(@SQL)

	END

    --Month 1
	BEGIN
		SET @SQL = 'UPDATE  tmp  set ' + 	
				'tmp.tot_mo_1 =   cv.NetSales' +  
		   ' FROM tmp_API_Card_VOL_SLX_AAP tmp '+
		   ' inner join ' +
		   '	(  select  APIAccountNo,NetSales '  +
		   '			from pharmacymaster..chapi_sales   where month(date) = '''+ @MO_1 + '''  and year(date) = '''  + @MO_1_YEAR +  '''' +
		   '	 ) cv' +
		   ' on tmp.APIAccountNo = cv.APIAccountNo  ';
		EXEC(@SQL)
		print(@SQL)
	END
       --Month 2
	BEGIN
		SET @SQL = 'UPDATE  tmp  set ' + 	
				'tmp.tot_mo_2 =   cv.NetSales' + 
		   ' FROM tmp_API_Card_VOL_SLX_AAP tmp '+
		   ' inner join ' +
		   '	(  select dea,APIAccountNo,NetSales '  +
		   '			from pharmacymaster..chapi_sales  where month(date) = '''+ @MO_2 + '''   and year(date) = '''  + @MO_2_YEAR +  '''' +
		   '	 ) cv' +
		   ' on tmp.APIAccountNo = cv.APIAccountNo  ';
		EXEC(@SQL)
		print(@SQL)
	END

   BEGIN
		SET @SQL = 'UPDATE  tmp  set ' + 	
				'tmp.tot_mo_3 =   cv.NetSales' + 
		   ' FROM tmp_API_Card_VOL_SLX_AAP tmp '+
		   ' inner join ' +
		   '	(  select dea,APIAccountNo,NetSales' +  
		   '			from pharmacymaster..chapi_sales  where month(date) = '''+ @MO_3 + '''  and year(date) = '''  + @MO_3_YEAR +  '''' +
		   '	 ) cv' +
		   ' on tmp.APIAccountNo = cv.APIAccountNo  ';
		EXEC(@SQL)
		print(@SQL)
	END

   BEGIN
    SET @SQL = 'UPDATE tmp_API_Card_VOL_SLX_AAP  '+
		' SET Avg_3_MO =  reporting.dbo.AvgNoLeading0s3argsHybrid(tot_mo_1, tot_mo_2, tot_mo_3)  ';
	EXEC(@SQL)

END

	BEGIN
		-- Drop temp tables
   IF EXISTS(SELECT name FROM sys.tables WHERE name = 'tmp_API_Card_VOL_SLX_DEA')
		BEGIN
           drop table tmp_API_Card_VOL_SLX_DEA;
        END
 -- Group by DEA - API has some multiple DEA's
	SELECT * into  api..tmp_API_Card_VOL_SLX_DEA from 

    (  SELECT DEA,
	sum(Avg_3_MO) as Avg_3_MO 
        from  api..tmp_API_Card_VOL_SLX_AAP
    where dea ! = ''
    group by DEA ) ch

 -- THis is to remove the 3 bears that are no longer under API PVA   
delete from tmp_API_Card_VOL_SLX_DEA where dea = 'BT9229306'
delete from tmp_API_Card_VOL_SLX_DEA where dea = 'BT9746984'
 

	END







GO
