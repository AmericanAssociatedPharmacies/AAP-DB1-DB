USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[usp_PreferredPartnerRebatesUtilization]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Sun Technologies
-- Create date: 07/06/2020
-- Description:	This procedure is used to get Rebates 
-- on a partner associated with given PMID
-- =============================================
CREATE PROCEDURE [dbo].[usp_PreferredPartnerRebatesUtilization]
	-- Add the parameters for the stored procedure here
	@pmid int = 0
AS

BEGIN
	DECLARE @toDate DATETIME;
	DECLARE @fromDate DATETIME;
	SET @fromDate = CAST(DATEADD(MONTH, -14, GETDATE()) AS DATETIME);
	SET @toDate = CAST(CONVERT(VARCHAR(10),GETDATE(),102) AS DATETIME);


	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
	  VVR.PMID AS PMID
	, WP.PARTNER_ID AS PARTNERID
	, WP.NAME AS NAME
	, VVR.Eligibility AS ELIGIBILITY
	FROM [dbo].[webpartners] AS WP
	INNER JOIN [dbo].[Partners] AS UP
	ON UP.PPVendorID = WP.PARTNER_ID
	INNER JOIN [dbo].[VendorVolumeRebate] AS VVR
	ON UP.VendorID = VVR.VendorID
	WHERE
	VVR.PMID = @pmid
	AND
	VVR.AccruedEnddt 
	BETWEEN
	@fromDate
	AND
	@toDate
	ORDER BY VVR.VendorID;
	
END
GO
