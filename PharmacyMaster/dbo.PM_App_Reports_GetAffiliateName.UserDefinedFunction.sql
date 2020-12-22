USE [PharmacyMaster]
GO
/****** Object:  UserDefinedFunction [dbo].[PM_App_Reports_GetAffiliateName]    Script Date: 12/22/2020 4:45:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dan Wendt
-- Create date: 6/09/11
-- Description:	return the current Affiliate Name
-- =============================================
CREATE FUNCTION [dbo].[PM_App_Reports_GetAffiliateName]
(
	@pmid int
)
RETURNS varchar(255)
AS
BEGIN
	DECLARE @result VarChar(255)
	SELECT  @result = COALESCE(@result + ', ', '') + CAST(g.Group_Name as VarChar(255))
      FROM PM_Pharmacy p
		left outer join PM_Groups_XRef x ON x.PMID     = p.PMID
		left outer join PM_Groups g      ON g.Group_ID = x.Group_ID
		WHERE p.PMID = @pmid AND g.AffiliateID IS NOT Null 
	RETURN isnull(@result,'')
END

GO
