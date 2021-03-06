USE [Purchases]
GO
/****** Object:  StoredProcedure [Staging].[usp_CHPH_AAP_Updates]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [Staging].[usp_CHPH_AAP_Updates]


AS

SET NOCOUNT ON;

BEGIN
BEGIN TRY

	--To ensure any "-A" etc. is not part of the value.
	UPDATE x
	SET [CorrectedCAHAccountNo] = LEFT([CorrectedCAHAccountNo],6)
	FROM Staging.CAHAccount AS x
	WHERE LEN([CorrectedCAHAccountNo]) <> 6

	--Correct CAH Account # to pad leading zero's
	UPDATE x
	SET [CUSTOMER_NO] = CASE
						WHEN LEN([CUSTOMER_NO]) < 6 THEN REVERSE(LEFT(REVERSE(STUFF([CUSTOMER_NO], 1, 0, REPLICATE('0', 6 - LEN([CUSTOMER_NO])))), 6))
						ELSE [CUSTOMER_NO]
						END
	FROM [Staging].[CHPH_AAP] AS x

	--Update PMID's
	UPDATE x
	SET PMID = s.PMID
	FROM Staging.CHPH_AAP AS x 
	INNER JOIN [Staging].[CAHAccount] AS s ON x.[CUSTOMER_NO] = s.[CorrectedCAHAccountNo]
													--AND x.DateKey BETWEEN s.[AAPEffectiveDateKey] AND s.[AAPQuitDateKey]

	UPDATE x
	SET PMID = s.PMID
	FROM dbo.CHPH_AAP AS x 
	INNER JOIN [Staging].[CAHAccount] AS s ON x.[CUSTOMER_NO] = s.[CorrectedCAHAccountNo]
												--AND x.DateKey BETWEEN s.[AAPEffectiveDateKey] AND s.[AAPQuitDateKey]
	WHERE x.PMID = 0
	AND x.DateKey = YEAR(GETDATE())

	--Update Store as AAPAccountNo
	UPDATE x
	SET STORE = dt.AAPNumber
	FROM Staging.CHPH_AAP AS x
	INNER JOIN(SELECT DISTINCT PMID, CAHPrimaryAccount, AAPNumber
				FROM RXMaster.dbo.PharmacyDim
				WHERE CAHPrimaryAccount IS NOT NULL
			  ) AS dt ON x.CUSTOMER_NO = dt.CAHPrimaryAccount
	WHERE x.Store IS NULL
	OR x.Store = ''


END TRY
BEGIN CATCH

	ROLLBACK TRAN

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
	

END CATCH


END










GO
