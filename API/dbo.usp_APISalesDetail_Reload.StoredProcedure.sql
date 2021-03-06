USE [API]
GO
/****** Object:  StoredProcedure [dbo].[usp_APISalesDetail_Reload]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_APISalesDetail_Reload]

AS

SET NOCOUNT ON;

BEGIN
BEGIN TRY

	INSERT INTO [dbo].[APISalesDetail]([WHAccountID], [InvNbr], [InvLine], [CustomerName], APIItemNbr, [ItemDescription], [Qty], [UnitAmount], [ItemGrp], [AcctGrp], [Territory], [InvDate], [LineAmt], [ExtSales]
	            , [OrderNbr], [NDC_orig], [NDC], [DateLoaded], [Type], [WHNbr], [Rebate], [APIHoldbackPercent], [APIHoldbackAmount], [RebateAfterAPIHoldbackAmount], [AffiliateHoldbackPercent]
				, [AffiliateHoldbackAmount], [FinalRebateAmount], [DiscountPercentage], [ConferenceCreditPercentage], [ConferenceCreditAmount], PMID, TransTypeCode, TransTypeCodeDesc, CarrierCode, CarrierDesc
				)
	SELECT  [WHAccountID], [InvNbr], [InvLine], [CustomerName], [APIItemNbr] AS APIItemNbr, [ItemDescription], [Qty], [UnitAmount], [ItemGrp], [AcctGrp], [Territory], [InvDate], [LineAmt], [ExtSales]
	            , [OrderNbr], [NDC_orig], [NDC], [DateLoaded], [Type], [WHNbr], [Rebate], [APIHoldbackPercent], [APIHoldbackAmount], [RebateAfterAPIHoldbackAmount], [AffiliateHoldbackPercent]
				, [AffiliateHoldbackAmount], [FinalRebateAmount], [DiscountPercentage], [ConferenceCreditPercentage], [ConferenceCreditAmount], PMID, TransTypeCode, TransTypeCodeDesc, CarrierCode, CarrierDesc
	FROM [Staging].[APISalesDetail] AS s
	WHERE NOT EXISTS(SELECT 1
						FROM [dbo].[APISalesDetail] AS a
						WHERE s.InvNbr = a.InvNbr
						AND s.InvDate = a.InvDate
						AND s.WHAccountID = a.WHAccountID
						AND s.NDC = a.NDC
						AND s.InvLine = a.InvLine
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
        );	

END CATCH




END 

GO
