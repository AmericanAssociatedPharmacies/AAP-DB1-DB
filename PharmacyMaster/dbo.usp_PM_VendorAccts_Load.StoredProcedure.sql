USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[usp_PM_VendorAccts_Load]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_PM_VendorAccts_Load]

AS

SET NOCOUNT ON;

BEGIN

	INSERT INTO [dbo].[PM_VendorAccts](PMID, VendorID, isPrimary, VendAcctNum, PVA, PaymentTerms, Source, PVAEffectiveDate)	
	SELECT ft.PMID, ft.VendorID, ft. IsPrimary, ft.VendAcctNum, ft.PVA, ft.PaymentTerms, ft.Source, ft.PVAEffectiveDate
	FROM(SELECT ROW_NUMBER() OVER(PARTITION BY dt.PMID, dt.VendorID, dt.IsPrimary, dt.Source ORDER BY(SELECT NULL)) AS RN 
			,dt.PMID, dt.VendorID, dt. IsPrimary, dt.VendAcctNum, dt.PVA, dt.PaymentTerms, dt.Source, dt.PVAEffectiveDate
			FROM(SELECT PMID, 37 AS VendorID, 1 AS IsPrimary, 0 AS [VendAcctNum], NULL AS PVA, NULL AS PaymentTerms, 'AAP' AS Source, NULL AS PVAEffectiveDate
				FROM Staging.PM_VendorAccts 
				) AS dt
		) AS ft
	WHERE ft.RN = 1
	AND NOT EXISTS(SELECT 1
					FROM [dbo].[PM_VendorAccts] AS pva
					WHERE ft.PMID = pva.PMID
					AND ft.VendorID = pva.VendorID
					AND ft.Source = pva.Source  
					)
	AND EXISTS(SELECT 1
				FROM dbo.PM_Pharmacy AS p
				WHERE ft.PMID = p.PMID	
					)


END
GO
