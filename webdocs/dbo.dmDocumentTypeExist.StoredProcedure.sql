USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmDocumentTypeExist]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmDocumentTypeExist]
		@DocTypeKey [char](36)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		DECLARE @RecCount INT; -- Used to store results of record count

		SET NOCOUNT ON;

		SET @RecCount = (SELECT Count(*)
			FROM dmDocumentType
			WHERE DocTypeKey = @DocTypeKey);

		IF (@@error!=0)
		BEGIN
			RAISERROR ('dmDocumentTypeExist : Error encountered. ',100,1);
			RETURN(1);
		END;

		IF (@RecCount > 0)
			RETURN(0);
		ELSE
			RETURN(1);
	END;
GO
