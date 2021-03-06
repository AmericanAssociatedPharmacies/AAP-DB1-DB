USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_report_trend0708]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spud_report_trend0708]
as
set nocount on


--step 1 drop temp tables
begin
drop table tmp_trendreport0708_status
select getdate() as dt, cast('start' as varchar(50)) as status into tmp_trendreport0708_status

--drop next two manually before updating sp if you get 'invalid column name' errors
drop table tmp_delete_tr_volumesnap_allws
drop table tmp_delete_tr_volumesnap_priws
drop table tmp_trendreport0708_vsum
drop table tmp_trendreport0708_vpri
end


--step 2 snapshot FY 2008 volume for wholesale vendors
begin
select acct_no,vendor_id, 
january as jan08,
february as feb08,
march as mar08,
april as apr08,
may as may08,
june as jun07,
july as jul07,
cast(0.0 as numeric(38,2)) as jun08,
cast(0.0 as numeric(38,2)) as jul08,
cast(0.0 as numeric(38,2)) as apr07,
cast(0.0 as numeric(38,2)) as may07
into tmp_delete_tr_volumesnap_allws
from udb_volume
where fy_end='2008'
and vendor_id in (65,86,76,79) --distinct wsale volume ids
end

insert into tmp_trendreport0708_status (dt,status) values(getdate(),'step 1')

begin
update tmp_delete_tr_volumesnap_allws 
set jun08 = (select june as jun08 from udb_volume v where v.fy_end='2009' and v.acct_no= tmp_delete_tr_volumesnap_allws.acct_no and v.vendor_id= tmp_delete_tr_volumesnap_allws.vendor_id)
update tmp_delete_tr_volumesnap_allws
set jul08=(select july from udb_volume v where fy_end='2009' and v.acct_no= tmp_delete_tr_volumesnap_allws.acct_no and v.vendor_id= tmp_delete_tr_volumesnap_allws.vendor_id)
update tmp_delete_tr_volumesnap_allws 
set apr07=(select april from udb_volume v where fy_end='2007' and v.acct_no= tmp_delete_tr_volumesnap_allws.acct_no and v.vendor_id= tmp_delete_tr_volumesnap_allws.vendor_id)
update tmp_delete_tr_volumesnap_allws 
set may07=(select may from udb_volume v where fy_end='2007' and v.acct_no= tmp_delete_tr_volumesnap_allws.acct_no and v.vendor_id= tmp_delete_tr_volumesnap_allws.vendor_id)
end

insert into tmp_trendreport0708_status (dt,status) values(getdate(),'step 2')

--step 3 select primary wholesaler only
begin
select m.acct_no,vendor_id, 
jan08, feb08, mar08, apr08, may08, jun08, jul08,
apr07, may07, jun07, jul07
into tmp_delete_tr_volumesnap_priws
from tmp_delete_tr_volumesnap_allws v inner join active_members_withtypes m on v.acct_no=m.acct_no
where v.vendor_id=m.primaryws
end

insert into tmp_trendreport0708_status (dt,status) values(getdate(),'step 3')

--step 4 his sums all ws volume
--into tmp_trendreport0708_vsum
begin
SELECT m.*, 
sum(Jan08) AS Jan08, 
sum(Feb08) AS Feb08, 
sum(Mar08) AS Mar08, 
sum(Apr08) as Apr08,
sum(May08) as May08,
sum(jun08) as jun08,
cast(0.0 as numeric(38,2)) as avg6mo, 
sum(Jul08) as Jul08, 
cast(0.0 as numeric(38,2)) as pctchangeAvg,
sum(Jul07) as Jul07,
cast(0.0 as numeric(38,2)) as pctchangeYY,
(sum(Apr08)+sum(May08)+sum(jun08)) as Q208, 
 (sum(apr07)+sum(may07)+sum(jun07)) as Q207, 
cast(0.0 as numeric(38,2)) as pctchangeQQ

INTO tmp_trendreport0708_vsum
FROM active_members_withtypes m 
LEFT JOIN tmp_delete_tr_volumesnap_allws AS v ON m.acct_no=v.acct_no
GROUP BY m.acct_no, ncpdp, store, city, state, nsterritory,effective,quitdate,m.type, m.primaryws
ORDER BY m.acct_no;
end

insert into tmp_trendreport0708_status (dt,status) values(getdate(),'step 4')

--step 5 this is primary ws volume only
--into tmp_trendreport0708_vpri
--this is primary ws volume only
--into tmp_trendreport0708_vpri
--sum isn't needed because only one vendor_id per store
begin
SELECT m.*, 
Jan08, Feb08, Mar08, Apr08, May08, Jun08,
cast(0.0 as numeric(38,2)) as avg6mo, 
Jul08, 
cast(0.0 as numeric(38,2)) as pctchangeAvg,
Jul07,
cast(0.0 as numeric(38,2)) as pctchangeYY,
Apr08+May08+Jun08 as Q208,
Apr07+May07+Jun07 as Q207,
cast(0.0 as numeric(38,2)) as pctchangeQQ

INTO tmp_trendreport0708_vpri
FROM active_members_withtypes m 
LEFT JOIN tmp_delete_tr_volumesnap_priws AS v ON m.acct_no=v.acct_no
ORDER BY m.acct_no;
end

insert into tmp_trendreport0708_status (dt,status) values(getdate(),'step 5')

--step 6 calculate averages
begin
update tmp_trendreport0708_vsum
set avg6mo = dbo.AvgNoLeading0s(Jan08, Feb08, Mar08, Apr08, May08, jun08)
end

begin
update tmp_trendreport0708_vpri 
set avg6mo = dbo.AvgNoLeading0s(Jan08, Feb08, Mar08, Apr08, May08, jun08)
end

insert into tmp_trendreport0708_status (dt,status) values(getdate(),'step 6')

--step 7 calculate %change
begin
update tmp_trendreport0708_vsum
set pctchangeAvg = case
	when avg6mo = 0 then 0.0
	else ((jul08 - avg6mo) / avg6mo) end,
pctchangeYY = case
	when jul07 = 0 then 0.0
	else ((jul08 - jul07)/ jul07) end,
pctchangeQQ = case
	when Q207= 0 then 0.0
	else ((Q208 - Q207) / Q207) end
end

begin
update tmp_trendreport0708_vpri
set pctchangeAvg = case
	when avg6mo = 0 then 0.0
	else ((jul08 - avg6mo) / avg6mo) end,
pctchangeYY = case
	when jul07 = 0 then 0.0
	else ((jul08 - jul07)/ jul07) end,
pctchangeQQ = case
	when Q207= 0 then 0.0
	else ((Q208 - Q207) / Q207) end
end

insert into tmp_trendreport0708_status (dt,status) values(getdate(),'complete')

set nocount off

--select * from tmp_trendreport0708_vsum

GO
