USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmActivityCodeDelete]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

	CREATE PROCEDURE [dbo].[dmActivityCodeDelete]
		@ActivityCode [int]
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		-- Begin a transaction
		BEGIN TRAN
		-- Set NOCOUNT on to enhance performance
		SET NOCOUNT ON
		-- Remove record from table
		DELETE
			FROM dmActivityCode
			WHERE ActivityCode = @ActivityCode
		-- See if any errors were encountered
		IF (@@error!=0)
		BEGIN
			RAISERROR ('dmActivityCodeDelete : Cannot delete record. ',100,1);
			ROLLBACK TRAN
			RETURN(1)
		END
		-- Commit changes
		COMMIT TRAN
		RETURN(0)
	END
GO
