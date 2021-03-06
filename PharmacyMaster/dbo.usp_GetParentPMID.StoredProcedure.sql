USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetParentPMID]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetParentPMID]

	@PMID INT

AS

SET NOCOUNT ON;

BEGIN

	SELECT pm.PMID
	FROM(SELECT AAPParentNo
			FROM dbo.PM_Pharmacy
			WHERE PMID = @PMID
		) AS dt
	INNER JOIN dbo.PM_Pharmacy AS pm ON dt.AAPParentNo = pm.AAPParentNo
										AND dt.AAPParentNo = pm.AAPAccountNo

END
GO
