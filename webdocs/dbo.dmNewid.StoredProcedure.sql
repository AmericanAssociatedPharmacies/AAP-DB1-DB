USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmNewid]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmNewid]
		@newid [char](36) OUTPUT
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		SET @newid = NEWID();
		RETURN(0);
	END;
GO
