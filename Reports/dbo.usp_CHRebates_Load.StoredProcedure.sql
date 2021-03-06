USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_CHRebates_Load]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[usp_CHRebates_Load]

	@Date DATE

AS

SET NOCOUNT ON;

BEGIN
BEGIN TRY

	MERGE [dbo].[import_CHRebate] AS target 
	USING (SELECT @Date AS [Date], [Marker], [PMID], [Primary CA#], [Division], [API#], [Account Name], [City], [ST], [SumOfExtended Sales], [AAP Volume Admin Fee], [RxPlusAdminFee]
				, [Bs Class], [Affiliation], [Affiliate Admin Fee], [SumOfCCA = AAP Generics 872, 25676, 25677], [SumOfCCA = 26776 AAP Excluded Generic Rx Prod]
				, [SumOfTotal Generics], [Est Generic Admin Fee], [Calculated generic rebate], [Leader Rebate], [MSI Rebate], [Pay to Store], [Pay to Affiliate Office]
				, [Total to Pay Out], [Territory Manager], [Pay Account], [Effective Rebate%], [HRTA], [Sort Code], [Check Fee], [A/P Payment Mode], [AdjustedGenericSource]
				, [AdjustedExtSales], [PriceProtection], [PriceProtectionRebate], [PrescribedWellnessFee], [GenericRebateAdjustment], [PriceProtectionAdjustment], [VolAdminFeeAdj]
				, [AffilAdminFeeAdj], [GenericAdminFeeAdj], [NCPAMembershipFee], [FloridaPhcyAssocDeduct], [AreteEligible], [AretePerformanceRebate], [TotalRXlessExcludedItems]
				, [COGRebate], [COGRebate%], [COGRebateAdjustment], [COGEligibleSales]
					FROM [dbo].[vw_import_CHRebate]
						) AS source ([Date], [Marker], [PMID], [Primary CA#], [Division], [API#], [Account Name], [City], [ST], [SumOfExtended Sales], [AAP Volume Admin Fee], [RxPlusAdminFee]
													, [Bs Class], [Affiliation], [Affiliate Admin Fee], [SumOfCCA = AAP Generics 872, 25676, 25677], [SumOfCCA = 26776 AAP Excluded Generic Rx Prod]
											, [SumOfTotal Generics], [Est Generic Admin Fee], [Calculated generic rebate], [Leader Rebate], [MSI Rebate], [Pay to Store], [Pay to Affiliate Office]
											, [Total to Pay Out], [Territory Manager], [Pay Account], [Effective Rebate%], [HRTA], [Sort Code], [Check Fee], [A/P Payment Mode], [AdjustedGenericSource]
											, [AdjustedExtSales], [PriceProtection], [PriceProtectionRebate], [PrescribedWellnessFee], [GenericRebateAdjustment], [PriceProtectionAdjustment], [VolAdminFeeAdj]
											, [AffilAdminFeeAdj], [GenericAdminFeeAdj], [NCPAMembershipFee], [FloridaPhcyAssocDeduct], [AreteEligible], [AretePerformanceRebate], [TotalRXlessExcludedItems]
											, [COGRebate], [COGRebate%], [COGRebateAdjustment], [COGEligibleSales]
											)
	ON (target.Date = source.Date
			AND target.PMID = source.PMID
			)
	WHEN MATCHED THEN 
	UPDATE SET Marker = source.Marker
			,[Primary CA#] = source.[Primary CA#]
			,[Division] = source.[Division]
			,[API#] = source.[API#]
			,[Account Name] = source.[Account Name]
			,[City] = source.[Account Name]
			,[ST] = source.[ST]
			,[SumOfExtended Sales] = source.[SumOfExtended Sales]
			,[AAP Volume Admin Fee] = source.[AAP Volume Admin Fee]
			,[RxPlusAdminFee] = source.[RxPlusAdminFee]
			,[Bs Class] = source.[Bs Class]
			,[Affiliation] = source.[Affiliation]
			,[Affiliate Admin Fee] = source.[Affiliate Admin Fee]
			,[SumOfCCA = AAP Generics 872, 25676, 25677] = source.[SumOfCCA = AAP Generics 872, 25676, 25677]
			,[SumOfCCA = 26776 AAP Excluded Generic Rx Prod] = source.[SumOfCCA = 26776 AAP Excluded Generic Rx Prod]
			,[SumOfTotal Generics] = source.[SumOfTotal Generics]
			,[Est Generic Admin Fee] = source.[Est Generic Admin Fee]
			,[Calculated generic rebate] = source.[Calculated generic rebate]
			,[Leader Rebate] = source.[Leader Rebate]
			,[MSI Rebate] = source.[MSI Rebate]
			,[Pay to Store] = source.[Pay to Store]
			,[Pay to Affiliate Office] = source.[Pay to Affiliate Office]
			,[Total to Pay Out] = source.[Total to Pay Out] 
		    ,[Territory Manager] = source.[Territory Manager]
			,[Pay Account] = source.[Pay Account] 
			,[Effective Rebate%] = source.[Effective Rebate%]
			,[HRTA] = source.[HRTA]
			,[Sort Code] = source.[Sort Code]
		    ,[Check Fee] = source.[Check Fee]
		    ,[A/P Payment Mode] = source.[A/P Payment Mode]
			,[AdjustedGenericSource] = source.[AdjustedGenericSource]
			,[AdjustedExtSales] = source.[AdjustedExtSales]
		    ,[PriceProtection] = source.[PriceProtection]
			,[PriceProtectionRebate] = source.[PriceProtectionRebate]
			,[PrescribedWellnessFee] = source.[PrescribedWellnessFee]
		    ,[GenericRebateAdjustment] = source.[GenericRebateAdjustment]
			,[PriceProtectionAdjustment] = source.[PriceProtectionAdjustment]
			,[VolAdminFeeAdj] = source.[VolAdminFeeAdj]
			,[AffilAdminFeeAdj] = source.[AffilAdminFeeAdj]
			,[GenericAdminFeeAdj] = source.[GenericAdminFeeAdj]
			,[NCPAMembershipFee] = source.[NCPAMembershipFee]
			,[FloridaPhcyAssocDeduct] = source.[FloridaPhcyAssocDeduct]
			,[AreteEligible] = source.[AreteEligible]
	        ,[AretePerformanceRebate] = source.[AretePerformanceRebate]
			,[TotalRXlessExcludedItems] = source.[TotalRXlessExcludedItems]
			,[COGRebate] = source.[COGRebate]
			,[COGRebate%] = source.[COGRebate%]
			,[COGRebateAdjustment] = source.[COGRebateAdjustment]
			,[COGEligibleSales] = source.[COGEligibleSales]
			
	WHEN NOT MATCHED THEN
	INSERT([Date], [Marker], [PMID], [Primary CA#], [Division], [API#], [Account Name], [City], [ST], [SumOfExtended Sales], [AAP Volume Admin Fee], [RxPlusAdminFee]
				, [Bs Class], [Affiliation], [Affiliate Admin Fee], [SumOfCCA = AAP Generics 872, 25676, 25677], [SumOfCCA = 26776 AAP Excluded Generic Rx Prod]
				, [SumOfTotal Generics], [Est Generic Admin Fee], [Calculated generic rebate], [Leader Rebate], [MSI Rebate], [Pay to Store], [Pay to Affiliate Office]
				, [Total to Pay Out], [Territory Manager], [Pay Account], [Effective Rebate%], [HRTA], [Sort Code], [Check Fee], [A/P Payment Mode], [AdjustedGenericSource]
				, [AdjustedExtSales], [PriceProtection], [PriceProtectionRebate], [PrescribedWellnessFee], [GenericRebateAdjustment], [PriceProtectionAdjustment], [VolAdminFeeAdj]
				, [AffilAdminFeeAdj], [GenericAdminFeeAdj], [NCPAMembershipFee], [FloridaPhcyAssocDeduct], [AreteEligible], [AretePerformanceRebate], [TotalRXlessExcludedItems]
				, [COGRebate], [COGRebate%], [COGEligibleSales], [COGRebateAdjustment]
				)
	VALUES (source.[Date], source.[Marker], source.[PMID], source.[Primary CA#], source.[Division], source.[API#], source.[Account Name], source.[City], source.[ST], source.[SumOfExtended Sales], 
			source.[AAP Volume Admin Fee], source.[RxPlusAdminFee], source.[Bs Class], source.[Affiliation], source.[Affiliate Admin Fee], source.[SumOfCCA = AAP Generics 872, 25676, 25677], 
			source.[SumOfCCA = 26776 AAP Excluded Generic Rx Prod], source.[SumOfTotal Generics], source.[Est Generic Admin Fee], source.[Calculated generic rebate], source.[Leader Rebate], source.[MSI Rebate],
			source. [Pay to Store], source.[Pay to Affiliate Office], source.[Total to Pay Out], source.[Territory Manager], source.[Pay Account], source.[Effective Rebate%], source.[HRTA], source.[Sort Code], 
			source.[Check Fee], source.[A/P Payment Mode], source.[AdjustedGenericSource], source.[AdjustedExtSales], source.[PriceProtection], source.[PriceProtectionRebate], source.[PrescribedWellnessFee], 
			source.[GenericRebateAdjustment], source.[PriceProtectionAdjustment], source.[VolAdminFeeAdj], source.[AffilAdminFeeAdj], source.[GenericAdminFeeAdj], source.[NCPAMembershipFee], source.[FloridaPhcyAssocDeduct], 
			source.[AreteEligible], source.[AretePerformanceRebate], source.[TotalRXlessExcludedItems], source.[COGRebate], source.[COGRebate%], source.[COGEligibleSales], source.[COGRebateAdjustment]
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
        )

		INSERT INTO PharmacyMaster.dbo.ErrorLog(ErrorNumber, ErrorLine, ErrorState, ErrorSeverity, ErrorProcedure, ErrorMessage)
		VALUES(@ErrorNumber, @ErrorLine, @ErrorState, @ErrorSeverity, @ErrorProcedure, @ErrorMessage)



END CATCH

END


GO
