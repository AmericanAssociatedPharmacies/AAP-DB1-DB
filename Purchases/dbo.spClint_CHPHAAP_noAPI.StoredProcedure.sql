USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[spClint_CHPHAAP_noAPI]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--added join to view of claims..apiprice 3/30/11 bg
--note this may require select permission on claims
CREATE procedure [dbo].[spClint_CHPHAAP_noAPI]

@dt_from datetime,
@dt_to datetime,
@pmid int
as
select 
top 1 null as NDC,
'CH AAP Purchases for ' + cast(@pmid as varchar) + ' ' 
+ accountname + ', ' + city + ', ' + [state] 
+ ' from ' + convert(varchar,@dt_from,1) 
+ ' to ' + convert(varchar,@dt_to,1) as ITEM_DESCR,
null as FDB_PKG_SIZE, null as SHIP_QTY,null as UNIT_COST, null as EXT_COST
from pharmacymaster..v_pm_allwithaffiliates v
where pmid=@pmid

UNION

SELECT NDC, ITEM_DESCR, 
--ITEM_DESCR_SIZE as [CH Size],
FDB_PKG_SIZE,
sum(isnull(SHIP_QTY,0)) as SHIP_QTY,
--case when max(isnull(UNIT_COST,0)) = min(isnull(UNIT_COST,0)) then cast(max(isnull(UNIT_COST,0)) as varchar(20))
--	else cast(min(isnull(UNIT_COST,0)) as varchar(20)) + ' to ' cast(max(isnull(UNIT_COST,0)) as varchar(20))
--	end as UNIT_COST,
max(isnull(UNIT_COST,0)) as UNIT_COST,
sum(isnull(EXT_COST,0)) as EXT_COST
from
(
SELECT
c.NDC,ITEM_DESCR,
--ID, DC, CUSTOMER_NAME, CUSTOMER_NO, ITEM_NO, PMID, STORE,  
ITEM_TYPE, 
--purchases.dbo.fnParseCHPHDescription(ITEM_DESCR,1) as ITEM_DESCR,
--purchases.dbo.fnParseCHPHDescription(ITEM_DESCR,2) as ITEM_DESCR_SIZE,
f.PS as FDB_PKG_SIZE,
ORDER_QTY, SHIP_QTY, UNIT_COST, EXT_COST
--GENERIC_NAME, TRADE_NAME, INV_DATE, 
--                      INVOICE_NO, TYPE, ORDER_QTY, SHIP_QTY, UNIT_COST, EXT_COST, CORP_AWP, WAC, VENDOR_NAME, UPC, CONTRACT_FLAG, BRAND, 
--                      GENERIC_CODE, STRENGTH, SHORT_CODE, ENCODING, ContractNo, ContractDesc, --MM_DD_YY_LOAD
--x.GPI
from purchases..CHPH_AAP c
left join FDB..NDCGPI x on c.NDC=x.NDC
left join FDB..RNDC14 f on c.NDC=f.NDC
where ITEM_TYPE='Rx'
and SHIP_QTY > 0
and INV_DATE >= @dt_from and INV_DATE < @dt_to
and PMID=@pmid
--order by INV_DATE,ID
) dt
GROUP BY NDC,ITEM_DESCR, FDB_PKG_SIZE
order by 1


	
GO
