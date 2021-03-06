USE [API]
GO
/****** Object:  StoredProcedure [dbo].[usp_APISalesDetail_Load]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










CREATE PROCEDURE [dbo].[usp_APISalesDetail_Load]

AS

SET NOCOUNT ON;

BEGIN
BEGIN TRY

	MERGE [dbo].[APISalesDetail] AS T
	USING (SELECT [WHAccountID], [InvNbr], [InvLine], [CustomerName], [APIItemNbr] AS APIItemNbr, [ItemDescription], [Qty], [UnitAmount], [ItemGrp], [AcctGrp], [Territory], [InvDate], [LineAmt], [ExtSales]
	            , [OrderNbr], [NDC_orig], [NDC], [DateLoaded], [Type], [WHNbr], [Rebate], [APIHoldbackPercent], [APIHoldbackAmount], [RebateAfterAPIHoldbackAmount], [AffiliateHoldbackPercent]
				, [AffiliateHoldbackAmount], [FinalRebateAmount], [DiscountPercentage], [ConferenceCreditPercentage], [ConferenceCreditAmount], PMID, TransTypeCode, TransTypeCodeDesc, CarrierCode, CarrierDesc
		   FROM [Staging].[APISalesDetail]
		   ) AS S
		([WHAccountID], [InvNbr], [InvLine], [CustomerName], [APIItemNbr], [ItemDescription], [Qty], [UnitAmount], [ItemGrp], [AcctGrp], [Territory], [InvDate], [LineAmt], [ExtSales]
		, [OrderNbr], [NDC_orig], [NDC], [DateLoaded], [Type], [WHNbr], [Rebate], [APIHoldbackPercent], [APIHoldbackAmount], [RebateAfterAPIHoldbackAmount], [AffiliateHoldbackPercent]
		, [AffiliateHoldbackAmount], [FinalRebateAmount], [DiscountPercentage], [ConferenceCreditPercentage], [ConferenceCreditAmount], PMID, TransTypeCode, TransTypeCodeDesc, CarrierCode, CarrierDesc
		)
				ON T.[WHAccountID] = S.[WHAccountID]
				AND T.[InvNbr] = S.[InvNbr]				
				AND T.[InvDate] = S.[InvDate]
				AND T.[NDC] = S.[NDC]
				AND T.[InvLine] = S.[InvLine]
				

	WHEN MATCHED THEN
	UPDATE SET T.[CustomerName] = S.[CustomerName]
			 , T.[APIItemNbr] = S.[APIItemNbr]
			 , T.[ItemDescription] = S.[ItemDescription]
			 , T.[Qty] = S.[Qty] 
			 , T.[UnitAmount] = S.[UnitAmount]
		     , T.[ItemGrp] = S.[ItemGrp]
		     , T.[AcctGrp] = S.[AcctGrp]
		     , T.[Territory] = S.[Territory]
		     , T.[LineAmt] = S.[LineAmt]
		     , T.[ExtSales] = S.[ExtSales]
		     , T.[OrderNbr] = S.[OrderNbr]
		     , T.[NDC_orig] = S.[NDC_orig]
		     --, T.[NDC] = S.[NDC]
		     --, T.[DateLoaded] = S.[DateLoaded]
		     , T.[Type] = S.[Type]
		     , T.[WHNbr] = S.[WHNbr]
		     , T.[Rebate] = S.[Rebate]
		     , T.[APIHoldbackPercent] = S.[APIHoldbackPercent]
		     , T.[APIHoldbackAmount] = S.[APIHoldbackAmount]
		     , T.[RebateAfterAPIHoldbackAmount] = S.[RebateAfterAPIHoldbackAmount]
		     , T.[AffiliateHoldbackPercent] = S.[AffiliateHoldbackPercent]
		     , T.[AffiliateHoldbackAmount] = S.[AffiliateHoldbackAmount]
		     , T.[FinalRebateAmount] = S.[FinalRebateAmount]
			 , T.[DiscountPercentage] = S.[DiscountPercentage]
			 , T.[ConferenceCreditPercentage] = S.[ConferenceCreditPercentage]
			 , T.[ConferenceCreditAmount] = S.[ConferenceCreditAmount]
			 , t.PMID = s.PMID
			 , t.TransTypeCode = s.TransTypeCode
			 , t.TransTypeCodeDesc = s.TransTypeCodeDesc
			 , t.CarrierCode = s.CarrierCode
			 , t.CarrierDesc = s.CarrierDesc
	
	WHEN NOT MATCHED THEN
	INSERT ([WHAccountID], [InvNbr], [InvLine], [CustomerName], [APIItemNbr], [ItemDescription], [Qty], [UnitAmount], [ItemGrp], [AcctGrp], [Territory], [InvDate], [LineAmt], [ExtSales]
	        , [OrderNbr], [NDC_orig], [NDC], [DateLoaded], [Type], [WHNbr], [Rebate], [APIHoldbackPercent], [APIHoldbackAmount], [RebateAfterAPIHoldbackAmount], [AffiliateHoldbackPercent]
			, [AffiliateHoldbackAmount], [FinalRebateAmount], [DiscountPercentage], [ConferenceCreditPercentage], [ConferenceCreditAmount], PMID
			, TransTypeCode, TransTypeCodeDesc, CarrierCode, CarrierDesc
			)
	VALUES (S.[WHAccountID], S.[InvNbr], S.[InvLine], S.[CustomerName], S.[APIItemNbr], S.[ItemDescription], S.[Qty], S.[UnitAmount], S.[ItemGrp], S.[AcctGrp], S.[Territory], S.[InvDate], S.[LineAmt], S.[ExtSales]
	        , S.[OrderNbr], S.[NDC_orig], S.[NDC], S.[DateLoaded], S.[Type], S.[WHNbr], S.[Rebate], S.[APIHoldbackPercent], S.[APIHoldbackAmount], S.[RebateAfterAPIHoldbackAmount], S.[AffiliateHoldbackPercent]
			, S.[AffiliateHoldbackAmount], S.[FinalRebateAmount], s.[DiscountPercentage], s.[ConferenceCreditPercentage], s.[ConferenceCreditAmount], s.PMID
			, s.TransTypeCode, s.TransTypeCodeDesc, s.CarrierCode, s.CarrierDesc
			);



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
        );

	

END CATCH

END








GO
