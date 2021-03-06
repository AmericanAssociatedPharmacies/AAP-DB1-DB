USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_GCRHistoryFEV1_1_0]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		<David Bohler> 
-- Create date: <09/26/2017> Edited for Alpha by LeeAnn on 11/08/2017
-- Description:	<GCR History FE V1.1>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GCRHistoryFEV1_1_0]

-- Add the parameters for the stored procedure here
	@AccountName varchar (200) = Null,
		@PMID INT = Null

AS

SET NOCOUNT ON;

BEGIN

 	SELECT pm.[PMID]
		  ,pm.[AccountName]
		  ,pm.MailCity
		  ,pm.MailState
		  ,pm.OwnerName
		  ,gcr.AAPSourceCompliance as CurrentGCR
	FROM PharmacyMaster.dbo.v_PM_AllWithAffiliates AS pm
	--Getting the PMID and the max date that had a populated GCR
	INNER JOIN (SELECT PMID, MAX(Date) as GCRDate
				FROM PharmacyMaster.dbo.CH_ALLPVA_SALES
				WHERE AAPSourceCompliance IS NOT NULL
				AND AAPSourceCompliance <> 0.00
				GROUP BY PMID) AS cas
	ON pm.PMID = cas.PMID
	--Getting the GCR based on the PMID/Date combo from the first inner join
	INNER JOIN (SELECT PMID, Date, AAPSourceCompliance
				FROM PharmacyMaster.dbo.CH_ALLPVA_SALES) AS gcr 
	ON cas.PMID = gcr.PMID AND cas.GCRDate = gcr.Date
	WHERE pm.AAPAccountNo is not null 
		AND pm.PMID = ISNULL (@PMID, pm.PMID)
		AND pm.AccountName LIKE ISNULL(CONCAT(@AccountName,'%'), pm.AccountName)
	ORDER BY pm.AccountName ASC




--GCR History FE V1_0_0
	--SELECT pm.[PMID]
	--	  ,pm.[AccountName]
	--	  ,pm.MailCity
	--	  ,pm.MailState
	--	  ,pm.OwnerName
	--FROM PharmacyMaster.dbo.v_PM_AllWithAffiliates AS pm
	--WHERE pm.AAPAccountNo is not null
	--	AND EXISTS (SELECT 1
	--				FROM PharmacyMaster.dbo.CH_ALLPVA_SALES AS pva
	--				WHERE pm.PMID = pva.PMID
	--				GROUP BY pva.PMID
	--				HAVING SUM([AAPSourceCompliance]) > 0)	--Only PMIDs that have historical GCR
	--	AND pm.PMID = ISNULL (@PMID, pm.PMID)
	--	AND pm.AccountName LIKE ISNULL(CONCAT(@AccountName,'%'), pm.AccountName)
 --ORDER BY pm.AccountName ASC
	 
END






GO
