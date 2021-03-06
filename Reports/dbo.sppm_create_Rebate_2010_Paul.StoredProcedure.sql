USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_Rebate_2010_Paul]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <07/07/2011>
-- Description:	Create table for Report Card Rebate for Wayne
-- =============================================
Create PROCEDURE [dbo].[sppm_create_Rebate_2010_Paul]
(@in_month as varchar(2),@in_year as varchar(4))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

 
		 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_RCRebate_jmw_2010')
		 BEGIN
          DROP TABLE tmp_RCRebate_jmw_2010
         END

select a.pmid ,
 
cast (0 as float)   as [Total PP Rebate 2010], -- will populate later
 
cast (0 as float) as [API Whse Rebate 2010],  -- will populate later
 
cast (0 as float) as [CA-P2P3 Rebates 2010],
cast (0 as float) as [AAPVolumeAdminFee2010],
 
 

cast (0 as float) as [AAPGenericAdminFee2010],
cast (0 as float) as [GenericRebate2010],
cast (0 as float) as [LeaderRebate2010],
cast (0 as float) as [Pay To Store 2010],
cast (0 as float)   as [Pay To Affiliate Office 2010]


from 
(select distinct pmid from 
	(select distinct pmid from pharmacymaster..PM_rebates_PPartner_Archive where period in ('2010Q1','2010Q2','2010Q3','2010Q4') 
		union
	 select distinct pmid from pharmacymaster..PM_rebates_APIQuarterly_Archive2010 where period in ('2010Q1','2010Q2','2010Q3','2010Q4') 
		union
	 select distinct pmid from pharmacymaster..PM_Rebates_CHAAP where date >= '1/1/2010' and date < '1/1/2011'
 
	-- select distinct pmid from reports..tmp_PPartner2011Q1_rollup --todo
	--	union
	--select distinct pmid from pharmacymaster..pm_rebates_HighVolume where date >= '1/1/2011' and date < '1/1/2012'
	--	union
	--select distinct pmid from pharmacymaster..pm_rebates_Conference where date >= '1/1/2011' and date < '1/1/2012'

	) p
) a


		 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_RCRebate_PP_jmw')
		 BEGIN
          DROP TABLE tmp_RCRebate_PP_jmw
         END
 
-- Create temp table for pivoted PP Rebates
SELECT * INTO tmp_RCRebate_PP_jmw from (
	SELECT   
	  PMID, sum(round(isnull(Payment,0.00),2) )as [Total PP Rebate 2010] 
FROM  pharmacymaster..PM_rebates_PPartner_Archive  where ( period in ('2010Q1','2010Q2','2010Q3','2010Q4'))
group by PMID


)vol


----------------------

		 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_RCRebate_APIQtr_jmw')
		 BEGIN
          DROP TABLE tmp_RCRebate_APIQtr_jmw
         END
 
-- Create temp table for pivoted API Quarterly
SELECT * INTO tmp_RCRebate_APIQtr_jmw from (
	SELECT   
	  PMID, 


  sum([API Whse Rebate]) as [API Whse Rebate 2010], sum([CA-P2P3 Rebates]) as [CA-P2P3 Rebates 2010]  FROM  pharmacymaster..PM_rebates_APIQuarterly_Archive2010
where ( period in ('2010Q1','2010Q2','2010Q3','2010Q4')) and pmid > 99
	group by PMID 

)vol

----------------------

 

		 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_RCRebate_AAP_jmw')
		 BEGIN
          DROP TABLE tmp_RCRebate_AAP_jmw
         END

-- Create temp table for pivoted AAP Rebates
SELECT * INTO tmp_RCRebate_AAP_jmw from (
	SELECT   
	  PMID, 

 sum(AAPVolumeAdminFee) as AAPVolumeAdminFee2010,sum(AAPGenericAdminFee) as AAPGenericAdminFee2010,
sum(GenericRebate) as GenericRebate2010,sum(LeaderRebate) as LeaderRebate2010,sum([Pay To Store])as  [Pay To Store 2010],sum([Pay To Affiliate Office]) as [Pay To Affiliate Office 2010]
 from pharmacymaster..pm_rebates_chaap_archive where year(date) = 2010
 
	group by PMID 

)vol

END








GO
