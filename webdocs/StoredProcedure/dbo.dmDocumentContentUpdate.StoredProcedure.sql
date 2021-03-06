USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmDocumentContentUpdate]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dmDocumentContentUpdate]
	@DocumentKey [char](36),
	@TextContent [nvarchar](MAX)
WITH EXECUTE AS CALLER
AS
BEGIN
    BEGIN TRANSACTION;
		SET NOCOUNT ON;

		UPDATE dmDocumentTextContent
		  SET FullTextContent = @TextContent
		  WHERE DocumentKey = @DocumentKey

		IF (@@error!=0)
		BEGIN
			RAISERROR ('dmDocumentContentUpdate : Cannot update record. ',100,1);
			ROLLBACK TRAN;
			RETURN(1);
		END;
    COMMIT TRAN;

    RETURN(0);
END;
GO
