USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmDocumentContentInsert]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dmDocumentContentInsert]
	@DocumentKey [char](36),
	@TextContent [nvarchar](MAX)
WITH EXECUTE AS CALLER
AS
BEGIN
	BEGIN TRAN;
		SET NOCOUNT ON;

		INSERT INTO dmDocumentTextContent
			(DocumentKey,FullTextContent)
			VALUES (@DocumentKey,@TextContent);

		IF (@@error!=0)
		BEGIN
			RAISERROR ('dmDocumentContentInsert : Cannot insert record. ',100,1);
			ROLLBACK TRAN;
			RETURN(1);
		END;
	COMMIT TRAN;

	RETURN(0);
END;
GO
