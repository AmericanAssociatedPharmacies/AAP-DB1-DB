USE [ODSIntake]
GO
/****** Object:  StoredProcedure [dbo].[usp_InvoiceComparison]    Script Date: 12/22/2020 4:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_InvoiceComparison]

	@Date DATETIME = NULL

AS

SET NOCOUNT ON;

BEGIN

SELECT dt.Date
, dt.[Type]
, dt.[CIN]
, dt.[DESCRIPTION]
, dt.[SIZE]
, dt.[AAPPrice]
, dt.[Supplier]
, dt.[BrandName]
, dt.[Form]
, dt.[NDC_UPC]
, dt.[GPI_ID]
, dt.[AWP]
, dt.[Select]
, dt.[Quantity]
, dt.[Comp Price]
, dt.[Invoice#]
, dt.[Invoicedate]
, dt.[AAPExt]
, dt.Comp_Ext
, dt.Size_Diff
, dt.Comp_NDC
, dt.Notes
FROM(SELECT CONVERT(VARCHAR(500), a.[Date]) AS [Date]
      ,CONVERT(VARCHAR(500), [Type]) AS [Type]
      ,CONVERT(VARCHAR(500), [CIN]) AS [CIN]
      ,CONVERT(VARCHAR(500), [DESCRIPTION]) AS [DESCRIPTION]
      ,CONVERT(VARCHAR(500), [SIZE]) AS [SIZE]
      ,CONVERT(VARCHAR(500), [AAP Price]) AS [AAPPrice]
      ,CONVERT(VARCHAR(500), [Supplier]) AS [Supplier]
      ,CONVERT(VARCHAR(500), [Brand Name]) AS [BrandName]
      ,CONVERT(VARCHAR(500), [Form]) AS [Form]
      ,CONVERT(VARCHAR(500), [NDC/UPC]) AS [NDC_UPC]
      ,CONVERT(VARCHAR(500), [GPI_ID]) AS [GPI_ID]
      ,CONVERT(VARCHAR(500), [AWP]) AS [AWP]
      ,CONVERT(VARCHAR(500), [Select]) AS [Select]
      ,CONVERT(VARCHAR(500), [Quantity]) AS [Quantity]
      ,CONVERT(VARCHAR(500), [Comp Price]) AS [Comp Price]
      ,CONVERT(VARCHAR(500), [Invoice#]) AS [Invoice#]
      ,CONVERT(VARCHAR(500), [Invoice date]) AS [Invoicedate]
      ,CONVERT(VARCHAR(500), [AAP Ext]) AS [AAPExt]
      ,CONVERT(VARCHAR(500), [Comp Ext]) AS Comp_Ext
      ,CONVERT(VARCHAR(500), [Size diff]) AS Size_Diff
      ,CONVERT(VARCHAR(500), [Comp NDC]) AS Comp_NDC
      ,CONVERT(VARCHAR(500), [Notes]) AS Notes
	  FROM [INVOICECOMPARISON]...[dbo_CardinalPricing_forCompare1] AS a
	  CROSS JOIN(SELECT MIN([Date]) AS [Date]
					FROM [INVOICECOMPARISON]...[dbo_CardinalPricing_forCompare1]  
						) AS cj
	  WHERE a.[Date] >= ISNULL(@Date, cj.[Date])
  ) AS dt

END



GO
