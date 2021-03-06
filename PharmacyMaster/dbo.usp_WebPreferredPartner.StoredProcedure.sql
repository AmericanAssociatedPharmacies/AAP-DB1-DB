USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebPreferredPartner]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/* =============================================
-- Author:		Chris McKinnie
-- Create date: 11/15/2017
-- Returns a list of 
-- Change: 
	Author: RSE
	Notes: Formatted sproc for better ease of reading. Added schema name to tables
			so SQL Server won't do a schema lock on tables. 

-- =============================================
*/
CREATE PROCEDURE [dbo].[usp_WebPreferredPartner]

AS

SET NOCOUNT ON;

BEGIN

	SELECT UP.PARTNER_ID
	, UP.NAME
	, UP.DESCRIPTION
	, UPL.LABEL
	, UPC.CATEGORY
	, UP.PHONE_NUM
	, UP.URI
	, UP.LOGO 
	FROM dbo.WEBPARTNERS AS UP 
	INNER JOIN dbo.PARTNERCATEGORY AS UPC ON(UP.PARTNER_CATEGORY_ID = UPC.PARTNER_CATEGORY_ID)
	INNER JOIN dbo.PARTNERLEVEL AS UPL ON(UP.PARTNER_LEVEL_ID = UPL.PARTNER_LEVEL_ID)
	WHERE UP.PARTNER_ID NOT IN (378,404)
	ORDER BY Upc.Category

END


GO
