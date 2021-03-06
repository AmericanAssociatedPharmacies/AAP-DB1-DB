USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[usp_Active_AAP_RX30]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[usp_Active_AAP_RX30]

AS

SET NOCOUNT ON;

BEGIN

	SELECT DISTINCT dt.ServiceProviderID, dt.AccountName
	FROM(SELECT NCPDP AS ServiceProviderID
			, AccountName
		   FROM dbo.PM_Pharmacy
		   WHERE AAPQuitDate IS NULL
 
		   UNION ALL
 
		   SELECT NPI
		   , AccountName
		   FROM dbo.PM_Pharmacy
		   WHERE AAPQuitDate IS NULL
 
		   UNION ALL
 
		   SELECT NCPDP
		   , AccountName
		   FROM dbo.PM_Pharmacy
		   WHERE APIStatus = 'Active'
 
		   UNION ALL
 
		   SELECT NPI
		   , AccountName
		   FROM dbo.PM_Pharmacy
		   WHERE APIStatus = 'Active'
		   ) AS dt
	WHERE dt.ServiceProviderID LIKE '%[a-zA-Z0-9]%'
	ORDER BY dt.AccountName ASC

END



GO
