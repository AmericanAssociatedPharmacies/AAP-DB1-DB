USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmUpdateDocumentFullTextIndexStatus]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmUpdateDocumentFullTextIndexStatus]
		@DocumentKey char(36),
		@NeedsFullTextIndex bit = 0,
		@Status varchar(255) = ''
	AS
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
		BEGIN TRAN;
		SET NOCOUNT ON;

		UPDATE [dmDocument]
		SET [NeedsFullTextIndex] = @NeedsFullTextIndex, [FullTextIndexStatus] = @Status
		WHERE [DocumentKey] = @DocumentKey;
		IF (@@error!=0)
			BEGIN
				RAISERROR ('dmUpdateDocumentFullTextIndexStatus : Cannot update record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
