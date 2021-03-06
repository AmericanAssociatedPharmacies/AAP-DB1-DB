USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_GlobalRpt_MO]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create Monthly Global Report
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_GlobalRpt_MO]
(@in_month varchar(02), @in_year varchar(4))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

	DECLARE @date datetime;
	DECLARE @dateOut varchar(10);
	SET @date = @in_month + '/01/' + @in_year

	SET @dateOut =  (SELECT SUBSTRING(CONVERT(VARCHAR(11),@date, 109), 10, 2) )
	SET @dateOut = @dateOut + '-';

	SET @dateOut =  @dateOut + (SELECT SUBSTRING(CONVERT(VARCHAR(11),@date, 109), 1, 3) )
 

 
		 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_GR_jmw')
		 BEGIN
          DROP TABLE tmp_GR_jmw
         END
 
 SELECT * INTO tmp_GR_jmw from ( 
--select * from(
	          SELECT   
               PMID,  
			   cast(null as varchar(20)) as AAP# ,  
			   cast(null as varchar(20)) as Parent# ,  
			   cast(null as varchar(20)) as API# ,  
			   cast(null as  varchar(100)) as [Account Name] ,  
			   cast(null as  varchar(100)) as [City] ,  
			   cast(null as  varchar(100)) as ST , 
			   cast(null as varchar(10)) as TM , 
			   cast(null as varchar(20)) as DEA , 
			   cast(null as  varchar(200)) as Affiliate ,   
			   cast(null as  varchar(10)) as BC ,  
               cast(@dateOut as  varchar(10)) as Period , 
			   MAX([CH Gen Src]) as [CH Gen Src],
			   MAX([CH Gen Exc]) as [CH Gen Exc],
			   MAX([CH Gen Total]) as [CH Gen Total],
			   MAX([CH Brand]) as [CH Brand],
               MAX([CH Other]) as [CH Other],
--               MAX([CH UD Other*]) as [CH UD Other*],
			   MAX([CH Total]) as [CH Total], 
			   MAX([API Gen]) as [API Gen],
			   MAX([API Br]) as [API Br],
			   MAX([API OTC]) as [API OTC],
			   MAX([API Total]) as [API Total],
			   MAX([ML Total]) as [ML Total],
--			   MAX([Anda Total]) as [Anda Total],
			   MAX([All Total]) as [All Total]
   
	FROM (
	  SELECT PMID,date,
		  'CH Gen Src' as dateGTS,
		     sum(isnull(AAPGENTotalSrc,0))as AAPGENTotalSrc  ,
		   'CH Gen Exc' as dateGEX,
		sum(isnull(AAPGENExcl,0))   as AAPGENExcl,
           'CH Gen Total' as dateGTT,
		     sum(isnull(AAPGENTotal,0))as AAPGENTotal  ,  
           'CH Brand' as dateCHB,
			sum(isnull(AAPBrand,0))as AAPBrand ,
		   'CH Other' as dateCHO,
			sum(isnull(AAPOther,0)) +  sum(isnull(AAPOTC,0))as AAPOther,   -- Bruce puts OTC and Other together for Other
--           'CH UD Other*' as dateCHUO,
--			sum(isnull(UDAdminOnly,0))as UDAdminOnly,
           'CH Total' as dateCHT,
			sum(isnull(AAPNetSales,0))as AAPNetSales ,
           'API Gen' as dateAPIG,
			sum(isnull(WHAPIGeneric,0))as WHAPIGeneric,
			'API Br' as dateAPIB,
			sum(isnull(WHAPIBrand,0))as WHAPIBrand,
			'API OTC' as dateAPIO,
			sum(isnull(WHAPIOTC,0))as WHAPIOTC ,
			'API Total' as dateAPIT,
			sum(isnull(WHAPIGeneric,0)) + sum(isnull(WHAPIBrand,0)) + sum(isnull(WHAPIOTC,0))as WHAPITot,
			'ML Total' as dateMLT,
			sum(isnull(MLTotal,0))as MLTotal ,  
--			'Anda Total' as dateAT,
--			sum(isnull(AndaTotal,0))as AndaTotal,
 		'All Total' as dateAllT,
			sum(isnull(WHAPIGeneric,0)) + sum(isnull(WHAPIBrand,0)) + sum(isnull(WHAPIOTC,0)) + 
                sum(isnull(AAPNetSales,0)) + sum(isnull(MLTotal,0))  as AllTotal     
 

	  FROM PharmacyMaster..all_volume  where ( month(date) in (10,11,12) and year(date) = 2010) 
				         
			 group by PMID ,date
  ) as TableDate
PIVOT 
	(
	  SUM(AAPGENTotalSrc)
	  FOR dateGTS IN  ([CH Gen Src])
	)as P1

	PIVOT 
	(
	  SUM(AAPGENExcl)
	  FOR dateGEX IN  ([CH Gen Exc])
	)as P2
    PIVOT 
	(
	  SUM(AAPGENTotal)
	  FOR dateGTT IN  ([CH Gen Total])
	)as P3
     PIVOT 
	(
	  SUM(AAPBrand)
	  FOR dateCHB IN  ([CH Brand])
	)as P4
     PIVOT 
	(
	  SUM(AAPOther)
	  FOR dateCHO IN  ([CH Other])
	)as P5
--     PIVOT 
--	(
--	  SUM(UDAdminOnly)
--	  FOR dateCHUO IN  ([CH UD Other*])
--	)as P6
     PIVOT 
	(
	  SUM(AAPNetSales)
	  FOR dateCHT IN  ([CH Total])
	)as P7
     PIVOT 
	(
	  SUM(WHAPIGeneric)
	  FOR dateAPIG IN  ([API Gen])
	)as P8
     PIVOT 
	(
	  SUM(WHAPIBrand)
	  FOR dateAPIB IN  ([API Br])
	)as P9
     PIVOT 
	(
	  SUM(WHAPIOTC)
	  FOR dateAPIO IN  ([API OTC])
	)as P10
     PIVOT 
	(
	  SUM(WHAPITot)
	  FOR dateAPIT IN  ([API Total])
	)as P11
	 PIVOT 
	(
	  SUM(MLTotal)
	  FOR dateMLT IN  ([ML Total])
	)as P12
--	PIVOT 
--	(
--	  SUM(AndaTotal)
--	  FOR dateAT IN  ([Anda Total])
--	)as P13
    PIVOT 
	(
	  SUM(AllTotal)
	  FOR dateAllT IN  ([All Total])
	)as P13
	group by PMID 

)vol

	UPDATE v set
		TM = p.territory  ,
		[AAP#] = p.aapaccountno,
		[Parent#] = p.aapparentno ,
		[API#] = p.apiaccountno ,
		Affiliate = p.Affiliate,
        DEA = p.DEA,
		[Account Name] = p.[accountname],
		City = p.City, 
		ST = p.State ,
        BC = p.BusinessClass
  
	FROM tmp_GR_jmw v
	left join PharmacyMaster..v_PM_AllWithAffiliates p on v.pmid=p.pmid

END








GO
