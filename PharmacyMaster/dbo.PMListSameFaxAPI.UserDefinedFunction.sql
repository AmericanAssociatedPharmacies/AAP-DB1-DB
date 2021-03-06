USE [PharmacyMaster]
GO
/****** Object:  UserDefinedFunction [dbo].[PMListSameFaxAPI]    Script Date: 12/22/2020 4:45:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joni Wilson (adapted from Bruces ListAffiliates in AAP)
-- Create date: 1/12/10
-- Description:	return a delimited list of affiliates
-- =============================================
CREATE FUNCTION [dbo].[PMListSameFaxAPI]
(
	-- Add the parameters for the function here
	@Fax varchar(max) 
)
RETURNS varchar(max)
AS
BEGIN
	declare @result varchar(max)
	SELECT @result = COALESCE(@result + ', ', '') + 
	   cast( AccountName as varchar(255))
from 
		v_pm_allwithaffiliates where pmid in (

select pmid from v_pm_allwithaffiliates where apistatus in ('ACTIVE','SUSPENDED','inactive')
and apiaccountno is not null and apiaccountno not like '%-%' and ( email is null or email = '')
 ) and Fax = @Fax
	RETURN isnull(@result,'')

END
GO
