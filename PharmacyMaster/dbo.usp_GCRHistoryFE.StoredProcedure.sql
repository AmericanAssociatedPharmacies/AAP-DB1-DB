USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[usp_GCRHistoryFE]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<David Bohler> 
-- Create date: <09/26/2017> Edited for Beta by LeeAnn on 09/28/2017
-- Description:	<GCR History FE>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GCRHistoryFE]

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
	FROM PharmacyMaster.dbo.v_PM_AllWithAffiliates AS pm
	WHERE pm.AAPAccountNo is not null
		AND EXISTS (SELECT 1
					FROM PharmacyMaster.dbo.CH_ALLPVA_SALES AS pva
					WHERE pm.PMID = pva.PMID
					GROUP BY pva.PMID
					HAVING SUM([AAPSourceCompliance]) > 0)	--Only PMIDs that have historical GCR
		AND pm.PMID = ISNULL (@PMID, pm.PMID)
		AND pm.AccountName LIKE ISNULL(CONCAT(@AccountName,'%'), pm.AccountName)
 ORDER BY pm.AccountName ASC
	 
END



GO
