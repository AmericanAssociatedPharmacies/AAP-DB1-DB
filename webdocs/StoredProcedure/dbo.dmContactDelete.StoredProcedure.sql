USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmContactDelete]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmContactDelete]
		@ContactKey [char](36)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRAN;
			SET NOCOUNT ON;

			DELETE FROM dmContact
				WHERE ContactKey = @ContactKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmContactDelete : Cannot delete record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
