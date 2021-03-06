USE [Medispan]
GO
/****** Object:  StoredProcedure [dbo].[usp_Load_M25GPPC_2]    Script Date: 12/22/2020 4:38:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[usp_Load_M25GPPC_2]

AS

SET NOCOUNT ON;

BEGIN

BEGIN TRY

	BEGIN TRAN

		TRUNCATE TABLE [Archive].[M25GPPC_2]

		ALTER TABLE [dbo].[M25GPPC_2]
		SWITCH TO [Archive].[M25GPPC_2]

		ALTER TABLE [Staging].[M25GPPC_2]
		SWITCH TO [dbo].[M25GPPC_2]

		UPDATE STATISTICS [dbo].[M25GPPC_2]

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
