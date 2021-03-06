USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_Import_APIMonthlyRebates_New_Load]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[usp_Import_APIMonthlyRebates_New_Load]

	@Date VARCHAR(20)

AS

SET NOCOUNT ON;

BEGIN
BEGIN TRY

	DECLARE @Date2 DATETIME

	SET @Date2 = CONVERT(DATETIME,@Date)

	TRUNCATE TABLE [dbo].[Import_APIMonthlyRebates_New];

	MERGE [dbo].[Import_APIMonthlyRebates] AS t
	USING(SELECT CONVERT(DATETIME,@Date) AS Date, [PMID], [APIAccountNo], [Pharmacy Name], [Business Class], [Rebate Administrator], [API Generic Sales], [API Brand Sales], [API OTC Sales]
			, [API Total Whse Sales], [API Whse Gross Rebate], [Adjust for Promotions], [Adjust for Returns], [Adjust for Rebate Errors], [Generic Admin Fee], InstantRebate, [API WHSE REBATE for Payout], [Less Negative Rebates], [Unpaid Finance Charges]
			, [Check Fee], [Held Rebate], [Rebate to Pay Acct/Admin], [Less Group Admin], [Net Rebate to Store], [Pay Account], [Print Rebate Letter], [Brand Credits Disbursed], [Accelerated Pay Discount], [Avg Rebate Percentage]
			, [A/P Payment Mode], [Previous Month Held Rebate], [PostAveRebatePerc], [True10Sales], [True10Rebate], [AreteRebateFee], [APIGenericSalesTier1], [APIGenericSalesTier2], [APIGenericRebateTier1], [APIGenericRebateTier2]
			, [ConferenceCreditOnePercent]
			FROM [Staging].[vwAPIMonthlyRebates]
			) AS s (Date, [PMID], [APIAccountNo], [Pharmacy Name], [Business Class], [Rebate Administrator], [API Generic Sales], [API Brand Sales], [API OTC Sales]
			, [API Total Whse Sales], [API Whse Gross Rebate], [Adjust for Promotions], [Adjust for Returns], [Adjust for Rebate Errors], [Generic Admin Fee], InstantRebate, [API WHSE REBATE for Payout], [Less Negative Rebates], [Unpaid Finance Charges]
			, [Check Fee], [Held Rebate], [Rebate to Pay Acct/Admin], [Less Group Admin], [Net Rebate to Store], [Pay Account], [Print Rebate Letter], [Brand Credits Disbursed], [Accelerated Pay Discount], [Avg Rebate Percentage]
			, [A/P Payment Mode], [Previous Month Held Rebate], [PostAveRebatePerc], [True10Sales], [True10Rebate], [AreteRebateFee], [APIGenericSalesTier1], [APIGenericSalesTier2], [APIGenericRebateTier1], [APIGenericRebateTier2]
			, [ConferenceCreditOnePercent]
			) 
	ON (t.Date = s.Date
	AND t.PMID = s.PMID
	)

	WHEN MATCHED THEN
	UPDATE SET 
	[APIAccountNo] = s.[APIAccountNo]
	, [Pharmacy Name] = s.[Pharmacy Name]
	, [Business Class] = s. [Business Class]
	, [Rebate Administrator] = s.[Rebate Administrator]
	, [API Generic Sales] = s.[API Generic Sales]
	, [API Brand Sales] = s.[API Brand Sales]
	, [API OTC Sales] = s.[API OTC Sales]
	, [API Total Whse Sales] = s.[API Total Whse Sales]
	, [API Whse Gross Rebate] = s.[API Whse Gross Rebate]
	, [Adjust for Promotions] = s.[Adjust for Promotions]
	, [Adjust for Returns] = s.[Adjust for Returns]
	, [Adjust for Rebate Errors] = s.[Adjust for Rebate Errors]
	, [Generic Admin Fee] = s.[Generic Admin Fee]
	, InstantRebate = s.InstantRebate
	, [API WHSE REBATE for Payout] = s.[API WHSE REBATE for Payout]
	, [Less Negative Rebates] = s.[Less Negative Rebates]
	, [Unpaid Finance Charges] = s.[Unpaid Finance Charges]
	, [Check Fee] = s.[Check Fee]
	, [Held Rebate] = s.[Held Rebate]
	, [Rebate to Pay Acct/Admin] = s.[Rebate to Pay Acct/Admin]
	, [Less Group Admin] = s.[Less Group Admin]
	, [Net Rebate to Store] = s.[Net Rebate to Store]
	, [Pay Account] = s.[Pay Account]
	, [Print Rebate Letter] = s.[Print Rebate Letter]
	, [Brand Credits Disbursed] = s.[Brand Credits Disbursed]
	, [Accelerated Pay Discount] = s.[Accelerated Pay Discount]
	, [Avg Rebate Percentage] = s.[Avg Rebate Percentage]
	, [A/P Payment Mode] = s.[A/P Payment Mode]
	, [Previous Month Held Rebate] = s.[Previous Month Held Rebate]
	, [PostAveRebatePerc] = s.[PostAveRebatePerc]
	, [True10Sales] = s.[True10Sales]
	, [True10Rebate] = s.[True10Rebate]
	, [AreteRebateFee] = s.[AreteRebateFee]
	, [APIGenericSalesTier1] = s.[APIGenericSalesTier1]
	, [APIGenericSalesTier2] = s.[APIGenericSalesTier2]
	, [APIGenericRebateTier1] = s.[APIGenericRebateTier1]
	, [APIGenericRebateTier2] = s.[APIGenericRebateTier2]
	, [ConferenceCreditOnePercent] = s.[ConferenceCreditOnePercent]



	WHEN NOT MATCHED THEN 
	INSERT([Date], [PMID], [APIAccountNo], [Pharmacy Name], [Business Class], [Rebate Administrator], [API Generic Sales], [API Brand Sales], [API OTC Sales]
	, [API Total Whse Sales], [API Whse Gross Rebate], [Adjust for Promotions], [Adjust for Returns], [Adjust for Rebate Errors], [Generic Admin Fee], InstantRebate, [API WHSE REBATE for Payout], [Less Negative Rebates], [Unpaid Finance Charges]
	, [Check Fee], [Held Rebate], [Rebate to Pay Acct/Admin], [Less Group Admin], [Net Rebate to Store], [Pay Account], [Print Rebate Letter], [Brand Credits Disbursed], [Accelerated Pay Discount], [Avg Rebate Percentage]
	, [A/P Payment Mode], [Previous Month Held Rebate], [PostAveRebatePerc], [True10Sales], [True10Rebate], [AreteRebateFee], [APIGenericSalesTier1], [APIGenericSalesTier2], [APIGenericRebateTier1], [APIGenericRebateTier2]
	, [ConferenceCreditOnePercent])
	VALUES(s.[Date], s.[PMID], s.[APIAccountNo], s.[Pharmacy Name], s.[Business Class], s.[Rebate Administrator], s.[API Generic Sales], s.[API Brand Sales], s.[API OTC Sales]
		, s.[API Total Whse Sales], s.[API Whse Gross Rebate], s.[Adjust for Promotions], s.[Adjust for Returns], s.[Adjust for Rebate Errors], s.[Generic Admin Fee], s.InstantRebate, s.[API WHSE REBATE for Payout], s.[Less Negative Rebates], s.[Unpaid Finance Charges]
		, s.[Check Fee], s.[Held Rebate], s.[Rebate to Pay Acct/Admin], s.[Less Group Admin], s.[Net Rebate to Store], s.[Pay Account], s.[Print Rebate Letter], s.[Brand Credits Disbursed], s.[Accelerated Pay Discount], s.[Avg Rebate Percentage]
		, s.[A/P Payment Mode], s.[Previous Month Held Rebate], s.[PostAveRebatePerc], s.[True10Sales], s.[True10Rebate], s.[AreteRebateFee], s.[APIGenericSalesTier1], s.[APIGenericSalesTier2], s.[APIGenericRebateTier1], s.[APIGenericRebateTier2]
		, s.[ConferenceCreditOnePercent]
		)
	;

	--Update PMID
	UPDATE x
	SET PMID = dt.PMID
	FROM [dbo].[Import_APIMonthlyRebates] AS x
	INNER JOIN(SELECT DISTINCT PMID, APINumber
				FROM RXMaster.dbo.PharmacyDim	
				) AS dt ON x.APIAccountNo = dt.APINumber
	WHERE x.[Business Class] <> 'C99'
	AND x.PMID = ''
	OR x.PMID IS NULL

	--Set PostAveRebatePerc value
	UPDATE x	
	SET [PostAveRebatePerc] = [Avg Rebate Percentage] 
	FROM [dbo].[Import_APIMonthlyRebates] AS x 
	WHERE [PostAveRebatePerc] != 'Contact TM'  
	and DATE = @Date2

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
