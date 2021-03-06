USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_report_trend0908]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spud_report_trend0908]
as
set nocount on


--step 1 drop temp tables
begin
drop table tmp_trendreport0908_status
select getdate() as dt, cast('start' as varchar(30)) as status into tmp_trendreport0908_status

--drop next two manually before updating sp if you get 'invalid column name' errors
drop table tmp_delete_tr_volumesnap_allws
drop table tmp_delete_tr_volumesnap_priws
drop table tmp_trendreport0908_vsum
drop table tmp_trendreport0908_vpri
end


--step 2 snapshot FY 2008 volume for wholesale vendors
begin
select acct_no,vendor_id, 
march as mar08,
april as apr08,
may as may08,
june as jun07,
july as jul07,
august as aug07,
september as sep07,
cast(0.0 as numeric(38,2)) as jun08,
cast(0.0 as numeric(38,2)) as jul08,
cast(0.0 as numeric(38,2)) as aug08,
cast(0.0 as numeric(38,2)) as sep08
into tmp_delete_tr_volumesnap_allws
from udb_volume
where fy_end='2008'
and vendor_id in (65,86,76,79) --distinct wsale volume ids
end
-- (10924 row(s) affected) 1:27

insert into tmp_trendreport0908_status (dt,status) values(getdate(),'step 1')

begin
update tmp_delete_tr_volumesnap_allws 
set jun08 = (select june as jun08 from udb_volume v where v.fy_end='2009' and v.acct_no= tmp_delete_tr_volumesnap_allws.acct_no and v.vendor_id= tmp_delete_tr_volumesnap_allws.vendor_id)
update tmp_delete_tr_volumesnap_allws
set jul08=(select july from udb_volume v where fy_end='2009' and v.acct_no= tmp_delete_tr_volumesnap_allws.acct_no and v.vendor_id= tmp_delete_tr_volumesnap_allws.vendor_id)
update tmp_delete_tr_volumesnap_allws
set aug08=(select august from udb_volume v where fy_end='2009' and v.acct_no= tmp_delete_tr_volumesnap_allws.acct_no and v.vendor_id= tmp_delete_tr_volumesnap_allws.vendor_id)
update tmp_delete_tr_volumesnap_allws
set sep08=(select september from udb_volume v where fy_end='2009' and v.acct_no= tmp_delete_tr_volumesnap_allws.acct_no and v.vendor_id= tmp_delete_tr_volumesnap_allws.vendor_id)
end

insert into tmp_trendreport0908_status (dt,status) values(getdate(),'step 2')

--step 3 select primary wholesaler only
begin
select m.acct_no,vendor_id, 
mar08, apr08, may08, jun08, jul08, aug08, sep08,
jun07, jul07, aug07, sep07
into tmp_delete_tr_volumesnap_priws
from tmp_delete_tr_volumesnap_allws v inner join active_members_withtypes m on v.acct_no=m.acct_no
where v.vendor_id=m.primaryws
end

insert into tmp_trendreport0908_status (dt,status) values(getdate(),'step 3')

--step 4 his sums all ws volume
--into tmp_trendreport0908_vsum
begin
SELECT m.*, 
sum(Mar08) AS Mar08, 
sum(Apr08) as Apr08,
sum(May08) as May08,
sum(jun08) as jun08,
sum(Jul08) as Jul08, 
sum(Aug08) as Aug08, 
cast(0.0 as numeric(38,2)) as avg6mo, 
sum(Sep08) as Sep08, 
cast(0.0 as numeric(38,2)) as pctchangeAvg,
sum(Sep07) as Sep07,
cast(0.0 as numeric(38,2)) as pctchangeYY,
(sum(sep08)+sum(Jul08)+sum(aug08)) as Q308, 
 (sum(sep07)+sum(jul07)+sum(aug07)) as Q307, 
cast(0.0 as numeric(38,2)) as pctchangeQQ

INTO tmp_trendreport0908_vsum
FROM active_members_withtypes m 
LEFT JOIN tmp_delete_tr_volumesnap_allws AS v ON m.acct_no=v.acct_no
GROUP BY m.acct_no, ncpdp, store, city, state, nsterritory,effective,quitdate,m.type, m.primaryws, m.primarywsname
ORDER BY m.acct_no;
end

insert into tmp_trendreport0908_status (dt,status) values(getdate(),'step 4')

--step 5 this is primary ws volume only
--into tmp_trendreport0908_vpri
--this is primary ws volume only
--into tmp_trendreport0908_vpri
--sum isn't needed because only one vendor_id per store
begin
SELECT m.*, 
Mar08, Apr08, May08, Jun08,Jul08, Aug08,
cast(0.0 as numeric(38,2)) as avg6mo, 
Sep08, 
cast(0.0 as numeric(38,2)) as pctchangeAvg,
Sep07,
cast(0.0 as numeric(38,2)) as pctchangeYY,
Jul08+Aug08+Sep08 as Q308,
Jul07+Aug07+Sep07 as Q307,
cast(0.0 as numeric(38,2)) as pctchangeQQ

INTO tmp_trendreport0908_vpri
FROM active_members_withtypes m 
LEFT JOIN tmp_delete_tr_volumesnap_priws AS v ON m.acct_no=v.acct_no
ORDER BY m.acct_no;
end

insert into tmp_trendreport0908_status (dt,status) values(getdate(),'step 5')

--step 6 calculate averages
begin
update tmp_trendreport0908_vsum
set avg6mo = dbo.AvgNoLeading0s(Mar08, Apr08, May08, jun08, jul08, aug08)
end

begin
update tmp_trendreport0908_vpri 
set avg6mo = dbo.AvgNoLeading0s(Mar08, Apr08, May08, jun08,jul08,aug08)
end

insert into tmp_trendreport0908_status (dt,status) values(getdate(),'step 6')

--step 7 calculate %change
begin
update tmp_trendreport0908_vsum
set pctchangeAvg = case
	when avg6mo = 0 then 0.0
	else ((sep08 - avg6mo) / avg6mo) end,
pctchangeYY = case
	when sep07 = 0 then 0.0
	else ((sep08 - sep07)/ sep07) end,
pctchangeQQ = case
	when Q307= 0 then 0.0
	else ((Q308 - Q307) / Q307) end
end

begin
update tmp_trendreport0908_vpri
set pctchangeAvg = case
	when avg6mo = 0 then 0.0
	else ((sep08 - avg6mo) / avg6mo) end,
pctchangeYY = case
	when sep07 = 0 then 0.0
	else ((sep08 - sep07)/ sep07) end,
pctchangeQQ = case
	when Q307= 0 then 0.0
	else ((Q308 - Q307) / Q307) end
end

insert into tmp_trendreport0908_status (dt,status) values(getdate(),'complete')

set nocount off

--select * from tmp_trendreport0908_vsum




GO
