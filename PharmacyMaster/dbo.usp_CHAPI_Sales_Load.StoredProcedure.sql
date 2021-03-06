USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[usp_CHAPI_Sales_Load]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 
 
CREATE PROCEDURE [dbo].[usp_CHAPI_Sales_Load]
 
AS
 
 
SET NOCOUNT ON;
 
BEGIN
BEGIN TRY
 
       MERGE [dbo].[CHAPI_SALES] AS target
       USING(SELECT Date, PMID, AccountName, APIAccountNo, AAPAccountNo, AAPCOGAppliedSales, AAPNetSales, AAPBrand, AAPGENTotal, AAPGENTotalSrc, AAPOTC, AAPOther, CombNetSales
                     , CombBrands, AAPGENExcl, CombOTC, CombGENTotal, CombGENTotalSrc, COGEligibleSales, RebateEligibleSourceGenerics
                     FROM dbo.vwCHAPI_Sales     
                     ) AS source (Date, PMID, AccountName, APIAccountNo, AAPAccountNo, AAPCOGAppliedSales, AAPNetSales, AAPBrand, AAPGENTotal, AAPGENTotalSrc, AAPOTC, AAPOther, CombNetSales
                                         , CombBrands, AAPGENExcl, CombOTC, CombGENTotal, CombGENTotalSrc, COGEligibleSales, RebateEligibleSourceGenerics
                                         )
       ON (target.Date = source.Date
              AND target.PMID = source.PMID
              )
 
       WHEN MATCHED THEN
       UPDATE SET AccountName = source.AccountName
       , APIAccountNo = source.APIAccountNo
       , AAPAccountNo = source.AAPAccountNo
       , AAPCOGAppliedSales = source.AAPCOGAppliedSales
       , AAPNetSales = source.AAPNetSales
       , AAPBrand = source.AAPBrand
       , AAPGENTotal = source.AAPGENTotal
       , AAPGENTotalSrc = source.AAPGENTotalSrc
       , AAPOTC = source.AAPOTC
       , AAPOther = source.AAPOther
       , CombNetSales = source.CombNetSales
       , CombBrands = source.CombBrands
       , AAPGENExcl = source.AAPGENExcl
       , CombOTC = source.CombOTC
       , CombGENTotal = source.CombGENTotal
       , CombGENTotalSrc = source.CombGENTotalSrc
	   , COGEligibleSales = source.COGEligibleSales
	   , RebateEligibleSourceGenerics = source.RebateEligibleSourceGenerics

	   WHEN NOT MATCHED THEN
	   INSERT(Date, PMID, AccountName, APIAccountNo, AAPAccountNo, AAPCOGAppliedSales, AAPNetSales, AAPBrand
				, AAPGENTotal, AAPGENTotalSrc, AAPOTC, AAPOther, CombNetSales, CombBrands, AAPGENExcl, CombOTC
				, CombGENTotal, CombGENTotalSrc, COGEligibleSales, RebateEligibleSourceGenerics
				)
	   VALUES(source.Date, source.PMID, source.AccountName, source.APIAccountNo, source.AAPAccountNo, source.AAPCOGAppliedSales, source.AAPNetSales, source.AAPBrand, source.AAPGENTotal
			, source.AAPGENTotalSrc, source.AAPOTC, source.AAPOther, source.CombNetSales, source.CombBrands, source.AAPGENExcl, source.CombOTC, source.CombGENTotal
			, source.CombGENTotalSrc, source.COGEligibleSales, source.RebateEligibleSourceGenerics
			);  
 
END TRY
BEGIN CATCH
 
        DECLARE @ErrorMessage NVARCHAR(4000)
        , @ErrorNumber INT
        , @ErrorSeverity INT
        , @ErrorState INT
        , @ErrorLine INT
        , @ErrorProcedure NVARCHAR(200)
 
         SELECT @ErrorNumber = ERROR_NUMBER()
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
 


GO
