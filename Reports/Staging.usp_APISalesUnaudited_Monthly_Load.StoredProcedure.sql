USE [Reports]
GO
/****** Object:  StoredProcedure [Staging].[usp_APISalesUnaudited_Monthly_Load]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Staging].[usp_APISalesUnaudited_Monthly_Load]

AS

SET NOCOUNT ON;

BEGIN
BEGIN TRY

	DECLARE @StartDate DATETIME
	, @EndDate DATETIME

	SET @StartDate = DATEADD(yy,-1,DATEADD(yy,DATEDIFF(yy,0,GETDATE()),0)) -- First day of previous year
	SET @EndDate = DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) + 1, -1) -- Last day of current year

	BEGIN TRAN
		
	   TRUNCATE TABLE Staging.APISalesUnaudited_Monthly;
 
       INSERT INTO Staging.APISalesUnaudited_Monthly(APIAccountNo, PMID, Date)
       SELECT dt.WHAccountID
       , dt.PMID
       , dt.Date
       FROM(SELECT dt.WHAccountID
					, dt.PMID
            --, ISNULL(v1.PMID, v2.PMID) AS PMID
            , DATEADD(month, DATEDIFF(month, 0, dt.StartInvDate), 0) AS Date
            FROM(SELECT a.PMID
					, a.WHAccountID
                   , a.InvDate AS StartInvDate
                   , DATEADD(DAY, 1, a.InvDate) AS EndInvDate
                   , a.ExtSales
                   FROM  API.dbo.APISalesDetail AS a
				   --INNER JOIN RXMaster.dbo.PharmacyDim AS pd ON a.WHAccountID = pd.APINumber
							--								AND a.InvDate BETWEEN ISNULL(pd.[APIEffectiveDate], '19000101') AND ISNULL(pd.APIQuitDate, '29991231')
                   WHERE a.InvDate >= @StartDate
                   AND a.InvDate < @EndDate
				   --AND a.ItemDescription NOT LIKE '%Credit%'
				   --AND (a.TransTypeCode <> 'C' OR a.TransTypeCode IS NULL)
				   AND a.PMID IS NOT NULL
                   ) AS dt
            
            ) AS dt
       GROUP BY dt.WHAccountID
       , dt.PMID
       , dt.Date
 
 
       TRUNCATE TABLE [Staging].[APISalesUnaudited_Monthly_Work];
 
       INSERT INTO [Staging].[APISalesUnaudited_Monthly_Work](WHAccountID, PMID, InvDate, ExtSales, Type, ItemGroup)
       SELECT dt.WHAccountID
	   , dt.PMID
       , dt.StartInvDate AS InvDate
       , dt.ExtSales
       , dt.Type
	   , dt.ItemGrp
       FROM(SELECT a.PMID
				, a.WHAccountID
              , a.InvDate AS StartInvDate
              , DATEADD(DAY, 1, a.InvDate) AS EndInvDate
              , a.ExtSales
              , a.Type
			  , a.ItemGrp
              FROM  API.dbo.APISalesDetail AS a
			  --INNER JOIN RXMaster.dbo.PharmacyDim AS pd ON a.WHAccountID = pd.APINumber
					--										AND a.InvDate BETWEEN ISNULL(pd.[APIEffectiveDate], '19000101') AND ISNULL(pd.APIQuitDate, '29991231')
              WHERE a.InvDate >= @StartDate
              AND a.InvDate < @EndDate
			  --AND a.ItemDescription NOT LIKE '%Credit%'
			  --AND (a.TransTypeCode <> 'C' OR a.TransTypeCode IS NULL)			  
			  AND a.PMID IS NOT NULL
             ) AS dt
      
	

	UPDATE x
	SET GenericSales = g.GenericSales
	FROM Staging.APISalesUnaudited_Monthly AS x
	INNER JOIN (SELECT [WHAccountID]
				, [PMID]
				, DATEADD(month, DATEDIFF(month, 0, InvDate), 0) AS Date
				, SUM(ExtSales) AS GenericSales
				FROM [Staging].[APISalesUnaudited_Monthly_Work]
				WHERE Type = 'Generic'
				AND InvDate >= @StartDate
				AND InvDate < @EndDate
				GROUP BY WHAccountID, PMID ,DATEADD(month, DATEDIFF(month, 0, InvDate), 0)
						) AS g ON x.Date = g.Date
											AND x.PMID = g.PMID
											--AND x.APIAccountNo = g.WHAccountID
											
	--Generic Sales Tier 1
	UPDATE x
	SET GenericSalesTier1 = g.GenericSalesTier1
	FROM Staging.APISalesUnaudited_Monthly AS x
	INNER JOIN (SELECT [WHAccountID]
				, [PMID]
				, DATEADD(month, DATEDIFF(month, 0, InvDate), 0) AS Date
				, SUM(ExtSales) AS GenericSalesTier1
				FROM [Staging].[APISalesUnaudited_Monthly_Work]
				WHERE Type = 'Generic'
				AND ItemGroup <> 'G06'
				AND InvDate >= @StartDate
				AND InvDate < @EndDate
				GROUP BY WHAccountID, PMID ,DATEADD(month, DATEDIFF(month, 0, InvDate), 0)
						) AS g ON x.Date = g.Date
											AND x.PMID = g.PMID
											--AND x.APIAccountNo = g.WHAccountID

	--Generic Sales Tier 2
	UPDATE x
	SET GenericSalesTier2 = g.GenericSalesTier2
	FROM Staging.APISalesUnaudited_Monthly AS x
	INNER JOIN (SELECT [WHAccountID]
				, [PMID]
				, DATEADD(month, DATEDIFF(month, 0, InvDate), 0) AS Date
				, SUM(ExtSales) AS GenericSalesTier2
				FROM [Staging].[APISalesUnaudited_Monthly_Work]
				WHERE Type = 'Generic'
				AND ItemGroup = 'G06'
				AND InvDate >= @StartDate
				AND InvDate < @EndDate
				GROUP BY WHAccountID, PMID ,DATEADD(month, DATEDIFF(month, 0, InvDate), 0)
						) AS g ON x.Date = g.Date
											AND x.PMID = g.PMID
											--AND x.APIAccountNo = g.WHAccountID

	UPDATE x
	SET BrandSales = b.BrandSales
	FROM Staging.APISalesUnaudited_Monthly AS x
	INNER JOIN (SELECT [WHAccountID]
				, [PMID]
				, DATEADD(month, DATEDIFF(month, 0, InvDate), 0) AS Date
				, SUM(ExtSales) AS BrandSales
				FROM [Staging].[APISalesUnaudited_Monthly_Work]
				WHERE Type = 'Brand'
				AND InvDate >= @StartDate
				AND InvDate < @EndDate
				GROUP BY WHAccountID, PMID ,DATEADD(month, DATEDIFF(month, 0, InvDate), 0)
						) AS b ON x.Date = b.Date
								AND b.PMID = x.PMID
								--AND x.APIAccountNo = b.WHAccountID
								


	UPDATE x
	SET OTCSales = o.OTCSales
	FROM Staging.APISalesUnaudited_Monthly AS x
	INNER JOIN (SELECT [WHAccountID]
				, [PMID]
				, DATEADD(month, DATEDIFF(month, 0, InvDate), 0) AS Date
				, SUM(ExtSales) AS OTCSales
				FROM [Staging].[APISalesUnaudited_Monthly_Work]
				WHERE Type = 'OTC'
				AND InvDate >= @StartDate
				AND InvDate < @EndDate
				GROUP BY WHAccountID, PMID ,DATEADD(month, DATEDIFF(month, 0, InvDate), 0)
						) AS o ON  x.Date = o.Date
								AND o.PMID = x.PMID
								--AND x.APIAccountNo = o.WHAccountID
								


	UPDATE STATISTICS Staging.APISalesUnaudited_Monthly;

	COMMIT TRAN

END TRY
BEGIN CATCH

		ROLLBACK TRAN

		DECLARE @ErrorMessage NVARCHAR(4000)
        , @ErrorNumber INT
        , @ErrorSeverity INT
        , @ErrorState INT
        , @ErrorLine INT
        , @ErrorProcedure NVARCHAR(200)

		SELECT 
        @ErrorNumber = ERROR_NUMBER()
        , @ErrorSeverity = ERROR_SEVERITY()
        , @ErrorState = ERROR_STATE()
        , @ErrorLine = ERROR_LINE()
        , @ErrorProcedure = ISNULL(ERROR_PROCEDURE(), '-')
		, @ErrorMessage = ERROR_MESSAGE();

		RAISERROR 
        (@ErrorMessage 
        , @ErrorSeverity, 1               
        , @ErrorNumber    -- parameter: original error number.
        , @ErrorSeverity  -- parameter: original error severity.
        , @ErrorState     -- parameter: original error state.
        , @ErrorProcedure -- parameter: original error procedure name.
        , @ErrorLine       -- parameter: original error line number.
        )

		INSERT INTO PharmacyMaster.dbo.ErrorLog(ErrorNumber, ErrorLine, ErrorState, ErrorSeverity, ErrorProcedure, ErrorMessage)
		VALUES(@ErrorNumber, @ErrorLine, @ErrorState, @ErrorSeverity, @ErrorProcedure, @ErrorMessage)



END CATCH

END










GO
