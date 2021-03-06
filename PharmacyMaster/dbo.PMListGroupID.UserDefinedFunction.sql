USE [PharmacyMaster]
GO
/****** Object:  UserDefinedFunction [dbo].[PMListGroupID]    Script Date: 12/22/2020 4:45:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joni Wilson (adapted from Bruces ListAffiliates in AAP)
-- Create date: 1/12/10
-- Description:	return a delimited list of affiliates
-- =============================================
CREATE FUNCTION [dbo].[PMListGroupID]
(
	-- Add the parameters for the function here
	@pmid int
)
RETURNS varchar(255)
AS
BEGIN
	declare @result varchar(255)
	SELECT @result = COALESCE(@result + ', ', '') + 
	    cast(g.group_id as varchar(10))
from 
		pharmacymaster.dbo.pm_pharmacy p
		left outer join 
		pharmacymaster.dbo.PM_Groups_xref x on p.pmid=x.pmid
		left outer join 
		pharmacymaster.dbo.PM_Groups g on x.group_id  =  g.group_id
		where p.pmid= @pmid
	RETURN isnull(@result,'')

END
GO
