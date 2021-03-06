USE [reporting]
GO
/****** Object:  UserDefinedFunction [dbo].[fnbgFirst]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BG
-- Create date: 5/12/10
-- Description:	First function for varchars
-- =============================================
CREATE FUNCTION [dbo].[fnbgFirst]
(
	-- Add the parameters for the function here
	@table varchar(255), @fieldReturn varchar(255), @fieldOrderby varchar(255),
	@fieldValue varchar(255), @value varchar(255)
)
RETURNS varchar(255)
AS
BEGIN
	declare @ret varchar(255)
	declare @cmd varchar(255)
	set @cmd = 'select ' + @fieldReturn + ' from ' + @table + ' where ' + @fieldValue + ' = ''' + @value + ''' order by ' + @fieldOrderby
	return(@cmd)
END
GO
