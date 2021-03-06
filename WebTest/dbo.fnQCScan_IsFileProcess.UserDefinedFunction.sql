USE [WebTest]
GO
/****** Object:  UserDefinedFunction [dbo].[fnQCScan_IsFileProcess]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnQCScan_IsFileProcess]
(
	@FileType varchar(50),
	@file NVARCHAR(350)
)
RETURNS INT
WITH EXECUTE AS CALLER
AS
BEGIN
DECLARE @IsProcessed INT
	
	SELECT @IsProcessed = 
					CASE WHEN EXISTS(
						SELECT DISTINCT IsProcess 
						-- SELECT *
						FROM dbo.QC_ScanFiles 
						WHERE (FileType LIKE @FileType) AND  FromLocation LIKE '%' + @file + '%' AND IsProcess = 1 -- WHERE (FromLocation LIKE '%' + @file + '%') AND IsProcess = 1	
					) THEN 1 ELSE 0 END;
RETURN(@IsProcessed)
END;
-- usage:
-- select dbo.fnQCScan_IsFileProcess ('ESI.TXT.pgp');
GO
