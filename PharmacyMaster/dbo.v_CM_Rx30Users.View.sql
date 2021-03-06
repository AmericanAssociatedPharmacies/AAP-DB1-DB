USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_CM_Rx30Users]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_CM_Rx30Users]
as
--list of current Rx30 users for sales
--note this only lists those we have feeds for 
select 
'y' as DataFeed,
r.[pharm id] as NCPDP,
p.PMID,
p.AAPAccountNo as [AAP#],
p.APIAccountNo as [API#],
p.AccountName,
p.City,
p.State as [St],
p.Territory as [TM],
p.Affiliate,
p.AAPEffectiveDate,
p.AAPQuitDate,
p.computersoftware as PMCS
from claims.dbo.Rx30ClaimsStores r 
	left join pharmacymaster..v_pm_allwithaffiliates p on r.[pharm id]=p.ncpdp 

--add any new AAP members
union
select
'n' as DataFeed,
p.NCPDP,
p.PMID,
p.AAPAccountNo as [AAP#],
p.APIAccountNo as [API#],
p.AccountName,
p.City,
p.State as [St],
p.Territory as [TM],
p.Affiliate,
p.AAPEffectiveDate,
p.AAPQuitDate,
p.computersoftware as PMCS
from pharmacymaster..v_pm_allwithaffiliates p
where p.computersoftware like 'Rx3%'
and AAPAccountNo is not null and AAPQuitDate is null
and p.NCPDP not in (select [pharm id] as NCPDP from claims.dbo.Rx30ClaimsStores)

GO
