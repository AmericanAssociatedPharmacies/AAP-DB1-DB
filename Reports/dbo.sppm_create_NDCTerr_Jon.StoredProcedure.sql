USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_NDCTerr_Jon]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Compliance Report for Chriss S.
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_NDCTerr_Jon]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

 
		 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_NDCTerr_jmw')
		 BEGIN
          DROP TABLE tmp_NDCTerr_jmw
         END


SELECT * INTO tmp_NDCTerr_jmw from (
	SELECT   

	    PMID, 
		AccountName as [Store Name],
		City,
		State as ST,
		Territory as TM ,
		cast(null as  varchar(100)) as [AVION PRENATE MINI  75854-0304-30] ,  
		cast(null as  varchar(100)) as [AVION PRENATE OTHER  75854-0306-30] ,   
		cast(null as  varchar(100)) as [AVION PRENATE OTHER  75854-0301-30], 
        cast(null as  varchar(100)) as [AVION PRENATE OTHER  75854-0303-30], 
        cast(null as  varchar(100)) as [EVERETT SELECT-0B  00642-0077-90],
	    cast(null as  varchar(100)) as [EVERETT VITAFOL  00642-0079-12],	 
        cast(null as  varchar(100)) as [EVERETT VITAFOL  00642-0078-12],
        cast(null as  varchar(100)) as [EVERETT VITAFOL  00642-0072-12],
        cast(null as  varchar(100)) as [MEDA PREFERA OB  68220-0084-90],
        cast(null as  varchar(100)) as [MISSION CITRANATAL  00178-0898-30],
        cast(null as  varchar(100)) as [PAN NEEVO DHA  00525-0315-90],
        cast(null as  varchar(100)) as [UPSHER PRENEXA  00245-0178-30],
        cast(null as  varchar(100)) as [VERTICAL OB COMPLETE  68025-0059-30],
        cast(null as  varchar(100)) as [WC NESTABS  50967-0309-30],
        cast(null as  varchar(100)) as [WH DUET  44118-0809-30],
		cast(null as  varchar(100)) as [PRENA1 50265-0199-30],
		cast(null as  varchar(100)) as [PRENA1 PLUS 50265-0299-60]

	FROM (
	  SELECT PMID,Territory,AccountName,City,State

	  FROM  pharmacymaster..v_pm_allwithaffiliates where territory in('30','31','32')
 		  
	) as P group by PMID,Territory,AccountName,City,State

 )N


 
    

-- Now update all the other stuff

	UPDATE t set
		[AVION PRENATE MINI  75854-0304-30] = p.ship_Qty   
  
	FROM tmp_NDCTerr_jmw t
	join 
     (
		select pmid,ndc,sum(ship_Qty) as  ship_Qty from  purchases..chph_aap  where inv_date >= '09/1/2013' and inv_date <= '3/31/2014'
	and ndc = '75854030430' group by pmid,ndc
	) p
 
    on t.pmid = p.pmid
---------------------------
	UPDATE t set
		[AVION PRENATE OTHER  75854-0306-30] = p.ship_Qty   
  
	FROM tmp_NDCTerr_jmw t
	join 
     (
		select pmid,ndc,sum(ship_Qty) as  ship_Qty from  purchases..chph_aap  where inv_date >= '09/1/2013' and inv_date <= '3/31/2014'
	and ndc = '75854030630'  group by pmid,ndc
	) p
 
    on t.pmid = p.pmid
---------------------------
	UPDATE t set
		[AVION PRENATE OTHER  75854-0301-30] = p.ship_Qty   
  
	FROM tmp_NDCTerr_jmw t
	join 
     (
		select pmid,ndc,sum(ship_Qty) as  ship_Qty from  purchases..chph_aap  where inv_date >= '09/1/2013' and inv_date <= '3/31/2014'
	and ndc = '75854030130'  group by pmid,ndc
	) p
 
    on t.pmid = p.pmid

---------------------------
	UPDATE t set
		[AVION PRENATE OTHER  75854-0303-30] = p.ship_Qty   
  
	FROM tmp_NDCTerr_jmw t
	join 
     (
		select pmid,ndc,sum(ship_Qty) as  ship_Qty from  purchases..chph_aap  where inv_date >= '09/1/2013' and inv_date <= '3/31/2014'
	and ndc = '75854030330'  group by pmid,ndc
	) p
 
    on t.pmid = p.pmid

---------------------------
	UPDATE t set
		[EVERETT SELECT-0B  00642-0077-90] = p.ship_Qty   
  
	FROM tmp_NDCTerr_jmw t
	join 
     (
		select pmid,ndc,sum(ship_Qty) as  ship_Qty from  purchases..chph_aap  where inv_date >= '09/1/2013' and inv_date <= '3/31/2014'
	and ndc = '00642007790'  group by pmid,ndc
	) p
 
    on t.pmid = p.pmid

---------------------------
	UPDATE t set
		[EVERETT VITAFOL  00642-0079-12] = p.ship_Qty   
  
	FROM tmp_NDCTerr_jmw t
	join 
     (
		select pmid,ndc,sum(ship_Qty) as  ship_Qty from  purchases..chph_aap  where inv_date >= '09/1/2013' and inv_date <= '3/31/2014'
	and ndc = '00642007912'  group by pmid,ndc
	) p
 
    on t.pmid = p.pmid

---------------------------
	UPDATE t set
		[EVERETT VITAFOL  00642-0078-12] = p.ship_Qty   
  
	FROM tmp_NDCTerr_jmw t
	join 
     (
		select pmid,ndc,sum(ship_Qty) as  ship_Qty from  purchases..chph_aap  where inv_date >= '09/1/2013' and inv_date <= '3/31/2014'
	and ndc = '00642007812'  group by pmid,ndc
	) p
 
    on t.pmid = p.pmid

---------------------------
	UPDATE t set
		[EVERETT VITAFOL  00642-0072-12] = p.ship_Qty   
  
	FROM tmp_NDCTerr_jmw t
	join 
     (
		select pmid,ndc,sum(ship_Qty) as  ship_Qty from  purchases..chph_aap  where inv_date >= '09/1/2013' and inv_date <= '3/31/2014'
	and ndc = '00642007212'  group by pmid,ndc
	) p
 
    on t.pmid = p.pmid

---------------------------
	UPDATE t set
		[MEDA PREFERA OB  68220-0084-90] = p.ship_Qty   
  
	FROM tmp_NDCTerr_jmw t
	join 
     (
		select pmid,ndc,sum(ship_Qty) as  ship_Qty from  purchases..chph_aap  where inv_date >= '09/1/2013' and inv_date <= '3/31/2014'
	and ndc = '68220008490'  group by pmid,ndc
	) p
 
    on t.pmid = p.pmid

---------------------------
	UPDATE t set
		[MISSION CITRANATAL  00178-0898-30] = p.ship_Qty   
  
	FROM tmp_NDCTerr_jmw t
	join 
     (
		select pmid,ndc,sum(ship_Qty) as  ship_Qty from  purchases..chph_aap  where inv_date >= '09/1/2013' and inv_date <= '3/31/2014'
	and ndc = '00178089830'  group by pmid,ndc
	) p
 
    on t.pmid = p.pmid

---------------------------
	UPDATE t set
		[PAN NEEVO DHA  00525-0315-90] = p.ship_Qty   
  
	FROM tmp_NDCTerr_jmw t
	join 
     (
		select pmid,ndc,sum(ship_Qty) as  ship_Qty from  purchases..chph_aap  where inv_date >= '09/1/2013' and inv_date <= '3/31/2014'
	and ndc = '00525031590'  group by pmid,ndc
	) p
 
    on t.pmid = p.pmid

---------------------------
	UPDATE t set
		[UPSHER PRENEXA  00245-0178-30] = p.ship_Qty   
  
	FROM tmp_NDCTerr_jmw t
	join 
     (
		select pmid,ndc,sum(ship_Qty) as  ship_Qty from  purchases..chph_aap  where inv_date >= '09/1/2013' and inv_date <= '3/31/2014'
	and ndc = '00245017830'  group by pmid,ndc
	) p
 
    on t.pmid = p.pmid

---------------------------
	UPDATE t set
		[VERTICAL OB COMPLETE  68025-0059-30] = p.ship_Qty   
  
	FROM tmp_NDCTerr_jmw t
	join 
     (
		select pmid,ndc,sum(ship_Qty) as  ship_Qty from  purchases..chph_aap  where inv_date >= '09/1/2013' and inv_date <= '3/31/2014'
	and ndc = '68025005930'  group by pmid,ndc
	) p
 
    on t.pmid = p.pmid

---------------------------
	UPDATE t set
		[WC NESTABS  50967-0309-30] = p.ship_Qty   
  
	FROM tmp_NDCTerr_jmw t
	join 
     (
		select pmid,ndc,sum(ship_Qty) as  ship_Qty from  purchases..chph_aap  where inv_date >= '09/1/2013' and inv_date <= '3/31/2014'
	and ndc = '50967030930'  group by pmid,ndc
	) p
 
    on t.pmid = p.pmid

---------------------------
	UPDATE t set
		[WH DUET  44118-0809-30] = p.ship_Qty   
  
	FROM tmp_NDCTerr_jmw t
	join 
     (
		select pmid,ndc,sum(ship_Qty) as  ship_Qty from  purchases..chph_aap  where inv_date >= '09/1/2013' and inv_date <= '3/31/2014'
	and ndc = '44118080930' group by pmid,ndc
	) p
 
    on t.pmid = p.pmid

--------------
	UPDATE t set
		[PRENA1 50265-0199-30] = p.ship_Qty   
  
	FROM tmp_NDCTerr_jmw t
	join 
     (
		select pmid,ndc,sum(ship_Qty) as  ship_Qty from  purchases..chph_aap  where inv_date >= '09/1/2013' and inv_date <= '3/31/2014'
	and ndc = '50265019930' group by pmid,ndc
	) p
 
    on t.pmid = p.pmid
--------
	UPDATE t set
		[PRENA1 PLUS 50265-0299-60] = p.ship_Qty   
  
	FROM tmp_NDCTerr_jmw t
	join 
     (
		select pmid,ndc,sum(ship_Qty) as  ship_Qty from  purchases..chph_aap  where inv_date >= '09/1/2013' and inv_date <= '3/31/2014'
	and ndc = '50265029960' group by pmid,ndc
	) p
 
    on t.pmid = p.pmid
 

delete from tmp_NDCTerr_jmw where [AVION PRENATE MINI  75854-0304-30] is null and
[AVION PRENATE OTHER  75854-0306-30] is null and
[AVION PRENATE OTHER  75854-0301-30] is null and
[AVION PRENATE OTHER  75854-0303-30] is null and
[EVERETT SELECT-0B  00642-0077-90] is null and
[EVERETT VITAFOL  00642-0079-12] is null and
[EVERETT VITAFOL  00642-0078-12] is null and
[EVERETT VITAFOL  00642-0072-12] is null and
[MEDA PREFERA OB  68220-0084-90] is null and
[MISSION CITRANATAL  00178-0898-30] is null and
[PAN NEEVO DHA  00525-0315-90] is null and
[UPSHER PRENEXA  00245-0178-30] is null and
[VERTICAL OB COMPLETE  68025-0059-30] is null and
[WC NESTABS  50967-0309-30] is null and
[WH DUET  44118-0809-30] is null and
[PRENA1 50265-0199-30] is null and
[PRENA1 PLUS 50265-0299-60] is null
 

END








GO
