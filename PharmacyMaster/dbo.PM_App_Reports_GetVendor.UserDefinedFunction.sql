USE [PharmacyMaster]
GO
/****** Object:  UserDefinedFunction [dbo].[PM_App_Reports_GetVendor]    Script Date: 12/22/2020 4:45:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dan Wendt
-- Create date: 6/09/11
-- Description:	return the current Group Name
-- =============================================
CREATE FUNCTION [dbo].[PM_App_Reports_GetVendor]
(
	@pmid int
)
RETURNS varchar(255)
AS
BEGIN
	DECLARE @result VarChar(255)
	SELECT @result = COALESCE(@result + ', ', '') + CAST(v.VendorName as VarChar(255))
      FROM PM_Pharmacy p
		left outer join PM_VendorAccts va ON va.PMID    = p.PMID
		left outer join PM_Vendors v      ON v.VendorID = va.VendorID
		WHERE p.PMID = @pmid AND va.isPrimary <> 0
	RETURN isnull(@result,'')
END

GO
