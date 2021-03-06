USE [ODSIntake]
GO
/****** Object:  StoredProcedure [Staging].[usp_GetContractUpData_Load]    Script Date: 12/22/2020 4:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Staging].[usp_GetContractUpData_Load]

AS

SET NOCOUNT ON;

BEGIN
BEGIN TRY


INSERT INTO [Staging].[ContractUp](DateKey
								, [case pk]
								, [inner pk]
								, [1]
								, [2]
								, [Control Rx]
								, [API ITEM #]
								, [REPLACE#]
								, [NDC #]
								, [temp-ndc number]
								, [BRAND REFER]
								, [ITEM DESCRIPTION]
								, [UNIT]
								, [SIZE]
								, [CONTRACT]
								, [INVOICE PRICE]
								, [CONTRACT PRICE]
								, [API PRICE]
								, [FEE SCHED]
								, [AWP]
								, [PROGRAM]
								, [RATE]
								, [MFG Multiple for  Rebate]
								, [NET PRICE]
								, [REBATE]
								, [% REBATE]
								, [Value Add Factor]
								, [Value Add Basis]
								, [ADR Item]
								, [ADR Expiry]
								, [MFG DATE]
								, [Work Date]
								, [API DATE]
								, [REVIEW]
								, [GPI]
								, [TempSIZE]
								, [billable size]
								, [billable cost]
								, [4% of price]
								, [rebate minus 4% of price]
								, [Comments]
								)

SELECT CAST(CONVERT(varchar(20), GETDATE(),112) as INT) AS DateKey
, [case pk]
, [inner pk]
, [1]
, [2]
, [Control Rx]
, [API ITEM #]
, [REPLACE#]
, [NDC #]
, [temp-ndc number]
, [BRAND REFER]
, [ITEM DESCRIPTION]
, [UNIT]
, [SIZE]
, [CONTRACT]
, [INVOICE PRICE]
, [CONTRACT PRICE]
, [API PRICE]
, [FEE SCHED]
, [AWP]
, [PROGRAM]
, [RATE]
, [MFG Multiple for  Rebate]
, [NET PRICE]
, [REBATE]
, [% REBATE]
, [Value Add Factor]
, [Value Add Basis]
, [ADR Item]
, [ADR Expiry]
, [MFG DATE]
, [Work Date]
, [API DATE]
, [REVIEW]
, [GPI]
, [TempSIZE]
, [billable size]
, [billable cost]
, [4% of price]
, [rebate minus 4% of price]
, [Comments]
  FROM [APICONTRACTS]...[CONTRACT-UP] WITH(NOLOCK)

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
