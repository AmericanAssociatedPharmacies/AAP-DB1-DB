USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[spCardCom_20200204]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[spCardCom_20200204] @pmid     INT
                                , @dt_from  DATETIME
                                , @dt_to    DATETIME
                                , @exclude  INT
                                , @drugtype VARCHAR(1)
AS
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

/*
Date: 12/17/2019
Author: RSE
Change: Changed derived table using Reports.dbo.APICatalog from a LEFT OUTER JOIN to an INNER JOIN. LEFT OUTER JOIN will still result in Tier 2 items. Per Wayne's request,
		remove all Tier 2 items. Thus, why an INNER JOIN is required.


*/

SET NOCOUNT ON;

BEGIN

     --CAH
     IF @exclude = 1 --Exclude Variations
	 BEGIN

	SELECT MIN(CUSTOMER_NAME) AS Customer
	, MIN([API ITEM]) AS [API ITEM]
	, MIN(APINDC) AS APINDC
	, MIN([API PRICE]) AS [API PRICE]
	, (MIN([API PRICE]) * SUM(SHIP_QTY)) AS APIExt
	, MIN([Adj Rebate]) AS [Adj Rebate]
	, c.NDC
	, MIN(purchases.dbo.fnParseCHPHDescription(ITEM_DESCR, 1)) AS ItemDesc
	, MIN(f.PS) AS FDB_PKG_SIZE
	, SUM(SHIP_QTY) AS SHIP_QTY
	, Unit_Cost
	, SUM(Ext_Cost) AS Ext_Cost
	, MIN(BRAND) AS DrugType
	FROM purchases.dbo.CHPH_AAP AS c
	LEFT JOIN purchases..v_CARDINALCOMPLETE ON c.ITEM_NO = v_CardinalComplete.CARDINALITEMNUMBER
	LEFT JOIN Medispan..DrugMaster f ON c.NDC = f.NDC
	INNER JOIN(SELECT a.NDC
		FROM Reports.dbo.APICatalog AS a
		WHERE a.Tier1Item = 1 
		) AS t1 ON f.NDC = t1.NDC
	WHERE purchases.dbo.fnParseCHPHDescription(ITEM_DESCR, 1) NOT LIKE 'OLANZAPINE%'
	AND [API ITEM] IS NOT NULL
	AND [API ITEM] <> '0'
	AND ITEM_TYPE = 'RX'
	AND SHIP_QTY > 0
	AND INV_DATE >= @dt_from
	AND INV_DATE < @dt_to
	AND PMID = @pmid
	AND Brand = @drugtype
	GROUP BY PMID
	, c.NDC
	, Unit_Cost
	HAVING(((SUM(Ext_Cost) - (MIN([API PRICE]) * SUM(SHIP_QTY))) / SUM(Ext_Cost)) * 100) < 50
	ORDER BY SHIP_QTY DESC;

     END;

	IF @exclude = 2 --Dont Exclude Variations
	BEGIN

	SELECT MIN(CUSTOMER_NAME) AS Customer
	, MIN([API ITEM]) AS [API ITEM]
	, MIN(APINDC) AS APINDC
	, MIN([API PRICE]) AS [API PRICE]
	, MIN([API PRICE]) * SUM(SHIP_QTY) AS APIExt
	, MIN([Adj Rebate]) AS [Adj Rebate]
	, c.NDC
	, MIN(purchases.dbo.fnParseCHPHDescription(ITEM_DESCR, 1)) AS ItemDesc
	, MIN(f.PS) AS FDB_PKG_SIZE
	, SUM(SHIP_QTY) AS SHIP_QTY
	, Unit_Cost
	, SUM(Ext_Cost) AS Ext_Cost
	, MIN(BRAND) AS DrugType
	FROM purchases.dbo.CHPH_AAP AS c
	LEFT JOIN purchases..v_CARDINALCOMPLETE ON c.ITEM_NO = v_CardinalComplete.CARDINALITEMNUMBER
	LEFT JOIN Medispan..DrugMaster f ON c.NDC = f.NDC
	INNER JOIN(SELECT a.NDC
				FROM Reports.dbo.APICatalog AS a
				WHERE a.Tier1Item IS NOT NULL
			) AS t1 ON f.NDC = t1.NDC
	WHERE purchases.dbo.fnParseCHPHDescription(ITEM_DESCR, 1) NOT LIKE 'OLANZAPINE%'
	AND [API ITEM] IS NOT NULL
	AND [API ITEM] <> '0'
	AND ITEM_TYPE = 'RX'
	AND SHIP_QTY > 0
	AND INV_DATE >= @dt_from
	AND INV_DATE < @dt_to
	AND PMID = @pmid
	AND Brand = @drugtype
	--AND (((SUM(Ext_Cost)- (MIN([API PRICE]) * SUM(SHIP_QTY)))/SUM(Ext_Cost)) * 100) < 50
	GROUP BY PMID
	, c.NDC
	, Unit_Cost
	ORDER BY SHIP_QTY DESC;

    END

END


GO
