USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[spClint_CHPHAAP_withAPI2_Detail]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--added join to view of claims..apiprice 3/30/11 bg
--note this may require select permission on claims
CREATE procedure [dbo].[spClint_CHPHAAP_withAPI2_Detail]
@pmid int,
@dt_from datetime,
@dt_to datetime
as
SELECT
case when aN.APIItemNbr is null then
		case when aG.APIItemNbr is null then '' else 'GPI' end
		else 'NDC' end as [API Match Type],
case when aN.APIItemNbr is null then AG.APIItemNbr else AN.APIItemNbr end as APIItemNbr,
case when aN.APIPrice is null then AG.APIPrice else AN.APIPrice end as APIPrice,
case when aN.PricePerUnit is null then AG.PricePerUnit else AN.PricePerUnit end as APIPricePerUnit,
case when aN.dateloaded is null then AG.dateloaded else AN.dateloaded end as APIPriceDate,

ID, DC, CUSTOMER_NAME, CUSTOMER_NO, ITEM_NO, PMID, STORE, c.NDC, ITEM_TYPE, 
purchases.dbo.fnParseCHPHDescription(ITEM_DESCR,1) as ITEM_DESCR,
purchases.dbo.fnParseCHPHDescription(ITEM_DESCR,2) as ITEM_DESCR_SIZE,
f.PS as FDB_PKG_SIZE,
GENERIC_NAME, TRADE_NAME, INV_DATE, 
                      INVOICE_NO, TYPE, ORDER_QTY, SHIP_QTY, UNIT_COST, EXT_COST, CORP_AWP, WAC, VENDOR_NAME, UPC, CONTRACT_FLAG, BRAND, 
                      GENERIC_CODE, STRENGTH, SHORT_CODE, ENCODING, ContractNo, ContractDesc, --MM_DD_YY_LOAD
x.GPI
from purchases..CHPH_AAP c
left join FDB..NDCGPI x on c.NDC=x.NDC
left join FDB..RNDC14 f on c.NDC=f.NDC
left join v_APIPrice_mostrecent2 aN on c.NDC=aN.NDC
left join v_APIPrice_mostrecent2 aG on isnull(x.GPI,'nomatch')=aG.GPI
where INV_DATE >= @dt_from and INV_DATE < @dt_to
and PMID=@pmid
order by INV_DATE,ID

GO
