USE [AAP]
GO
/****** Object:  View [dbo].[v_tmp_STPlanQPS4Q]    Script Date: 12/22/2020 9:04:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_tmp_STPlanQPS4Q]
as
select distinct a.aapid,
a.APIWarehouseAcctNo,u.acct_no
,s.QPS,s.Planogram,s.ScanAndToss
,(w.October+w.November+w.December)/3 as API4Q09Avg
,u.UDCH4Q09/3 as UDCH4Q09Avg
--,dbo.csfnRangeString1(isnull((w.October+w.November+w.December)/3,0),25000,1) as API4Q09Avg_range
,dbo.csfnRangeString1((w.October+w.November+w.December)/3,25000,1) as API4Q09Avg_range
from aapaccount a 
left join API..API_Sum_Totamt_Mnthly w on (a.APIWarehouseAcctNo = w.WHAccountID)
left join v_tmp_UDCH4Q09 u on a.PreviousAcctNo = u.acct_no
left join v_slxaccount s on cast(a.aapid as varchar(10))=s.aapid
where (w.WHAccountID is null or w.year='2009')
and a.quitdate is null 
GO
