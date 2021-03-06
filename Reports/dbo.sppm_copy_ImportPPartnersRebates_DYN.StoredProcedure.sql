USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_copy_ImportPPartnersRebates_DYN]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/28/2011>
-- Description:	Create table from import to production for Preferred Partners rebates
-- =============================================
CREATE PROCEDURE [dbo].[sppm_copy_ImportPPartnersRebates_DYN]
(@period varchar(6))
 
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	INSERT into pharmacymaster..PM_Rebates_PPartner (
			Period,
			PMID,
			VolumeAmt,
			RebateAmt,
			PaymentAmt,
			Eligible,
			Affiliate,
			LastPayment,
			[Paid To Store],
			[Paid To Affiliate]) 
		SELECT @period, 
			PMID,
			VolumeAmt,
			RebateAmt,
			PaymentAmt,
			Eligible,
			Affiliate,
			LastPayment,
			PaidToStore,
			PaidToAffiliate  
			 FROM import_PPRebates where period = @period

   
--QA below

END








GO
