USE [ODSIntake]
GO
/****** Object:  UserDefinedFunction [dbo].[mtvf_GetFileInfo]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[mtvf_GetFileInfo](@targetDirectory [nvarchar](max))
RETURNS  TABLE (
	[FilePath] [nvarchar](500) NULL,
	[FileDirectory] [nvarchar](500) NULL,
	[FileName] [nvarchar](500) NULL,
	[FileSize] [bigint] NULL,
	[FileCreateTime] [datetime] NULL
) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [GetFileInfo].[UserDefinedFunctions].[mtvf_GetFileInfo]
GO
