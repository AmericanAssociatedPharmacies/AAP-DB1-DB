USE [AAP]
GO
/****** Object:  UserDefinedFunction [dbo].[ListPharmacists]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BGrant
-- Create date: 1/12/10
-- Description:	return a delimited list of affiliates
-- =============================================
CREATE FUNCTION [dbo].[ListPharmacists]
(
	-- Add the parameters for the function here
	@aapid int
)
RETURNS varchar(255)
AS
BEGIN
	declare @result varchar(255)
	SELECT @result = COALESCE(@result + ', ', '') + 
	   p.pharfirstname + ' ' + p.pharlastname
from 
		aap.dbo.aapaccount a
		left join 
		Pharmacists p on a.accountid=p.accountid
		where a.aapid=@aapid

	-- Return the result of the function
	RETURN isnull(@result,'')

END

GO
