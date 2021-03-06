USE [PharmacyMaster]
GO
/****** Object:  UserDefinedFunction [dbo].[PMProgramNames]    Script Date: 12/22/2020 4:45:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joni Wilson (adapted from Bruces ListAffiliates in AAP)
-- Create date: 1/12/10
-- Description:	return a delimited list of Program names -updated to chane return sixe and add in enddate 9/17/2015 jmw
-- =============================================
CREATE FUNCTION [dbo].[PMProgramNames]
(
	-- Add the parameters for the function here
	@pmid int
)
RETURNS varchar(max)
AS
BEGIN
		declare @result varchar(max)
	SELECT @result = COALESCE(@result + ', ', '') + 
	   cast(g.Description as varchar(max))
from 
		pharmacymaster.dbo.pm_pharmacy p
		left outer join 
		pharmacymaster.dbo.PM_MemberPrograms x on p.pmid=x.pmid
		left outer join 
		pharmacymaster.dbo.PM_Programs g on x.programid = g.programid
		where p.pmid= @pmid and enddate is null
	RETURN isnull(@result,'')

END
GO
