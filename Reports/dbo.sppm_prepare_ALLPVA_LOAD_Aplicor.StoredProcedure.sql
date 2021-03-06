USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_prepare_ALLPVA_LOAD_Aplicor]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <06/16/2014>
-- Description:	Create table to use for load to Aplicor - ALL PVA and Warehouse averages
-- =============================================
CREATE PROCEDURE [dbo].[sppm_prepare_ALLPVA_LOAD_Aplicor]
 (@in_month varchar(2), @in_year varchar(4))
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table
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

	DECLARE @date varchar(10);
	SET @date = @in_month + '/01/' + @in_year;
	 
	-- Here we set the months we need to be getting data from
	IF( @in_month = '01')
		 BEGIN
		   SET @MO_3 = '01';
		   SET @MO_2 = '12';
		   SET @MO_1 = '11';
           SET @MO_1_Year =  @prev_year;
		   SET @MO_2_Year =  @prev_year;
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

   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_ALLPVA_Aplicor')
          DROP TABLE tmp_ALLPVA_Aplicor

exec  sppm_prepare_API_LOAD_Aplicor @in_month, @in_year; -- Need to execute this to get wh totals !!!!!!!!!!!!!  CHANGE DATE
  
SELECT * INTO tmp_ALLPVA_Aplicor from (
   SELECT p.pmid,p.accountname,p.dea,p.apiaccountno,p.aapaccountno, m1.totnetsales   as m1 ,  m2.totnetsales  as m2, m3.totnetsales   as m3 ,
	cast(0.0 as numeric(38,2)) as  mo3Avg ,
    cast(0.0 as numeric(38,2)) as  WHM1, 
	cast(0.0 as numeric(38,2)) as  WHM2, 
	cast(0.0 as numeric(38,2)) as  WHM3, 
    cast(0.0 as numeric(38,2)) as  whPVAAvg3mo ,
    cast(0.0 as numeric(38,2)) as WHMOAvg,
	cast(0.0 as numeric(38,2)) as WHGenRx,
	cast(0.0 as numeric(38,2)) as WHBrandRx,
	cast(0.0 as numeric(38,2)) as WHOTC
	FROM Pharmacymaster..pm_pharmacy p
	left outer join
	(
	SELECT aapnetsales as totnetsales,pmid from
	Pharmacymaster..ALL_VOLUME where [date] = @MO_1 + '/01/' +  @MO_1_Year -- CHANGE DATES
	)m1
	 on p.pmid = m1.pmid 
	left outer join
	(
	SELECT aapnetsales as totnetsales,pmid from
	Pharmacymaster..ALL_VOLUME where [date] = @MO_2 + '/01/' +  @MO_2_Year -- CHANGE DATES
	)m2
	 on p.pmid = m2.pmid 
	left outer join
	(
	SELECT aapnetsales as totnetsales,pmid from
	Pharmacymaster..ALL_VOLUME where [date] = @MO_3 + '/01/' +  @MO_3_Year -- CHANGE DATES
	)m3
	 on p.pmid = m3.pmid
	WHERE (m1.pmid is not null
	or m2.pmid is not null
	or m3.pmid is not null)  
) slx


 update tmp_ALLPVA_Aplicor set m1 = 0.0 where m1 is null;
 update tmp_ALLPVA_Aplicor set m2 = 0.0 where m2 is null;
 update tmp_ALLPVA_Aplicor set m3 = 0.0 where m3 is null;




-- For First Month ML Volume - add it into the Cardinal Volume
   SET @SQL = '	UPDATE su set '+
		' su.m1 =  vol.sales + su.m1'+
 	    ' FROM   tmp_ALLPVA_Aplicor su '+
		'	inner join '+
		'	 (       '+
		'		SELECT sum(TotalSales) as sales, pmid   '+
		'		from pharmacymaster..MiamiLuken  '+
		'			where  year(date) = ' + @MO_1_Year + ' AND month(date) = ' + @MO_1 +   '' +
		'		group by  pmid '+
 		'	 ) vol '+
		'  on su.pmid = vol.pmid    ';
 print @sql
	 EXEC (@SQL);


  	  SET @SQL = 'INSERT  into tmp_ALLPVA_Aplicor (DEA,PMID,AccountName,ApiAccountNo,AAPAccountNo ,m1,m2,m3,mo3Avg,WHM1,WHM2,WHM3,whPVAAvg3mo)  '+
			 ' SELECT vol.dea,vol.pmid,vol.AccountName,vol.apiaccountno,vol.AAPAccountNo,sales,0,0,0,0,0,0,0 FROM '+
             ' ( '+
 			 '	 SELECT dea, pm.pmid,pm.AccountName,apiaccountno,AAPAccountNo,sum(TotalSales) as sales  '+
			 '		from pharmacymaster..MiamiLuken n  '+
			 '		left outer join  '+
			 '			(SELECT pmid,udaccountno,aapAccountNo,dea,AccountName,apiaccountno  FROM Pharmacymaster..PM_Pharmacy) pm on pm.pmid = n.pmid  '+
			 '		where  year(date) = ' + @MO_1_Year + ' AND month(date) = ' + @MO_1 +   '' +
			 '	group by pm.udaccountno,aapaccountno,pm.pmid,DEA,pm.AccountName ,apiaccountno  '+
 			 ' ) vol	  '+
	         '   WHERE    not exists  (select pmid from  tmp_ALLPVA_Aplicor  where   pmid = vol.pmid) and sales is not null';
 print @sql
	 EXEC (@SQL);


-- For Second Month ML Volume - add it into the Cardinal Volume
   SET @SQL = '	UPDATE su set '+
		' su.m2 =  vol.sales + su.m2'+
 	    ' FROM   tmp_ALLPVA_Aplicor su '+
		'	inner join '+
		'	 (       '+
		'		SELECT sum(TotalSales) as sales, pmid   '+
		'		from pharmacymaster..MiamiLuken  '+
		'			where   year(date) = ' + @MO_2_Year + ' AND month(date) = ' + @MO_2 +   '' +
		'		group by  pmid '+
 		'	 ) vol '+
		'  on su.pmid = vol.pmid    ';
	 EXEC (@SQL);




    SET @SQL = 'INSERT  into tmp_ALLPVA_Aplicor (DEA,PMID,AccountName,ApiAccountNo,AAPAccountNo,m1,m2,m3,mo3Avg,WHM1,WHM2,WHM3,whPVAAvg3mo)  '+
			 ' SELECT vol.dea,vol.pmid,vol.AccountName,vol.apiaccountno,vol.AAPAccountNo,0,sales,0,0,0,0,0,0 FROM '+
             ' ( '+
 			 '	 SELECT dea, pm.pmid,pm.AccountName,apiaccountno,AAPAccountNo,sum(TotalSales) as sales  '+
			 '		from pharmacymaster..MiamiLuken n  '+
			 '		left outer join  '+
			 '			(SELECT pmid,udaccountno,aapAccountNo,dea,AccountName,apiaccountno   FROM Pharmacymaster..PM_Pharmacy) pm on pm.pmid = n.pmid  '+
			 '		where  year(date) = ' + @MO_2_Year + ' AND month(date) = ' + @MO_2 +   '' +
			 '	group by pm.udaccountno,aapaccountno,pm.pmid,DEA,pm.AccountName ,apiaccountno  '+
 			 ' ) vol	  '+
	         '  WHERE   not exists  (select pmid from  tmp_ALLPVA_Aplicor  where   pmid = vol.pmid)   and sales is not null';
	 EXEC (@SQL);

-- For Third Month ML Volume - add it into the Cardinal Volume
   SET @SQL = '	UPDATE su set '+
		' su.m3 =  vol.sales + su.m3'+
 	    ' FROM   tmp_ALLPVA_Aplicor su '+
		'	inner join '+
		'	 (       '+
		'		SELECT sum(TotalSales) as sales, pmid   '+
		'		from pharmacymaster..MiamiLuken  '+
		'			where  year(date) = ' + @MO_3_Year + ' AND month(date) = ' + @MO_3 +   '' +
		'		group by  pmid '+
 		'	 ) vol '+
		'  on su.pmid = vol.pmid    ';
	 EXEC (@SQL);

         SET @SQL = 'INSERT  into tmp_ALLPVA_Aplicor (DEA,PMID,AccountName,ApiAccountNo,AAPAccountNo,m1,m2,m3,mo3Avg,WHM1,WHM2,WHM3,whPVAAvg3mo)  '+
			 ' SELECT vol.dea,vol.pmid,vol.AccountName,vol.apiaccountno,vol.AAPAccountNo,0,0,sales,0,0,0,0,0 FROM '+
             ' ( '+
 			 '	 SELECT dea, pm.pmid,pm.AccountName,apiaccountno,AAPAccountNo,sum(TotalSales) as sales  '+
			 '		from pharmacymaster..MiamiLuken n  '+
			 '		left outer join  '+
			 '			(SELECT pmid,udaccountno,aapAccountNo,dea,AccountName,apiaccountno   FROM Pharmacymaster..PM_Pharmacy) pm on pm.pmid = n.pmid  '+
			 '		where   year(date) = ' + @MO_3_Year + ' AND month(date) = ' + @MO_3 +   '' +
			 '	group by pm.udaccountno,aapaccountno,pm.pmid,DEA,pm.AccountName ,apiaccountno '+
 			 ' ) vol	  '+
	         '   WHERE   not exists  (select pmid from tmp_ALLPVA_Aplicor  where   pmid = vol.pmid)  and sales is not null';
	 EXEC (@SQL);

	UPDATE tmp_ALLPVA_Aplicor set m1 = 0.00 where m1 is null;
	UPDATE tmp_ALLPVA_Aplicor set m2 = 0.00 where m2 is null;
	UPDATE tmp_ALLPVA_Aplicor set m3 = 0.00 where m3 is null;



-- UPDATE WITH WH DATA **********Need to run the stored proc to create api..tmp_API_SALES_LOAD_SLX_AAP with data required for these months
		UPDATE t set 
        WHM1 =  v.tot_mo_1,  
		WHM2 = v.tot_mo_2,  
        WHM3 = v.tot_mo_3 ,
        WHMOAvg = v.tot_avg_3_mo,
        WHGenRx = v.gen_avg_3_mo,
        WHBrandRx = v.br_avg_3_mo,
        WHOTC = v.otc_avg_3_mo
	    FROM    tmp_ALLPVA_Aplicor t 
			inner join 
			 (  
              	SELECT  sum(tot_mo_1)as tot_mo_1,sum(tot_mo_2) as tot_mo_2,sum(tot_mo_3) as tot_mo_3,wh.pmid,sum(tot_avg_3_mo) as tot_avg_3_mo,
                    sum(gen_avg_3_mo) as gen_avg_3_mo,  sum(br_avg_3_mo) as br_avg_3_mo,  
                    sum(otc_avg_3_mo) as otc_avg_3_mo from tmp_APISales_Aplicor wh 
				    left outer join
					(
						SELECT *   from  tmp_ALLPVA_Aplicor 
					) pva on wh.pmid = pva.pmid where wh.pmid 
					is not null
                    GROUP by wh.pmid
			) v 
		   on t.pmid =v.pmid

--INSERT WH DATA WHERE THERE IS WH VOLUME BUT THERE WAS NO PVA VOLUME
 INSERT  into tmp_ALLPVA_Aplicor (DEA,PMID,AccountName,ApiAccountNo,AAPAccountNo,WHM1,WHM2,WHM3,
WHMOAvg,WHGenRx,WHBrandRx,WHOTC ,m1,m2,m3,mo3Avg, whPVAAvg3mo )       
      SELECT * ,0,0,0,0,0  FROM (  
			SELECT  pm.dea,pm.pmid,pm.accountname,pm.apiaccountno,AAPAccountNo,  sum(tot_mo_1)as WHM1,sum(tot_mo_2)as WHM2,sum(tot_mo_3) as WHM3,
               sum(tot_avg_3_mo) as WHMOAvg,sum(gen_avg_3_mo) as WHGenRx,  sum(br_avg_3_mo) as WHBrandRx,  
                    sum(otc_avg_3_mo) as WHOTC
				FROM tmp_APISales_Aplicor wh 
				left outer join (
					SELECT pmid,DEA,accountname ,apiaccountno,AAPAccountNo FROM  pharmacymaster..pm_pharmacy
				) pm on pm.pmid = wh.pmid
				WHERE  wh.pmid 
					is not null  
			group by  pm.dea,pm.pmid,pm.accountname,pm.apiaccountno  ,pm.AAPAccountNo 
		 )vol
	 WHERE not exists  (select pmid from  tmp_ALLPVA_Aplicor where pmid = vol.pmid ); 

	UPDATE tmp_ALLPVA_Aplicor set m1 = 0.00 where m1 is null;
	UPDATE tmp_ALLPVA_Aplicor set m2 = 0.00 where m2 is null;
	UPDATE tmp_ALLPVA_Aplicor set m3 = 0.00 where m3 is null;

 




       IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_ALLPVA_Aplicor_BD')
          DROP TABLE tmp_ALLPVA_Aplicor_BD

		SELECT * into tmp_ALLPVA_Aplicor_BD from tmp_ALLPVA_Aplicor


 
-- Populate Month Average and Anda Total
	UPDATE tmp_ALLPVA_Aplicor set mo3Avg = pharmacymaster.dbo.AvgNoLeading0s3argsSLX(m1,m2,m3);
    UPDATE tmp_ALLPVA_Aplicor set whPVAAvg3mo = pharmacymaster.dbo.AvgNoLeading0s3argsSLX(m1 + WHM1,m2+ WHM2,m3+ WHM3);
--FOR ROUNDING
--SELECT mo3avg,
--	CASE WHEN mo3avg >= 1000 THEN (round((mo3avg/1000),0) )*1000
--	WHEN (mo3avg < 1000 and mo3avg >= 100) THEN  (round((mo3avg/100),0) )*100
--	WHEN (mo3avg < 100 and mo3avg >= 10) THEN  (round((mo3avg/10),0) )*10
--	WHEN (mo3avg < 10 and mo3avg > 0) THEN  (round(mo3avg,0))
--	ELSE mo3avg   END as PVAMOVolumeAvg FROM tmp_ALLPVA_Aplicor

--whPVAAvg3mo

--SELECT whPVAAvg3mo,
--	CASE WHEN whPVAAvg3mo >= 1000 THEN (round((whPVAAvg3mo/1000),0) )*1000
--	WHEN (whPVAAvg3mo < 1000 and whPVAAvg3mo >= 100) THEN  (round((whPVAAvg3mo/100),0) )*100
--	WHEN (whPVAAvg3mo < 100 and whPVAAvg3mo >= 10) THEN  (round((whPVAAvg3mo/10),0) )*10
--	WHEN (whPVAAvg3mo < 10 and whPVAAvg3mo > 0) THEN  (round(whPVAAvg3mo,0))
--	ELSE whPVAAvg3mo   END as PVAAPIMOVolAvg FROM tmp_ALLPVA_Aplicor

   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_Aplicor_LoadVolume')
          DROP TABLE tmp_Aplicor_LoadVolume

SELECT * INTO tmp_Aplicor_LoadVolume FROM (
SELECT PMID,APIACCOUNTNO,AAPAccountNo,DEA,
CASE WHEN mo3avg >= 1000 THEN (round((mo3avg/1000),0) )*1000
	WHEN (mo3avg < 1000 and mo3avg >= 100) THEN  (round((mo3avg/100),0) )*100
	WHEN (mo3avg < 100 and mo3avg >= 10) THEN  (round((mo3avg/10),0) )*10
	WHEN (mo3avg < 10 and mo3avg > 0) THEN  (round(mo3avg,0))
	ELSE mo3avg   END as [PVA Monthly Average (BusinessAccount.Account0813)] , --PVAMOVolumeAvg 
CASE WHEN whPVAAvg3mo >= 1000 THEN (round((whPVAAvg3mo/1000),0) )*1000
	WHEN (whPVAAvg3mo < 1000 and whPVAAvg3mo >= 100) THEN  (round((whPVAAvg3mo/100),0) )*100
	WHEN (whPVAAvg3mo < 100 and whPVAAvg3mo >= 10) THEN  (round((whPVAAvg3mo/10),0) )*10
	WHEN (whPVAAvg3mo < 10 and whPVAAvg3mo > 0) THEN  (round(whPVAAvg3mo,0))
	ELSE whPVAAvg3mo   END as [AVG Comb Volume  (BusinessAccount.Account0812)], --PVAAPIMOVolAvg
	ROUND(WHMOAvg,0) as [Monthly Vol (BusinessAccount.Account0817], --APIMOVolume
    ROUND(WHBrandRx,0) as [Brand Rx (BusinessAccount.Account0816)], --APIBrandRx
	ROUND(WHGenRx,0) as [Generic Rx (BusinessAccount.Account0815)], --APIGenericRx
	ROUND(WHOTC,0) as [OTC (BusinessAccount.Account0814)] --APIOTC

 FROM tmp_ALLPVA_Aplicor
)ch

--SELECT PMID,APIACCOUNTNO as [ API Account No],AAPAccountNo as [AAP Account No],DEA, PVAMOVolumeAvg as [PVA Monthly Average],
--   PVAAPIMOVolAvg as [Avg Comb Vol],
--   APIMOVolume as [Monthly Vol],
--   APIBrandRx as [Brand Rx],
--   APIGenericRx as [Generic Rx],
--   APIOTC as [OTC]
-- FROM tmp_Aplicor_LoadVolume

SELECT PMID,APIACCOUNTNO as [API Account Number (BusinessAccount.Account0209)],
AAPAccountNo as [AAP Account No (BusinessAccount.Account0201)],
DEA as [DEA (BusinessAccount.Account0145)], 
[PVA Monthly Average (BusinessAccount.Account0813)],
[AVG Comb Volume  (BusinessAccount.Account0812)],
[Monthly Vol (BusinessAccount.Account0817],
[Brand Rx (BusinessAccount.Account0816)],
[Generic Rx (BusinessAccount.Account0815)],
[OTC (BusinessAccount.Account0814)]
 FROM tmp_Aplicor_LoadVolume

--   PVAMOVolumeAvg as [PVA Monthly Average (BusinessAccount.Account0123)],
--   PVAAPIMOVolAvg as [Avg Comb Vol (BusinessAccount.Account0144)],
--   APIMOVolume as [Monthly Vol: (BusinessAccount.Account0133)],
--   APIBrandRx as [Brand Rx: (BusinessAccount.Account0134)],
--   APIGenericRx as [Generic Rx: (BusinessAccount.Account0135)],
--   APIOTC as [OTC: (BusinessAccount.Account0136)]



END





GO
