USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_ReportCardVolume_Static_3mo]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Report Card for Wayne
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_ReportCardVolume_Static_3mo]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

 
		 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_RCVol_jmw_1')
		 BEGIN
          DROP TABLE tmp_RCVol_jmw_1
         END
 
SELECT * INTO tmp_RCVol_jmw_1 from (
	SELECT   
	  PMID, 

 
             			   cast(null as varchar(20)) as AAP# ,  
			   cast(null as varchar(20)) as Parent# ,  
			  cast(null as varchar(20)) as API# ,  
			   cast(null as varchar(10)) as [AAP Eff] ,  
			  cast(null as varchar(10)) as [AAP Quit] ,  
			   cast(null as  varchar(200)) as Description ,  
			   cast(null as  varchar(200)) as Affiliate ,  
			   cast(null as  varchar(100)) as [Account DBA Name] ,  
			   cast(null as  varchar(100)) as [Account Corporate Name] ,  
			   cast(null as  varchar(100)) as [Address] ,  
			   cast(null as  varchar(100)) as [City] ,  
			   cast(null as  varchar(100)) as ST ,  
			   cast(null as  varchar(100)) as Contact ,  
			   cast(null as  varchar(10)) as [Whse Acct Date Opened] ,  
			   cast(null as  varchar(100)) as Status ,  
			   cast(null as  varchar(100)) as Wholesaler ,  
		MAX([API Oct 10 Brand])  as [API Oct 10 Brand],
		MAX([API Oct 10 Generic])  as [API Oct 10 Generic],
		MAX([API Oct 10 OTC])  as [API Oct 10 OTC],
		MAX([API Oct 10 Total Whse])  as [API Oct 10 Total Whse],

		MAX([API Nov 10 Brand])  as [API Nov 10 Brand],
		MAX([API Nov 10 Generic])  as [API Nov 10 Generic],
		MAX([API Nov 10 OTC])  as [API Nov 10 OTC],
		MAX([API Nov 10 Total Whse])  as [API Nov 10 Total Whse],

		MAX([API Dec 10 Brand])  as [API Dec 10 Brand],
		MAX([API Dec 10 Generic])  as [API Dec 10 Generic],
		MAX([API Dec 10 OTC])  as [API Dec 10 OTC],
		MAX([API Dec 10 Total Whse])  as [API Dec 10 Total Whse],

		 
		cast(0 as float) as [API Total Brand Sales],
		cast(0 as float) as [API Total Generic Sales],
		cast(0 as float) as [API Total OTC Sales],
		cast(0 as float) as [API TOTAL SALES],

 
		MAX([CAH Oct 10 AAP Brand])  as [CAH Oct 10 AAP Brand],
		MAX([CAH Oct 10 AAP Src Generics])  as [CAH Oct 10 AAP Src Generics],
		MAX([CAH Oct 10 AAP Other Sales])  as [CAH Oct 10 AAP Other Sales],
		MAX([CAH Oct 10 AAP Total Sales])  as [CAH Oct 10 AAP Total Sales],

		MAX([CAH Nov 10 AAP Brand])  as [CAH Nov 10 AAP Brand],
		MAX([CAH Nov 10 AAP Src Generics])  as [CAH Nov 10 AAP Src Generics],
		MAX([CAH Nov 10 AAP Other Sales])  as [CAH Nov 10 AAP Other Sales],
		MAX([CAH Nov 10 AAP Total Sales])  as [CAH Nov 10 AAP Total Sales],

		MAX([CAH Dec 10 AAP Brand])  as [CAH Dec 10 AAP Brand],
		MAX([CAH Dec 10 AAP Src Generics])  as [CAH Dec 10 AAP Src Generics],
		MAX([CAH Dec 10 AAP Other Sales])  as [CAH Dec 10 AAP Other Sales],
		MAX([CAH Dec 10 AAP Total Sales])  as [CAH Dec 10 AAP Total Sales],
 
	 

		cast(0 as float) as [CAH Total Brand Sales],
		cast(0 as float) as [CAH Total Src Generic Sales],
		cast(0 as float) as [CAH Total Other Sales],
		cast(0 as float) as [TOTAL CAH SALES YTD],

	 
		MAX([ML Oct 10 Volume])  as [ML Oct 10 Volume],
		MAX([ML Nov 10 Volume])  as [ML Nov 10 Volume],
		MAX([ML Dec 10 Volume])  as [ML Dec 10 Volume],

		cast(0 as float) as [ML YTD Total Volume],

		cast(0 as float) as [Total Oct 10 Combined Mthly Sales],
		cast(0 as float) as [Total Nov 10 Combined Mthly Sales],
		cast(0 as float) as [Total Dec 10 Combined Mthly Sales],
 
		cast(0 as float) as [Total Combined YTD Sales]


	FROM (
	  SELECT PMID,date,
		  'API ' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + ' Brand' as dateWAB,
		sum(isnull(WHAPIBrand,0))as WHAPIBrand  ,
		   'API ' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + ' Generic' as dateWAG,
		sum(isnull(WHAPIGeneric,0))as WHAPIGeneric ,
		   'API ' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + ' OTC' as dateWAO,
		sum(isnull(WHAPIOTC,0))as WHAPIOTC  ,
		   'API ' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + ' Total Whse' as dateWAT,
		sum(isnull(WHAPITotal,0))as WHAPITotal ,

		   'CAH '+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + ' AAP Brand'    AS dateCAB ,
		sum(isnull(AAPBrand,0)) as AAPBrand,
		   'CAH '+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + ' AAP Src Generics'    AS dateSRCG ,
		sum(isnull(AAPGENTotalSrc,0)) as AAPGENTotalSrc,

		  'CAH '+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + ' AAP Other Sales'    AS dateCOS ,
		sum(isnull(AAPNetSales ,0)) - sum(isnull(AAPBrand ,0))-sum(isnull(AAPGENTotalSrc,0)) as AAPOther,

		'CAH '+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + ' AAP Total Sales'    AS dateCTS ,
		sum(isnull(AAPNetSales,0)) as AAPNetSales,

		'ML '+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + ' Volume'    AS dateML ,
		sum(isnull(MLTotal,0)) as MLTotal


	  FROM pharmacymaster..all_volume  where ( month(date) in (10,11,12) and year(date) = 2010) and pmid = 100378
					           
			 group by PMID ,date
	) as TableDate


	PIVOT 
	(
	  SUM(WHAPIBrand) 
	  FOR dateWAB IN  ( [API Oct 10 Brand],[API Nov 10 Brand],[API Dec 10 Brand]) 
	) as P1
	PIVOT 
	(
	  SUM(WHAPIGeneric)
	  FOR dateWAG IN  ([API Oct 10 Generic],[API Nov 10 Generic],[API Dec 10 Generic]) 
	) as P2
	PIVOT 
	(
	  SUM(WHAPIOTC)
	  FOR dateWAO IN  ([API Oct 10 OTC],[API Nov 10 OTC],[API Dec 10 OTC]) 
	)as P3
	PIVOT 
	(
	  SUM(WHAPITotal)
	  FOR dateWAT IN  ( [API Oct 10 Total Whse],[API Nov 10 Total Whse],[API Dec 10 Total Whse]) 
	)as P4
	PIVOT 
	(
	  SUM(AAPBrand)
	  FOR dateCAB IN  ([CAH Oct 10 AAP Brand], [CAH Nov 10 AAP Brand], [CAH Dec 10 AAP Brand])
	)as P5

	PIVOT 
	(
	  SUM(AAPGENTotalSrc)
	  FOR dateSRCG IN  ([CAH Oct 10 AAP Src Generics], [CAH Nov 10 AAP Src Generics], [CAH Dec 10 AAP Src Generics]) 
	)as P6

	PIVOT 
	(
	  SUM(AAPOther)
	  FOR dateCOS IN  ([CAH Oct 10 AAP Other Sales], [CAH Nov 10 AAP Other Sales], [CAH Dec 10 AAP Other Sales] ) 
	)as P7

	PIVOT 
	(
	  SUM(AAPNetSales)
	  FOR dateCTS IN  ([CAH Oct 10 AAP Total Sales], [CAH Nov 10 AAP Total Sales], [CAH Dec 10 AAP Total Sales] ) 
	)as P8

	PIVOT 
	(
	  SUM(MLTotal)
	  FOR dateML IN  ([ML Oct 10 Volume], [ML Nov 10 Volume], [ML Dec 10 Volume]   ) 
	)as P9
	group by PMID 

)vol

		UPDATE tmp_RCVol_jmw_1 set [API Total Brand Sales] =  [API Oct 10 Brand] + [API Nov 10 Brand]+ [API Dec 10 Brand];

		UPDATE tmp_RCVol_jmw_1 set [API Total Generic Sales] =  [API Oct 10 Generic] + [API Nov 10 Generic] + [API Dec 10 Generic];

		UPDATE tmp_RCVol_jmw_1 set [API Total OTC Sales] =  [API Oct 10 OTC] + [API Nov 10 OTC] + [API Dec 10 OTC];

		UPDATE tmp_RCVol_jmw_1 set [API Total Sales] =  [API Oct 10 Total Whse] +[API Nov 10 Total Whse] + [API Dec 10 Total Whse];


		UPDATE tmp_RCVol_jmw_1 set [CAH Total Brand Sales] = [CAH Oct 10 AAP Brand] + [CAH Nov 10 AAP Brand] + [CAH Dec 10 AAP Brand];

		UPDATE tmp_RCVol_jmw_1 set [CAH Total Src Generic Sales] =  [CAH Oct 10 AAP Src Generics] +  [CAH Nov 10 AAP Src Generics] +  [CAH Dec 10 AAP Src Generics];

		UPDATE tmp_RCVol_jmw_1 set [CAH Total Other Sales] =  [CAH Oct 10 AAP Other Sales] + [CAH Nov 10 AAP Other Sales] + [CAH Dec 10 AAP Other Sales] ;

	    UPDATE tmp_RCVol_jmw_1 set [TOTAL CAH SALES YTD] =  [CAH Oct 10 AAP Total Sales] +  [CAH Nov 10 AAP Total Sales] + [CAH Dec 10 AAP Total Sales] 
 
	 
END








GO
