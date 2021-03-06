USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[spClint_CHPHAAP_withAPI]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--added join to view of claims..apiprice 3/30/11 bg
--note this may require select permission on claims
CREATE procedure [dbo].[spClint_CHPHAAP_withAPI]
@pmid int,
@dt_from datetime,
@dt_to datetime
as
SELECT     
a.APIItemNbr,a.APIPrice,a.PricePerUnit as APIPricePerUnit,a.dateloaded as APIPriceDate,
ID, DC, CUSTOMER_NAME, CUSTOMER_NO, ITEM_NO, PMID, STORE, c.NDC, ITEM_TYPE, 
purchases.dbo.fnParseCHPHDescription(ITEM_DESCR,1) as ITEM_DESCR,
purchases.dbo.fnParseCHPHDescription(ITEM_DESCR,2) as ITEM_DESCR_SIZE,
f.PS as FDB_PKG_SIZE,
GENERIC_NAME, TRADE_NAME, INV_DATE, 
                      INVOICE_NO, TYPE, ORDER_QTY, SHIP_QTY, UNIT_COST, EXT_COST, CORP_AWP, WAC, VENDOR_NAME, UPC, CONTRACT_FLAG, BRAND, 
                      GENERIC_CODE, STRENGTH, SHORT_CODE, ENCODING, ContractNo, ContractDesc, MM_DD_YY_LOAD

from purchases..CHPH_AAP c
left join FDB..RNDC14 f on c.NDC=f.NDC
left join v_APIPrice_mostrecent a on c.NDC=a.NDC
where INV_DATE >= @dt_from and INV_DATE < @dt_to
and PMID=@pmid
order by INV_DATE,ID

GO
