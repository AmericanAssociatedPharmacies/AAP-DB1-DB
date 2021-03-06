USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_ControlSub_CardinalOnlyByPMID]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Controlled Substance Report
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_ControlSub_CardinalOnlyByPMID]
(@in_month varchar(2),@in_year varchar(4),@in_pmid varchar(100))
 
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @SQL varchar(8000);

	IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_ControlSub_PMID')
	BEGIN
	DROP TABLE tmp_ControlSub_PMID
	END

	SET @SQL = ' SELECT * into tmp_ControlSub_PMID from ( '+

	' SELECT  '+
    ' cast ( ' + @in_month + @in_year + '  as varchar(10)) as Period , '+
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
	' on p.pmid = chacct.pmid where p.pmid in ( '+  @in_pmid  +') '+
	' ) ch ';
 

	EXEC (@SQL);

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

 from tmp_ControlSub_PMID p

left outer join  --CH Brand Units
(	 
	select  pmid, sum(ship_qty * ps ) as CH_BrandUnits  from purchases..chph_aap  a
	join
	(
	select   ndc,dea,drugname,
			 ps  from Medispan..v_DrugMaster group by ndc,dea,drugname,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)   and  brand = 'B'
	group by pmid
)chb 
on p.pmid = chb.pmid

left outer join  --CH Generic Units
(
	select  pmid, sum(ship_qty * ps ) as CH_GenericUnits  from purchases..chph_aap  a
	join
	(
	select   ndc,dea,drugname,
			 ps  from Medispan..v_DrugMaster group by ndc,dea,drugname,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)   and  brand = 'N' and item_type = 'RX'  
	group by pmid
)chg 
on p.pmid = chg.pmid

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_ControlUnitsCII  from purchases..chph_aap  a
	join
	(
	select   ndc,dea,drugname,
			 ps  from Medispan..v_DrugMaster where dea = 2  group by ndc,dea,drugname,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)   
	group by pmid
) chc2
on p.pmid = chc2.pmid

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_ControlUnits3_5  from purchases..chph_aap  a
	join
	(
	select   ndc,dea,drugname,
			 ps  from Medispan..v_DrugMaster where dea >= 3  group by ndc,dea,drugname,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)   
	group by pmid
) chc35
on p.pmid = chc35.pmid

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_ControlUnitsTotal  from purchases..chph_aap  a
	join
	(
	select   ndc,dea,drugname,
			 ps  from Medispan..v_DrugMaster where dea >= 2  group by ndc,dea,drugname,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)   
	group by pmid

 )chct
on p.pmid = chct.pmid

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_NonControlUnits  from purchases..chph_aap  a
	join
	(
	select   ndc,dea,drugname,
			 ps  from Medispan..v_DrugMaster where dea < 2  group by ndc,dea,drugname,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)   
	group by pmid
)chnc
on p.pmid = chnc.pmid

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_Hydros  from purchases..chph_aap  a
	join
	(
	select   ndc,dea,drugname, ps  from Medispan..v_DrugMaster     group by ndc,dea,drugname,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)   and item_descr like '%Hydrocod%'
	group by pmid
)chh
on p.pmid = chh.pmid

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_Oxys  from purchases..chph_aap  a
	join
	(
	select   ndc,dea,drugname, ps  from Medispan..v_DrugMaster     group by ndc,dea,drugname,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)     and item_descr like '%oxycodon%'  
	group by pmid
) cho
on p.pmid = cho.pmid

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_Oxy30s  from purchases..chph_aap  a
	join
	(
	select   ndc,dea,drugname, ps  from Medispan..v_DrugMaster     group by ndc,dea,drugname,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)     and  item_descr like '%oxycodon%30MG%'  
	group by pmid
)cho30
on p.pmid = cho30.pmid

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_AllALP  from purchases..chph_aap  a
	join
	(
	select   ndc,dea,drugname, ps  from Medispan..v_DrugMaster     group by ndc,dea,drugname,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)     and  item_descr like '%Alprazolam%' 
	group by pmid
)chalp
on p.pmid = chalp.pmid

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_ALP2MG  from purchases..chph_aap  a
	join
	(
	select   ndc,dea,drugname, ps  from Medispan..v_DrugMaster     group by ndc,dea,drugname,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)     and  item_descr like '%Alprazolam 2%MG%' 
	group by pmid
)chalp2
on p.pmid = chalp2.pmid

left outer join
(
	select  pmid, sum(ship_qty * ps ) as CH_METHADONE  from purchases..chph_aap  a
	join
	(
	select   ndc,dea,drugname, ps  from Medispan..v_DrugMaster     group by ndc,dea,drugname,ps  
	) r
	on a.ndc = r.ndc
	 where year(inv_date) = @in_year and month(inv_date) in (@in_month)     and  item_descr like '%Methadone%' 
	group by pmid
)chmeth
on p.pmid = chmeth.pmid


	UPDATE tmp_ControlSub_PMID set [CH_%CII-CV] =  (isNull(CH_ControlUnits3_5,0) + (isNull(CH_ControlUnitsCII,0)) )/ (isNull(CH_ControlUnitsTotal,0) + isNull(CH_NonControlUnits,0)) 
		WHERE isNull(CH_ControlUnitsTotal,0) + isNull(CH_NonControlUnits,0) != 0

	UPDATE tmp_ControlSub_PMID set [CH_%CII] = isNull(CH_ControlUnitsCII,0) / (isNull(CH_ControlUnitsTotal,0) + isNull(CH_NonControlUnits,0)) 
		WHERE isNull(CH_ControlUnitsTotal,0) + isNull(CH_NonControlUnits,0) != 0

	UPDATE tmp_ControlSub_PMID set CH_GXtoBXRatio = CH_GenericUnits / (isNull(CH_GenericUnits,0) + isNull(CH_BrandUnits,0)) 
		WHERE CH_BrandUnits is not null

 
SELECT * from tmp_ControlSub_PMID;

END








GO
