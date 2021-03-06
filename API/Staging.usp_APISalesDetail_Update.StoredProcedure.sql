USE [API]
GO
/****** Object:  StoredProcedure [Staging].[usp_APISalesDetail_Update]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Staging].[usp_APISalesDetail_Update]

AS

SET NOCOUNT ON;

BEGIN 
BEGIN TRY

	UPDATE x
	SET Rebate = (Rebate * Qty)
	FROM Staging.APISalesDetail AS x
	where QTY >= 1	
	AND x.Rebate > 0.00
	
	UPDATE x
	SET [ConferenceCreditPercentage] = ([DiscountPercentage] - 20.00)
	FROM [Staging].[APISalesDetail] AS x
	WHERE [DiscountPercentage] = 21.00

	UPDATE x
	SET [ConferenceCreditAmount] = (ExtSales * ([ConferenceCreditPercentage]/100))
	FROM [Staging].[APISalesDetail] AS x
	WHERE [DiscountPercentage] = 21.00

	UPDATE x
	SET PMID = p.PMID
	FROM [Staging].[APISalesDetail] AS x
	INNER JOIN RXMaster.[dbo].[vwAPIAccount] AS p ON x.WHAccountID = p.[APIAccountNo]	
	WHERE x.InvDate BETWEEN p.[APIEffectiveDate] AND p.[APIQuitDate]

	--Update any PMID's that do not match on Production.
	UPDATE x
	SET PMID = p.PMID
	FROM [dbo].[APISalesDetail] AS x
	INNER JOIN RXMaster.[dbo].[vwAPIAccount] AS p ON x.WHAccountID = p.[APIAccountNo]	
	WHERE x.InvDate BETWEEN p.[APIEffectiveDate] AND p.[APIQuitDate]
	AND x.PMID <> p.PMID

	--S2K for returns and credits
	UPDATE x
	SET UnitAmount = CASE
					 WHEN TransTypeCode IN ('R', 'C') AND UnitAmount > 0  THEN (-1 * UnitAmount)
					 ELSE UnitAmount
					 END
	, LineAmt = CASE
				WHEN TransTypeCode IN ('R', 'C') AND LineAmt > 0  THEN (LineAmt * -1)
				ELSE LineAmt
				END
	, ExtSales = CASE
				WHEN TransTypeCode IN ('R', 'C') AND ExtSales > 0  THEN (ExtSales * -1)
				ELSE ExtSales
				END 
	, Rebate = CASE
				WHEN TransTypeCode IN ('R', 'C') AND Rebate > 0  THEN (Rebate * -1)
				ELSE Rebate
				END 
	, ConferenceCreditAmount = CASE
				WHEN TransTypeCode IN ('R', 'C') AND ConferenceCreditAmount > 0  THEN (ConferenceCreditAmount * -1)
				ELSE ConferenceCreditAmount
				END 
	FROM Staging.APISalesDetail AS x
	WHERE InvDate >= '20200801'


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

	

END CATCH
END

GO
