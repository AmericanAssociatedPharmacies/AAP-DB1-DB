USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_yyreport_step2]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--ALTER view [dbo].[v_yy_test1]
CREATE PROCEDURE [dbo].[spud_yyreport_step2]
as
begin
set nocount on
drop table tmp_yyreport_step2
select * into tmp_yyreport_step2
from  (select v.vendor_id, 
convert(datetime,'1/1/' + v.fy_end) as [date], 
sum(v.january) as volume, 
vv.vendorpair,
(select sum(v2.january) from tmp_yyreport_step1 v2 where v2.vendor_id=vv.vendorpair and v2.fy_end=v.fy_end) as rebate,
(select count(january) from tmp_yyreport_step1 v3 where v3.vendor_id=vv.vendor_id and v3.fy_end=v.fy_end and january <>0 ) as stores
from tmp_yyreport_step1 v left join vvcopy vv on v.vendor_id=vv.vendor_id
where vv.reports='V'
group by v.fy_end, v.vendor_id, vv.vendor_id, vv.vendor, vv.vendorpair
 
union
select v.vendor_id, 
convert(datetime,'2/1/' + v.fy_end) as [date], 
sum(v.february) as volume, 
vv.vendorpair,
(select sum(v2.february) from tmp_yyreport_step1 v2 where v2.vendor_id=vv.vendorpair and v2.fy_end=v.fy_end) as rebate,
(select count(february) from tmp_yyreport_step1 v3 where v3.vendor_id=vv.vendor_id and v3.fy_end=v.fy_end and february <>0 ) as stores
from tmp_yyreport_step1 v left join vvcopy vv on v.vendor_id=vv.vendor_id
where vv.reports='V'
group by v.fy_end, v.vendor_id, vv.vendor_id,vv.vendor, vv.vendorpair

union
select v.vendor_id, 
convert(datetime,'3/1/' + v.fy_end) as [date], 
sum(v.march) as volume, vv.vendorpair,
(select sum(v2.march) from tmp_yyreport_step1 v2 where v2.vendor_id=vv.vendorpair and v2.fy_end=v.fy_end) as rebate,
(select count(march) from tmp_yyreport_step1 v3 where v3.vendor_id=vv.vendor_id and v3.fy_end=v.fy_end and march <>0 ) as stores
from tmp_yyreport_step1 v left join vvcopy vv on v.vendor_id=vv.vendor_id
where vv.reports='V'
group by v.fy_end, v.vendor_id, vv.vendor_id,vv.vendor, vv.vendorpair

union
select v.vendor_id, 
convert(datetime,'4/1/' + v.fy_end) as [date], 
sum(v.april) as volume, 
vv.vendorpair,
(select sum(v2.april) from tmp_yyreport_step1 v2 where v2.vendor_id=vv.vendorpair and v2.fy_end=v.fy_end) as rebate,
(select count(april) from tmp_yyreport_step1 v3 where v3.vendor_id=vv.vendor_id and v3.fy_end=v.fy_end and april <>0 ) as stores
from tmp_yyreport_step1 v left join vvcopy vv on v.vendor_id=vv.vendor_id
where vv.reports='V'
group by v.fy_end, v.vendor_id, vv.vendor_id,vv.vendor, vv.vendorpair

union
select v.vendor_id, 
convert(datetime,'5/1/' + v.fy_end) as [date], 
sum(v.may) as volume, 
vv.vendorpair,
(select sum(v2.may) from tmp_yyreport_step1 v2 where v2.vendor_id=vv.vendorpair and v2.fy_end=v.fy_end) as rebate,
(select count(may) from tmp_yyreport_step1 v3 where v3.vendor_id=vv.vendor_id and v3.fy_end=v.fy_end and may <>0 ) as stores
from tmp_yyreport_step1 v left join vvcopy vv on v.vendor_id=vv.vendor_id
where vv.reports='V'
group by v.fy_end, v.vendor_id, vv.vendor_id, vv.vendor, vv.vendorpair

union
select v.vendor_id, 
convert(datetime,'6/1/' + cast((cast(fy_end as int)-1) as varchar)) as [date], 
sum(v.june) as volume, 
vv.vendorpair,
(select sum(v2.june) from tmp_yyreport_step1 v2 where v2.vendor_id=vv.vendorpair and v2.fy_end=v.fy_end) as rebate,
(select count(june) from tmp_yyreport_step1 v3 where v3.vendor_id=vv.vendor_id and v3.fy_end=v.fy_end and june <>0 ) as stores
from tmp_yyreport_step1 v left join vvcopy vv on v.vendor_id=vv.vendor_id
where vv.reports='V'
group by v.fy_end, v.vendor_id, vv.vendor_id, vv.vendor, vv.vendorpair

union
select v.vendor_id, 
convert(datetime,'7/1/' + cast((cast(fy_end as int)-1) as varchar)) as [date], 
sum(v.july) as volume, 
vv.vendorpair,
(select sum(v2.july) from tmp_yyreport_step1 v2 where v2.vendor_id=vv.vendorpair and v2.fy_end=v.fy_end) as rebate,
(select count(july) from tmp_yyreport_step1 v3 where v3.vendor_id=vv.vendor_id and v3.fy_end=v.fy_end and july <>0 ) as stores
from tmp_yyreport_step1 v left join vvcopy vv on v.vendor_id=vv.vendor_id
where vv.reports='V'
group by v.fy_end, v.vendor_id, vv.vendor_id, vv.vendor, vv.vendorpair

union
select v.vendor_id, 
convert(datetime,'8/1/' + cast((cast(fy_end as int)-1) as varchar)) as [date], 
sum(v.august) as volume, 
vv.vendorpair,
(select sum(v2.august) from tmp_yyreport_step1 v2 where v2.vendor_id=vv.vendorpair and v2.fy_end=v.fy_end) as rebate,
(select count(august) from tmp_yyreport_step1 v3 where v3.vendor_id=vv.vendor_id and v3.fy_end=v.fy_end and august <>0 ) as stores
from tmp_yyreport_step1 v left join vvcopy vv on v.vendor_id=vv.vendor_id
where vv.reports='V'
group by v.fy_end, v.vendor_id, vv.vendor_id,vv.vendor, vv.vendorpair

union
select v.vendor_id, 
convert(datetime,'9/1/' + cast((cast(fy_end as int)-1) as varchar)) as [date], 
sum(v.september) as volume, 
vv.vendorpair,
(select sum(v2.september) from tmp_yyreport_step1 v2 where v2.vendor_id=vv.vendorpair and v2.fy_end=v.fy_end) as rebate,
(select count(september) from tmp_yyreport_step1 v3 where v3.vendor_id=vv.vendor_id and v3.fy_end=v.fy_end and september <>0 ) as stores
from tmp_yyreport_step1 v left join vvcopy vv on v.vendor_id=vv.vendor_id
group by v.fy_end, v.vendor_id, vv.vendor_id, vv.vendor, vv.vendorpair

union
select v.vendor_id, 
convert(datetime,'10/1/' + cast((cast(fy_end as int)-1) as varchar)) as [date], 
sum(v.october) as volume, 
vv.vendorpair,
(select sum(v2.october) from tmp_yyreport_step1 v2 where v2.vendor_id=vv.vendorpair and v2.fy_end=v.fy_end) as rebate,
(select count(october) from tmp_yyreport_step1 v3 where v3.vendor_id=vv.vendor_id and v3.fy_end=v.fy_end and october <>0 ) as stores
from tmp_yyreport_step1 v left join vvcopy vv on v.vendor_id=vv.vendor_id
where vv.reports='V'
group by v.fy_end, v.vendor_id, vv.vendor_id, vv.vendor, vv.vendorpair

union
select v.vendor_id, 
convert(datetime,'11/1/' + cast((cast(fy_end as int)-1) as varchar)) as [date], 
sum(v.november) as volume, 
vv.vendorpair,
(select sum(v2.november) from tmp_yyreport_step1 v2 where v2.vendor_id=vv.vendorpair and v2.fy_end=v.fy_end) as rebate,
(select count(november) from tmp_yyreport_step1 v3 where v3.vendor_id=vv.vendor_id and v3.fy_end=v.fy_end and november <>0 ) as stores
from tmp_yyreport_step1 v left join vvcopy vv on v.vendor_id=vv.vendor_id
where vv.reports='V'
group by v.fy_end, v.vendor_id, vv.vendor_id,vv.vendor, vv.vendorpair

union
select v.vendor_id, 
convert(datetime,'12/1/' + cast((cast(fy_end as int)-1) as varchar)) as [date], 
sum(v.december) as volume, 
vv.vendorpair,
(select sum(v2.december) from tmp_yyreport_step1 v2 where v2.vendor_id=vv.vendorpair and v2.fy_end=v.fy_end) as rebate,
(select count(december) from tmp_yyreport_step1 v3 where v3.vendor_id=vv.vendor_id and v3.fy_end=v.fy_end and december <>0 ) as stores
from tmp_yyreport_step1 v left join vvcopy vv on v.vendor_id=vv.vendor_id
where vv.reports='V'
group by v.fy_end, v.vendor_id, vv.vendor_id, vv.vendor, vv.vendorpair) as derivedtable1

set nocount off
end



GO
