USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[spud_PPEligible]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spud_PPEligible]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT  MIN(PMAffiliate) as PMAffiliate, MIN(AAPParentNo) as AAPParentNo, MIN(Addr1) + ', ' + MIN(City) + ', ' + MIN(State) + ', ' + MIN(Zip) as Addr1, 
	MIN(NCPDP) as NCPDP,  MIN(AAPAccountNo) as AAPAccountNo,  MIN(AccountName) as AccountName, MIN(Affiliate) as Affiliate,MIN(AAPQuitDate) as AAPQuitDate, 
	MIN(PMParentID) as PMParentID, MIN(Eligibility) as Eligibility,(Case WHEN MIN(Eligibility)=0 Then 'No' ELSE 'Yes' END ) as Elig, MIN(PayTo) as Payto, MIN(StoreName) as StoreName,PMID , SUM(VolumeAmt) AS Vol, SUM(RebateAmt) AS Rebate, 
	SUM(RebateAmt) * .90 AS PaymentAmt, SUM(Case WHEN Eligibility=0 Then 0 ELSE RebateAmt * .90 END) AS Payment
	FROM v_VendorVolumeEligibility	
	GROUP BY PMID
	HAVING PMID IS NOT NULL 
	ORDER BY AccountName
END
GO
