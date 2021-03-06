USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_import_RebateGenericIncentiveSum_Load]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_import_RebateGenericIncentiveSum_Load]

	@Year VARCHAR(4)

AS

BEGIN
BEGIN TRY


	MERGE [dbo].[import_RebateGenericIncentiveSum] AS t
	USING(SELECT @Year AS [Year], pd.PMID, s.APIAccountNo, s.BUSCLS, s.Affiliate, s.AccountName, s.City, s.[State], s.Territory
		, s.TotalGenericsSales, s.EligGenericsforRebate, s.GenericLoyaltyRebate, s.FirstPaymentAmt
		, s.CheckFeeFirstPayment, s.NetPaymentFirstPayment, s.PayAccountFirstPayment, s.PaymentModeFirstPayment
		, s.SecondPaymentAmt, s.CheckFeeSecondPayment, s.NetPaymentSecondPayment, s.PayAccountSecondPayment, s.BusClsSecondPayment
		, s.AffiliateSecondPayment, s.NegativeRebatesCollectedSecondPayment, s.SecondPaymentCollectFC, s.SecondPaymentCollectNegativeRebate
		FROM Staging.vwGenericIncentive AS s
		LEFT OUTER JOIN RXMaster.dbo.PharmacyDim AS pd ON s.[APIAccountNo] = pd.[APINumber]
		) AS s ([Year], PMID, APIAccountNo, BUSCLS, Affiliate, AccountName, City, [State], Territory
				, TotalGenericsSales, EligGenericsforRebate, GenericLoyaltyRebate, FirstPaymentAmt
				, CheckFeeFirstPayment, NetPaymentFirstPayment, PayAccountFirstPayment, PaymentModeFirstPayment
				, SecondPaymentAmt, CheckFeeSecondPayment, NetPaymentSecondPayment, PayAccountSecondPayment, BusClsSecondPayment
				, AffiliateSecondPayment, NegativeRebatesCollectedSecondPayment, SecondPaymentCollectFC, SecondPaymentCollectNegativeRebate
				) ON t.[Year] = s.[Year]
					AND t.PMID = s.PMID

	WHEN MATCHED THEN
	UPDATE
	SET APIAccountNo = s.APIAccountNo
	, BUSCLS = s.BUSCLS
	, Affiliate = s.Affiliate
	, AccountName = s.AccountName
	, City = s.City
	, [State] = s.[State]
	, Territory = s.Territory
	, TotalGenericsSales = s.TotalGenericsSales
	, EligGenericsforRebate = s.EligGenericsforRebate
	, GenericLoyaltyRebate = s.GenericLoyaltyRebate
	, FirstPaymentAmt = s.FirstPaymentAmt
	, CheckFeeFirstPayment = s.CheckFeeFirstPayment
	, NetPaymentFirstPayment = s.NetPaymentFirstPayment
	, PayAccountFirstPayment = s.PayAccountFirstPayment
	, PaymentModeFirstPayment = s.PaymentModeFirstPayment
	, SecondPaymentAmt = s.SecondPaymentAmt
	, CheckFeeSecondPayment = s.CheckFeeSecondPayment
	, NetPaymentSecondPayment = s.NetPaymentSecondPayment
	, PayAccountSecondPayment = s.PayAccountSecondPayment
	, BusClsSecondPayment = s.BusClsSecondPayment
	, AffiliateSecondPayment = s.AffiliateSecondPayment
	, NegativeRebatesCollectedSecondPayment = s.NegativeRebatesCollectedSecondPayment
	, SecondPaymentCollectFC = s.SecondPaymentCollectFC
	, SecondPaymentCollectNegativeRebate = s.SecondPaymentCollectNegativeRebate

	WHEN NOT MATCHED THEN
	INSERT([Year], PMID, APIAccountNo, BUSCLS, Affiliate, AccountName, City, [State], Territory
				, TotalGenericsSales, EligGenericsforRebate, GenericLoyaltyRebate, FirstPaymentAmt
				, CheckFeeFirstPayment, NetPaymentFirstPayment, PayAccountFirstPayment, PaymentModeFirstPayment
				, SecondPaymentAmt, CheckFeeSecondPayment, NetPaymentSecondPayment, PayAccountSecondPayment, BusClsSecondPayment
				, AffiliateSecondPayment, NegativeRebatesCollectedSecondPayment, SecondPaymentCollectFC, SecondPaymentCollectNegativeRebate
				)
	VALUES(s.[Year], s.PMID, s.APIAccountNo, s.BUSCLS, s.Affiliate, s.AccountName, s.City, s.[State], s.Territory
				, s.TotalGenericsSales, s.EligGenericsforRebate, s.GenericLoyaltyRebate, s.FirstPaymentAmt
				, s.CheckFeeFirstPayment, s.NetPaymentFirstPayment, s.PayAccountFirstPayment, s.PaymentModeFirstPayment
				, s.SecondPaymentAmt, s.CheckFeeSecondPayment, s.NetPaymentSecondPayment, s.PayAccountSecondPayment, s.BusClsSecondPayment
				, s.AffiliateSecondPayment, s.NegativeRebatesCollectedSecondPayment, s.SecondPaymentCollectFC, s.SecondPaymentCollectNegativeRebate
			);


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
