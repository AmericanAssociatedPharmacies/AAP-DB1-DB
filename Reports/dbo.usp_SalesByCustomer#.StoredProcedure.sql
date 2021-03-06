USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_SalesByCustomer#]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_SalesByCustomer#]
AS
--*****************************************
--VARIABLE DECLARATION 

--Declare Variables
DECLARE @APISalesDate datetime
	,@CAHSalesDate datetime
	,@APIVolumeDate datetime
	,@CAHVolumeDate datetime
	,@ReportStartDate datetime
	,@CAHAudited varchar(1)
	,@APIAudited varchar(1)

--Set the Date Variables
SELECT @APISalesDate = MAX(InvDate) 
FROM API..APISalesDetail

SELECT @CAHSalesDate = MAX(Inv_Date)
FROM Purchases..CHPH_AAP

SELECT @CAHVolumeDate = MAX(Date)
FROM (SELECT Date, SUM(AAPTotalRX) as AAPTotalRx FROM  PharmacyMaster..ALL_Volume GROUP BY Date) AS av
WHERE av.AAPTotalRx > 0

SELECT @APIVolumeDate = MAX(Date)
FROM (SELECT Date, SUM(WHAPITotal) as WHAPITotal FROM  PharmacyMaster..ALL_Volume GROUP BY Date) AS av
WHERE av.WHAPITotal > 0

--start date is 13 months prior to the last full month of data
SET @ReportStartDate = DATEADD(month, -13, @APIVolumeDate) 

--Set Initial Audited Variables
SET @CAHAudited = 'Y'
SET @APIAudited = 'Y'

--*****************************************
--*****************************************

--DROP OLD DATA ***Request Scott to show me how to do this 
TRUNCATE TABLE reporting..tmp_SalesByCustomer#
--IF EXISTS(SELECT name FROM sys.tables
--			 WHERE name = 'tmp_SalesByCustomer#')
--		 BEGIN
--          DROP TABLE tmp_SalesByCustomer#
--         END


--INSERT API DATA FROM ALL_VOLUME
INSERT INTO reporting..tmp_SalesByCustomer# 
SELECT pm.Territory as TM
	,pm.PMID
	,pm.AAPAccountNo as AAP#
	,pm.AAPParentNo as Parent#
	,pm.APIAccountNo as API#
	,pm.AAPEffectiveDate
	,pm.DateOpened as APIEffectiveDate
	,pm.AAPQuitDate
	,pm.APIStatus
	,pm.AccountDescription
	,pm.Affiliate
	,pm.AccountName as [AccountDBAName]
	,pm.City
	,pm.State as ST
	,av.Date
	,SUM(av.WHAPIGenericUnits) as APIGenericUnits
	,SUM(av.WHAPIGeneric) as APIGenericSales
	,SUM(av.WHAPIBrandUnits) as APIBrandUnits
	,SUM(av.WHAPIBrand) as APIBrandSales
	,0 as DaysOrderedAPI
	,0 as CAHGenericUnits
	,SUM(av.AAPGENTotal) as CAHGenericSales
	,0 as CAHBrandUnits
	,SUM(av.AAPBrand) as CAHBrandSales
	,IIF(av.Date < DATEADD(month, 1, @APIVolumeDate), 'Y', 'N') as APIAudited
	,IIF(av.Date < DATEADD(month, 1, @CAHVolumeDate), 'Y', 'N') as APIAudited
FROM PharmacyMaster.dbo.ALL_Volume AS av
INNER JOIN PharmacyMaster..v_PM_AllWithAffiliates pm ON av.PMID = pm.PMID
WHERE Date >= @ReportStartDate
GROUP BY pm.Territory ,pm.PMID, pm.AAPAccountNo, pm.AAPParentNo, pm.APIAccountNo, pm.AAPEffectiveDate
	,pm.DateOpened, pm.AAPQuitDate, pm.APIStatus, pm.AccountDescription, pm.Affiliate
	,pm.AccountName, pm.City, pm.[State], av.[Date]
ORDER BY PMID, Date ASC

--ADD IN CAH UNITS FROM PURCHASES..CHPH_AAP
UPDATE t
SET t.CAHBrandUnits = ISNULL(CAHBrandUnits.BrandUnits, 0)
	,t.CAHGenericUnits = ISNULL(CAHGenericUnits.GenericUnits,0)
FROM reporting..tmp_SalesByCustomer# AS t
LEFT JOIN (SELECT c.PMID	
				,DATEADD(mm, DATEDIFF(mm, 0, c.Inv_Date), 0) as InvMonth
				,SUM(c.SHIP_QTY) as BrandUnits
			FROM Purchases..CHPH_AAP AS c
			WHERE c.Inv_Date >= @ReportStartDate AND c.Inv_Date < DATEADD(month, 1, @CAHVolumeDate)
				AND c.PMID IS NOT NULL
				AND c.BRAND = 'B' 
				AND c.ContractNo NOT IN (25676, 25677, 58705, 29731, 26776, 66685, 66684, 73246, 73245)
			GROUP BY c.PMID, DATEADD(mm, DATEDIFF(mm, 0, c.Inv_Date), 0)
			) AS CAHBrandUnits
ON t.PMID = CAHBrandUnits.PMID AND t.Date = CAHBrandUnits.InvMonth
LEFT JOIN (SELECT c.PMID	
				,DATEADD(mm, DATEDIFF(mm, 0, c.Inv_Date), 0) as InvMonth
				,SUM(c.SHIP_QTY) as GenericUnits
			FROM Purchases..CHPH_AAP AS c
			WHERE c.Inv_Date >= @ReportStartDate AND c.Inv_Date < DATEADD(month, 1, @CAHVolumeDate)
				AND c.PMID IS NOT NULL
				AND ContractNo in (25676, 25677, 58705, 29731, 26776, 66685, 66684, 73246, 73245)
			GROUP BY c.PMID, DATEADD(mm, DATEDIFF(mm, 0, c.Inv_Date), 0)
			) AS CAHGenericUnits
ON t.PMID = CAHGenericUnits.PMID AND t.Date = CAHGenericUnits.InvMonth


--ADD IN DAYSORDEREDAPI
SELECT WHAccountID
	,DATEADD(mm, DATEDIFF(mm, 0, InvDate), 0) as Inv_Month
	,COUNT(distinct day(InvDate)) as DaysOrderedAPI
FROM API..APISalesDetail AS api
WHERE api.InvDate >= @ReportStartDate AND api.InvDate < DATEADD(month, 1, @APIVolumeDate)
GROUP BY WHAccountID, DATEADD(mm, DATEDIFF(mm, 0, InvDate), 0)
GO
