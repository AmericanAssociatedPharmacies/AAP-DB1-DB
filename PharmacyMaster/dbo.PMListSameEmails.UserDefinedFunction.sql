USE [PharmacyMaster]
GO
/****** Object:  UserDefinedFunction [dbo].[PMListSameEmails]    Script Date: 12/22/2020 4:45:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joni Wilson (adapted from Bruces ListAffiliates in AAP)
-- Create date: 1/12/10
-- Description:	return a delimited list of affiliates
-- =============================================
CREATE FUNCTION [dbo].[PMListSameEmails]
(
	-- Add the parameters for the function here
	@Email varchar(255),@Programid varchar(10)
)
RETURNS varchar(255)
AS
BEGIN
	declare @result varchar(255)
	SELECT @result = COALESCE(@result + ', ', '') + 
	   cast( AccountName as varchar(255))
from 
		v_pm_allwithaffiliates where pmid in (
select pmid from pm_memberprograms where programid = @Programid and enddate is null ) and Email = @Email
	RETURN isnull(@result,'')

END
GO
