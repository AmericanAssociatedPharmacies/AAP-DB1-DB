USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[usp_LoadAPIPrice_ETL]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_LoadAPIPrice_ETL]

AS

SET NOCOUNT ON;

BEGIN
BEGIN TRY

	BEGIN TRAN

	TRUNCATE TABLE [Archive].[APIPrice];

	ALTER TABLE [dbo].[APIPrice]
	SWITCH TO [Archive].[APIPrice]

	ALTER TABLE [Staging].[APIPrice]
	SWITCH TO [dbo].[APIPrice]

	UPDATE STATISTICS [dbo].[APIPrice]

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
