USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[usp_CH_ALLPVA_SALES_Load_old_20190621]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[usp_CH_ALLPVA_SALES_Load_old_20190621]

AS

SET NOCOUNT ON;

BEGIN
BEGIN TRY

		UPDATE x
		SET AccountName = c.AccountName
       , APIAccountNo = c.APIAccountNo
       , AAPAccountNo = c.AAPAccountNo
       , AAPCOGAppliedSales = c.AAPCOGAppliedSales
       , AAPNetSales = c.AAPNetSales
       , AAPBrand = c.AAPBrand
       , AAPGENTotal = c.AAPGENTotal
       , AAPGENTotalSrc = c.AAPGENTotalSrc
       , AAPOTC = c.AAPOTC
       , AAPOther = c.AAPOther
       , CombNetSales = c.CombNetSales
       , CombBrands = c.CombBrands
       , AAPGENExcl = c.AAPGENExcl
       , CombOTC = c.CombOTC
       , CombGENTotal = c.CombGENTotal
       , CombGENTotalSrc = c.CombGENTotalSrc
	   , AAPTotalRX = c.AAPTotalRX
	   , AAPExcludedFromTotalRX = c.AAPExcludedFromTotalRX
	   , AAPNonRXOTCandHH = c.AAPNonRXOTCandHH
	   , AAPSourceCompliance = c.AAPSourceCompliance
	   , COGEligibleSales = c.COGEligibleSales
	   FROM [dbo].[CH_ALLPVA_SALES] AS x
	   INNER JOIN dbo.vw_CH_ALLPVA_SALES AS c ON x.Date = c.Date			
											AND x.PMID = c.PMID


		INSERT INTO [dbo].[CH_ALLPVA_SALES](Date, PMID, AccountName, APIAccountNo, AAPAccountNo, AAPCOGAppliedSales, AAPNetSales, AAPBrand, AAPGENTotal, AAPGENTotalSrc, AAPGENExcl, AAPOTC, AAPOther, CombNetSales
		, CombBrands, CombOTC, CombGENTotal, CombGENTotalSrc, AAPTotalRX, AAPExcludedFromTotalRX, AAPNonRXOTCandHH, AAPSourceCompliance, COGEligibleSales)
		SELECT Date, PMID, AccountName, APIAccountNo, AAPAccountNo, AAPCOGAppliedSales, AAPNetSales, AAPBrand, AAPGENTotal, AAPGENTotalSrc, AAPGENExcl, AAPOTC, AAPOther, CombNetSales
		, CombBrands, CombOTC, CombGENTotal, CombGENTotalSrc, AAPTotalRX, AAPExcludedFromTotalRX, AAPNonRXOTCandHH, AAPSourceCompliance,COGEligibleSales
		FROM dbo.vw_CH_ALLPVA_SALES AS c
		WHERE NOT EXISTS(SELECT 1
							FROM [dbo].[CH_ALLPVA_SALES] AS a
							WHERE a.Date = c.Date			
							AND a.PMID = c.PMID		
							)  
	

END TRY
BEGIN CATCH

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

		INSERT INTO dbo.ErrorLog(ErrorNumber, ErrorLine, ErrorState, ErrorSeverity, ErrorProcedure, ErrorMessage)
		VALUES(@ErrorNumber, @ErrorLine, @ErrorState, @ErrorSeverity, @ErrorProcedure, @ErrorMessage)



END CATCH



END

/***************************************************************************************************************************************************************************************************************

															Original Version

****************************************************************************************************************************************************************************************************************/

	-- MERGE [dbo].[CH_ALLPVA_SALES] AS target 
	--  USING(SELECT Date, PMID, AccountName, APIAccountNo, AAPAccountNo, AAPCOGAppliedSales, AAPNetSales, AAPBrand, AAPGENTotal, AAPGENTotalSrc, AAPGENExcl, AAPOTC, AAPOther, CombNetSales
 --                  , CombBrands, CombOTC, CombGENTotal, CombGENTotalSrc, AAPTotalRX, AAPExcludedFromTotalRX, AAPNonRXOTCandHH, COGEligibleSales
 --           FROM dbo.vw_CH_ALLPVA_SALES     
 --                    ) AS source (Date, PMID, AccountName, APIAccountNo, AAPAccountNo, AAPCOGAppliedSales, AAPNetSales, AAPBrand, AAPGENTotal, AAPGENTotalSrc, AAPOTC, AAPOther, CombNetSales
 --                                        , CombBrands, AAPGENExcl, CombOTC, CombGENTotal, CombGENTotalSrc, AAPTotalRX, AAPExcludedFromTotalRX, AAPNonRXOTCandHH, COGEligibleSales
 --                                        )
 --      ON (target.Date = source.Date
 --             AND target.PMID = source.PMID
 --             )
 
 --      WHEN MATCHED THEN
 --      UPDATE SET AccountName = source.AccountName
 --      , APIAccountNo = source.APIAccountNo
 --      , AAPAccountNo = source.AAPAccountNo
 --      , AAPCOGAppliedSales = source.AAPCOGAppliedSales
 --      , AAPNetSales = source.AAPNetSales
 --      , AAPBrand = source.AAPBrand
 --      , AAPGENTotal = source.AAPGENTotal
 --      , AAPGENTotalSrc = source.AAPGENTotalSrc
 --      , AAPOTC = source.AAPOTC
 --      , AAPOther = source.AAPOther
 --      , CombNetSales = source.CombNetSales
 --      , CombBrands = source.CombBrands
 --      , AAPGENExcl = source.AAPGENExcl
 --      , CombOTC = source.CombOTC
 --      , CombGENTotal = source.CombGENTotal
 --      , CombGENTotalSrc = source.CombGENTotalSrc
	--   , AAPTotalRX = source.AAPTotalRX
	--   , AAPExcludedFromTotalRX = source.AAPExcludedFromTotalRX
	--   , AAPNonRXOTCandHH = source.AAPNonRXOTCandHH
	--   , COGEligibleSales = source.COGEligibleSales
	   

	--WHEN NOT MATCHED THEN
	--INSERT (Date, PMID, AccountName, APIAccountNo, AAPAccountNo, AAPCOGAppliedSales, AAPNetSales, AAPBrand, AAPGENTotal, AAPGENTotalSrc, AAPGENExcl, AAPOTC, AAPOther, 
	--		CombNetSales, CombBrands, CombOTC, CombGENTotal, CombGENTotalSrc, AAPTotalRX, AAPExcludedFromTotalRX, AAPNonRXOTCandHH, COGEligibleSales
	--		)
	--VALUES(source.Date, source.PMID, source.AccountName, source.APIAccountNo, source.AAPAccountNo, source.AAPCOGAppliedSales, source.AAPNetSales, source.AAPBrand, source.AAPGENTotal, 
	--	   source.AAPGENTotalSrc, source.AAPGENExcl, source.AAPOTC, source.AAPOther, source.CombNetSales, source.CombBrands, source.CombOTC, source.CombGENTotal, source.CombGENTotalSrc, 
	--	   source.AAPTotalRX, source.AAPExcludedFromTotalRX, source.AAPNonRXOTCandHH, source.COGEligibleSales
	--	   );



GO
