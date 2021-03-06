USE [WebTest]
GO
/****** Object:  UserDefinedFunction [dbo].[fnUPStatusResult_Export]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BGrant
-- Create date: 10/3/14
-- Description:	CG status description
-- same as fnUPStatusResult without HTML tags BG 4/23/15
-- =============================================
CREATE FUNCTION [dbo].[fnUPStatusResult_Export]
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
	SET @ret = 'Response:' + @result
	SET @br = CASE WHEN @ret is null or DATALENGTH(@ret) = 0 THEN '' ELSE '  '  END
	SET @ret = @ret + 
	CASE WHEN @note is null or DATALENGTH(@note) = 0 or @note='BULK UPDATE' or @note like 'AUTO %'
		THEN ''
		ELSE @br + 'State MAC Response:' + @note
		END
	SET @br = CASE WHEN @ret is null or DATALENGTH(@ret) = 0 THEN '' ELSE '  '  END
	SET @ret = @ret + 
	CASE WHEN @api is null or DATALENGTH(@api) = 0
		THEN ''
		ELSE @br + 'API Price:' + @api
		END
	SET @br = CASE WHEN @ret is null or DATALENGTH(@ret) = 0 THEN '' ELSE '  '  END
	SET @ret = @ret + 
	CASE WHEN @ch is null or DATALENGTH(@ch) = 0
		THEN ''
		ELSE @br + 'Cardinal Price:' + @ch
		END

	-- Return the result of the function
	RETURN @ret

END

GO
