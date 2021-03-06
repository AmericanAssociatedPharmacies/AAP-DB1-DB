USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[spud_PPEligibilityUpd]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spud_PPEligibilityUpd] 
--(
--	@dateloaded smalldatetime --Last Date of Last Quarter
--)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  
	--Update Query for Affiliates field
	--This code will pull back all stores that haven't been paid yet
	update VendorVolumeRebate 
	set VendorVolumeRebate.Affiliate = dbo.fnAffiliateDirectPay(v_PM_AllWithAffiliates.Affiliate,v_PM_AllWithAffiliates.AAPParentNo,v_PM_AllWithAffiliates.UDParentNo) 
	FROM VendorVolumeRebate 
	JOIN v_PM_AllWithAffiliates ON VendorVolumeRebate.PMID =  v_PM_AllWithAffiliates.PMID
	WHERE StorePaidDT IS NULL

	--These stores are treated differently.Thise code excludes these stores, which are not affiliates.
	update VendorVolumeRebate 
	set VendorVolumeRebate.Affiliate = NULL
	FROM VendorVolumeRebate 
	JOIN v_PM_AllWithAffiliates ON VendorVolumeRebate.PMID =  v_PM_AllWithAffiliates.PMID
	WHERE StorePaidDT IS NULL 
	AND VendorVolumeRebate.Affiliate = 'BASHAS'


	--Set Eligible=1 if Quit during that quarter
	/* update VendorVolumeRebate set VendorVolumeRebate.Eligibility = 1 
	FROM VendorVolumeRebate JOIN v_PM_AllWithAffiliates ON VendorVolumeRebate.PMID =  v_PM_AllWithAffiliates.PMID
	WHERE Eligibility=0 AND AAPAccountNo IS NOT NULL AND StorePaiddt IS NULL AND (AAPQuitDate > @dateloaded + ' 12:00:00 AM' AND AAPQuitDate < DATEADD(mm, DATEDIFF(mm,0,DATEADD(m, + 4, @dateloaded)), 0))*/

	--LeeAnn changed the hardcoded 2015 date to 2016
	update VendorVolumeRebate 
	set VendorVolumeRebate.Eligibility = 1 
	FROM VendorVolumeRebate 
	JOIN v_PM_AllWithAffiliates ON VendorVolumeRebate.PMID =  v_PM_AllWithAffiliates.PMID
	WHERE Eligibility=0 
	AND AAPAccountNo IS NOT NULL 
	AND StorePaiddt IS NULL 
	AND Year (AAPQuitDate) = '2017' 

	--Update Eligibility=0 if AAPAccountNo IS NULL
	update VendorVolumeRebate 
	set VendorVolumeRebate.Eligibility = 0 
	FROM VendorVolumeRebate 
	JOIN v_PM_AllWithAffiliates ON VendorVolumeRebate.PMID =  v_PM_AllWithAffiliates.PMID
	WHERE Eligibility=1 
	AND StorePaiddt IS NULL 
	AND AAPAccountNo IS NULL
	
			
	--Update Eligibility=0 if AAPQuitDate Prior to that Quarter
	/* update VendorVolumeRebate set VendorVolumeRebate.Eligibility = 0 
	FROM VendorVolumeRebate JOIN v_PM_AllWithAffiliates ON VendorVolumeRebate.PMID =  v_PM_AllWithAffiliates.PMID
	WHERE Eligibility=1 AND StorePaiddt IS NULL AND AAPQuitDate <= @dateloaded + ' 12:00:00 AM' */

	--LeeAnn updated the hardcoded 2014 date to 2015
	update VendorVolumeRebate 
	set VendorVolumeRebate.Eligibility = 0 
	FROM VendorVolumeRebate 
	JOIN v_PM_AllWithAffiliates ON VendorVolumeRebate.PMID =  v_PM_AllWithAffiliates.PMID
	WHERE Eligibility=1 
	AND StorePaiddt IS NULL 
	AND  Year (AAPQuitDate) <= '2016' 


END


GO
