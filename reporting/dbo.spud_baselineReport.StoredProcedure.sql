USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_baselineReport]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spud_baselineReport]
as
-- B.Grant, C.Stone 8/08 
-- for sales objectives, archive after c.a.
-- uses results of spud_report_trend0508
begin
set nocount on

IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='report_baselineFY2008') DROP TABLE report_baselineFY2008

select m.*,
case m.primaryws
	when 86 then 'CH'
	when 65 then 'CH'
	when 76 then 'IPC'
	when 79 then 'ML'
	else ''
end as pwsname,
dec07,jan08,feb08,mar08,apr08,may08,
dbo.AvgNoLeading0s(dec07,jan08,feb08,mar08,apr08,may08) as avg6mo,
a.sales0408 as Anda0408,
a.sales0508 as Anda0508,
(isnull(a.sales0408,0) + isnull(a.sales0508,0))/2 as AndaAvg,
p.[total sales] as Parmed0508,
dbo.AvgNoLeading0s(dec07,jan08,feb08,mar08,apr08,may08) + (isnull(a.sales0408,0) + isnull(a.sales0508,0))/2 + isnull(p.[total sales],0) as TotalAvg,
(select (t2.may08 - t.may08) from tmp_baselineReport_vsum t2 where t2.acct_no=t.acct_no) as owsvol
into report_baselineFY2008
from report_baselineFY2008_members m left join 
tmp_baselineReport_vpri t
on m.acct_no = t.acct_no
left join anda_temp_0405 a 
on m.acct_no=a.[ud#]
left join [parmed sales may 2008] p on m.acct_no = p.[ud acct #]

set nocount off
end

GO
