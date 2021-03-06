USE [Purchases]
GO
/****** Object:  View [dbo].[v_purchases_CHRebates]    Script Date: 12/22/2020 9:26:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[v_purchases_CHRebates]
as
select distinct 
[date]
,[month]
,[year]
,PMID,
NCPDP,
CHRebatePerc
from
 Purchases.dbo.CHRebates
 
 union
select distinct 
[date]
,12 as [month]
,2014 as [year]
,PMID,
NCPDP,
CHRebatePerc
from
 Purchases.dbo.CHRebates where [year]=2014 and [month]=11 
 and not exists (select * from Purchases.dbo.CHRebates where [year]=2014 and [month]=12)
 
 union
select distinct 
[date]
,1 as [month]
,2015 as [year]
,PMID,
NCPDP,
CHRebatePerc
from
 Purchases.dbo.CHRebates where [year]=2014 and [month]=11 
  and not exists (select * from Purchases.dbo.CHRebates where [year]=2015 and [month]=1)
GO
