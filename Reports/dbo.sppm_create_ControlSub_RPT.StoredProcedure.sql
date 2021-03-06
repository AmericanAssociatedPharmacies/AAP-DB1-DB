USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_ControlSub_RPT]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Controlled Substance Report
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_ControlSub_RPT]
(@in_month varchar(2),@in_year varchar(4))
 
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_ControlSub_ALL')
	BEGIN
	DROP TABLE tmp_ControlSub_ALL
	END

	SELECT * into tmp_ControlSub_ALL from (

	SELECT 
    cast (@in_month + @in_year as varchar(10)) as Period ,
    p.PMID ,AccountName,City,State,Zip, p.DEA,p.APIAccountNo, p.AAPAccountNo, CHAccountNoPrimary,
    cast (wg.WH_GenericUnits as decimal(30,2) ) as   WH_GenericUnits,
    cast (wb.WH_BrandUnits as decimal(30,2) ) as   WH_BrandUnits,
    cast (wc2.WH_ControlUnitsCII as decimal(30,2) ) as   WH_ControlUnitsCII,
    cast (w35.WH_ControlUnits3_5 as decimal(30,2) ) as   WH_ControlUnits3_5, 
	cast (wGT2.WH_ControlUnitsTotal  as decimal(30,2) ) as   WH_ControlUnitsTotal,
    cast (wnc.WH_NonControlUnits  as decimal(30,2) ) as  WH_NonControlUnits ,
	cast (why.WH_Hydros  as decimal(30,2) ) as  WH_Hydros,
    cast (why10.WH_Hydro10s  as decimal(30,2) ) as  WH_Hydro10s,
    cast (who.WH_Oxys as decimal(30,2) ) as  WH_Oxys ,
	cast (who30.WH_Oxy30s  as decimal(30,2) ) as  WH_Oxy30s,
    cast (walp.WH_AllALP  as decimal(30,2)) as   WH_AllALP,
    cast (walp2.WH_ALP2MG  as decimal(30,2) ) as  WH_ALP2MG ,
	cast (wmeth.WH_METHADONE  as decimal(30,2) ) as  WH_METHADONE ,
	cast (null as decimal(30,4)) as [WH_%CII-CV],
    cast (null as decimal(30,4)) as [WH_%CII-CV_AVG3MO],
	cast (null as decimal(30,4) ) as [WH_%CII],
	cast (null as decimal(30,4) ) as [WH_%CII_AVG3MO],
	cast (null as decimal(30,4) ) as WH_GXtoBXRatio,
	cast (null as decimal(30,4) ) as WH_GXtoBXRatio_AVG3MO,
	cast (null as decimal(30,2) ) as CH_GenericUnits,
	cast (null as decimal(30,2) ) as CH_BrandUnits,
	cast (null as decimal(30,2) ) as CH_ControlUnitsCII,
	cast (null as decimal(30,2) ) as CH_ControlUnits3_5,
	cast (null as decimal(30,2) ) as CH_ControlUnitsTotal,
	cast (null as decimal(30,2) ) as CH_NonControlUnits,
    cast (null as decimal(30,2) ) as CH_Hydros,
	cast (null as decimal(30,2) ) as CH_Hydro10s,
    cast (null as decimal(30,2) ) as CH_Oxys,
    cast (null as decimal(30,2) ) as CH_Oxy30s,
    cast (null as decimal(30,2) ) as CH_AllALP,
    cast (null as decimal(30,2) ) as CH_ALP2MG,
    cast (null as decimal(30,2) ) as CH_METHADONE,
	cast (null as decimal(30,4) ) as [CH_%CII-CV],
	cast (null as decimal(30,4) ) as [CH_%CII-CV_AVG3MO],
	cast (null as decimal(30,4) ) as [CH_%CII],
	cast (null as decimal(30,4) ) as [CH_%CII_AVG3MO],
	cast (null as decimal(30,4) ) as CH_GXtoBXRatio,
	cast (null as decimal(30,4) ) as CH_GXtoBXRatio_AVG3MO


	from pharmacymaster..v_PM_AllWithAffiliates p
	left outer join -- WH Brand Units
	(
		SELECT  whaccountid, sum(qty * cast(isnull(api_size,0) as numeric(11,3))) as WH_BrandUnits  from api..v_apisalesdetail a
		join
		(
			--select ndc,api_size from purchases..cardinalcomplete 
	          select   ndc , ps as  api_size from Medispan..v_DrugMaster_ControlledSubstance
		) r
		on a.ndc = r.ndc
		 where year(invdate) = @in_year and month(invdate) in (@in_month)   and type = 'Brand' 
		group by whaccountid
	)  wb
	on p.apiaccountno = wb.whaccountid  
	left outer join  -- WH Generic Units
	(
		SELECT  whaccountid, sum(qty *  cast(isnull(api_size,0) as numeric(11,3)) ) as WH_GenericUnits  from api..v_apisalesdetail a
		join
		(
			--select ndc,api_size from purchases..cardinalcomplete
			select   ndc , ps as  api_size from Medispan..v_DrugMaster_ControlledSubstance
		) r
		on a.ndc = r.ndc
		 where year(invdate) = @in_year and month(invdate) in (@in_month)   and type = 'Generic' 
		group by whaccountid

	) wg
	on p.apiaccountno = wg.whaccountid  
	left outer join  -- WH ControlUnits CII
	(
		SELECT  whaccountid, sum(qty *  cast(isnull(api_size,0) as numeric(11,3)) ) as WH_ControlUnitsCII  from api..v_apisalesdetail a
		join
			(
--				SELECT distinct f.ndc,dea,drugname,ps,c.api_size from Medispan..v_DrugMaster_ControlledSubstance f
--				join 
--				(
--				--select ndc,api_size from purchases..cardinalcomplete
--				select   ndc , ps as  api_size from Medispan..v_DrugMaster_ControlledSubstance
--                )
--				c
--				on f.ndc = c.ndc
--				where dea = 2  group by f.ndc,dea,drugname,ps,c.api_size  
			select  ndc,dea,ps  as  api_size from Medispan..v_DrugMaster_ControlledSubstance where dea = 2  group by  ndc,dea,ps 
			) r
			on a.ndc = r.ndc
			 where year(invdate) =  @in_year and month(invdate) in (@in_month)   
			group by whaccountid
	) wc2
	on p.apiaccountno = wc2.whaccountid  

	left outer join  -- WH ControlUnits 3-5
	(
		SELECT  whaccountid, sum(qty *  cast(isnull(api_size,0) as numeric(11,3)) ) as WH_ControlUnits3_5  from api..v_apisalesdetail a
		join
		(
--	           SELECT distinct f.ndc,dea,drugname,ps,c.api_size from Medispan..v_DrugMaster_ControlledSubstance f
--				join 
--				(
--					--select ndc,api_size from purchases..cardinalcomplete
--					select   ndc , ps as  api_size from Medispan..v_DrugMaster_ControlledSubstance
--				)
--				c
--				on f.ndc = c.ndc
--                where dea >= 3  group by f.ndc,dea,drugname,ps,c.api_size   
			   select  ndc,dea,ps  as  api_size from Medispan..v_DrugMaster_ControlledSubstance where dea  >= 3   group by  ndc,dea,ps 
		) r
		on a.ndc = r.ndc
		 where year(invdate) = @in_year and month(invdate) in (@in_month)   
		group by whaccountid

	) w35
	on p.apiaccountno = w35.whaccountid  


	left outer join  -- WH ControlUnits > = 2
	(
		SELECT  whaccountid, sum(qty *  cast(isnull(api_size,0) as numeric(11,3)) )  as WH_ControlUnitsTotal 
        FROM api..v_apisalesdetail a
			join
			(
--				SELECT distinct f.ndc,dea,drugname,ps,c.api_size from Medispan..v_DrugMaster_ControlledSubstance f
--				join 
--				(
--					--select ndc,api_size from purchases..cardinalcomplete
--					select   ndc , ps as  api_size from Medispan..v_DrugMaster_ControlledSubstance
--				)
--				c
--				on f.ndc = c.ndc
--				where dea >= 2  group by f.ndc,dea,drugname,ps,c.api_size  
				select  ndc,dea,ps  as  api_size from Medispan..v_DrugMaster_ControlledSubstance where dea  >= 2   group by  ndc,dea,ps 
			) r
			on a.ndc = r.ndc
			 where year(invdate) =  @in_year and month(invdate) in (@in_month)   
			group by whaccountid
	) wGT2
	on p.apiaccountno = wGT2.whaccountid  
	left outer join  -- WH NonControlUnits dea < 2
	(
		SELECT  whaccountid, sum(qty *  cast(isnull(api_size,0) as numeric(11,3)) ) as WH_NonControlUnits  from api..v_apisalesdetail a
		join
		(
--			SELECT distinct f.ndc,dea,drugname,ps,c.api_size from Medispan..v_DrugMaster_ControlledSubstance f
--				join 
--				(
--					--select ndc,api_size from purchases..cardinalcomplete
--					select   ndc , ps as  api_size from Medispan..v_DrugMaster_ControlledSubstance
--				)
--				c
--				on f.ndc = c.ndc
--				where dea < 2  group by f.ndc,dea,drugname,ps,c.api_size  

			select  ndc,dea,ps  as  api_size from Medispan..v_DrugMaster_ControlledSubstance where dea  < 2   group by  ndc,dea,ps 
		) r
		on a.ndc = r.ndc
		 where year(invdate) = @in_year and month(invdate) in (@in_month)   
		group by whaccountid
	) wnc
	on p.apiaccountno = wnc.whaccountid  
	left outer join  -- WH Hydros
	(	
		SELECT  whaccountid, sum(qty *  cast(isnull(api_size,0) as numeric(11,3)) ) as WH_Hydros  from api..v_apisalesdetail a
		join
		(
			--SELECT ndc,api_size from purchases..cardinalcomplete 
			select   ndc , ps as  api_size from Medispan..v_DrugMaster_ControlledSubstance
		) r
		on a.ndc = r.ndc
		 where year(invdate) = @in_year and month(invdate) in (@in_month)    and itemdescription like '%Hydrocodon%' 
		group by whaccountid
	) why
	on p.apiaccountno = why.whaccountid  

	left outer join  -- WH Hydros 10s
	(	
		SELECT  whaccountid, sum(qty *  cast(isnull(api_size,0) as numeric(11,3)) ) as WH_Hydro10s  from api..v_apisalesdetail a
		join
		(
			--SELECT ndc,api_size from purchases..cardinalcomplete 
			select   ndc , ps as  api_size from Medispan..v_DrugMaster_ControlledSubstance
		) r
		on a.ndc = r.ndc
		 where year(invdate) = @in_year and month(invdate) in (@in_month)    and itemdescription like '%Hydrocodon%10%' 
		group by whaccountid
	) why10
	on p.apiaccountno = why10.whaccountid  

	left outer join  -- WH oxycodone
	(	
		SELECT  whaccountid, sum(qty *  cast(isnull(api_size,0) as numeric(11,3)) ) as WH_Oxys  from api..v_apisalesdetail a
		join
		(
			--SELECT ndc,api_size from purchases..cardinalcomplete
			select   ndc , ps as  api_size from Medispan..v_DrugMaster_ControlledSubstance
		) r
		on a.ndc = r.ndc
		 where year(invdate) = @in_year and month(invdate) in (@in_month)    and itemdescription like '%oxycodon%' 
		group by whaccountid
	) who
	on p.apiaccountno = who.whaccountid  

	left outer join  -- WH oxycodone 30s
	(	
		SELECT  whaccountid, sum(qty *  cast(isnull(api_size,0) as numeric(11,3)) ) as WH_Oxy30s  from api..v_apisalesdetail a
		join
		(
			--SELECT ndc,api_size from purchases..cardinalcomplete
			select   ndc , ps as  api_size from Medispan..v_DrugMaster_ControlledSubstance
		) r
		on a.ndc = r.ndc
		 where year(invdate) = @in_year and month(invdate) in (@in_month)    and itemdescription like '%oxycodon%30%MG%' 
		group by whaccountid
	) who30
	on p.apiaccountno = who30.whaccountid  

	left outer join  -- WH Alprazolam* ALL
	(	
		SELECT  whaccountid, sum(qty *  cast(isnull(api_size,0) as numeric(11,3)) ) as WH_AllALP  from api..v_apisalesdetail a
		join
		(
			--SELECT ndc,api_size from purchases..cardinalcomplete
			select   ndc , ps as  api_size from Medispan..v_DrugMaster_ControlledSubstance
		) r
		on a.ndc = r.ndc
		 where year(invdate) = @in_year and month(invdate) in (@in_month)    and itemdescription like '%Alprazolam%' 
		group by whaccountid
	) walp
	on p.apiaccountno = walp.whaccountid  

	left outer join  -- WH Alprazolam 2 MG  
	(	
		SELECT  whaccountid, sum(qty *  cast(isnull(api_size,0) as numeric(11,3)) ) as WH_ALP2MG  from api..v_apisalesdetail a
		join
		(
				--SELECT ndc,api_size from purchases..cardinalcomplete
				select   ndc , ps as  api_size from Medispan..v_DrugMaster_ControlledSubstance
		) r
		on a.ndc = r.ndc
		 where year(invdate) = @in_year and month(invdate) in (@in_month)    and itemdescription like '%Alprazolam 2%MG%' 
		group by whaccountid
	) walp2
	on p.apiaccountno = walp2.whaccountid  

	left outer join  -- WH Methadone 
	(	
		SELECT  whaccountid, sum(qty *  cast(isnull(api_size,0) as numeric(11,3)) ) as WH_METHADONE  from api..v_apisalesdetail a
		join
		(
				--SELECT ndc,api_size from purchases..cardinalcomplete
				select   ndc , ps as  api_size from Medispan..v_DrugMaster_ControlledSubstance
		) r
		on a.ndc = r.ndc
		 where year(invdate) = @in_year and month(invdate) in (@in_month)    and itemdescription like '%Methadone%' 
		group by whaccountid
	) wmeth
	on p.apiaccountno = wmeth.whaccountid  

    left outer join 
	(
	select * from pharmacymaster..pm_CHaccounts_adj
	) chacct
	on p.pmid = chacct.pmid

-- Commented out - jmw 09/27/2011
--	where   wb.WH_BrandUnits  is not null or wg.WH_GenericUnits  is not null or
--	   wc2.WH_ControlUnitsCII   is not null or w35.WH_ControlUnits3_5  is not null or
--	 WH_ControlUnitsTotal is not null  or WH_NonControlUnits is not null or why.WH_Hydros  is not null
--	or who.WH_Oxys is not null or who30.WH_Oxy30s is not null or walp.WH_AllALP is not null
--	or walp2.WH_ALP2MG is not null or wmeth.WH_METHADONE is not null


	) ch


	UPDATE tmp_ControlSub_ALL set [WH_%CII-CV] =  (isNull(WH_ControlUnits3_5,0) + (isNull(WH_ControlUnitsCII,0)) )/ (isNull(WH_ControlUnitsTotal,0) + isNull(WH_NonControlUnits,0)) 
		WHERE isNull(WH_ControlUnitsTotal,0) + isNull(WH_NonControlUnits,0) != 0

	UPDATE tmp_ControlSub_ALL set [WH_%CII] = isNull(WH_ControlUnitsCII,0) / (isNull(WH_ControlUnitsTotal,0) + isNull(WH_NonControlUnits,0)) 
		WHERE isNull(WH_ControlUnitsTotal,0) + isNull(WH_NonControlUnits,0) != 0

	UPDATE tmp_ControlSub_ALL set WH_GXtoBXRatio = WH_GenericUnits / (isNull(WH_GenericUnits,0) + isNull(WH_BrandUnits,0)) 
		WHERE WH_BrandUnits is not null

--- ------------------------------------------------------------------------Use to update CH Stuff
UPDATE p  set
  p.CH_BrandUnits = chb.CH_BrandUnits
 from tmp_ControlSub_ALL p

left outer join  --CH Brand Units
(	 
	select  pmid, sum(ship_qty * ps ) as CH_BrandUnits  from purchases..chph_aap  a
	join
	(
	select   ndc,dea,
			 ps  from Medispan..v_DrugMaster_ControlledSubstance group by ndc,dea,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)   and  brand = 'B'
	group by pmid
)chb 
on p.pmid = chb.pmid;

UPDATE p  set
  p.CH_GenericUnits = chg.CH_GenericUnits
 from tmp_ControlSub_ALL p

left outer join  --CH Generic Units
(
	select  pmid, sum(ship_qty * ps ) as CH_GenericUnits  from purchases..chph_aap  a
	join
	(
	select   ndc,dea,
			 ps  from Medispan..v_DrugMaster_ControlledSubstance group by ndc,dea,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)   and  brand = 'N' and item_type = 'RX' and contractno in (25676,25677,58705,29731,26776)
	group by pmid
)chg 
on p.pmid = chg.pmid;

UPDATE p  set
  p.CH_ControlUnitsCII = chc2.CH_ControlUnitsCII
 from tmp_ControlSub_ALL p

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_ControlUnitsCII  from purchases..chph_aap  a
	join
	(
	select   ndc,dea,
			 ps  from Medispan..v_DrugMaster_ControlledSubstance where dea = 2  group by ndc,dea,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)   
	group by pmid
) chc2
on p.pmid = chc2.pmid;


UPDATE p  set
  p.CH_ControlUnits3_5 = chc35.CH_ControlUnits3_5

 from tmp_ControlSub_ALL p

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_ControlUnits3_5  from purchases..chph_aap  a
	join
	(
	select   ndc,dea,
			 ps  from Medispan..v_DrugMaster_ControlledSubstance where dea >= 3  group by ndc,dea,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)   
	group by pmid
) chc35
on p.pmid = chc35.pmid;

UPDATE p  set
  p.CH_ControlUnitsTotal = chct.CH_ControlUnitsTotal 
 from tmp_ControlSub_ALL p

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_ControlUnitsTotal  from purchases..chph_aap  a
	join
	(
	select   ndc,dea,
			 ps  from Medispan..v_DrugMaster_ControlledSubstance where dea >= 2  group by ndc,dea,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)   
	group by pmid

 )chct
on p.pmid = chct.pmid;

UPDATE p  set
  p.CH_NonControlUnits = chnc.CH_NonControlUnits

 from tmp_ControlSub_ALL p

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_NonControlUnits  from purchases..chph_aap  a
	join
	(
	select   ndc,dea,
			 ps  from Medispan..v_DrugMaster_ControlledSubstance where dea < 2  group by ndc,dea,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)   
	group by pmid
)chnc
on p.pmid = chnc.pmid

UPDATE p  set
  p.CH_Hydros = chh.CH_Hydros 
 from tmp_ControlSub_ALL p

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_Hydros  from purchases..chph_aap  a
	join
	(
	select   ndc,dea,ps  from Medispan..v_DrugMaster_ControlledSubstance     group by ndc,dea,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)   and ( item_descr like '%Hydrocod%' or 
        generic_name like '%Hydrocod%')
	group by pmid
)chh
on p.pmid = chh.pmid;

UPDATE p  set
  p.CH_Hydro10s = chhten.CH_Hydro10s 
 from tmp_ControlSub_ALL p

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_Hydro10s  from purchases..chph_aap  a
	join
	(
	select   ndc,dea,ps  from Medispan..v_DrugMaster_ControlledSubstance     group by ndc,dea,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)   and ( (item_descr like '%Hydrocod%' and strength like '10-%' ) or 
        (generic_name like '%Hydrocod%' and strength like '10-%'))
	group by pmid
)chhten
on p.pmid = chhten.pmid;

UPDATE p  set
  p.CH_Oxys = cho.CH_Oxys
 from tmp_ControlSub_ALL p

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_Oxys  from purchases..chph_aap  a
	join
	(
	select   ndc,dea,ps  from Medispan..v_DrugMaster_ControlledSubstance     group by ndc,dea,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)     and ( item_descr like '%oxycodon%'  
        or generic_name like '%oxycodon%'  )
	group by pmid
) cho
on p.pmid = cho.pmid;

UPDATE p  set
  p.CH_Oxy30s = cho30.CH_Oxy30s
 from tmp_ControlSub_ALL p

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_Oxy30s  from purchases..chph_aap  a
	join
	(
	select   ndc,dea,ps  from Medispan..v_DrugMaster_ControlledSubstance     group by ndc,dea,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)  and ( (item_descr like '%oxycodon%' and strength like '30MG%' ) or 

        (generic_name like '%oxycodon%' and strength like '30MG%'))
	group by pmid
)cho30
on p.pmid = cho30.pmid;

UPDATE p  set
  p.CH_AllALP = chalp.CH_AllALP

 from tmp_ControlSub_ALL p

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_AllALP  from purchases..chph_aap  a
	join
	(
	select   ndc,dea, ps  from Medispan..v_DrugMaster_ControlledSubstance     group by ndc,dea,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)     and ( item_descr like '%Alprazolam%' or
        generic_name like '%Alprazolam%' )
	group by pmid
)chalp
on p.pmid = chalp.pmid;


UPDATE p  set
  p.CH_ALP2MG = chalp2.CH_ALP2MG
 from tmp_ControlSub_ALL p

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_ALP2MG  from purchases..chph_aap  a
	join
	(
	select   ndc,dea, ps  from Medispan..v_DrugMaster_ControlledSubstance     group by ndc,dea,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)     and (( item_descr like '%Alprazolam' and strength = '2MG') or
        (generic_name like '%Alprazolam%' and strength = '2MG'))
	group by pmid
)chalp2
on p.pmid = chalp2.pmid;

UPDATE p  set
  p.CH_METHADONE = chmeth.CH_METHADONE

 from tmp_ControlSub_ALL p

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_METHADONE  from purchases..chph_aap  a
	join
	(
	select   ndc,dea, ps  from Medispan..v_DrugMaster_ControlledSubstance     group by ndc,dea,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)     and ( item_descr like '%Methadone%' or
         generic_name like '%Methadone%' )
	group by pmid
)chmeth
on p.pmid = chmeth.pmid;


	UPDATE tmp_ControlSub_ALL set [CH_%CII-CV] =  (isNull(CH_ControlUnits3_5,0) + (isNull(CH_ControlUnitsCII,0)) )/ (isNull(CH_ControlUnitsTotal,0) + isNull(CH_NonControlUnits,0)) 
		WHERE isNull(CH_ControlUnitsTotal,0) + isNull(CH_NonControlUnits,0) != 0

	UPDATE tmp_ControlSub_ALL set [CH_%CII] = isNull(CH_ControlUnitsCII,0) / (isNull(CH_ControlUnitsTotal,0) + isNull(CH_NonControlUnits,0)) 
		WHERE isNull(CH_ControlUnitsTotal,0) + isNull(CH_NonControlUnits,0) != 0

	UPDATE tmp_ControlSub_ALL set CH_GXtoBXRatio = CH_GenericUnits / (isNull(CH_GenericUnits,0) + isNull(CH_BrandUnits,0)) 
		WHERE CH_BrandUnits is not null and ( (isNull(CH_GenericUnits,0) + isNull(CH_BrandUnits,0)) !=0 )

	DELETE   from tmp_ControlSub_ALL where 
		WH_GenericUnits is null and WH_BrandUnits is null and  WH_ControlUnitsCII is null and  WH_ControlUnits3_5 is null and WH_ControlUnitsTotal is null and
		WH_NonControlUnits is null and  WH_Hydros is null and WH_Oxys is null and WH_Oxy30s is null and WH_AllALP is null and WH_ALP2MG is null and
		WH_METHADONE is null and [WH_%CII-CV] is null and [WH_%CII-CV_AVG3MO] is null and [WH_%CII] is null and [WH_%CII_AVG3MO] is null and WH_GXtoBXRatio is null and
		WH_GXtoBXRatio_AVG3MO is null and
		CH_GenericUnits is null and CH_BrandUnits is null and CH_ControlUnitsCII is null and CH_ControlUnits3_5  is null and CH_ControlUnitsTotal is null and 
		CH_NonControlUnits  is null and CH_Hydros  is null and CH_Oxys is null and CH_Oxy30s is null and CH_AllALP  is null and CH_ALP2MG  is null and 
		CH_METHADONE is null and [CH_%CII-CV] is null and [CH_%CII-CV_AVG3MO] is null and [CH_%CII] is null and [CH_%CII_AVG3MO]  is null and
		CH_GXtoBXRatio is null and CH_GXtoBXRatio_AVG3MO is   null

END








GO
