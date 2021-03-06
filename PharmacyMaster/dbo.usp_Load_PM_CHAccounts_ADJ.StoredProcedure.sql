USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[usp_Load_PM_CHAccounts_ADJ]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_Load_PM_CHAccounts_ADJ]

AS

SET NOCOUNT ON;

BEGIN

BEGIN TRY

	BEGIN TRAN

		TRUNCATE TABLE [Archive].[PM_CHAccounts_ADJ]

		ALTER TABLE [dbo].[PM_CHAccounts_ADJ]
		SWITCH TO [Archive].[PM_CHAccounts_ADJ]

		ALTER TABLE [Staging].[PM_CHAccounts_ADJ]
		SWITCH TO [dbo].[PM_CHAccounts_ADJ]

		UPDATE STATISTICS [dbo].[PM_CHAccounts_ADJ]

	COMMIT TRAN

END TRY
BEGIN CATCH

	IF @@TRANCOUNT > 0

	ROLLBACK TRAN

	    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE()
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY()
        DECLARE @ErrorState INT = ERROR_STATE()

    -- Use RAISERROR inside the CATCH block to return error  
    -- information about the original error that caused  
    -- execution to jump to the CATCH block.  
    RAISERROR (@ErrorMessage, -- Message text.  
               @ErrorSeverity, -- Severity.  
               @ErrorState -- State.  
               );

END CATCH


END

GO
