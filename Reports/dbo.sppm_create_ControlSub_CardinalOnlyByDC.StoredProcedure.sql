USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_ControlSub_CardinalOnlyByDC]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Controlled Substance Report
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_ControlSub_CardinalOnlyByDC]
(@in_month varchar(2),@in_year varchar(4),@in_DC varchar(10))
 
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @SQL varchar(8000);

	IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_ControlSub_DC')
	BEGIN
	DROP TABLE tmp_ControlSub_DC
	END

	SET @SQL = ' SELECT * into tmp_ControlSub_DC from ( '+

	' SELECT  '+
    ' cast ( ' + @in_month + @in_year + '  as varchar(10)) as Period , '+
    'cast (' + @in_DC + ' as varchar(10)) as DC,' +
    'p.PMID ,AccountName,City,State,Zip, p.APIAccountNo, p.AAPAccountNo, CHAccountNoPrimary, '+
	' cast (null as decimal(30,2) ) as CH_GenericUnits, '+
	' cast (null as decimal(30,2) ) as CH_BrandUnits, '+
	' cast (null as decimal(30,2) ) as CH_ControlUnitsCII, '+
	' cast (null as decimal(30,2) ) as CH_ControlUnits3_5, '+
	' cast (null as decimal(30,2) ) as CH_ControlUnitsTotal, '+
	' cast (null as decimal(30,2) ) as CH_NonControlUnits, '+
    ' cast (null as decimal(30,2) ) as CH_Hydros, '+
    ' cast (null as decimal(30,2) ) as CH_Oxys, '+
    ' cast (null as decimal(30,2) ) as CH_Oxy30s, '+
    ' cast (null as decimal(30,2) ) as CH_AllALP, '+
    ' cast (null as decimal(30,2) ) as CH_ALP2MG, '+
    ' cast (null as decimal(30,2) ) as CH_METHADONE, '+
	' cast (null as decimal(30,4) ) as [CH_%CII-CV], '+
	' cast (null as decimal(30,4) ) as [CH_%CII], '+
	' cast (null as decimal(30,4) ) as CH_GXtoBXRatio '+



	' from pharmacymaster..v_PM_AllWithAffiliates p '+
	
    ' left outer join  '+
	' ( '+
	' select * from pharmacymaster..pm_CHaccounts_adj '+
	' ) chacct '+
	' on p.pmid = chacct.pmid  '+
	' ) ch ';
 

	EXEC (@SQL);
    print @sql;
--- ------------------------------------------------------------------------Use to update CH Stuff
UPDATE p  set
  p.CH_BrandUnits = chb.CH_BrandUnits,
  p.CH_GenericUnits = chg.CH_GenericUnits,
  p.CH_ControlUnitsCII = chc2.CH_ControlUnitsCII,
  p.CH_ControlUnits3_5 = chc35.CH_ControlUnits3_5,
  p.CH_ControlUnitsTotal = chct.CH_ControlUnitsTotal,
  p.CH_NonControlUnits = chnc.CH_NonControlUnits,
  p.CH_Hydros = chh.CH_Hydros,
  p.CH_Oxys = cho.CH_Oxys,
  p.CH_Oxy30s = cho30.CH_Oxy30s,
  p.CH_AllALP = chalp.CH_AllALP,
  p.CH_ALP2MG = chalp2.CH_ALP2MG,
  p.CH_METHADONE = chmeth.CH_METHADONE

 from tmp_ControlSub_DC p

left outer join  --CH Brand Units
(	 
	select  pmid, sum(ship_qty * ps ) as CH_BrandUnits ,dc from purchases..chph_aap  a
	join
	(
	select   ndc,dea,drugname,
			 ps  from Medispan..v_DrugMaster group by ndc,dea,drugname,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)   and  brand = 'B' and dc = @in_DC
	group by pmid ,dc
)chb 
on p.pmid = chb.pmid

left outer join  --CH Generic Units
(
	select  pmid, sum(ship_qty * ps ) as CH_GenericUnits ,dc from purchases..chph_aap  a
	join
	(
	select   ndc,dea,drugname,
			 ps  from Medispan..v_DrugMaster group by ndc,dea,drugname,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)   and  brand = 'N' and item_type = 'RX'   and dc = @in_DC
	group by pmid, dc
)chg 
on p.pmid = chg.pmid 

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_ControlUnitsCII,dc   from purchases..chph_aap  a
	join
	(
	select   ndc,dea,drugname,
			 ps  from Medispan..v_DrugMaster where dea = 2  group by ndc,dea,drugname,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)    and dc = @in_DC
	group by pmid ,dc
) chc2
on p.pmid = chc2.pmid 

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_ControlUnits3_5 ,dc   from purchases..chph_aap  a
	join
	(
	select   ndc,dea,drugname,
			 ps  from Medispan..v_DrugMaster where dea >= 3  group by ndc,dea,drugname,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)    and dc = @in_DC
	group by pmid,dc
) chc35
on p.pmid = chc35.pmid

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_ControlUnitsTotal ,dc from purchases..chph_aap  a
	join
	(
	select   ndc,dea,drugname,
			 ps  from Medispan..v_DrugMaster where dea >= 2  group by ndc,dea,drugname,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)    and dc = @in_DC
	group by pmid,dc

 )chct
on p.pmid = chct.pmid

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_NonControlUnits ,dc  from purchases..chph_aap  a
	join
	(
	select   ndc,dea,drugname,
			 ps  from Medispan..v_DrugMaster where dea < 2  group by ndc,dea,drugname,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)   and dc = @in_DC
	group by pmid,dc
)chnc
on p.pmid = chnc.pmid

left outer join
(
	select  pmid, sum(ship_qty * ps )as CH_Hydros,dc   from purchases..chph_aap  a
	join
	(
	select   ndc,dea,drugname, ps  from Medispan..v_DrugMaster     group by ndc,dea,drugname,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)   and item_descr like '%Hydrocod%' and dc = @in_DC
	group by pmid ,dc
)chh
on p.pmid = chh.pmid

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_Oxys ,dc from purchases..chph_aap  a
	join
	(
	select   ndc,dea,drugname, ps  from Medispan..v_DrugMaster     group by ndc,dea,drugname,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)     and item_descr like '%oxycodon%'  and dc = @in_DC
	group by pmid,dc
) cho
on p.pmid = cho.pmid 

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_Oxy30s,dc  from purchases..chph_aap  a
	join
	(
	select   ndc,dea,drugname, ps  from Medispan..v_DrugMaster     group by ndc,dea,drugname,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)     and  item_descr like '%oxycodon%30MG%'   and dc = @in_DC
	group by pmid,dc
)cho30
on p.pmid = cho30.pmid

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_AllALP ,dc  from purchases..chph_aap  a
	join
	(
	select   ndc,dea,drugname, ps  from Medispan..v_DrugMaster     group by ndc,dea,drugname,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)     and  item_descr like '%Alprazolam%'  and dc = @in_DC
	group by pmid,dc
)chalp
on p.pmid = chalp.pmid

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_ALP2MG ,dc from purchases..chph_aap  a
	join
	(
	select   ndc,dea,drugname, ps  from Medispan..v_DrugMaster     group by ndc,dea,drugname,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)     and  item_descr like '%Alprazolam 2%MG%' and dc = @in_DC
	group by pmid,dc
)chalp2
on p.pmid = chalp2.pmid

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_METHADONE ,dc from purchases..chph_aap  a
	join
	(
	select   ndc,dea,drugname, ps  from Medispan..v_DrugMaster     group by ndc,dea,drugname,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)     and  item_descr like '%Methadone%' and dc = @in_DC
	group by pmid,dc
)chmeth
on p.pmid = chmeth.pmid


	UPDATE tmp_ControlSub_DC set [CH_%CII-CV] =  (isNull(CH_ControlUnits3_5,0) + (isNull(CH_ControlUnitsCII,0)) )/ (isNull(CH_ControlUnitsTotal,0) + isNull(CH_NonControlUnits,0)) 
		WHERE isNull(CH_ControlUnitsTotal,0) + isNull(CH_NonControlUnits,0) != 0

	UPDATE tmp_ControlSub_DC set [CH_%CII] = isNull(CH_ControlUnitsCII,0) / (isNull(CH_ControlUnitsTotal,0) + isNull(CH_NonControlUnits,0)) 
		WHERE isNull(CH_ControlUnitsTotal,0) + isNull(CH_NonControlUnits,0) != 0

	UPDATE tmp_ControlSub_DC set CH_GXtoBXRatio = CH_GenericUnits / (isNull(CH_GenericUnits,0) + isNull(CH_BrandUnits,0)) 
		WHERE CH_BrandUnits is not null

 
DELETE from  tmp_ControlSub_DC   where    CH_BrandUnits  is null and
   CH_GenericUnits  is null and
   CH_ControlUnitsCII  is null and
   CH_ControlUnits3_5  is null and
   CH_ControlUnitsTotal is null and
   CH_NonControlUnits  is null and
   CH_Hydros  is null and
   CH_Oxys  is null and
   CH_Oxy30s  is null and
   CH_AllALP  is null and
   CH_ALP2MG  is null and
   CH_METHADONE  is null  

SELECT * from tmp_ControlSub_DC;

END








GO
