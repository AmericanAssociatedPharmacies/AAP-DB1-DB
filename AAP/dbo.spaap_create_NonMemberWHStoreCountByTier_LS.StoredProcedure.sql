USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[spaap_create_NonMemberWHStoreCountByTier_LS]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 04/29/2009
-- Description:	Create Mail List
-- =============================================
CREATE PROCEDURE  [dbo].[spaap_create_NonMemberWHStoreCountByTier_LS]
 
AS
BEGIN



 
SELECT count, Tier from 
(
	select count(pm.apiaccountno) as count   ,'> 0 and <= 5000'as Tier ,1 as ordernum from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 0 and api.Q4avg <= 5000 and pm.aapaccountno is null

UNION


select count(pm.apiaccountno) as count   ,'> 5000 and <= 10000'   as Tier ,2 as ordernum from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 5000 and  api.Q4avg <= 10000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 10000 and <= 15000' as Tier,3 as ordernum from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 10000 and  api.Q4avg <= 15000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 15000 and <= 20000' as Tier ,4 as ordernum from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 15000 and  api.Q4avg <= 20000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 20000 and <= 25000' as Tier,5 as ordernum from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 20000 and  api.Q4avg <= 25000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 25000 and <= 30000' as Tier,6 as ordernum from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 25000 and  api.Q4avg <= 30000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 30000 and <= 35000' as Tier,7 as ordernum from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 30000 and  api.Q4avg <= 35000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 35000 and <= 40000' as Tier,8 as ordernum from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 35000 and  api.Q4avg <= 40000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 40000 and <= 45000' as Tier,9 as ordernum from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 40000 and  api.Q4avg <= 45000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 45000 and <= 50000' as Tier,10 as ordernum from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 45000 and  api.Q4avg <= 50000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 50000 and <= 55000' as Tier,11 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 50000 and  api.Q4avg <= 55000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 55000 and <= 60000' as Tier,12 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 55000 and  api.Q4avg <= 60000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 60000 and <= 65000' as Tier,13 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 60000 and  api.Q4avg <= 65000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 65000 and <= 70000' as Tier ,14 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 65000 and  api.Q4avg <= 70000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 70000 and <= 75000' as Tier ,15 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 70000 and  api.Q4avg <= 75000 and pm.aapaccountno is null



UNION

select count(pm.apiaccountno) as count   ,'> 75000 and <= 80000' as Tier,16 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 75000 and  api.Q4avg <= 80000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 80000 and <= 85000' as Tier ,17 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 80000 and  api.Q4avg <= 85000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 85000 and <= 90000' as Tier,18 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 85000 and  api.Q4avg <= 90000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 90000 and <= 95000' as Tier,19 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 90000 and  api.Q4avg <= 95000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 95000 and <= 100000' as Tier,20 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 95000 and  api.Q4avg <= 100000 and pm.aapaccountno is null

---- OVER 100000

UNION

select count(pm.apiaccountno) as count   ,'> 100000 and <= 105000' as Tier,21 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 100000 and  api.Q4avg <= 105000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 105000 and <= 110000' as Tier,22 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 105000 and  api.Q4avg <= 110000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 110000 and <= 115000' as Tier,23 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 110000 and  api.Q4avg <= 115000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 115000 and <= 120000' as Tier,24 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 115000 and  api.Q4avg <= 120000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 120000 and <= 125000' as Tier,25 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 120000 and  api.Q4avg <= 125000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 125000 and <= 130000' as Tier,26 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 125000 and  api.Q4avg <= 130000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 130000 and <= 135000' as Tier,27 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 130000 and  api.Q4avg <= 135000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 135000 and <= 140000' as Tier,28 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 135000 and  api.Q4avg <= 140000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 140000 and <= 145000' as Tier,29 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 140000 and  api.Q4avg <= 145000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 145000 and <= 150000' as Tier,30 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 145000 and  api.Q4avg <= 150000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 150000 and <= 155000' as Tier,31 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 150000 and  api.Q4avg <= 155000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 155000 and <= 160000' as Tier,32 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 155000 and  api.Q4avg <= 160000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 160000 and <= 165000' as Tier,33 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 160000 and  api.Q4avg <= 165000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 165000 and <= 170000' as Tier ,34 as ordernum from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 165000 and  api.Q4avg <= 170000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 170000 and <= 175000' as Tier ,35 as ordernum from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 170000 and  api.Q4avg <= 175000 and pm.aapaccountno is null



UNION

select count(pm.apiaccountno) as count   ,'> 175000 and <= 180000' as Tier,36 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 175000 and  api.Q4avg <= 180000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 180000 and <= 185000' as Tier,37 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 180000 and  api.Q4avg <= 185000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 185000 and <= 190000' as Tier,38 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 185000 and  api.Q4avg <= 190000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 190000 and <= 195000' as Tier,39 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 190000 and  api.Q4avg <= 195000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 195000 and <= 200000' as Tier,40 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 195000 and  api.Q4avg <= 200000 and pm.aapaccountno is null


--- OVER 200000


UNION

select count(pm.apiaccountno) as count   ,'> 200000 and <= 205000' as Tier,41 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 200000 and  api.Q4avg <= 205000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 205000 and <= 210000' as Tier,42 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 205000 and  api.Q4avg <= 210000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 210000 and <= 215000' as Tier,43 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 210000 and  api.Q4avg <= 215000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 215000 and <= 220000' as Tier,44 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 215000 and  api.Q4avg <= 220000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 220000 and <= 225000' as Tier,45 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 220000 and  api.Q4avg <= 225000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 225000 and <= 230000' as Tier,46 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 225000 and  api.Q4avg <= 230000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 230000 and <= 235000' as Tier,47 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 230000 and  api.Q4avg <= 235000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 235000 and <= 240000' as Tier,48 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 235000 and  api.Q4avg <= 240000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 240000 and <= 245000' as Tier,49 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 240000 and  api.Q4avg <= 245000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 245000 and <= 250000' as Tier,50 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 245000 and  api.Q4avg <= 250000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 250000 and <= 255000' as Tier,51 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 250000 and  api.Q4avg <= 255000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 255000 and <= 260000' as Tier,52 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 255000 and  api.Q4avg <= 260000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 260000 and <= 265000' as Tier,53 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 260000 and  api.Q4avg <= 265000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 265000 and <= 270000' as Tier,54 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 265000 and  api.Q4avg <= 270000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 270000 and <= 275000' as Tier,55 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 270000 and  api.Q4avg <= 275000 and pm.aapaccountno is null



UNION

select count(pm.apiaccountno) as count   ,'> 275000 and <= 280000' as Tier,56 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 275000 and  api.Q4avg <= 280000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 280000 and <= 285000' as Tier,57 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 280000 and  api.Q4avg <= 285000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 285000 and <= 290000' as Tier,58 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 285000 and  api.Q4avg <= 290000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 290000 and <= 295000' as Tier,59 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 290000 and  api.Q4avg <= 295000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 295000 and <= 300000' as Tier,60 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 295000 and  api.Q4avg <= 300000 and pm.aapaccountno is null

--- OVER 300000


UNION

select count(pm.apiaccountno) as count   ,'> 300000 and <= 320000' as Tier,61 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 300000 and  api.Q4avg <= 320000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 320000 and <= 328000' as Tier,62 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 320000 and  api.Q4avg <= 328000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 328000 and <= 400000' as Tier,63 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 328000 and  api.Q4avg <= 400000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 400000 and <= 500000' as Tier,64 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 400000 and  api.Q4avg <= 500000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 500000 and <= 600000' as Tier,65 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 500000 and  api.Q4avg <= 600000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 600000 and <= 700000' as Tier,66 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 600000 and  api.Q4avg <= 700000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> 700000 and <= 800000' as Tier,67 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > 700000 and  api.Q4avg <= 800000 and pm.aapaccountno is null

UNION

select count(pm.apiaccountno) as count   ,'> -5000 and <= 0' as Tier,0 as ordernum  from pharmacymaster pm 
join
(
select  whaccountid, reporting.dbo.AvgNoLeading0s3args(october,november,december) as Q4Avg from api..API_Sum_Totamt_Mnthly
where year = '2009' 
 
) api
 
on pm.apiaccountno = api.whaccountid
where api.Q4avg > -5000 and  api.Q4avg <= 0 and pm.aapaccountno is null


 	
) tmp
order by ordernum
 	
 	
 	
				 
END
GO
