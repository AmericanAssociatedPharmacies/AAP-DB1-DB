USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmActivityCodeUpdate]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmActivityCodeUpdate]
		@ActivityCode [int],
		@ActivityDesc [varchar](256)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRAN;
			SET NOCOUNT ON;

			UPDATE dmActivityCode
				SET ActivityDesc = @ActivityDesc
				WHERE ActivityCode = @ActivityCode;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmActivityCodeUpdate : Cannot update record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
