USE [AAP]
GO
/****** Object:  UserDefinedFunction [dbo].[ListWholesalers]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BGrant
-- Create date: 1/12/10
-- Description:	return a delimited list of affiliates
-- =============================================
CREATE FUNCTION [dbo].[ListWholesalers]
(
	-- Add the parameters for the function here
	@aapid int
)
RETURNS varchar(255)
AS
BEGIN
	declare @result varchar(255)
	SELECT @result = case IsPrimaryWholesaler
		when -1 then 
			COALESCE(@result + ', ', '') + cast(w.wholesalerid as varchar(5)) + ' PRIMARY '
		else
			COALESCE(@result + ', ', '') + cast(w.wholesalerid as varchar(5))
		end
from 
		aap.dbo.aapaccount a
		left join 
		AAPWholesalerStore w on a.accountid=w.accountid
		where a.aapid=@aapid

	-- Return the result of the function
	RETURN isnull(@result,'')

END

GO
