USE [API]
GO
/****** Object:  StoredProcedure [Staging].[usp_APISalesDetail_Reload]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [Staging].[usp_APISalesDetail_Reload]

AS

SET NOCOUNT ON;

BEGIN
BEGIN TRY

	TRUNCATE TABLE [Staging].[APISalesDetail];

	INSERT INTO [Staging].[APISalesDetail](WHAccountID, InvNbr, InvLine, CustomerName, APIItemNbr, ItemDescription, Qty, UnitAmount, ItemGrp, AcctGrp, Territory, InvDate, LineAmt, ExtSales, OrderNbr, NDC_orig, NDC, Type, Rebate, DiscountPercentage, TransTypeCode, WHNbr, CarrierCode, CarrierDesc, TransTypeCodeDesc, CustomerRef, OrderType)
	SELECT  WHAccountID, InvNbr, InvLine, CustomerName, APIItemNbr, ItemDescription, Qty, UnitAmount, ItemGrp, AcctGrp, Territory, InvDate, LineAmt, ExtSales, OrderNbr, NDC_orig, NDC, Type, Rebate, DiscountPercentage, TransTypeCode, WHNbr, CarrierCode, CarrierDesc, TransTypeCodeDesc, CustomerRef, OrderType
	FROM [Staging].[vw_APISalesDetailReload] AS s
	WHERE NOT EXISTS(SELECT 1
						FROM dbo.APISalesDetail AS a
						WHERE a.[WHAccountID] = S.[WHAccountID]
						AND a.[InvNbr] = S.[InvNbr]				
						AND a.[InvDate] = S.[InvDate]
						AND a.[NDC] = S.[NDC]
						AND a.[InvLine] = S.[InvLine]						
						--a.[InvNbr] = s.[InvNbr]
						--AND a.InvDate = s.InvDate
						)


	--Run updates
	EXEC Staging.usp_APISalesDetail_Update


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
