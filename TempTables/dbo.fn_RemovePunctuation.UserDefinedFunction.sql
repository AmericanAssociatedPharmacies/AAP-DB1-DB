USE [TempTables]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_RemovePunctuation]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_RemovePunctuation]
(
    @InputString VARCHAR(500)
)
RETURNS VARCHAR(500)
AS
BEGIN
    SELECT
    	@InputString = REPLACE(@InputString, P.Symbol, '')
    FROM 
    	Punctuation P

    RETURN @InputString
END
GO
