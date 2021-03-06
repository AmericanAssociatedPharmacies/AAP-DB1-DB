USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_sameStoreSalesReport_ByChain]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spud_sameStoreSalesReport_ByChain]
@chaincode int
--NOTE: this is spud_sameStoreSalesReport
--with the chaincode arg added. Edit the parent report first,
--then enable the arguments in a copy. MUST BE EDITED EACH MONTH

as
set nocount on
begin
declare @reportdate datetime
declare @yearago datetime
set @reportdate = '1/31/2009'
set @yearago = '1/31/2008'

drop table tmp_report_samestore_detail

--part 1 fy09
select v.acct_no, m.type,
sum(v.june) + sum(v.july) + sum(v.august) + sum(v.september) + sum(v.october) + 
sum(v.november) + sum(v.december) + sum(v.january) as fytd09ss, 
cast(0 as numeric(38,2)) as fytd08ss 
into tmp_report_samestore_detail
from udVolume v 
left join v_all_members_withtypes m 
on v.acct_no=m.acct_no
where v.fy_end='2009' 
and v.vendor_id in (65,76,79,86) 
and (m.effective is not null and m.effective <= @yearago)
and (m.quitdate is null or m.quitdate > @reportdate)
and m.chain_code=@chaincode --optional filter for chain_code
group by v.acct_no,m.type

--part 2 fy08
update tmp_report_samestore_detail
set fytd08ss = (select sum(v.june) + sum(v.july) + sum(v.august) + sum(v.september) + sum(v.october) +
sum(v.november) + sum(v.december) + sum(v.january)
from udVolume v 
where v.fy_end='2008' 
and v.vendor_id in (65,76,79,86)
and v.acct_no = tmp_report_samestore_detail.acct_no)

--part 3 aggregate
drop table tmp_report_samestore

select @chaincode as chaincode,
type, 
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
sum(v.november) + sum(v.december) + sum(v.january)
as fytd09all
into delete_tmp_ssreport
from udVolume v left join v_all_members_withtypes m
on v.acct_no=m.acct_no
where fy_end='2009' 
and vendor_id in (65,76,79,86)
and (v.june <> 0 or v.july <> 0 or v.august <> 0 or v.september <> 0 or v.october <> 0)
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
sum(v.november) + sum(v.december) + sum(v.january)
as fytd08all
into delete_tmp_ssreport
from udVolume v left join v_all_members_withtypes m
on v.acct_no=m.acct_no
where fy_end='2008' 
and vendor_id in (65,76,79,86)
and (v.june <> 0 or v.july <> 0 or v.august <> 0 or v.september <> 0 or v.october <> 0)
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
