USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_ReportCardVolume_Static]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Report Card for Wayne
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_ReportCardVolume_Static]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

 
		 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_RCVol_jmw')
		 BEGIN
          DROP TABLE tmp_RCVol_jmw
         END
 
SELECT * INTO tmp_RCVol_jmw from (
	SELECT   
	  PMID, 


		MAX([API Sep 09 Brand])  as [API Sep 09 Brand],
		MAX([API Sep 09 Generic])  as [API Sep 09 Generic],
		MAX([API Sep 09 OTC])  as [API Sep 09 OTC],
		MAX([API Sep 09 Total Whse])  as [API Sep 09 Total Whse],

		MAX([API Oct 09 Brand])  as [API Oct 09 Brand],
		MAX([API Oct 09 Generic])  as [API Oct 09 Generic],
		MAX([API Oct 09 OTC])  as [API Oct 09 OTC],
		MAX([API Oct 09 Total Whse])  as [API Oct 09 Total Whse],

		MAX([API Nov 09 Brand])  as [API Nov 09 Brand],
		MAX([API Nov 09 Generic])  as [API Nov 09 Generic],
		MAX([API Nov 09 OTC])  as [API Nov 09 OTC],
		MAX([API Nov 09 Total Whse])  as [API Nov 09 Total Whse],

		MAX([API Dec 09 Brand])  as [API Dec 09 Brand],
		MAX([API Dec 09 Generic])  as [API Dec 09 Generic],
		MAX([API Dec 09 OTC])  as [API Dec 09 Dec],
		MAX([API Dec 09 Total Whse])  as [API Dec 09 Total Whse],

		MAX([API Jan 10 Brand])  as [API Jan 10 Brand],
		MAX([API Jan 10 Generic])  as [API Jan 10 Generic],
		MAX([API Jan 10 OTC])  as [API Jan 10 OTC],
		MAX([API Jan 10 Total Whse])  as [API Jan 10 Total Whse],

		MAX([API Feb 10 Brand])  as [API Feb 10 Brand] ,
		MAX([API Feb 10 Generic])  as [API Feb 10 Generic],
		MAX([API Feb 10 OTC])  as [API Feb 10 OTC],
		MAX([API Feb 10 Total Whse])  as [API Feb 10 Total Whse],

		MAX([API Mar 10 Brand])  as [API Mar 10 Brand] ,
		MAX([API Mar 10 Generic])  as [API Mar 10 Generic],
		MAX([API Mar 10 OTC])  as [API Mar 10 OTC],
		MAX([API Mar 10 Total Whse])  as [API Mar 10 Total Whse],

		MAX([API Apr 10 Brand])  as [API Apr 10 Brand] ,
		MAX([API Apr 10 Generic])  as [API Apr 10 Generic],
		MAX([API Apr 10 OTC])  as [API Apr 10 OTC],
		MAX([API Apr 10 Total Whse])  as [API Apr 10 Total Whse],

		MAX([API May 10 Brand])  as [API May 10 Brand] ,
		MAX([API May 10 Generic])  as [API May 10 Generic],
		MAX([API May 10 OTC])  as [API May 10 OTC],
		MAX([API May 10 Total Whse])  as [API May 10 Total Whse],

		MAX([API Jun 10 Brand])  as [API Jun 10 Brand] ,
		MAX([API Jun 10 Generic])  as [API Jun 10 Generic],
		MAX([API Jun 10 OTC])  as [API Jun 10 OTC],
		MAX([API Jun 10 Total Whse])  as [API Jun 10 Total Whse],

		MAX([API Jul 10 Brand])  as [API Jul 10 Brand] ,
		MAX([API Jul 10 Generic])  as [API Jul 10 Generic],
		MAX([API Jul 10 OTC])  as [API Jul 10 OTC],
		MAX([API Jul 10 Total Whse])  as [API Jul 10 Total Whse],

		MAX([API Aug 10 Brand])  as [API Aug 10 Brand] ,
		MAX([API Aug 10 Generic])  as [API Aug 10 Generic],
		MAX([API Aug 10 OTC])  as [API Aug 10 OTC],
		MAX([API Aug 10 Total Whse])  as [API Aug 10 Total Whse],

		MAX([API Sep 10 Brand])  as [API Sep 10 Brand] ,
		MAX([API Sep 10 Generic])  as [API Sep 10 Generic],
		MAX([API Sep 10 OTC])  as [API Sep 10 OTC],
		MAX([API Sep 10 Total Whse])  as [API Sep 10 Total Whse],
		cast(0 as float) as [API Total Brand Sales],
		cast(0 as float) as [API Total Generic Sales],
		cast(0 as float) as [API Total OTC Sales],
		cast(0 as float) as [API TOTAL SALES],
	-- NEED TO PUT IN FOR NEXT YEAR - DIDN"T HAVE CAH AAP SALES IN Jan 2010
	--    MAX([CAH Jan 10 AAP Brand])  as [CAH Jan AAP Brand],
	--    MAX([CAH Jan 10 AAP Src Generics])  as [CAH Jan AAP Src Generics],
	--    MAX([CAH Jan 10 AAP Other Sales])  as [CAH Jan AAP Other Sales],
	--    MAX([CAH Jan 10 AAP Total Sales])  as [CAH Jan AAP Total Sales],
	 
		MAX([CAH Feb 10 AAP Brand])  as [CAH Feb AAP Brand],
		MAX([CAH Feb 10 AAP Src Generics])  as [CAH Feb AAP Src Generics],
		MAX([CAH Feb 10 AAP Other Sales])  as [CAH Feb AAP Other Sales],
		MAX([CAH Feb 10 AAP Total Sales])  as [CAH Feb AAP Total Sales],

		MAX([CAH Mar 10 AAP Brand])  as [CAH Mar AAP Brand],
		MAX([CAH Mar 10 AAP Src Generics])  as [CAH Mar AAP Src Generics],
		MAX([CAH Mar 10 AAP Other Sales])  as [CAH Mar AAP Other Sales],
		MAX([CAH Mar 10 AAP Total Sales])  as [CAH Mar AAP Total Sales],

		MAX([CAH Apr 10 AAP Brand])  as [CAH Apr AAP Brand],
		MAX([CAH Apr 10 AAP Src Generics])  as [CAH Apr AAP Src Generics],
		MAX([CAH Apr 10 AAP Other Sales])  as [CAH Apr AAP Other Sales],
		MAX([CAH Apr 10 AAP Total Sales])  as [CAH Apr AAP Total Sales],

		MAX([CAH May 10 AAP Brand])  as [CAH May AAP Brand],
		MAX([CAH May 10 AAP Src Generics])  as [CAH May AAP Src Generics],
		MAX([CAH May 10 AAP Other Sales])  as [CAH May AAP Other Sales],
		MAX([CAH May 10 AAP Total Sales])  as [CAH May AAP Total Sales],

		MAX([CAH Jun 10 AAP Brand])  as [CAH Jun AAP Brand],
		MAX([CAH Jun 10 AAP Src Generics])  as [CAH Jun AAP Src Generics],
		MAX([CAH Jun 10 AAP Other Sales])  as [CAH Jun AAP Other Sales],
		MAX([CAH Jun 10 AAP Total Sales])  as [CAH Jun AAP Total Sales],

		MAX([CAH Jul 10 AAP Brand])  as [CAH Jul AAP Brand],
		MAX([CAH Jul 10 AAP Src Generics])  as [CAH Jul AAP Src Generics],
		MAX([CAH Jul 10 AAP Other Sales])  as [CAH Jul AAP Other Sales],
		MAX([CAH Jul 10 AAP Total Sales])  as [CAH Jul AAP Total Sales],

		MAX([CAH Aug 10 AAP Brand])  as [CAH Aug AAP Brand],
		MAX([CAH Aug 10 AAP Src Generics])  as [CAH Aug AAP Src Generics],
		MAX([CAH Aug 10 AAP Other Sales])  as [CAH Aug AAP Other Sales],
		MAX([CAH Aug 10 AAP Total Sales])  as [CAH Aug AAP Total Sales],
	 

		cast(0 as float) as [CAH Total Brand Sales],
		cast(0 as float) as [CAH Total Src Generic Sales],
		cast(0 as float) as [CAH Total Other Sales],
		cast(0 as float) as [TOTAL CAH SALES YTD],

	 
		MAX([ML Jan 10 Volume])  as [ML Jan 10 Volume],
		MAX([ML Feb 10 Volume])  as [ML Feb 10 Volume],
		MAX([ML Mar 10 Volume])  as [ML Mar 10 Volume],
		MAX([ML Apr 10 Volume])  as [ML Apr 10 Volume],
		MAX([ML May 10 Volume])  as [ML May 10 Volume],
		MAX([ML Jun 10 Volume])  as [ML Jun 10 Volume],
		MAX([ML Jul 10 Volume])  as [ML Jul 10 Volume],
		MAX([ML Aug 10 Volume])  as [ML Aug 10 Volume],
		cast(0 as float) as [ML YTD Total Volume],

		cast(0 as float) as [Total Sep 09 Combined Mthly Sales],
		cast(0 as float) as [Total Oct 09 Combined Mthly Sales],
		cast(0 as float) as [Total Nov 09 Combined Mthly Sales],
		cast(0 as float) as [Total Dec 09 Combined Mthly Sales],
		cast(0 as float) as [Total Jan 09 Combined Mthly Sales],
		cast(0 as float) as [Total Feb 09 Combined Mthly Sales],
		cast(0 as float) as [Total Mar 09 Combined Mthly Sales],
		cast(0 as float) as [Total Apr 09 Combined Mthly Sales],
		cast(0 as float) as [Total May 09 Combined Mthly Sales],
		cast(0 as float) as [Total Jun 09 Combined Mthly Sales],
		cast(0 as float) as [Total Jul 09 Combined Mthly Sales],
		cast(0 as float) as [Total Aug 09 Combined Mthly Sales],    
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


	  FROM all_volume  where ( month(date) in (01,02,03,04,05,06,07,08,09) and year(date) = 2010) 
					   or (month(date) in (09,10,11,12) and year(date) = 2009)            
			 group by PMID ,date
	) as TableDate


	PIVOT 
	(
	  SUM(WHAPIBrand) 
	  FOR dateWAB IN  ([API Sep 09 Brand],[API Oct 09 Brand],[API Nov 09 Brand],[API Dec 09 Brand],[API Jan 10 Brand], [API Feb 10 Brand], [API Mar 10 Brand],
			 [API Apr 10 Brand], [API May 10 Brand], [API Jun 10 Brand], [API Jul 10 Brand], [API Aug 10 Brand], [API Sep 10 Brand]) 
	) as P1
	PIVOT 
	(
	  SUM(WHAPIGeneric)
	  FOR dateWAG IN  ([API Sep 09 Generic],[API Oct 09 Generic],[API Nov 09 Generic],[API Dec 09 Generic],[API Jan 10 Generic], [API Feb 10 Generic], [API Mar 10 Generic],
			   [API Apr 10 Generic],[API May 10 Generic],[API Jun 10 Generic],[API Jul 10 Generic],[API Aug 10 Generic],[API Sep 10 Generic]) 
	) as P2
	PIVOT 
	(
	  SUM(WHAPIOTC)
	  FOR dateWAO IN  ([API Sep 09 OTC],[API Oct 09 OTC],[API Nov 09 OTC],[API Dec 09 OTC],[API Jan 10 OTC], [API Feb 10 OTC], [API Mar 10 OTC], 
			   [API Apr 10 OTC], [API May 10 OTC], [API Jun 10 OTC], [API Jul 10 OTC], [API Aug 10 OTC], [API Sep 10 OTC]) 
	)as P3
	PIVOT 
	(
	  SUM(WHAPITotal)
	  FOR dateWAT IN  ([API Sep 09 Total Whse],[API Oct 09 Total Whse],[API Nov 09 Total Whse],[API Dec 09 Total Whse],[API Jan 10 Total Whse], [API Feb 10 Total Whse],
				   [API Mar 10 Total Whse], [API Apr 10 Total Whse],[API May 10 Total Whse],[API Jun 10 Total Whse],[API Jul 10 Total Whse],[API Aug 10 Total Whse],[API Sep 10 Total Whse]) 
	)as P4
	PIVOT 
	(
	  SUM(AAPBrand)
	  FOR dateCAB IN  ([CAH Jan 10 AAP Brand], [CAH Feb 10 AAP Brand], [CAH Mar 10 AAP Brand], [CAH Apr 10 AAP Brand], 
					   [CAH May 10 AAP Brand], [CAH Jun 10 AAP Brand], [CAH Jul 10 AAP Brand], [CAH Aug 10 AAP Brand]) 
	)as P5

	PIVOT 
	(
	  SUM(AAPGENTotalSrc)
	  FOR dateSRCG IN  ([CAH Jan 10 AAP Src Generics], [CAH Feb 10 AAP Src Generics], [CAH Mar 10 AAP Src Generics], [CAH Apr 10 AAP Src Generics],
						 [CAH May 10 AAP Src Generics], [CAH Jun 10 AAP Src Generics], [CAH Jul 10 AAP Src Generics], [CAH Aug 10 AAP Src Generics]) 
	)as P6

	PIVOT 
	(
	  SUM(AAPOther)
	  FOR dateCOS IN  ([CAH Jan 10 AAP Other Sales], [CAH Feb 10 AAP Other Sales], [CAH Mar 10 AAP Other Sales], [CAH Apr 10 AAP Other Sales],
					   [CAH May 10 AAP Other Sales],[CAH Jun 10 AAP Other Sales],[CAH Jul 10 AAP Other Sales],[CAH Aug 10 AAP Other Sales] ) 
	)as P7

	PIVOT 
	(
	  SUM(AAPNetSales)
	  FOR dateCTS IN  ([CAH Jan 10 AAP Total Sales], [CAH Feb 10 AAP Total Sales], [CAH Mar 10 AAP Total Sales], [CAH Apr 10 AAP Total Sales],
						 [CAH May 10 AAP Total Sales], [CAH Jun 10 AAP Total Sales], [CAH Jul 10 AAP Total Sales], [CAH Aug 10 AAP Total Sales]  ) 
	)as P8

	PIVOT 
	(
	  SUM(MLTotal)
	  FOR dateML IN  ([ML Jan 10 Volume], [ML Feb 10 Volume], [ML Mar 10 Volume], [ML Apr 10 Volume],
						 [ML May 10 Volume], [ML Jun 10 Volume], [ML Jul 10 Volume], [ML Aug 10 Volume]  ) 
	)as P9
	group by PMID 

)vol

END








GO
