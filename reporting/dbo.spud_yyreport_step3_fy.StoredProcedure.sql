USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_yyreport_step3_fy]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spud_yyreport_step3_fy]
as
begin
set nocount on
drop table tmp_yyreport_step3_fy

select  v.vendor_id, vv.vendor, q.qsfy, q.qfy, q.yfy, 
sum(v.volume) as volume, sum(v.rebate) as rebate, max(v.stores) as stores
into tmp_yyreport_step3_fy
from tmp_yyreport_step2 v left join vvcopy vv on v.vendor_id=vv.vendor_id 
left join M2QY q on v.date = q.date
group by q.qsfy, v.vendor_id, vv.vendor, q.qfy, q.yfy
order by v.vendor_id, q.qsfy

set nocount off
end
GO
