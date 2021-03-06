USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_setPM_RebatesCHAAPNullToZero_TEST]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <07/02/2012>
-- Description:	When Changing the ALL_Volume through UI need to recalculate the combined totals after an update has occurred
-- =============================================
CREATE PROCEDURE [dbo].[sppm_setPM_RebatesCHAAPNullToZero_TEST]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table
--UPdate Totals 
	UPDATE Reports..pm_rebates_Chaap_Test set AAPGenericAdminFeePaidToPipco = 0 where AAPGenericAdminFeePaidToPipco is null;
	UPDATE Reports..pm_rebates_Chaap_Test set ExtendedSales = 0 where ExtendedSales is null;
	UPDATE Reports..pm_rebates_Chaap_Test set AAPVolumeAdminFee = 0 where AAPVolumeAdminFee is null;
	UPDATE Reports..pm_rebates_Chaap_Test set AAPVolumeAdminFeePaidToAffiliate = 0 where AAPVolumeAdminFeePaidToAffiliate is null;
	UPDATE Reports..pm_rebates_Chaap_Test set BrandRxSales = 0 where BrandRxSales is null;
	UPDATE Reports..pm_rebates_Chaap_Test set SourceGenericSales = 0 where SourceGenericSales is null;
	UPDATE Reports..pm_rebates_Chaap_Test set ExcludedGenericSales = 0 where ExcludedGenericSales is null;
	UPDATE Reports..pm_rebates_Chaap_Test set TotalGenericSales = 0 where TotalGenericSales is null;
	UPDATE Reports..pm_rebates_Chaap_Test set AAPGenericAdminFee = 0 where AAPGenericAdminFee is null;
	UPDATE Reports..pm_rebates_Chaap_Test set IPAGenericAdminFee = 0 where IPAGenericAdminFee is null;
	UPDATE Reports..pm_rebates_Chaap_Test set GenericRebate = 0 where GenericRebate is null;
	UPDATE Reports..pm_rebates_Chaap_Test set LeaderRebate = 0 where LeaderRebate is null;
	UPDATE Reports..pm_rebates_Chaap_Test set MSIRebate = 0 where MSIRebate is null;
	UPDATE Reports..pm_rebates_Chaap_Test set PayToStore = 0 where PayToStore is null;
	UPDATE Reports..pm_rebates_Chaap_Test set PayToAffiliateOffice = 0 where PayToAffiliateOffice is null;
	UPDATE Reports..pm_rebates_Chaap_Test set TotalToPayOut = 0 where TotalToPayOut is null;
	UPDATE Reports..pm_rebates_Chaap_Test set EffRebatePerc = 0 where EffRebatePerc is null;
	UPDATE Reports..pm_rebates_Chaap_Test set HRTA = 0 where HRTA is null;
	UPDATE Reports..pm_rebates_Chaap_Test set RxplusAdminFee = 0 where RxplusAdminFee is null;

    -- New 

	UPDATE Reports..pm_rebates_Chaap_Test set ContractPerformanceRebate = 0 where ContractPerformanceRebate is null;
	UPDATE Reports..pm_rebates_Chaap_Test set [Check Fee] = 0 where [Check Fee] is null;
	UPDATE Reports..pm_rebates_Chaap_Test set PriceProtectionRebate = 0 where PriceProtectionRebate is null;
	UPDATE Reports..pm_rebates_Chaap_Test set AdjustedExtSales = 0 where AdjustedExtSales is null;
	UPDATE Reports..pm_rebates_Chaap_Test set AdjustedGenericSource = 0 where AdjustedGenericSource is null;
	UPDATE Reports..pm_rebates_Chaap_Test set PriceProtection = 0 where PriceProtection is null;
	UPDATE Reports..pm_rebates_Chaap_Test set PrescribedWellnessFee = 0 where PrescribedWellnessFee is null;
	UPDATE Reports..pm_rebates_Chaap_Test set GenericRebateAdjustment = 0 where GenericRebateAdjustment is null;
	UPDATE Reports..pm_rebates_Chaap_Test set PriceProtectionAdjustment = 0 where PriceProtectionAdjustment is null;
	UPDATE Reports..pm_rebates_Chaap_Test set VolAdminFeeAdj = 0 where VolAdminFeeAdj is null;
	UPDATE Reports..pm_rebates_Chaap_Test set AffilAdminFeeAdj = 0 where AffilAdminFeeAdj is null;
	UPDATE Reports..pm_rebates_Chaap_Test set GenericAdminFeeAdj = 0 where GenericAdminFeeAdj is null;
	UPDATE Reports..pm_rebates_Chaap_Test set NCPAMembershipFee = 0 where NCPAMembershipFee is null;
	UPDATE Reports..pm_rebates_Chaap_Test set FloridaPhcyAssocDeduct = 0 where FloridaPhcyAssocDeduct is null;
END








GO
