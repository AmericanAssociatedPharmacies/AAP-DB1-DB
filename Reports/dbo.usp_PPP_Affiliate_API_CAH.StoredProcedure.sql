USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_PPP_Affiliate_API_CAH]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		Lovie Moultrie
-- Create date: 06/24/2020>
-- Description:	PPP Affliate Report to display API and CAH totals and grand total Monthly
-- =============================================
CREATE PROCEDURE [dbo].[usp_PPP_Affiliate_API_CAH]

	@StartDate datetime
	, @EndDate datetime
	
AS

SET NOCOUNT ON;

BEGIN

--SET @startdate = '20200101' testing purposes
--SET @enddate = '20200401' testing purposes

SELECT b.Date 
    ,ISNULL(a.CAH_PriceProtection,0) As [CAH_PriceProtection]
    ,ISNULL(a.[CAH_Adj Total],0) As [CAH_Adj Total]
    ,ISNULL(a.CAH_VolAdminFee,0) As [CAH_VolAdminFee]
    ,ISNULL(a.PPP_Aff_Holdback,0) As [PPP_Aff_Holdback]
    ,ISNULL(a.AAP_AdminFeePayout,0) As [AAP_AdminFeePayout]
	,ISNULL(a.[CAH Brand],0) As [CAH Brand]
	,ISNULL(a.[CAH Generics],0) As [CAH Generics]
	,ISNULL(a.[CAH Other],0) As [CAH Other]
	,ISNULL(a.[CAH Total],0) As [CAH Total]
	,ISNULL(b.[API Brand],0) As [API Brand]
	,ISNULL(b.[API Generic],0) As [API Generic]
	,ISNULL(b.[API OTC],0) as [API OTC]  
	,ISNULL(b.[API Total],0) As [API Total]
   ,(ISNULL(a.[CAH_Adj Total],0) + ISNULL((b.[API Total]),0)) As [CAH_API Total] 
FROM(	select i.Date
    ,sum(i.priceprotection) as CAH_PriceProtection
    ,sum(i.AdjustedExtSales) as [CAH_Adj Total]
    ,sum(i.AAPVolumeAdminFee) as CAH_VolAdminFee
    ,sum(i.AdjustedExtSales *.001) as PPP_Aff_Holdback
    ,sum(i.AAPVolumeAdminFeePaidToAffiliate) as AAP_AdminFeePayout
    ,sum (p.AAPBrand) as [CAH Brand]
    ,sum(p.AAPGENTotal) as [CAH Generics]
	,sum((p.AAPTotalRx + p.AAPNonRxOTCandHH)-(p.AAPBrand + p.AAPGENTotal) ) as [CAH Other]
	,sum(p.AAPTotalRX + AAPNonRXOTCandHH) as [CAH Total]
	from [PharmacyMaster].[dbo].[PM_Rebates_CHAAP] i
	left outer join PharmacyMaster.dbo.ALL_Volume p on i.pmid = p.pmid
													 and i.date = p.date
	Where i.Date between @startdate and  @enddate
	And i.Affiliate = 'PPP'
	Group By i.Date
	) AS A
RIGHT OUTER JOIN (select r.Date, sum(r.[API Brand Sales]) As [API Brand]
				,sum(r.[API Generic Sales]) As [API Generic]
				,sum(r.[API OTC Sales]) As [API OTC]
				,sum(r.[API Brand Sales] + [API Generic Sales] + [API OTC Sales]) As [API Total]
				from [PharmacyMaster].[dbo].[PM_Rebates_APIMonthly] r
				Where Date between @startdate and @enddate
				And [Rebate Administrator] = 'PPP'
				Group by r.Date 
				) AS B ON a.Date = b.Date
Order by b.date ASC
END

GO
