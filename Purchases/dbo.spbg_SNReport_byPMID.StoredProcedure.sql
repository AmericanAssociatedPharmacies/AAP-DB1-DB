USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[spbg_SNReport_byPMID]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spbg_SNReport_byPMID]
(
@PMID int
)
as
begin
	drop table temptables..tmp_SN_2011_byPMID
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
	into temptables..tmp_SN_2011_byPMID
	from 
	temptables..import_SN_2011 i
	left join purchases..chph_aap p on p.item_no = i.corp_item_num
	where p.PMID=@PMID and p.inv_date >= '10/1/2011' and p.inv_date <= '12/31/2011'
	group by i.CORP_ITEM_NUM,i.CORP_DESC
	order by i.CORP_ITEM_NUM

--select * from temptables..tmp_SN_2011_byPMID


	drop table temptables..tmp_SN_2012_byPMID
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
	into temptables..tmp_SN_2012_byPMID
	from 
	temptables..import_SN_2012 i
	left join purchases..chph_aap p on p.item_no = i.[Item Number]
	where p.PMID=@PMID and p.inv_date >= '3/1/2012' and p.inv_date < '6/1/2012'
	group by i.[Item Number],i.[DESC]
	order by i.[Item Number]

--select * from temptables..tmp_SN_2012_byPMID

end

GO
