USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_PatDivRebate_Load]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_PatDivRebate_Load]

	@Year VARCHAR(50)

AS


SET NOCOUNT ON;

BEGIN

	INSERT INTO [dbo].[import_RebatePatDivRebate](Year, PMID, AccountName, AAPAccountNo, AAPParentNo, UDNo, APIAccountNo, Affiliate, AAPEffectiveDate, AAPQuitDate, IsMC, MCQuitDate, MCContribution, MLAdminFee, HighVolIncentive, AAPPVAVolAdminFee, AAPPVAVolAdminFeeRetained, AAPPVAGenAdminFee, AAPPVAGenAdminFeeRetained, CardinalAnnualRebate, SubtotalCardinal, CardinalUpfrontAdmin, CardinalHVTotal, AAPParentContribution, WHBrandYear, WHGenYear, WHGenContribution, WHOTCYear, MCCardinalAPIWhseContribution, PrelimAllocation, Under15deleted, FinalAllocation, HalfOfAllocation, PaymentMethod, CheckFee, FirstPayment, SecondPayment, PatDivRebate)
	SELECT @Year AS Year, PMID, AccountName, AAPAccountNo, AAPParentNo, UDNo, APIAccountNo, Affiliate, AAPEffectiveDate, AAPQuitDate, IsMC, MCQuitDate, MCContribution, MLAdminFee, HighVolIncentive, AAPPVAVolAdminFee, AAPPVAVolAdminFeeRetained, AAPPVAGenAdminFee, AAPPVAGenAdminFeeRetained, CardinalAnnualRebate, SubtotalCardinal, CardinalUpfrontAdmin, CardinalHVTotal, AAPParentContribution, WHBrandYear, WHGenYear, WHGenContribution, WHOTCYear, MCCardinalAPIWhseContribution, PrelimAllocation, Under15deleted, FinalAllocation, HalfOfAllocation, PaymentMethod, CheckFee, FirstPayment, SecondPayment, PatDivRebate
	FROM dbo.vwImportRebatePatDiv

END
GO
