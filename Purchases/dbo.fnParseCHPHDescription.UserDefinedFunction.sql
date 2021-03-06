USE [Purchases]
GO
/****** Object:  UserDefinedFunction [dbo].[fnParseCHPHDescription]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnParseCHPHDescription] 
(
@description varchar(255), @token int
--split CH item description int is 1 or 2
)
RETURNS varchar(255)
AS
BEGIN
	DECLARE @result varchar(255)
	DECLARE @ipos int, @ipos2 int
	select @ipos2 = case when @description is null then null else charindex(' ',reverse(@description)) end
	select @ipos = case when @ipos2 is null then 0 else (len(@description) - @ipos2) end
	select @result = case when @ipos <= 0 
	then
		case when @token = 1 then @description else '' end
	else
		case when @token = 1 then rtrim(substring(@description,1,@ipos))
		else ltrim(substring(@description,@ipos+1,(len(@description)-@ipos)))
		end
	end
	return @result
END
GO
