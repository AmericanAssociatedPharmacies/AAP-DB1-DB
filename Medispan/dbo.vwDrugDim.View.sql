USE [Medispan]
GO
/****** Object:  View [dbo].[vwDrugDim]    Script Date: 12/22/2020 9:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwDrugDim]

AS

SELECT ROW_NUMBER() OVER(ORDER BY(SELECT NULL)) AS DrugKey
, 20170623 AS EffectiveDateKey
, NDC
, GPI
, DrugName
, MFG AS Manufacturer
, DrugType
, Unit AS UnitofMeasure
, Form
, PS AS PackageSize
, CASE 
	WHEN RxOTC = 'RX' THEN 1
	ELSE 0
	END AS IsRX
, CASE 
	WHEN RxOTC = 'OTC' THEN 1
	ELSE 0
	END AS IsOTC
, Strength
, Strength_Unit_Measure AS StrengthUnitMeasure
, DEA AS ControlledDrugClass
, WACPkg AS WACPackagePrice
, WAC AS WACPerDose
, AWPPkg AS AWPPackagePrice
, AWP AS AWPPerDose 
, CASE 
	WHEN Unit_Dose_Unit_of_Use_Package = 'U' THEN 1
	ELSE 0
	END AS IsUnitDose
FROM [dbo].[DrugMaster]


GO
