USE [reporting]
GO
/****** Object:  View [dbo].[PDOD_vw_extendedDetail2]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[PDOD_vw_extendedDetail2]
as

select d.acct_no,t.store,t.city,t.state,
t.nsterritory as terr,t.effective,t.quitdate,t.eligible,
d.vendor_id,d.vendor,d.volume as nwvolume,d.rebate as nwrebate,
d.wsvolume,d.wsadminfees,d.genrebate,d.crfactor,d.cr90,
cast(0.0 as numeric(38,2)) as contributionpercentage,
cast(0.0 as numeric(38,2)) as PDFactor,
cast(0.0 as numeric(38,2)) as PD90,
cast(0.0 as numeric(38,2)) as WSRxSales,
cast(0.0 as numeric(38,2)) as WSGenSales
from PDOD_detail d inner join PDOD_totals t on d.acct_no=t.acct_no

union

select t.acct_no,t.store,t.city,t.state,
t.nsterritory as terr,t.effective,t.quitdate,t.eligible,
cast(900 as integer) as vendor_id,
'UD Profit Distribution' as vendor,
cast(0.0 as numeric(38,2)) as nwvolume,
cast(0.0 as numeric(38,2)) as nwrebate,
cast(0.0 as numeric(38,2)) as wsvolume,
cast(0.0 as numeric(38,2)) as wsadminfees,
cast(0.0 as numeric(38,2)) as genrebate,
cast(0.0 as numeric(38,2)) as crfactor,
cast(0.0 as numeric(38,2)) as cr90,
t.contributionpercentage,
t.ProfitDistributionFactor as PDFactor,
t.ProfitDistribution90 as PD90,
cast(0.0 as numeric(38,2)) as WSRxSales,
cast(0.0 as numeric(38,2)) as WSGenSales
from PDOD_totals t

union
select t.acct_no,t.store,t.city,t.state,
t.nsterritory as terr,t.effective,t.quitdate,t.eligible,
cast(901 as integer) as vendor_id,
'CH Generic Rebate' as vendor,
cast(0.0 as numeric(38,2)) as nwvolume,
cast(0.0 as numeric(38,2)) as nwrebate,
cast(0.0 as numeric(38,2)) as wsvolume,
cast(0.0 as numeric(38,2)) as wsadminfees,
cast(0.0 as numeric(38,2)) as genrebate,
cast(0.0 as numeric(38,2)) as crfactor,
cast(0.0 as numeric(38,2)) as cr90,
cast(0.0 as numeric(38,2)) as contributionpercentage,
cast(0.0 as numeric(38,2)) as PDFactor,
cast(0.0 as numeric(38,2)) as PD90,
t.WSRxSales,
t.WSGenericSales as WSGenSales
from PDOD_totals t



GO
