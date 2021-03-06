USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[usp_Groups_Xref_Load]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Groups_Xref_Load]

AS


SET NOCOUNT ON;

BEGIN
BEGIN TRY

	INSERT INTO [dbo].[PM_Groups_xref]([PMID], Group_ID, Source)
	SELECT dt.PMID, dt.GroupID, dt.Source
	FROM(SELECT PMID, GroupID, 'AAP' AS Source
			FROM Staging.PM_AffiliateHistory
		) AS dt
	WHERE NOT EXISTS(SELECT 1 
						FROM [dbo].[PM_Groups_xref] AS x
						WHERE dt.PMID = x.PMID
						AND dt.GroupID = x.Group_ID
						AND dt.Source = x.Source
						)
	AND dt.GroupID IS NOT NULL
	AND dt.PMID <> 999999
	ORDER BY PMID ASC

END TRY
BEGIN CATCH


	DECLARE @ErrorMessage NVARCHAR(4000)
        , @ErrorNumber INT
        , @ErrorSeverity INT
        , @ErrorState INT
        , @ErrorLine INT
        , @ErrorProcedure NVARCHAR(200)

		SELECT 
        @ErrorNumber = ERROR_NUMBER()
        , @ErrorSeverity = ERROR_SEVERITY()
        , @ErrorState = ERROR_STATE()
        , @ErrorLine = ERROR_LINE()
        , @ErrorProcedure = ISNULL(ERROR_PROCEDURE(), '-')
		, @ErrorMessage = ERROR_MESSAGE();

		RAISERROR 
        (@ErrorMessage 
        , @ErrorSeverity, 1               
        , @ErrorNumber    -- parameter: original error number.
        , @ErrorSeverity  -- parameter: original error severity.
        , @ErrorState     -- parameter: original error state.
        , @ErrorProcedure -- parameter: original error procedure name.
        , @ErrorLine       -- parameter: original error line number.
        );

	ROLLBACK TRAN

END CATCH
END



GO
