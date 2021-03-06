USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmFilerDelete]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmFilerDelete]
		@DocumentKey [char](36),
		@FolderKey [char](36)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRAN;
			SET NOCOUNT ON;

			-- Insert record into deleted documents table
			INSERT INTO [dmDeletedDocuments] ([DocumentKey],[FolderKey])
			VALUES (@DocumentKey,@FolderKey);

			-- Remove record from filer table
			UPDATE dmDocument
			SET FolderKey = ''
			WHERE DocumentKey = @DocumentKey AND FolderKey = @FolderKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmFilerDelete : Cannot delete record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
