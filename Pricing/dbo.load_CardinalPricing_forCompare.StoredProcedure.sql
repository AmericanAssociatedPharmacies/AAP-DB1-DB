USE [Pricing]
GO
/****** Object:  StoredProcedure [dbo].[load_CardinalPricing_forCompare]    Script Date: 12/22/2020 4:51:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<LeeAnn Carrell>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[load_CardinalPricing_forCompare]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--Default Table
	INSERT INTO Pricing..CardinalPricing_forCompare
	SELECT sc.CatalogDate as [Date]
		, CASE
			WHEN sc.CONTRACT_CODE = 'A' THEN 'Top'
			WHEN sc.CONTRACT_CODE = 'B' THEN 'Source'
			WHEN sc.CONTRACT_CODE = 'C' THEN 'Ten Source'
			WHEN sc.CONTRACT_CODE = 'D' THEN 'Backup'
			ELSE NULL END AS [Type]
		, CAST(sc.VIN as float) as [CIN]
		, sc.[DESCRIPTION]
		, sc.[SIZE]
		, sc.INV as [AAP Price]
		, sc.MANUFACTURER as [Supplier]
		, NULL as [Brand Name]
		, sc.FORM as [Form]
		, sc.NDC as [NDC/UPC]
		, IIF(sc.GPI = '', g.GPI, sc.GPI) as [GPI_ID]
		, sc.AWP
		, NULL as [Select]
		, NULL as [Quantity]
		, NULL as [Comp Price]
		, NULL as [Invoice#]
		, NULL as [Invoice Date]
		, NULL as [AAP Ext]
		, NULL as [Comp Ext]
		, NULL as [Size diff]
		, NULL as [Comp NDC]
		, NULL as [Notes]
	FROM ODSIntake.Staging.StandeferCatalog AS sc
	INNER JOIN (SELECT DISTINCT NDC, GPI FROM Medispan..DrugMaster) AS g
	ON sc.NDC = g.NDC
	WHERE sc.CONTRACT_CODE in ('A', 'B', 'C', 'D') 
		AND DATENAME(dw, sc.CatalogDate) = 'Saturday'

	--Stephanie's Table
	INSERT INTO Pricing..CardinalPricing_forCompare_Stephanie
	SELECT sc.CatalogDate as [Date]
		, CASE
			WHEN sc.CONTRACT_CODE = 'A' THEN 'Top'
			WHEN sc.CONTRACT_CODE = 'B' THEN 'Source'
			WHEN sc.CONTRACT_CODE = 'C' THEN 'Ten Source'
			WHEN sc.CONTRACT_CODE = 'D' THEN 'Backup'
			ELSE NULL END AS [Type]
		, CAST(sc.VIN as float) as [CIN]
		, sc.[DESCRIPTION]
		, sc.[SIZE]
		, sc.INV as [AAP Price]
		, sc.MANUFACTURER as [Supplier]
		, NULL as [Brand Name]
		, sc.FORM as [Form]
		, sc.NDC as [NDC/UPC]
		, IIF(sc.GPI = '', g.GPI, sc.GPI) as [GPI_ID]
		, sc.AWP
		, NULL as [Select]
		, NULL as [Quantity]
		, NULL as [Comp Price]
		, NULL as [Invoice#]
		, NULL as [Invoice Date]
		, NULL as [AAP Ext]
		, NULL as [Comp Ext]
		, NULL as [Size diff]
		, NULL as [Comp NDC]
		, NULL as [Notes]
	FROM ODSIntake.Staging.StandeferCatalog AS sc
	INNER JOIN (SELECT DISTINCT NDC, GPI FROM Medispan..DrugMaster) AS g
	ON sc.NDC = g.NDC
	WHERE sc.CONTRACT_CODE in ('A', 'B', 'C', 'D') 
		AND DATENAME(dw, sc.CatalogDate) = 'Saturday'

END


GO
