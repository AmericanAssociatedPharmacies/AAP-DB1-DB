USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_sameStoreSalesReport]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spud_sameStoreSalesReport]
--NOTE: needs manual editing before running. BGrant 9/08
--Run spud_update_membertype_all first
--changed to use udVolume not udb_volume
--added stores_purchasing_fytd

as
set nocount on
begin
declare @reportdate datetime
declare @yearago datetime
set @reportdate = '2/28/2009'
set @yearago = '6/01/2007'

drop table tmp_report_samestore_detail

--part 1 fy09
select v.acct_no, m.type,
sum(v.june) + sum(v.july) + sum(v.august) + sum(v.september) + sum(v.october) + 
sum(v.november) + sum(v.december) + sum(v.january)+ sum(v.february)  as fytd09ss, 
cast(0 as numeric(38,2)) as fytd08ss 
into tmp_report_samestore_detail
from udVolume v 
left join v_all_members_withtypes m 
on v.acct_no=m.acct_no
where v.fy_end='2009' 
and v.vendor_id in (65,76,79,86) 
and (m.effective is not null and m.effective <= @yearago)
--test difference if 2007-07-31 used
and (m.quitdate is null or m.quitdate > @reportdate)
--and m.chain_code=783 --optional filter for chain_code
group by v.acct_no,m.type

--part 2 fy08
update tmp_report_samestore_detail
set fytd08ss = (select sum(v.june) + sum(v.july) + sum(v.august) + sum(v.september) + sum(v.october) +
sum(v.november) + sum(v.december) + sum(v.january) + sum(v.february)
from udVolume v 
where v.fy_end='2008' 
and v.vendor_id in (65,76,79,86)
and v.acct_no = tmp_report_samestore_detail.acct_no)

--part 3 aggregate
drop table tmp_report_samestore

select type, 
count(acct_no) as stores_ss, 
sum(fytd09ss) as fytd09ss, 
sum(fytd08ss) as fytd08ss,
cast(0 as integer) as stores_purchasing_fytd09,
cast(0 as numeric(38,2)) as fytd09all,
cast(0 as integer) as stores_purchasing_fytd08,
cast(0 as numeric(38,2)) as fytd08all
into tmp_report_samestore
from tmp_report_samestore_detail
group by type
order by type

--part 4 fy09 all stores
drop table delete_tmp_ssreport

select m.type,
count(v.acct_no) as stores_purchasing_fytd09,
sum(v.june) + sum(v.july) + sum(v.august) + sum(v.september) + sum(v.october) + 
sum(v.november) + sum(v.december) + sum(v.january)+ sum(v.february)
as fytd09all
into delete_tmp_ssreport
from udVolume v left join v_all_members_withtypes m
on v.acct_no=m.acct_no
where fy_end='2009' 
and vendor_id in (65,76,79,86)
and (v.june <> 0 or v.july <> 0 or v.august <> 0 or v.september <> 0 or v.october <> 0 or v.november <> 0 or v.december <> 0
	or v.january <> 0 or v.february <> 0)
group by m.type
order by m.type

update tmp_report_samestore
set fytd09all = (select fytd09all from delete_tmp_ssreport
where delete_tmp_ssreport.type= tmp_report_samestore.type),
stores_purchasing_fytd09 = (select stores_purchasing_fytd09 from delete_tmp_ssreport
where delete_tmp_ssreport.type= tmp_report_samestore.type)



--part 5 fy 08 all stores

drop table delete_tmp_ssreport

select m.type,
count(v.acct_no) as stores_purchasing_fytd08,
sum(v.june) + sum(v.july) + sum(v.august) + sum(v.september) + sum(v.october) + 
sum(v.november) + sum(v.december) + sum(v.january)+ sum(v.february)
as fytd08all
into delete_tmp_ssreport
from udVolume v left join v_all_members_withtypes m
on v.acct_no=m.acct_no
where fy_end='2008' 
and vendor_id in (65,76,79,86)
and (v.june <> 0 or v.july <> 0 or v.august <> 0 or v.september <> 0 or v.october <> 0 or v.november <> 0 or v.december <> 0
	or v.january <> 0 or v.february <> 0)
group by m.type
order by m.type

update tmp_report_samestore
set fytd08all = (select fytd08all from delete_tmp_ssreport
where delete_tmp_ssreport.type= tmp_report_samestore.type),
stores_purchasing_fytd08 = (select stores_purchasing_fytd08 from delete_tmp_ssreport
where delete_tmp_ssreport.type= tmp_report_samestore.type)

end
set nocount off

--optional display
select * from tmp_report_samestore
GO
