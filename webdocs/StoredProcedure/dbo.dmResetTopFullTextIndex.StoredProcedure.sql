USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmResetTopFullTextIndex]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmResetTopFullTextIndex]
	AS
	BEGIN
		SET NOCOUNT ON;

		UPDATE TOP (10000) [dmDocument]
		SET [NeedsFullTextIndex] = 1
		WHERE [NeedsFullTextIndex] = 0;

		Return @@ROWCOUNT;
	END
GO
