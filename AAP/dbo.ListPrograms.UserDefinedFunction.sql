USE [AAP]
GO
/****** Object:  UserDefinedFunction [dbo].[ListPrograms]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BGrant
-- Create date: 1/12/10
-- Description:	return a delimited list of affiliates
-- =============================================
CREATE FUNCTION [dbo].[ListPrograms]
(
	-- Add the parameters for the function here
	@aapid int
)
RETURNS varchar(255)
AS
BEGIN
	declare @result varchar(255)
	SELECT @result = COALESCE(@result + ', ', '') + 
	   p.description
from 
		aap.dbo.aapaccount a
		left join 
		aap.dbo.AAPMemberProgram x on a.accountid=x.accountid
		left join 
		aap.dbo.AAPPrograms p on x.programid = p.program_id
		where a.aapid=@aapid

	-- Return the result of the function
	RETURN isnull(@result,'')

END
GO
