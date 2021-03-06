USE [PharmacyMaster]
GO
/****** Object:  UserDefinedFunction [dbo].[PMGetOwnerLastName]    Script Date: 12/22/2020 4:45:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Rudy E. Hinojosa
-- Create date: 6-9-2010
-- Description:	Returns Last Name from Ownerfullname
-- =============================================
CREATE FUNCTION [dbo].[PMGetOwnerLastName]
(
	-- Add the parameters for the function here
	@pOwnername varchar(100)
)
RETURNS varchar(100)
AS
BEGIN
	declare @result varchar(100)
	SELECT @result = substring(@pOwnername,charindex(' ',@pOwnername)+1,20)
	from pharmacymaster.dbo.pm_pharmacy where 1=1
	RETURN isnull(@result,'')

END


GO
