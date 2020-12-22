USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_APIandCAH_UnitsAndDollars_byCustomer#_STATIC]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<LeeAnn Carrell>
-- Create date: <04-24-2017,>
-- Description:	<Create API and CAH Units and $ by Cutomer # Report>
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_APIandCAH_UnitsAndDollars_byCustomer#_STATIC]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_UnitsAndDollarsByCustNo')
		 BEGIN
          DROP TABLE tmp_UnitsAndDollarsByCustNo
         END


	SELECT   
		cast(null as varchar(10)) as TM ,
	    PMID,  
		cast(null as varchar(20)) as AAP# ,  
		cast(null as varchar(20)) as Parent# ,
		cast(null as varchar(20)) as [API#] ,     
		cast('' as DateTime) as [AAP Eff], 
		cast('' as DateTime) as [API Acct Eff],   
		cast('' as DateTime) as [AAP Quit],   
        cast(null as varchar(20)) as [API Status] , 
		cast(null as  varchar(200)) as Description ,  
		cast(null as  varchar(200)) as Affiliate ,    
		cast(null as  varchar(100)) as [Account DBA Name] ,  
		cast(null as  varchar(100)) as [City] ,   
		cast(null as  varchar(100)) as ST , 
   
		MAX([API GRx Units 03/16])  as [API GRx Units 03/16],	 
		MAX([API GRx $ 03/16])  as [API GRx $ 03/16],		 
		MAX([API BRx Units 03/16])  as [API BRx Units 03/16],	 
		MAX([API BRx $ 03/16])  as [API BRx $ 03/16],
		MAX([CAH GRx Units 03/16])  as [CAH GRx Units 03/16],	 
		MAX([CAH GRx $ 03/16])  as [CAH GRx $ 03/16],		 
		MAX([CAH BRx Units 03/16])  as [CAH BRx Units 03/16],	 
		MAX([CAH BRx $ 03/16])  as [CAH BRx $ 03/16],

		MAX([API GRx Units 04/16])  as [API GRx Units 04/16],	 
		MAX([API GRx $ 04/16])  as [API GRx $ 04/16],		 
		MAX([API BRx Units 04/16])  as [API BRx Units 04/16],	 
		MAX([API BRx $ 04/16])  as [API BRx $ 04/16],
		MAX([CAH GRx Units 04/16])  as [CAH GRx Units 04/16],	 
		MAX([CAH GRx $ 04/16])  as [CAH GRx $ 04/16],		 
		MAX([CAH BRx Units 04/16])  as [CAH BRx Units 04/16],	 
		MAX([CAH BRx $ 04/16])  as [CAH BRx $ 04/16],

        MAX([API GRx Units 05/16])  as [API GRx Units 05/16],	 
		MAX([API GRx $ 05/16])  as [API GRx $ 05/16],		 
		MAX([API BRx Units 05/16])  as [API BRx Units 05/16],	 
		MAX([API BRx $ 05/16])  as [API BRx $ 05/16],
		MAX([CAH GRx Units 05/16])  as [CAH GRx Units 05/16],	 
		MAX([CAH GRx $ 05/16])  as [CAH GRx $ 05/16],		 
		MAX([CAH BRx Units 05/16])  as [CAH BRx Units 05/16],	 
		MAX([CAH BRx $ 05/16])  as [CAH BRx $ 05/16],

		MAX([API GRx Units 06/16])  as [API GRx Units 06/16],	 
		MAX([API GRx $ 06/16])  as [API GRx $ 06/16],		 
		MAX([API BRx Units 06/16])  as [API BRx Units 06/16],	 
		MAX([API BRx $ 06/16])  as [API BRx $ 06/16],
		MAX([CAH GRx Units 06/16])  as [CAH GRx Units 06/16],	 
		MAX([CAH GRx $ 06/16])  as [CAH GRx $ 06/16],		 
		MAX([CAH BRx Units 06/16])  as [CAH BRx Units 06/16],	 
		MAX([CAH BRx $ 06/16])  as [CAH BRx $ 06/16],

		MAX([API GRx Units 07/16])  as [API GRx Units 07/16],	 
		MAX([API GRx $ 07/16])  as [API GRx $ 07/16],		 
		MAX([API BRx Units 07/16])  as [API BRx Units 07/16],	 
		MAX([API BRx $ 07/16])  as [API BRx $ 07/16],
		MAX([CAH GRx Units 07/16])  as [CAH GRx Units 07/16],	 
		MAX([CAH GRx $ 07/16])  as [CAH GRx $ 07/16],		 
		MAX([CAH BRx Units 07/16])  as [CAH BRx Units 07/16],	 
		MAX([CAH BRx $ 07/16])  as [CAH BRx $ 07/16],

		MAX([API GRx Units 08/16])  as [API GRx Units 08/16],	 
		MAX([API GRx $ 08/16])  as [API GRx $ 08/16],		 
		MAX([API BRx Units 08/16])  as [API BRx Units 08/16],	 
		MAX([API BRx $ 08/16])  as [API BRx $ 08/16],
		MAX([CAH GRx Units 08/16])  as [CAH GRx Units 08/16],	 
		MAX([CAH GRx $ 08/16])  as [CAH GRx $ 08/16],		 
		MAX([CAH BRx Units 08/16])  as [CAH BRx Units 08/16],	 
		MAX([CAH BRx $ 08/16])  as [CAH BRx $ 08/16],

		MAX([API GRx Units 09/16])  as [API GRx Units 09/16],	 
		MAX([API GRx $ 09/16])  as [API GRx $ 09/16],		 
		MAX([API BRx Units 09/16])  as [API BRx Units 09/16],	 
		MAX([API BRx $ 09/16])  as [API BRx $ 09/16],
		MAX([CAH GRx Units 09/16])  as [CAH GRx Units 09/16],	 
		MAX([CAH GRx $ 09/16])  as [CAH GRx $ 09/16],		 
		MAX([CAH BRx Units 09/16])  as [CAH BRx Units 09/16],	 
		MAX([CAH BRx $ 09/16])  as [CAH BRx $ 09/16],

		MAX([API GRx Units 10/16])  as [API GRx Units 10/16],	 
		MAX([API GRx $ 10/16])  as [API GRx $ 10/16],		 
		MAX([API BRx Units 10/16])  as [API BRx Units 10/16],	 
		MAX([API BRx $ 10/16])  as [API BRx $ 10/16],
		MAX([CAH GRx Units 10/16])  as [CAH GRx Units 10/16],	 
		MAX([CAH GRx $ 10/16])  as [CAH GRx $ 10/16],		 
		MAX([CAH BRx Units 10/16])  as [CAH BRx Units 10/16],	 
		MAX([CAH BRx $ 10/16])  as [CAH BRx $ 10/16],

		MAX([API GRx Units 11/16])  as [API GRx Units 11/16],	 
		MAX([API GRx $ 11/16])  as [API GRx $ 11/16],		 
		MAX([API BRx Units 11/16])  as [API BRx Units 11/16],	 
		MAX([API BRx $ 11/16])  as [API BRx $ 11/16],
		MAX([CAH GRx Units 11/16])  as [CAH GRx Units 11/16],	 
		MAX([CAH GRx $ 11/16])  as [CAH GRx $ 11/16],		 
		MAX([CAH BRx Units 11/16])  as [CAH BRx Units 11/16],	 
		MAX([CAH BRx $ 11/16])  as [CAH BRx $ 11/16],

		MAX([API GRx Units 12/16])  as [API GRx Units 12/16],	 
		MAX([API GRx $ 12/16])  as [API GRx $ 12/16],		 
		MAX([API BRx Units 12/16])  as [API BRx Units 12/16],	 
		MAX([API BRx $ 12/16])  as [API BRx $ 12/16],
		MAX([CAH GRx Units 12/16])  as [CAH GRx Units 12/16],	 
		MAX([CAH GRx $ 12/16])  as [CAH GRx $ 12/16],		 
		MAX([CAH BRx Units 12/16])  as [CAH BRx Units 12/16],	 
		MAX([CAH BRx $ 12/16])  as [CAH BRx $ 12/16],

		MAX([API GRx Units 01/17])  as [API GRx Units 01/17],	 
		MAX([API GRx $ 01/17])  as [API GRx $ 01/17],		 
		MAX([API BRx Units 01/17])  as [API BRx Units 01/17],	 
		MAX([API BRx $ 01/17])  as [API BRx $ 01/17],
		MAX([CAH GRx Units 01/17])  as [CAH GRx Units 01/17],	 
		MAX([CAH GRx $ 01/17])  as [CAH GRx $ 01/17],		 
		MAX([CAH BRx Units 01/17])  as [CAH BRx Units 01/17],	 
		MAX([CAH BRx $ 01/17])  as [CAH BRx $ 01/17],

		MAX([API GRx Units 02/17])  as [API GRx Units 02/17],	 
		MAX([API GRx $ 02/17])  as [API GRx $ 02/17],		 
		MAX([API BRx Units 02/17])  as [API BRx Units 02/17],	 
		MAX([API BRx $ 02/17])  as [API BRx $ 02/17],
		MAX([CAH GRx Units 02/17])  as [CAH GRx Units 02/17],	 
		MAX([CAH GRx $ 02/17])  as [CAH GRx $ 02/17],		 
		MAX([CAH BRx Units 02/17])  as [CAH BRx Units 02/17],	 
		MAX([CAH BRx $ 02/17])  as [CAH BRx $ 02/17],

		MAX([API GRx Units 03/17])  as [API GRx Units 03/17],	 
		MAX([API GRx $ 03/17])  as [API GRx $ 03/17],		 
		MAX([API BRx Units 03/17])  as [API BRx Units 03/17],	 
		MAX([API BRx $ 03/17])  as [API BRx $ 03/17],
		MAX([CAH GRx Units 03/17])  as [CAH GRx Units 03/17],	 
		MAX([CAH GRx $ 03/17])  as [CAH GRx $ 03/17],		 
		MAX([CAH BRx Units 03/17])  as [CAH BRx Units 03/17],	 
		MAX([CAH BRx $ 03/17])  as [CAH BRx $ 03/17],

		MAX([API GRx Units 04/17])  as [API GRx Units 04/17],	 
		MAX([API GRx $ 04/17])  as [API GRx $ 04/17],		 
		MAX([API BRx Units 04/17])  as [API BRx Units 04/17],	 
		MAX([API BRx $ 04/17])  as [API BRx $ 04/17],
		MAX([CAH GRx Units 04/17])  as [CAH GRx Units 04/17],	 
		MAX([CAH GRx $ 04/17])  as [CAH GRx $ 04/17],		 
		MAX([CAH BRx Units 04/17])  as [CAH BRx Units 04/17],	 
		MAX([CAH BRx $ 04/17])  as [CAH BRx $ 04/17]

	INTO tmp_UnitsAndDollarsByCustNo

	FROM (
	  SELECT av.PMID,av.date, 

 		'API GRx Units '+ RIGHT('0' + convert(varchar(2), month(av.date)), 2)  + '/' +  SUBSTRING(CONVERT(VARCHAR(9), year(av.date),4), 3, 2)    AS dateGRU ,
		max(isnull(WHAPIGenericUnits,0)) as WHAPIGenericUnits,

		'API GRx $ '+  RIGHT('0' + convert(varchar(2), month(av.date)), 2)  + '/' +  SUBSTRING(CONVERT(VARCHAR(9), year(av.date),4), 3, 2)     AS dateGRD ,
		max(isnull(WHAPIGeneric,0)) as WHAPIGeneric,

        'API BRx Units '+ RIGHT('0' + convert(varchar(2), month(av.date)), 2)  + '/' +  SUBSTRING(CONVERT(VARCHAR(9), year(av.date),4), 3, 2)    AS dateBRU ,
		max(isnull(WHAPIBrandUnits,0)) as WHAPIBrandUnits,

		'API BRx $ '+  RIGHT('0' + convert(varchar(2), month(av.date)), 2)  + '/' +  SUBSTRING(CONVERT(VARCHAR(9), year(av.date),4), 3, 2)     AS dateBRD ,
		max(isnull(WHAPIBrand,0)) as WHAPIBrand,

		'CAH GRx Units '+ RIGHT('0' + convert(varchar(2), month(av.date)), 2)  + '/' +  SUBSTRING(CONVERT(VARCHAR(9), year(av.date),4), 3, 2)    AS dateCGRU ,
		sum(isnull(g.Ship_Qty,0)) as CAHGenericUnits,

		'CAH GRx $ '+  RIGHT('0' + convert(varchar(2), month(av.date)), 2)  + '/' +  SUBSTRING(CONVERT(VARCHAR(9), year(av.date),4), 3, 2)     AS dateCGRD ,
		max(isnull(AAPGENTotal,0)) as AAPGeneric,

        'CAH BRx Units '+ RIGHT('0' + convert(varchar(2), month(av.date)), 2)  + '/' +  SUBSTRING(CONVERT(VARCHAR(9), year(av.date),4), 3, 2)    AS dateCBRU ,
		sum(isnull(b.ship_qty,0)) as CAHBrandUnits,

		'CAH BRx $ '+  RIGHT('0' + convert(varchar(2), month(av.date)), 2)  + '/' +  SUBSTRING(CONVERT(VARCHAR(9), year(av.date),4), 3, 2)     AS dateCBRD ,
		max(isnull(AAPBrand,0)) as AAPBrand


	  FROM pharmacymaster..all_volume  av
	  LEFT JOIN Purchases..v_CHPH_GenericPurchases g
	  ON av.PMID = g.PMID and month(av.date) = month(g.date) and year(av.date) = year(g.date)
	  LEFT JOIN Purchases..v_CHPH_BrandPurchases b
	  ON av.PMID = b.PMID and month(av.date) = month(b.date) and year(av.date) = year(b.date)

	  where ( (month(av.date) in (03,04,05,06,07,08,09,10,11,12) and year(av.date) = 2016) or (month(av.date) in (01,02,03,04) and year(av.date) = 2017)) 
 		 group by av.PMID ,av.date, g.date, b.date
	) as TableDate


	PIVOT 
	(
	  SUM(WHAPIGenericUnits)
	  FOR dateGRU IN  ([API GRx Units 03/16], [API GRx Units 04/16], [API GRx Units 05/16], [API GRx Units 06/16], [API GRx Units 07/16], [API GRx Units 08/16], [API GRx Units 09/16],
		[API GRx Units 10/16], [API GRx Units 11/16], [API GRx Units 12/16], [API GRx Units 01/17], [API GRx Units 02/17], [API GRx Units 03/17], [API GRx Units 04/17])
	)as P1

	PIVOT 
	(
	  SUM(WHAPIGeneric)
	  FOR dateGRD IN  ([API GRx $ 03/16], [API GRx $ 04/16], [API GRx $ 05/16], [API GRx $ 06/16], [API GRx $ 07/16], [API GRx $ 08/16], [API GRx $ 09/16],
		[API GRx $ 10/16], [API GRx $ 11/16], [API GRx $ 12/16], [API GRx $ 01/17], [API GRx $ 02/17], [API GRx $ 03/17], [API GRx $ 04/17])
 
	)as P2

	PIVOT 
	(
	  SUM(WHAPIBrandUnits)
	  FOR dateBRU IN  ([API BRx Units 03/16], [API BRx Units 04/16], [API BRx Units 05/16], [API BRx Units 06/16], [API BRx Units 07/16], [API BRx Units 08/16], [API BRx Units 09/16],
		[API BRx Units 10/16], [API BRx Units 11/16], [API BRx Units 12/16], [API BRx Units 01/17], [API BRx Units 02/17], [API BRx Units 03/17], [API BRx Units 04/17])

	)as P3

	PIVOT 
	(
	  SUM(WHAPIBrand)
	  FOR dateBRD IN  ([API BRx $ 03/16], [API BRx $ 04/16], [API BRx $ 05/16], [API BRx $ 06/16], [API BRx $ 07/16], [API BRx $ 08/16], [API BRx $ 09/16],
		[API BRx $ 10/16], [API BRx $ 11/16], [API BRx $ 12/16], [API BRx $ 01/17], [API BRx $ 02/17], [API BRx $ 03/17], [API BRx $ 04/17])

	)as P4

	PIVOT 
	(
	  SUM(CAHGenericUnits)
	  FOR dateCGRU IN  ([CAH GRx Units 03/16], [CAH GRx Units 04/16], [CAH GRx Units 05/16], [CAH GRx Units 06/16], [CAH GRx Units 07/16], [CAH GRx Units 08/16], [CAH GRx Units 09/16],
		[CAH GRx Units 10/16], [CAH GRx Units 11/16], [CAH GRx Units 12/16], [CAH GRx Units 01/17], [CAH GRx Units 02/17], [CAH GRx Units 03/17], [CAH GRx Units 04/17])
 
	)as P5

	PIVOT 
	(
	  SUM(AAPGeneric)
	  FOR dateCGRD IN  ([CAH GRx $ 03/16], [CAH GRx $ 04/16], [CAH GRx $ 05/16], [CAH GRx $ 06/16], [CAH GRx $ 07/16], [CAH GRx $ 08/16], [CAH GRx $ 09/16],
		[CAH GRx $ 10/16], [CAH GRx $ 11/16], [CAH GRx $ 12/16], [CAH GRx $ 01/17], [CAH GRx $ 02/17], [CAH GRx $ 03/17], [CAH GRx $ 04/17])
 
	)as P6

	PIVOT 
	(
	  SUM(CAHBrandUnits)
	  FOR dateCBRU IN  ([CAH BRx Units 03/16], [CAH BRx Units 04/16], [CAH BRx Units 05/16], [CAH BRx Units 06/16], [CAH BRx Units 07/16], [CAH BRx Units 08/16], [CAH BRx Units 09/16],
		[CAH BRx Units 10/16], [CAH BRx Units 11/16], [CAH BRx Units 12/16], [CAH BRx Units 01/17], [CAH BRx Units 02/17], [CAH BRx Units 03/17], [CAH BRx Units 04/17])

	)as P7

	PIVOT 
	(
	  SUM(AAPBrand)
	  FOR dateCBRD IN  ([CAH BRx $ 03/16], [CAH BRx $ 04/16], [CAH BRx $ 05/16], [CAH BRx $ 06/16], [CAH BRx $ 07/16], [CAH BRx $ 08/16], [CAH BRx $ 09/16],
		[CAH BRx $ 10/16], [CAH BRx $ 11/16], [CAH BRx $ 12/16], [CAH BRx $ 01/17], [CAH BRx $ 02/17], [CAH BRx $ 03/17], [CAH BRx $ 04/17])

	)as P8
	
	group by PMID 
	order by PMID


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
		City = p.City, 
		ST = p.State ,
    	[API Acct Eff] = CONVERT(VARCHAR(10), p.dateopened, 101) ,
		[API Status] = p.APIStatus 
  
	FROM tmp_UnitsAndDollarsByCustNo v
	left join pharmacymaster..v_PM_AllWithAffiliates p on v.pmid=p.pmid
	left join pharmacymaster..v_wholesaler_primary w on v.pmid=w.pmid

     UPDATE  tmp  set  
		 [Account DBA Name] = vol.acctname   
	      FROM  tmp_UnitsAndDollarsByCustNo  tmp  
		  inner join  
		 	( select max(accountname) as acctname, pmid from pharmacymaster..all_volume group by pmid) vol  
	      on tmp.pmid = vol.pmid    
          where tmp.pmid < 99  
END
GO
