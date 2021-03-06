USE [WebTest]
GO
/****** Object:  UserDefinedFunction [dbo].[fnTextToBit]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnTextToBit]
(
	@T NVARCHAR(500)
)
RETURNS BIT
WITH EXECUTE AS CALLER
AS
BEGIN
	DECLARE @B BIT
	IF (@T IS NULL OR @T = '') BEGIN
		SELECT @B = NULL; 
	END ELSE BEGIN
		DECLARE @FirstChar NVARCHAR(2)
		SELECT @FirstChar = LOWER(SUBSTRING(@T,1,1)); 	
		SELECT @B = (CASE WHEN @FirstChar = 't' OR @FirstChar = 'y' OR @FirstChar = '1' OR @FirstChar = '-1' THEN 1 ELSE 0 END);
	END;

RETURN (@B)

END;
-- usage:
-- select [dbo].[fnTextToBit] ('Yes')
GO
