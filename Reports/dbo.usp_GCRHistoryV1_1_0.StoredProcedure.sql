USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_GCRHistoryV1_1_0]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<David Bohler>
-- Create date: <09/25/2017> LeeAnn edited for ALPHA on 11/08/2017
-- Description:	<GCR History
--				Date 20160401 is hard-coded because that is when GCR program started.>
--Added date range and edited SUM(AAPSourceCompliance) to be <>, rather than > because > was filtering out
--some accounts that have an summed up negative GCR. -LA 11/8/2017
-- =============================================
CREATE PROCEDURE [dbo].[usp_GCRHistoryV1_1_0]

-- Add the parameters for the stored procedure here
	--@AccountName varchar (200) = Null,
		@PMID INT = Null
		,@StartDate DATETIME = NULL
		,@EndDate DATETIME = NULL
AS

SET NOCOUNT ON;

BEGIN
	
	DECLARE @p1 DATETIME
	, @p2 DATETIME

	--Set default values when input parameters are NULL
	SET @p1 = ISNULL(CONVERT(DATETIME, @StartDate), '20160401') --GCR Program started on 20160401
	SET @p2 = ISNULL(CONVERT(DATETIME, @EndDate), DATEADD(DAY, 1, DATEDIFF(DAY, 0, GETDATE())))

	SELECT pm.[PMID]
	,pm.[AccountName]
	,pva.Date
	,pva.AAPSourceCompliance
	FROM PharmacyMaster.dbo.v_PM_AllWithAffiliates AS pm
	INNER JOIN (SELECT PMID, Date, AAPSourceCompliance 
				FROM PharmacyMaster.dbo.CH_ALLPVA_SALES
				WHERE Date >= @p1
				AND Date < @p2
				) AS pva ON pm.PMID = pva.PMID
	WHERE pm.AAPAccountNo is not null 
	AND EXISTS (SELECT 1
			FROM PharmacyMaster.dbo.CH_ALLPVA_SALES AS pva
			WHERE pm.PMID = pva.PMID
			GROUP BY pva.PMID
			HAVING SUM([AAPSourceCompliance]) <> 0
			)
		AND pm.PMID = ISNULL(@PMID, pm.PMID)
 
 
	 
END





GO
