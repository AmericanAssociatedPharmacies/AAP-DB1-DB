USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[spCardCom_20171020]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spCardCom_20171020]
	@pmid int,
	@dt_from datetime,
	@dt_to datetime,
	@exclude int,
	@drugtype varchar(1)
as
--FDB
/*SELECT 
MIN([API ITEM #]) as [API ITEM #],
MIN([API PRICE]) as [API PRICE] ,
MIN([Adj Rebate]) as [Adj Rebate],
c.NDC,
MIN(purchases.dbo.fnParseCHPHDescription(ITEM_DESCR,1)) as ItemDesc, 
MIN(f.PS) as FDB_PKG_SIZE, 
SUM(SHIP_QTY) as SHIP_QTY, 
Unit_Cost, 
SUM(Ext_Cost)as Ext_Cost,
MIN(DrugType) as DrugType
from purchases..v_CHPHAAP c
left join purchases..CARDINALCOMPLETE ON c.ITEM_NO = CardinalComplete.CARDINALITEMNUMBER 
left join FDB..RNDC14 f on c.NDC=f.NDC
where [API ITEM #] IS NOT NULL AND [API ITEM #] <> 0 AND ITEM_TYPE = 'RX' AND SHIP_QTY > 0 AND INV_DATE >= @dt_from and INV_DATE < @dt_to and PMID=@pmid
 --and (DrugType='SINGLE-SOURCE BRAND' OR DrugType='UNK' OR DrugType='MULTI-SOURCE BRAND' )
GROUP BY c.NDC,Unit_Cost*/

--CAH
if @exclude=1 --Exclude Variations
Begin
	SELECT 
	MIN(CUSTOMER_NAME) as Customer,
	MIN([API ITEM]) as [API ITEM],
	MIN(APINDC) as APINDC,
	MIN([API PRICE]) as [API PRICE] ,
	(MIN([API PRICE])  * SUM(SHIP_QTY)) as APIExt ,
	MIN([Adj Rebate]) as [Adj Rebate],
	c.NDC,
	MIN(purchases.dbo.fnParseCHPHDescription(ITEM_DESCR,1)) as ItemDesc, 
	MIN(f.PS) as FDB_PKG_SIZE, 
	SUM(SHIP_QTY) as SHIP_QTY, 
	Unit_Cost, 
	SUM(Ext_Cost)as Ext_Cost,
	MIN(BRAND) as DrugType
	from purchases..CHPH_AAP c
	left join purchases..v_CARDINALCOMPLETE ON c.ITEM_NO = v_CardinalComplete.CARDINALITEMNUMBER 
	left join Medispan.[dbo].[DrugMaster_20171020] f on c.NDC=f.NDC
	where purchases.dbo.fnParseCHPHDescription(ITEM_DESCR,1) NOT LIKE 'OLANZAPINE%' AND [API ITEM ] IS NOT NULL AND [API ITEM ] <> '0' AND ITEM_TYPE = 'RX' AND SHIP_QTY > 0 AND INV_DATE >= @dt_from and INV_DATE < @dt_to and PMID=@pmid
	AND Brand=@drugtype
	GROUP BY PMID, c.NDC,Unit_Cost
	HAVING (((SUM(Ext_Cost)- (MIN([API PRICE]) * SUM(SHIP_QTY)))/SUM(Ext_Cost)) * 100) < 50
	ORDER BY SHIP_QTY DESC

End

if @exclude=2 --Dont Exclude Variations
BEGIN
SELECT 
	MIN(CUSTOMER_NAME) as Customer,
	MIN([API ITEM]) as [API ITEM],
	MIN(APINDC) as APINDC,
	MIN([API PRICE]) as [API PRICE] ,
	MIN([API PRICE])  * SUM(SHIP_QTY) as APIExt ,
	MIN([Adj Rebate]) as [Adj Rebate],
	c.NDC,
	MIN(purchases.dbo.fnParseCHPHDescription(ITEM_DESCR,1)) as ItemDesc, 
	MIN(f.PS) as FDB_PKG_SIZE, 
	SUM(SHIP_QTY) as SHIP_QTY, 
	Unit_Cost, 
	SUM(Ext_Cost)as Ext_Cost,
	MIN(BRAND) as DrugType
	from purchases..CHPH_AAP c
	left join purchases..v_CARDINALCOMPLETE ON c.ITEM_NO = v_CardinalComplete.CARDINALITEMNUMBER 
	left join Medispan.[dbo].[DrugMaster_20171020] f on c.NDC=f.NDC
	where purchases.dbo.fnParseCHPHDescription(ITEM_DESCR,1) NOT LIKE 'OLANZAPINE%' AND [API ITEM ] IS NOT NULL AND [API ITEM ] <> '0' AND ITEM_TYPE = 'RX' AND SHIP_QTY > 0 AND INV_DATE >= @dt_from and INV_DATE < @dt_to and PMID=@pmid
	AND Brand=@drugtype
	--AND (((SUM(Ext_Cost)- (MIN([API PRICE]) * SUM(SHIP_QTY)))/SUM(Ext_Cost)) * 100) < 50
	GROUP BY PMID, c.NDC,Unit_Cost
	ORDER BY SHIP_QTY DESC
END

GO
