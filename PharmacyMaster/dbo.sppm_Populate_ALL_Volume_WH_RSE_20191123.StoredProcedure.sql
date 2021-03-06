USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_Populate_ALL_Volume_WH_RSE_20191123]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/08/2010>
-- Description:	 Populate ALL_VOlume table with API WH Sales 
-- =============================================
CREATE PROCEDURE [dbo].[sppm_Populate_ALL_Volume_WH_RSE_20191123]
	@in_month varchar(2)
	, @in_year varchar(4) 
AS

SET NOCOUNT ON;

BEGIN
 
DECLARE @Startdate DATETIME
, @EndDate DATETIME

SET @Startdate = @in_month + '/01/' + @in_year;
SET @EndDate = EOMONTH(@StartDate)

/**************************************************************************************************************************************************

							Load work table for API data

****************************************************************************************************************************************************/


	TRUNCATE TABLE Reports.Staging.All_Volume_API;

	--Load work table
	MERGE Reports.Staging.All_Volume_API AS t
	USING(SELECT dt.PMID
			, dt.WHAccountID
			, dt.InvDate
			, dt.Type
			, SUM(dt.Qty) AS Qty
			, SUM(dt.ExtSales) AS ExtSales
			FROM(SELECT PMID
				, WHAccountID
				, DATEADD(month, DATEDIFF(month, 0, InvDate), 0) AS InvDate
				, IIF(ExtSales < 0.00 and Qty > 0, (-1 * Qty), Qty) AS Qty -- Need to show negative quantity when a return is present
				, Type
				, ExtSales
				FROM API.dbo.APISalesDetail AS a
				INNER JOIN RXMaster.dbo.PharmacyDim AS pd ON a.WHAccountID = pd.APINumber
															AND a.InvDate BETWEEN ISNULL(pd.[APIEffectiveDate], '19000101') AND ISNULL(pd.APIQuitDate, '29991231') -- This gets Change of Ownership to map PMID's correctly
				WHERE a.Type IN('Generic','Brand','OTC')
				AND a.InvDate BETWEEN @StartDate AND @EndDate
				) AS dt
			GROUP BY dt.PMID
			, dt.WHAccountID
			, dt.InvDate
			, dt.Type
			) AS s (PMID,WHAccountID,InvDate,Type,Qty,ExtSales) ON t.PMID = s.PMID 
																AND t.Date = s.InvDate
																AND t.Type = s.Type

	WHEN MATCHED THEN
	UPDATE 
	SET Type = s.Type
	, Qty = s.Qty
	, ExtSales = s.ExtSales

	WHEN NOT MATCHED THEN
	INSERT(PMID, APIAccountNo, Date, Type, Qty, ExtSales)
	VALUES(s.PMID, s.WHAccountID, s.InvDate, s.Type, s.Qty, s.ExtSales)
	;

	--Load Generics
	MERGE [dbo].[ALL_Volume_RSE_20191122] AS t
	USING(SELECT PMID
			, Date
			, [PharmacyName]
			, [APIAccountNo]
			, DEA
			, [Qty] AS [WHAPIGenericUnits]
			, [ExtSales] AS [WHAPIGeneric]			
			FROM Reports.Staging.All_Volume_API
			WHERE Date = @StartDate
			AND Type = 'Generic'	
			) AS s (PMID, Date, PharmacyName, APIAccountNo, DEA, [WHAPIGenericUnits], [WHAPIGeneric]) ON t.PMID = s.PMID
																							AND s.Date = t.Date

	WHEN MATCHED THEN
	UPDATE SET [WHAPIGenericUnits] = s.[WHAPIGenericUnits]
	, [WHAPIGeneric] = s.[WHAPIGeneric]
	

	WHEN NOT MATCHED THEN
	INSERT(PMID, Date, AccountName, APIAccountNo, DEA, [WHAPIGenericUnits], [WHAPIGeneric])
	VALUES(s.PMID, s.Date, s.PharmacyName, s.APIAccountNo, s.DEA, s.[WHAPIGenericUnits], s.[WHAPIGeneric])
	;

	--Load Brands
	MERGE [dbo].[ALL_Volume_RSE_20191122] AS t
	USING(SELECT PMID
			, Date
			, [PharmacyName]
			, [APIAccountNo]
			, DEA
			, [Qty] AS [WHAPIBrandUnits]
			, [ExtSales] AS [WHAPIBrand]		
			FROM Reports.Staging.All_Volume_API
			WHERE Date = @StartDate
			AND Type = 'Brand'	
			) AS s (PMID, Date, PharmacyName, APIAccountNo, DEA, [WHAPIBrandUnits], [WHAPIBrand]) ON t.PMID = s.PMID
																							AND s.Date = t.Date

	WHEN MATCHED THEN
	UPDATE SET 
	[WHAPIBrandUnits] = s.[WHAPIBrandUnits]
	, [WHAPIBrand] = s.[WHAPIBrand]
	

	WHEN NOT MATCHED THEN
	INSERT(PMID, Date, AccountName, APIAccountNo, DEA, [WHAPIBrandUnits], [WHAPIBrand])
	VALUES(s.PMID, s.Date, s.PharmacyName, s.APIAccountNo, s.DEA, s.[WHAPIBrandUnits], s.[WHAPIBrand])
	;

	--Load OTC
	MERGE [dbo].[ALL_Volume_RSE_20191122] AS t
	USING(SELECT PMID
			, Date
			, [PharmacyName]
			, [APIAccountNo]
			, DEA
			, [Qty] AS [WHAPIOTCUnits]
			, [ExtSales] AS [WHAPIOTC]
			FROM Reports.Staging.All_Volume_API
			WHERE Date = @StartDate
			AND Type = 'OTC'	
			) AS s (PMID, Date, PharmacyName, APIAccountNo, DEA, [WHAPIOTCUnits], [WHAPIOTC]) ON t.PMID = s.PMID
																							AND s.Date = t.Date

	WHEN MATCHED THEN
	UPDATE SET 
	[WHAPIOTCUnits] = s.[WHAPIOTCUnits]
	, [WHAPIOTC] = s.[WHAPIOTC]
	

	WHEN NOT MATCHED THEN
	INSERT(PMID, Date, AccountName, APIAccountNo, DEA, [WHAPIOTCUnits], [WHAPIOTC])
	VALUES(s.PMID, s.Date, s.PharmacyName, s.APIAccountNo, s.DEA, s.[WHAPIOTCUnits], s.[WHAPIOTC])
	;

	UPDATE x
	SET WHAPITotal = ISNULL(WHAPIBrand, 0.00) + ISNULL(WHAPIGeneric,0.00) + ISNULL(WHAPIOTC,0.00)
	FROM [dbo].[ALL_Volume_RSE_20191122] AS x
	WHERE Date = @StartDate
 
	--Update demographics
	UPDATE x
	SET AccountName = pd.PharmacyName
	, CHAccountNo = TRY_CONVERT(FLOAT,pd.CAHPrimaryAccount)
	, AAPAccountNo = pd.AAPNumber
	, DEA = pd.DEA_HIN
	, APIAccountNo = pd.APINumber
	FROM [dbo].[ALL_Volume_RSE_20191122] AS x
	INNER JOIN RXMaster.dbo.PharmacyDim AS pd ON x.PMID = pd.PMID
	WHERE x.Date = @StartDate


	

 
END













GO
