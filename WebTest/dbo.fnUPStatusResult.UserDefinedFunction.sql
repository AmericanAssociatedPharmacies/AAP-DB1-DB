USE [WebTest]
GO
/****** Object:  UserDefinedFunction [dbo].[fnUPStatusResult]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BGrant
-- Create date: 10/3/14
-- Description:	CG status description
-- =============================================
CREATE FUNCTION [dbo].[fnUPStatusResult]
(
	@result varchar(255),
	@api varchar(255),
	@ch varchar(255),
	@note varchar(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ret VARCHAR(MAX)
	DECLARE @br VARCHAR(6)
	SET @ret = '<span class=tag>Response:</span>' + @result
	SET @br = CASE WHEN @ret is null or DATALENGTH(@ret) = 0 THEN '' ELSE '<br />' END
	SET @ret = @ret + 
	CASE WHEN @note is null or DATALENGTH(@note) = 0 or @note='BULK UPDATE' or @note like 'AUTO %'
		THEN ''
		ELSE @br + '<span class=tag>State MAC Response:</span>' + @note
		END
	SET @br = CASE WHEN @ret is null or DATALENGTH(@ret) = 0 THEN '' ELSE '<br />' END
	SET @ret = @ret + 
	CASE WHEN @api is null or DATALENGTH(@api) = 0
		THEN ''
		ELSE @br + '<span class=tag>API Price:</span>' + @api
		END
	SET @br = CASE WHEN @ret is null or DATALENGTH(@ret) = 0 THEN '' ELSE '<br />' END
	SET @ret = @ret + 
	CASE WHEN @ch is null or DATALENGTH(@ch) = 0
		THEN ''
		ELSE @br + '<span class=tag>Cardinal Price:</span>' + @ch
		END

	-- Return the result of the function
	RETURN @ret

END
GO
