USE [API]
GO
/****** Object:  StoredProcedure [dbo].[usp_API_MO_WHSales_Load]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_API_MO_WHSales_Load]

	@Date VARCHAR(10)

AS

SET NOCOUNT ON;

BEGIN


	INSERT INTO [dbo].[API_MO_WHSales](Date, WHAccountID, Brand, Generics, OTC, TotalSales)
	SELECT TRY_CONVERT(DATETIME,@Date) AS Date
	, CASE
		   WHEN [VAICustNum] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
		   ELSE LTRIM(RTRIM([VAICustNum]))
		   END AS WHAccountID
	, TRY_CONVERT(NUMERIC(18,2),[BRx$]) AS Brands
	, TRY_CONVERT(NUMERIC(18,2),[GRx$]) AS Generics
	, TRY_CONVERT(NUMERIC(18,2),[OTC$]) AS OTC
	, TRY_CONVERT(NUMERIC(18,2),[Total$]) AS [Total Monthly Sales]
	--, CONVERT(NUMERIC(18,2),[T1$]) AS G1235 -- Not needed right now. 09//03/2020 RSE
	--, CONVERT(NUMERIC(18,2),[T2$]) AS G6
	FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0'
					, 'Excel 12.0 Xml;Database=C:\data\APIMnthlyWHSales\MonthlyWHSales.xlsx;HDR=YES'
					,'select * FROM [Load$]'
					)

END
GO
