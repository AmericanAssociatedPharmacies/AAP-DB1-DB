USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[usp_GCRHistory]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<David Bohler>
-- Create date: <09/25/2017> LeeAnn edited for Beta on 09/28/2017
-- Description:	<GCR History
--				Date 20160401 is hard-coded because that is when GCR program started.>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GCRHistory]

-- Add the parameters for the stored procedure here
	--@AccountName varchar (200) = Null,
		@PMID INT = Null

AS

SET NOCOUNT ON;

BEGIN


	SELECT pm.[PMID]
		  ,pm.[AccountName]
		  ,pva.Date
		  ,pva.AAPSourceCompliance
	FROM PharmacyMaster.dbo.v_PM_AllWithAffiliates AS pm
	INNER JOIN (SELECT PMID, Date, AAPSourceCompliance 
				FROM PharmacyMaster.dbo.CH_ALLPVA_SALES
				WHERE date >= '20160401') AS pva 
		ON pm.PMID = pva.PMID
	WHERE pm.AAPAccountNo is not null 
		AND EXISTS (SELECT 1
				FROM PharmacyMaster.dbo.CH_ALLPVA_SALES AS pva
				WHERE pm.PMID = pva.PMID
				GROUP BY pva.PMID
				HAVING SUM([AAPSourceCompliance]) > 0)
		AND pm.PMID = @PMID
 
 
	 
END


GO
