USE [PharmacyMaster]
GO
/****** Object:  UserDefinedFunction [dbo].[ColName1]    Script Date: 12/22/2020 4:45:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BG
-- Create date: 9/2010
-- Description:	return a column name for pivots,
-- e.g. Colname1('2/1/2010','Brand') => 'Brand 2/10'
-- =============================================
CREATE FUNCTION [dbo].[ColName1]
(
	-- Add the parameters for the function here
	@dt datetime, @name varchar(50)
)
RETURNS varchar(60)
AS
BEGIN
	declare @ret varchar(60)
	set @ret =  cast(month(@dt) as varchar(2)) + '/' + right(cast(year(@dt) as varchar(4)),2)+ ' ' + @name 
	RETURN @ret

END
GO
