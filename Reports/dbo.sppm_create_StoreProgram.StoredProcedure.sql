USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_StoreProgram]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <11/08/2011>
-- Description:	Create  Program listing for Paul as of 03/31/2013
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_StoreProgram]
(@in_month varchar(2), @in_year varchar(4) )
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


DECLARE @daysInMonth varchar(2);
DECLARE @date varchar(10);
SET @daysInMonth = dbo.DaysInMonth( @in_month,@in_year);
SET @date = @in_month + '/' + @daysInMonth + '/' + @in_year;


truncate table tmp_storesprograms
 

 insert into reports..tmp_storesprograms (PMID,AccountName,TM,[AAP#],[AAP Eff. Date],[API#], [API Status],
 [AAP Elite],[API Customer],[AuditGuard],[AAP Specialty],[Conf 2015],[Generic Adv],[Generic Care],[Managed Care],[MTM] ,[Rx Care Select],[Compliance Guardian],[Total]) 

--select * into  tmp_storesprograms from (
 
select PMID,AccountName,TM,AAPAccountNo as [AAP#],AAPEffectiveDate as [AAP Eff. Date] ,APIAccountNo as [API#],APIStatus as [API Status],
cast(0 as int) as [AAP Elite],
cast(0 as int) as [API Customer],
cast(0 as int) as [AuditGuard],
cast(0 as int) as [AAP Specialty],
cast(0 as int) as [Conf 2015],
cast(0 as int) as [Generic Adv],
cast(0 as int) as [Generic Care],
cast(0 as int) as [Managed Care],
cast(0 as int) as [MTM],
cast(0 as int) as [Rx Care Select],
cast(0 as int) as [Compliance Guardian],
cast(0 as int) as [Total]

from pharmacymaster..v_pm_allwithaffiliates where aapaccountno is not null and 
(aapquitdate is null or aapquitdate > @date) and
aapeffectivedate <= @date --) ch

update t
set [AAP Elite] = 1
from reports..tmp_storesprograms t
join(
select * from pharmacymaster..pm_memberprograms where startdate <= @date 
and (enddate is null or enddate > @date) and pmid in (select pmid from 
 reports..tmp_storesprograms) and programid = 184
) pm on t.pmid =pm.pmid

 --183 AAP Specialty
update t
set [AAP Specialty] = 1
from reports..tmp_storesprograms t
join(
select * from pharmacymaster..pm_memberprograms where startdate <= @date 
and (enddate is null or enddate > @date) and pmid in (select pmid from 
 reports..tmp_storesprograms) and programid = 183
) pm on t.pmid =pm.pmid

--update t
--set [Ad-Vantage] = 1
--from reports..tmp_storesprograms t
--join(
--select * frompharmacymaster.. pm_memberprograms where startdate <= @date 
--and (enddate is null or enddate > @date) and pmid in (select pmid from 
-- reports..tmp_storesprograms) and programid = 186
--) pm on t.pmid =pm.pmid

--update t
--set [Adheris] = 1
--from reports..tmp_storesprograms t
--join(
--select * from pharmacymaster.. pm_memberprograms where startdate <= @date 
--and (enddate is null or enddate > @date) and pmid in (select pmid from 
-- reports..tmp_storesprograms) and programid = 192
--) pm on t.pmid =pm.pmid

--update t
--set [Asthma Therapy] = 1
--from reports..tmp_storesprograms t
--join(
--select * from pharmacymaster.. pm_memberprograms where startdate <= @date 
--and (enddate is null or enddate > @date) and pmid in (select pmid from 
-- reports..tmp_storesprograms) and programid = 175
--) pm on t.pmid =pm.pmid


update t
set [AuditGuard] = 1
from reports..tmp_storesprograms t
join(
select * from pharmacymaster.. pm_memberprograms where startdate <= @date 
and (enddate is null or enddate > @date) and pmid in (select pmid from 
 reports..tmp_storesprograms) and programid = 182
) pm on t.pmid =pm.pmid

--update t
--set [Autoship] = 1
--from reports..tmp_storesprograms t
--join(
--select * from pharmacymaster.. pm_memberprograms where startdate <= @date 
--and (enddate is null or enddate > @date) and pmid in (select pmid from 
-- reports..tmp_storesprograms) and programid = 187
--) pm on t.pmid =pm.pmid

--update t
--set [Conf 2014] = 1
--from reports..tmp_storesprograms t
--join(
--select * from pharmacymaster.. pm_memberprograms where startdate <= @date 
--and (enddate is null or enddate > @date) and pmid in (select pmid from 
-- reports..tmp_storesprograms) and programid = 198
--) pm on t.pmid =pm.pmid

update t
set [Conf 2015] = 1
from reports..tmp_storesprograms t
join(
select * from pharmacymaster.. pm_memberprograms where startdate <= @date 
and (enddate is null or enddate > @date) and pmid in (select pmid from 
 reports..tmp_storesprograms) and programid = 203
) pm on t.pmid =pm.pmid


--update t
--set [DME] = 1
--from reports..tmp_storesprograms t
--join(
--select * from pharmacymaster.. pm_memberprograms where startdate <= @date 
--and (enddate is null or enddate > @date) and pmid in (select pmid from 
-- reports..tmp_storesprograms) and programid = 179
--) pm on t.pmid =pm.pmid
--
--update t
--set [FWA] = 1
--from reports..tmp_storesprograms t
--join(
--select * from pharmacymaster.. pm_memberprograms where startdate <= @date 
--and (enddate is null or enddate > @date) and pmid in (select pmid from 
-- reports..tmp_storesprograms) and programid = 180
--) pm on t.pmid =pm.pmid

update t
set [Generic Adv] = 1
from reports..tmp_storesprograms t
join(
select * from pharmacymaster.. pm_memberprograms where startdate <= @date 
and (enddate is null or enddate > @date) and pmid in (select pmid from 
 reports..tmp_storesprograms) and programid = 185
) pm on t.pmid =pm.pmid



update t
set [Generic Care] = 1
from reports..tmp_storesprograms t
join(
select * from pharmacymaster.. pm_memberprograms where startdate <= @date 
and (enddate is null or enddate > @date) and pmid in (select pmid from 
 reports..tmp_storesprograms) and programid = 189
) pm on t.pmid =pm.pmid
 
 
-- update t
--set [I.S. Fund] = 1
--from reports..tmp_storesprograms t
--join(
--select * from pharmacymaster.. pm_memberprograms where startdate <= @date 
--and (enddate is null or enddate > @date) and pmid in (select pmid from 
-- reports..tmp_storesprograms) and programid = 191
--) pm on t.pmid =pm.pmid

--update t
--set [Immunization] = 1
--from reports..tmp_storesprograms t
--join(
--select * from pharmacymaster.. pm_memberprograms where startdate <= @date 
--and (enddate is null or enddate > @date) and pmid in (select pmid from 
-- reports..tmp_storesprograms) and programid = 177
--) pm on t.pmid =pm.pmid
--
--update t
--set [Long Term Care] = 1
--from reports..tmp_storesprograms t
--join(
--select * from pharmacymaster.. pm_memberprograms where startdate <= @date 
--and (enddate is null or enddate > @date) and pmid in (select pmid from 
-- reports..tmp_storesprograms) and programid = 170
--) pm on t.pmid =pm.pmid

--update t
--set [Miami-Luken] = 1
--from reports..tmp_storesprograms t
--join(
--select * from pharmacymaster.. pm_memberprograms where startdate <= @date 
--and (enddate is null or enddate > @date) and pmid in (select pmid from 
-- reports..tmp_storesprograms) and programid = 171
--) pm on t.pmid =pm.pmid

update t
set [MTM] = 1
from reports..tmp_storesprograms t
join(
select * from pharmacymaster.. pm_memberprograms where startdate <= @date 
and (enddate is null or enddate > @date) and pmid in (select pmid from 
 reports..tmp_storesprograms) and programid = 173
) pm on t.pmid =pm.pmid

--update t
--set [Pleio] = 1
--from reports..tmp_storesprograms t
--join(
--select * from pharmacymaster.. pm_memberprograms where startdate <= @date 
--and (enddate is null or enddate > @date) and pmid in (select pmid from 
-- reports..tmp_storesprograms) and programid = 194
--) pm on t.pmid =pm.pmid
--
--update t
--set [Profit Minder] = 1
--from reports..tmp_storesprograms t
--join(
--select * from pharmacymaster.. pm_memberprograms where startdate <= @date 
--and (enddate is null or enddate > @date) and pmid in (select pmid from 
-- reports..tmp_storesprograms) and programid = 6
--) pm on t.pmid =pm.pmid
--
--update t
--set [Roche Medicare Qualification] = 1
--from reports..tmp_storesprograms t
--join(
--select * from pharmacymaster.. pm_memberprograms where startdate <= @date 
--and (enddate is null or enddate > @date) and pmid in (select pmid from 
-- reports..tmp_storesprograms) and programid = 172
--) pm on t.pmid =pm.pmid

update t
set [Rx Care Select] = 1
from reports..tmp_storesprograms t
join(
select * from pharmacymaster.. pm_memberprograms where startdate <= @date 
and (enddate is null or enddate > @date) and pmid in (select pmid from 
 reports..tmp_storesprograms) and programid = 190
) pm on t.pmid =pm.pmid

update t
set [Compliance Guardian] = 1
from reports..tmp_storesprograms t
join(
select * from pharmacymaster.. pm_memberprograms where startdate <= @date 
and (enddate is null or enddate > @date) and pmid in (select pmid from 
 reports..tmp_storesprograms) and programid = 197
) pm on t.pmid =pm.pmid

--update t
--set [Smart D Rx] = 1
--from reports..tmp_storesprograms t
--join(
--select * from pharmacymaster.. pm_memberprograms where startdate <= @date 
--and (enddate is null or enddate > @date) and pmid in (select pmid from 
-- reports..tmp_storesprograms) and programid = 193
--) pm on t.pmid =pm.pmid

--update t
--set [TrueScript Reconciler] = 1
--from reports..tmp_storesprograms t
--join(
--select * from pharmacymaster.. pm_memberprograms where startdate <= @date 
--and (enddate is null or enddate > @date) and pmid in (select pmid from 
-- reports..tmp_storesprograms) and programid = 8
--) pm on t.pmid =pm.pmid

--Managed Care  
 
 update t
set [Managed Care] = 1
from reports..tmp_storesprograms t
join(
select PMID,AccountName,TM from pharmacymaster..v_pm_allwithaffiliates where aapaccountno is not null and aapaccountno != ''and 
(aapquitdate is null or aapquitdate > @date) and
aapeffectivedate <= @date and 
 reports.dbo.maxdate(mceffectivedate,aapeffectivedate) <= @date and reports.dbo.maxdate(mceffectivedate,aapeffectivedate)
 is not null and pmid in (select pmid from 
 reports..tmp_storesprograms) and chaincode is not null  and ( mcquitdate is null or mcquitdate > @date)
) pm on t.pmid = pm.pmid

--API Customer

update t
set [API Customer] = 1
from reports..tmp_storesprograms t
join(
select PMID,AccountName,TM from pharmacymaster..v_pm_allwithaffiliates where aapaccountno is not null and aapaccountno != ''and 
(aapquitdate is null or aapquitdate > @date) and
aapeffectivedate <= @date    and pmid in (select pmid from 
 reports..tmp_storesprograms) and apiaccountno is not null and apiaccountno != '' and apistatus = 'active'
) pm on t.pmid =pm.pmid


Update reports..tmp_storesprograms set Total = 
[AAP Elite] + [API Customer]+ [AuditGuard]+ [Conf 2015]+ [Generic Adv]+ [Generic Care]+ [Managed Care]+ 
[MTM]+ [Rx Care Select]+ [Compliance Guardian] + [AAP Specialty]

 


--select * from tmp_storesprograms
--where [AAP Elite] = 0 and
--[API Customer] = 0 and [AuditGuard] = 0 and [Conf 2013] = 0 and [Generic Adv] = 0 and
--[Generic Care] = 0 and [Managed Care] = 0 and [MTM] = 0 and [Rx Care Select] = 0 and [RxAlly]  = 0  
Update reports..tmp_storesprograms set [AAP Elite] = null where [AAP Elite]  = 0;
Update reports..tmp_storesprograms set [API Customer] = null where [API Customer] = 0;
Update reports..tmp_storesprograms set [AuditGuard] = null where [AuditGuard] = 0;
Update reports..tmp_storesprograms set [Conf 2015] = null where [Conf 2015] = 0;
Update reports..tmp_storesprograms set [Generic Adv] = null where [Generic Adv] = 0;
Update reports..tmp_storesprograms set [Generic Care] = null where [Generic Care] = 0;
Update reports..tmp_storesprograms set [Managed Care] = null where [Managed Care] = 0;
Update reports..tmp_storesprograms set [MTM] = null where [MTM] = 0;
Update reports..tmp_storesprograms set [Rx Care Select] = null where [Rx Care Select] = 0;
Update reports..tmp_storesprograms set [Compliance Guardian] = null where [Compliance Guardian] = 0;
Update reports..tmp_storesprograms set[AAP Specialty] = null where [AAP Specialty] = 0;

select * from tmp_storesprograms;
 
END








GO
