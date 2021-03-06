USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmVersionDelete]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmVersionDelete]
		@DocumentKey [char](36),
		@Version int
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			DELETE FROM dmVersion
				WHERE DocumentKey = @DocumentKey AND [Version] = @Version;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmVersionDelete : Cannot delete record. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRANSACTION;

		RETURN(0);
	END;
GO
