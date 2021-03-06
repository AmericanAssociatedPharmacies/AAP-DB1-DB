USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[GetTotalDocumentCount]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[GetTotalDocumentCount]
		@DocCount int OUTPUT
	AS
	BEGIN
		SET NOCOUNT ON;

		SELECT COUNT(DocumentKey) As DocCount FROM dmDocument
	END;
GO
