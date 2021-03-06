USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[spbg_SNReport_byPMID3]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spbg_SNReport_byPMID3]
(
@PMID int
)
as
begin
drop table temptables..tmp_SN_2011_byPMID3
select
	[CIN]
		,right('00000000000' + NDC_CDE,11) as NDC
   ,[description]
           --,[VENDOR_NAM]
           --,[Net]
           --,[Nifo]
           --,[Usage]
           --,[New Price]
           --,[old ext#]
           --,[new ext#]
           --,[inc#/dec#$]
           --,[inc#/dec#%]
		,Medispan.dbo.f_FindWAC(right('00000000000' + NDC_CDE,11),'12/31/2011') as WAC_123111
,v.PS
,Medispan.dbo.f_FindWAC(right('00000000000' + NDC_CDE,11),'12/31/2011') * v.PS as WACxPS
--,v.CSP
   ,[PMID_count]
   ,[order_qty_total]
   ,[ship_qty_total]
   ,[unit_cost_avg]
   ,[unit_cost_min]
   ,[unit_cost_max]
   ,[ext_cost_total]
into temptables..tmp_SN_2011_byPMID3
from
(
	select 
	i.CORP_ITEM_NUM as CIN,
	i.CORP_DESC as description,
	count(distinct PMID) as PMID_count,
	sum(order_qty) as order_qty_total,
	sum(ship_qty) as ship_qty_total,
	avg(abs(isnull(unit_cost,0))) as unit_cost_avg,
	min(abs(isnull(unit_cost,0))) as unit_cost_min,
	max(abs(isnull(unit_cost,0))) as unit_cost_max,
	sum(isnull(ext_cost,0)) as ext_cost_total
	from 
	temptables..import_SN_2011 i
	left join purchases..chph_aap p on p.item_no = i.corp_item_num
	where p.PMID=@PMID and p.inv_date >= '10/1/2011' and p.inv_date <= '12/31/2011'
	group by i.CORP_ITEM_NUM,i.CORP_DESC
	--order by i.CORP_ITEM_NUM
) dt
left join temptables..import_SN_2011 t on t.CORP_ITEM_NUM=dt.CIN
left join medispan..v_DrugMaster v on v.NDC=right('00000000000' + NDC_CDE,11)
order by CIN


drop table temptables..tmp_SN_2012_byPMID3

select
	[CIN]
,right('00000000000' + convert(varchar(11),convert(decimal(15,0),t.NDC)),11) as NDC
   ,[description]
           --,[Price]
           --,[Usage]
           --,[Ext# cost]
	,Medispan.dbo.f_FindWAC(right('00000000000' + convert(varchar(11),convert(decimal(15,0),t.NDC)),11),'6/1/2012') as WAC_060112
,v.PS
--,v.CSP
,Medispan.dbo.f_FindWAC(right('00000000000' + convert(varchar(11),convert(decimal(15,0),t.NDC)),11),'6/1/2012') * v.PS as WACxPS
   ,[PMID_count]
   ,[order_qty_total]
   ,[ship_qty_total]
   ,[unit_cost_avg]
   ,[unit_cost_min]
   ,[unit_cost_max]
   ,[ext_cost_total]
into temptables..tmp_SN_2012_byPMID3
from
(
	select 
	i.[Item Number] as CIN,
	i.[DESC] as description,
	count(distinct PMID) as PMID_count,
	sum(isnull(order_qty,0)) as order_qty_total,
	sum(isnull(ship_qty,0)) as ship_qty_total,
	avg(abs(isnull(unit_cost,0))) as unit_cost_avg,
	min(abs(isnull(unit_cost,0))) as unit_cost_min,
	max(abs(isnull(unit_cost,0))) as unit_cost_max,
	sum(isnull(ext_cost,0)) as ext_cost_total
	--into temptables..tmp_SN_2012_byPMID
	from 
	temptables..import_SN_2012 i
	left join purchases..chph_aap p on p.item_no = i.[Item Number]
	where p.PMID=@PMID and p.inv_date >= '3/1/2012' and p.inv_date < '6/1/2012'
	group by i.[Item Number],i.[DESC]
	--order by i.[Item Number]
) dt2
left join temptables..import_SN_2012 t on t.[Item Number]=dt2.CIN
left join medispan..v_DrugMaster v on v.NDC=right('00000000000' + convert(varchar(11),convert(decimal(15,0),t.NDC)),11)
order by CIN



end

--spbg_SNReport_byPMID3 104339
--select * from temptables..tmp_SN_2011_byPMID3
--select * from temptables..tmp_SN_2012_byPMID3
GO
