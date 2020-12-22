USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmResetTopSearchIndex]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmResetTopSearchIndex]
	AS
	BEGIN
		SET NOCOUNT ON;

		UPDATE TOP (10000) [dmDocument]
		SET [NeedsKeyIndex] = 1
		WHERE [NeedsKeyIndex] = 0;

		Return @@ROWCOUNT;
	END
GO
