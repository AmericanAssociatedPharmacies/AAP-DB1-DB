USE [API]
GO
/****** Object:  StoredProcedure [dbo].[usp_APIInvoice_ReLoad]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[usp_APIInvoice_ReLoad]

AS

SET NOCOUNT ON;

BEGIN
BEGIN TRY

	INSERT INTO [dbo].[APISalesInvoice](InvNbr, OrderNbr, InvDate, WHAccountID, CustomerName, CarrierCode, CarrierDesc, [CustomerRef], Whsnum,[OrdType])
	SELECT DISTINCT InvNbr, OrderNbr, InvDate, WHAccountID, CustomerName, CarrierCode, CarrierDesc, [CustomerRef], WHNbr AS Whsnum, OrderType AS [OrdType]
	FROM Staging.APISalesDetail AS s
	WHERE NOT EXISTS(SELECT 1
						FROM [dbo].[APISalesInvoice] AS t
						WHERE T.[InvNbr] = S.[InvNbr]
						AND T.[InvDate] = S.[InvDate]
						AND T.[WHAccountID] = S.[WHAccountID]
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
