USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[usp_PartnerUtilizationReport]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_PartnerUtilizationReport]

AS

SET NOCOUNT ON;

BEGIN
SELECT UP.PARTNER_ID
	, UP.NAME
	, PUR.VendorName AS VENDORNAME
	, UP.DESCRIPTION
	, UPL.LABEL
	, UPC.CATEGORY
	, UP.PHONE_NUM
	, UP.URI
	, UP.LOGO
	, PUR.ParticipationReportActive AS REPORTACTIVE
	, PUR.ParticipationReportRank AS REPORTRANK
	, PD.[CustomerServiceE-mail] AS PARTNEREMAIL
	FROM dbo.WEBPARTNERS AS UP 
	INNER JOIN dbo.PARTNERCATEGORY AS UPC ON(UP.PARTNER_CATEGORY_ID = UPC.PARTNER_CATEGORY_ID)
	INNER JOIN dbo.PARTNERLEVEL AS UPL ON(UP.PARTNER_LEVEL_ID = UPL.PARTNER_LEVEL_ID)
	INNER JOIN dbo.Partners AS PUR ON (UP.PARTNER_ID = PUR.PPVendorID)
	LEFT JOIN dbo.PartnerDetails_PPU AS PD ON  (PD.PARTNER_ID = PUR.PPVendorID)
	ORDER BY CASE WHEN PUR.ParticipationReportRank = 0 THEN PUR.ParticipationReportRank
	END ASC,
	CASE WHEN PUR.ParticipationReportRank > 0 THEN PUR.ParticipationReportRank
	END ASC

END

GO
