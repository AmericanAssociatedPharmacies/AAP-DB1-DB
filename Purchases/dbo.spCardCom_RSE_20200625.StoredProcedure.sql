USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[spCardCom_RSE_20200625]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[spCardCom_RSE_20200625] @pmid     INT
                                , @dt_from  DATETIME
                                , @dt_to    DATETIME
                                , @exclude  INT
                                , @drugtype VARCHAR(1)
								, @IsC2Exclusion BIT --@IsC2Exclusion = 1 is a C2 exclusion, 0 means show me everything included C2's

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

	DECLARE @StartDateKey INT
	, @EndDateKey INT
	, @StartVariation INT
	, @EndVariation INT


	SET @StartDateKey = CAST(CONVERT(VARCHAR(20),@dt_from,112) as INT)
	SET @EndDateKey = CAST(CONVERT(VARCHAR(20),@dt_to,112) as INT)

	IF @exclude = 1
	BEGIN 

		SELECT @StartVariation = -100
		SELECT @EndVariation = 49

	END

	ELSE IF @exclude = 2
	BEGIN

		SELECT @StartVariation = -100
		SELECT @EndVariation = 100

	END

	SELECT dt.Customer
	, dt.[API ITEM]
	, dt.APINDC
	, dt.[API PRICE]
	, dt.APIExt
	, dt.[Adj Rebate]
	, dt.NDC
	, dt.ItemDesc
	, dt.FDB_PKG_SIZE
	, dt.SHIP_QTY
	, dt.Unit_Cost
	, dt.Ext_Cost
	, dt.DrugType
	FROM(SELECT c.CUSTOMER_NAME AS Customer
		, ISNULL(g.APIItemNum, b.APIItemNum) AS [API ITEM]
		, v.APINDC
		, c.NDC		
		, c.Unit_Cost
		, c.BRAND AS DrugType
		, MIN(v.[API PRICE]) AS [API PRICE]
		, (MIN(v.[API PRICE]) * SUM(c.SHIP_QTY)) AS APIExt
		, MIN(v.[Adj Rebate]) AS [Adj Rebate]		
		, c.ITEM_DESCR AS ItemDesc
		, MIN(dm.PS) AS FDB_PKG_SIZE
		, SUM(c.SHIP_QTY) AS SHIP_QTY		
		, SUM(c.Ext_Cost) AS Ext_Cost		
		, CONVERT(INT,(((SUM(c.Ext_Cost) - (MIN(v.[API PRICE]) * SUM(c.SHIP_QTY))) / SUM(c.Ext_Cost)) * 100)) AS C1
		FROM purchases.dbo.CHPH_AAP AS c
		INNER JOIN purchases.dbo.v_CARDINALCOMPLETE AS v ON c.ITEM_NO = v.CARDINALITEMNUMBER
		LEFT OUTER JOIN Reports.dbo.APICatalog AS g ON v.[API ITEM] = g.APIItemNum
																AND g.Tier1Item = 1
																AND g.Tier2Item = 0
		LEFT OUTER JOIN Reports.dbo.APICatalog AS b ON v.[API ITEM] = b.APIItemNum
																AND b.Tier1Item = 0 AND b.Tier2Item = 0
		INNER JOIN(SELECT ISNULL(l1.NDC,l2.NDC) AS NDC
					, ISNULL(l1.PS,l2.PS) AS PS
					FROM Medispan.dbo.DrugMaster AS d
					LEFT OUTER JOIN Medispan.dbo.DrugMaster AS l1 ON d.NDC = l1.NDC
																		AND @IsC2Exclusion = 1
																		AND l1.DEA_Class_Code <> 'C-II'																																			
					LEFT OUTER JOIN Medispan.dbo.DrugMaster AS l2 ON d.NDC = l2.NDC
																		AND @IsC2Exclusion = 0																																		
															
					WHERE (l1.NDC IS NOT NULL
							OR l2.NDC IS NOT NULL
							)
					AND (l1.PS IS NOT NULL
							OR l2.PS IS NOT NULL					
							)						
					AND purchases.dbo.fnParseCHPHDescription(d.GPIDesc, 1) NOT LIKE 'OLANZAPINE%'						
					AND d.RowID = (d.RowID + 0)
					) AS dm ON c.NDC = dm.NDC	
		WHERE (g.APIItemNum IS NOT NULL
				OR b.APIItemNum IS NOT NULL
				)		
		AND c.ITEM_TYPE = 'RX'
		AND c.SHIP_QTY > 0
		AND c.DateKey BETWEEN @StartDateKey AND @EndDateKey
		AND c.PMID = @pmid
		AND c.Brand = @drugtype
		GROUP BY c.CUSTOMER_NAME
		, c.NDC
		, v.[API ITEM]
		, g.APIItemNum
		, b.APIItemNum
		, v.APINDC
		, c.PMID
		, c.Unit_Cost
		, c.BRAND
		, c.ITEM_DESCR
		) AS dt
	WHERE dt.C1 BETWEEN @StartVariation AND @EndVariation
	ORDER BY dt.NDC ASC

END

 --   --CAH
 --    IF @exclude = 1 --Exclude Variations
	-- BEGIN	
	
	--SELECT dt.Customer
	--, dt.[API ITEM]
	--, dt.APINDC
	--, dt.[API PRICE]
	--, dt.APIExt
	--, dt.[Adj Rebate]
	--, dt.NDC
	--, dt.ItemDesc
	--, dt.FDB_PKG_SIZE
	--, dt.SHIP_QTY
	--, dt.Unit_Cost
	--, dt.Ext_Cost
	--, dt.DrugType
	--, dt.C1
	--FROM(SELECT c.CUSTOMER_NAME AS Customer
	--	, ISNULL(g.APIItemNum, b.APIItemNum) AS [API ITEM]
	--	, v.APINDC
	--	, c.NDC		
	--	, c.Unit_Cost
	--	, c.BRAND AS DrugType
	--	, MIN(v.[API PRICE]) AS [API PRICE]
	--	, (MIN(v.[API PRICE]) * SUM(c.SHIP_QTY)) AS APIExt
	--	, MIN(v.[Adj Rebate]) AS [Adj Rebate]		
	--	, MIN(purchases.dbo.fnParseCHPHDescription(c.ITEM_DESCR, 1)) AS ItemDesc
	--	, MIN(dm.PS) AS FDB_PKG_SIZE
	--	, SUM(c.SHIP_QTY) AS SHIP_QTY		
	--	, SUM(c.Ext_Cost) AS Ext_Cost		
	--	, CONVERT(INT,(((SUM(c.Ext_Cost) - (MIN(v.[API PRICE]) * SUM(c.SHIP_QTY))) / SUM(c.Ext_Cost)) * 100)) AS C1
	--	FROM purchases.dbo.CHPH_AAP AS c
	--	INNER JOIN purchases.dbo.v_CARDINALCOMPLETE AS v ON c.ITEM_NO = v.CARDINALITEMNUMBER
	--	LEFT OUTER JOIN Reports.dbo.APICatalog AS g ON v.[API ITEM] = g.APIItemNum
	--															AND g.Tier1Item = 1
	--															AND g.Tier2Item = 0
	--	LEFT OUTER JOIN Reports.dbo.APICatalog AS b ON v.[API ITEM] = b.APIItemNum
	--															AND b.Tier1Item = 0 AND b.Tier2Item = 0
	--	INNER JOIN(SELECT ISNULL(l1.NDC,l2.NDC) AS NDC
	--				, ISNULL(l1.PS,l2.PS) AS PS
	--				FROM Medispan.dbo.DrugMaster AS d
	--				LEFT OUTER JOIN Medispan.dbo.DrugMaster AS l1 ON d.NDC = l1.NDC
	--																	AND @IsC2Exclusion = 1
	--																	AND l1.DEA_Class_Code <> 'C-II'
	--				LEFT OUTER JOIN Medispan.dbo.DrugMaster AS l2 ON d.NDC = l2.NDC
	--																	AND @IsC2Exclusion = 0
															
	--				WHERE (l1.NDC IS NOT NULL
	--						OR l2.NDC IS NOT NULL
	--						)
	--				AND (l1.PS IS NOT NULL
	--						OR l2.PS IS NOT NULL					
	--						)					
	--				) AS dm ON c.NDC = dm.NDC	
	--	WHERE (g.APIItemNum IS NOT NULL
	--			OR b.APIItemNum IS NOT NULL
	--			)
	--	AND purchases.dbo.fnParseCHPHDescription(c.ITEM_DESCR, 1) NOT LIKE 'OLANZAPINE%'
	--	AND [API ITEM] IS NOT NULL
	--	AND [API ITEM] <> '0'
	--	AND c.ITEM_TYPE = 'RX'
	--	AND c.SHIP_QTY > 0
	--	AND c.DateKey BETWEEN @StartDateKey AND @EndDateKey
	--	AND c.PMID = @pmid
	--	AND c.Brand = @drugtype
	--	GROUP BY c.CUSTOMER_NAME
	--	, c.NDC
	--	--, v.[API ITEM]
	--	, g.APIItemNum
	--	, b.APIItemNum
	--	, v.APINDC
	--	, c.PMID
	--	, c.Unit_Cost
	--	, c.BRAND
	--	--HAVING(((SUM(c.Ext_Cost) - (MIN(v.[API PRICE]) * SUM(c.SHIP_QTY))) / SUM(c.Ext_Cost)) * 100) < 50
	--	) AS dt
	--WHERE dt.C1 < 50
	--ORDER BY dt.NDC ASC


 --    END;

	--IF @exclude = 2 --Dont Exclude Variations
	--BEGIN


	--SELECT dt.Customer
	--, dt.[API ITEM]
	--, dt.APINDC
	--, dt.[API PRICE]
	--, dt.APIExt
	--, dt.[Adj Rebate]
	--, dt.NDC
	--, dt.ItemDesc
	--, dt.FDB_PKG_SIZE
	--, dt.SHIP_QTY
	--, dt.Unit_Cost
	--, dt.Ext_Cost
	--, dt.DrugType
	-- FROM(SELECT c.CUSTOMER_NAME AS Customer
	--	, ISNULL(g.APIItemNum, b.APIItemNum) AS [API ITEM]
	--	, v.APINDC
	--	, c.NDC		
	--	, c.Unit_Cost
	--	, c.BRAND AS DrugType
	--	, MIN(v.[API PRICE]) AS [API PRICE]
	--	, (MIN(v.[API PRICE]) * SUM(c.SHIP_QTY)) AS APIExt
	--	, MIN(v.[Adj Rebate]) AS [Adj Rebate]		
	--	, MIN(purchases.dbo.fnParseCHPHDescription(c.ITEM_DESCR, 1)) AS ItemDesc
	--	, MIN(dm.PS) AS FDB_PKG_SIZE
	--	, SUM(c.SHIP_QTY) AS SHIP_QTY		
	--	, SUM(c.Ext_Cost) AS Ext_Cost		
	--	FROM purchases.dbo.CHPH_AAP AS c
	--	INNER JOIN purchases.dbo.v_CARDINALCOMPLETE AS v ON c.ITEM_NO = v.CARDINALITEMNUMBER
	--	LEFT OUTER JOIN Reports.dbo.APICatalog AS g ON v.[API ITEM] = g.APIItemNum
	--															AND g.Tier1Item = 1
	--															AND g.Tier2Item = 0
	--	LEFT OUTER JOIN Reports.dbo.APICatalog AS b ON v.[API ITEM] = b.APIItemNum
	--															AND b.Tier1Item = 0 AND b.Tier2Item = 0
	--	INNER JOIN(SELECT ISNULL(l1.NDC,l2.NDC) AS NDC
	--				, ISNULL(l1.PS,l2.PS) AS PS
	--				FROM Medispan.dbo.DrugMaster AS d
	--				LEFT OUTER JOIN Medispan.dbo.DrugMaster AS l1 ON d.NDC = l1.NDC
	--																	AND @IsC2Exclusion = 1
	--																	AND l1.DEA_Class_Code <> 'C-II'
	--				LEFT OUTER JOIN Medispan.dbo.DrugMaster AS l2 ON d.NDC = l2.NDC
	--																	AND @IsC2Exclusion = 0
															
	--				WHERE (l1.NDC IS NOT NULL
	--						OR l2.NDC IS NOT NULL
	--						)
	--				AND (l1.PS IS NOT NULL
	--						OR l2.PS IS NOT NULL
	--					)					
					
	--				) AS dm ON c.NDC = dm.NDC	
	--	WHERE (g.APIItemNum IS NOT NULL
	--			OR b.APIItemNum IS NOT NULL
	--			)
	--	AND purchases.dbo.fnParseCHPHDescription(c.ITEM_DESCR, 1) NOT LIKE 'OLANZAPINE%'
	--	AND [API ITEM] IS NOT NULL
	--	AND [API ITEM] <> '0'
	--	AND c.ITEM_TYPE = 'RX'
	--	AND c.SHIP_QTY > 0
	--	AND c.DateKey BETWEEN @StartDateKey AND @EndDateKey
	--	AND c.PMID = @pmid
	--	AND c.Brand = @drugtype
	--	GROUP BY c.CUSTOMER_NAME
	--	, c.NDC
	--	--, v.[API ITEM]
	--	, g.APIItemNum
	--	, b.APIItemNum
	--	, v.APINDC
	--	, c.PMID
	--	, c.Unit_Cost
	--	, c.BRAND
	--	) AS dt
	--ORDER BY dt.NDC ASC	
	

 -- END

--END












GO
