USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_ReportCardRebate_Static]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <07/07/2011>
-- Description:	Create table for Report Card Rebate for Wayne
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_ReportCardRebate_Static]
(@in_month as varchar(2),@in_year as varchar(4))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

 
		 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_RCRebate_jmw')
		 BEGIN
          DROP TABLE tmp_RCRebate_jmw
         END

select a.pmid ,

cast (0 as float)   as [PP Volume 2011Q1], -- Build these when build the pivot columns 
cast (0 as float)   as  [PP Rebate 2011Q1],
cast (0 as float)   as [Total PP Rebate 2011], -- will populate later
cast (0 as float)  as [Q1 API Whse Rebate], -- Build these when build the pivot columns 
cast (0 as float)  as [Q1 API Generic Rebate%],
cast (0 as float) as [Total API Whse Rebate 2011],  -- will populate later
cast (0 as float) as  [HV Incentive 0411],
cast (0 as float)   as [HV Incentive 0511],
cast (0 as float)  as [Total HV Incentive 2011],  -- will populate later
cast (0 as float)  as  [Conf Volume 0411],
cast (0 as float)  as [Conf Rebate 0411],
cast (0 as float) as [Conf Volume 0511],
cast (0 as float) as [Conf Rebate 0511],
cast (0 as float) as [Total Conf Volume 2011],
cast (0 as float) as  [Total Conf Rebate 2011],
cast (0 as float) as [Leader AAP 2011Q1],
cast (0 as float) as [Total Leader AAP 2011],
cast (0 as float) as  [01/11 Source Sales ],
cast (0 as float) as [01/11 AAP Gen Rebate],
cast (0 as float) as  [01/11 Avg%],
cast (0 as float) as  [01/11 HRTA%],
 
cast (0 as float) as  [02/11 Source Sales ],
cast (0 as float) as [02/11 AAP Gen Rebate],
cast (0 as float) as  [02/11 Avg%],
cast (0 as float) as  [02/11 HRTA%],
cast (0 as float) as [Total CH AAP Gen Rebate 2011],
cast (0 as float) as [Planogram Rebate 2011],
cast (0 as float) as [API Generic Incentive 2011],
cast (0 as float) as [AAP Patronage Dividend 2011],
cast (0 as float)   as [Total YTD All Rebates 2011]


from 
(select distinct pmid from 
	(select distinct pmid from pharmacymaster..PM_rebates_PPartner where period in ('2011Q1','2011Q2','2011Q3','2011Q4') 
		union
	 select distinct pmid from pharmacymaster..PM_rebates_APIQuarterly where period in ('2011Q1','2011Q2','2011Q3','2011Q4') 
		union
	 select distinct pmid from pharmacymaster..PM_Rebates_CHAAP where date >= '1/1/2011' and date < '1/1/2012'
		union
	 select distinct pmid from reports..tmp_PPartner2011Q1_rollup --todo
		union
	select distinct pmid from pharmacymaster..pm_rebates_HighVolume where date >= '1/1/2011' and date < '1/1/2012'
		union
	select distinct pmid from pharmacymaster..pm_rebates_Conference where date >= '1/1/2011' and date < '1/1/2012'

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
	  PMID, 


		MAX([PP Volume 2011Q1])  as [PP Volume 2011Q1],
		MAX([PP Rebate 2011Q1])  as [PP Rebate 2011Q1],
		MAX([PP Volume 2011Q2])  as [PP Volume 2011Q2],
		MAX([PP Rebate 2011Q2])  as [PP Rebate 2011Q2],
		MAX([PP Volume 2011Q3])  as [PP Volume 2011Q3],
		MAX([PP Rebate 2011Q3])  as [PP Rebate 2011Q3],
		MAX([PP Volume 2011Q4])  as [PP Volume 2011Q4],
		MAX([PP Rebate 2011Q4])  as [PP Rebate 2011Q4]
 
	FROM (
	  SELECT PMID,period,

		   'PP Volume ' + period as datePPV,
		sum(isnull(VolumeAmt,0.00)  )as PPQtrVolume ,
		   'PP Rebate ' + period as datePPR,
		sum(round(isnull(PaymentAmt,0.00),2) )as PPQtrRebate 
 

--	  FROM reports..tmp_PPartner2011Q1_rollup  where ( period in ('2011Q1'))
--			 group by PMID ,period

      	  FROM  pharmacymaster..PM_rebates_PPartner  where ( period in ('2011Q1','2011Q2','2011Q3','2011Q4'))
			 group by PMID ,period
	) as PPTable


	PIVOT 
	(
	  SUM(PPQtrVolume) 
	  FOR datePPV IN  ( [PP Volume 2011Q1],[PP Volume 2011Q2], [PP Volume 2011Q3], [PP Volume 2011Q4]) 
	) as P1
	PIVOT 
	(
	  SUM(PPQtrRebate)
	  FOR datePPR IN  ([PP Rebate 2011Q1],[PP Rebate 2011Q2],[PP Rebate 2011Q3],[PP Rebate 2011Q4]) 
	) as P2
	

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


		MAX([Q1 API Whse Rebate])  as [Q1 API Whse Rebate],
		MAX([Q1 API Generic Rebate])  as [Q1 API Generic Rebate],
		MAX([Q2 API Whse Rebate])  as [Q2 API Whse Rebate],
		MAX([Q2 API Generic Rebate])  as [Q2 API Generic Rebate],
		MAX([Q3 API Whse Rebate])  as [Q3 API Whse Rebate],
		MAX([Q3 API Generic Rebate])  as [Q3 API Generic Rebate],
		MAX([Q4 API Whse Rebate])  as [Q4 API Whse Rebate],
		MAX([Q4 API Generic Rebate])  as [Q4 API Generic Rebate]
 
	FROM (
	  SELECT PMID,period,

		   substring(period,5,2) + ' API Whse Rebate'  as dateWReb,
		sum((round(isnull([Rebate to Pay Acct/Admin] ,0),2) * [Pay Account]))as APIWhseReb ,
		   substring(period,5,2)  + ' API Generic Rebate' as dateGReb,
		sum([Avg Rebate Percentage]) as APIGenReb 
 

      	  FROM  pharmacymaster..PM_rebates_APIQuarterly where ( period in ('2011Q1','2011Q2','2011Q3','2011Q4'))
			 group by PMID ,period
	) as PPTable


	PIVOT 
	(
	  SUM(APIWhseReb) 
	  FOR dateWReb IN  ( [Q1 API Whse Rebate],[Q2 API Whse Rebate], [Q3 API Whse Rebate], [Q4 API Whse Rebate]) 
	) as P1
	PIVOT 
	(
	  SUM(APIGenReb)
	  FOR dateGReb IN  ([Q1 API Generic Rebate],[Q2 API Generic Rebate],[Q3 API Generic Rebate],[Q4 API Generic Rebate]) 
	) as P2
	

	group by PMID 

)vol

----------------------

		 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_RCRebate_HV_jmw')
		 BEGIN
          DROP TABLE tmp_RCRebate_HV_jmw
         END

-- Create temp table for pivoted High Volume
SELECT * INTO tmp_RCRebate_HV_jmw from (
	SELECT   
	  PMID, 


		MAX([HV Incentive 0411])  as [HV Incentive 0411],
		MAX([HV COG Reduction 0411])  as [HV COG Reduction 0411],
		MAX([HV Incentive 0511])  as [HV Incentive 0511],
		MAX([HV COG Reduction 0511])  as [HV COG Reduction 0511] 
 
	FROM (
	  SELECT PMID,date,

		  'HV Incentive ' +  replace(str(datepart(month,date),2),' ','0')  +  substring(cast(datepart(year,date) as varchar(4)),3,2)    as dateHVI,
		sum(round(isnull([High Volume Incentive],0.00),2))as HVI ,
		    'HV COG Reduction ' + replace(str(datepart(month,date),2),' ','0')  +  substring(cast(datepart(year,date) as varchar(4)),3,2)   as dateHVC,
		sum( [COG Reduction]) as HVC 
 

      	  FROM  pharmacymaster..pm_rebates_HighVolume where ( date in ('04/01/2011','05/01/2011'))
			 group by PMID ,date
	) as PPTable


	PIVOT 
	(
	  SUM(HVI) 
	  FOR dateHVI IN  ( [HV Incentive 0411],[HV Incentive 0511] ) 
	) as P1
	PIVOT 
	(
	  SUM(HVC)
	  FOR dateHVC IN  ( [HV COG Reduction 0411],[HV COG Reduction 0511] ) 
	) as P2
	

	group by PMID 

)vol


----------------------

		 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_RCRebate_Conf_jmw')
		 BEGIN
          DROP TABLE tmp_RCRebate_Conf_jmw
         END

-- Create temp table for pivoted Conference Rebates fields
SELECT * INTO tmp_RCRebate_Conf_jmw from (
	SELECT   
	  PMID, 


		MAX([Conf Volume 0411])  as [Conf Volume 0411],
		MAX([Conf Rebate 0411])  as [Conf Rebate 0411],
		MAX([Conf Volume 0511])  as [Conf Volume 0511],
		MAX([Conf Rebate 0511])  as [Conf Rebate 0511] 
 
	FROM (
	  SELECT PMID,date,

		  'Conf Volume ' +  replace(str(datepart(month,date),2),' ','0')  +  substring(cast(datepart(year,date) as varchar(4)),3,2)    as dateHVI,
		sum(round(isnull(Volume,0.00),2))as HVI ,
		    'Conf Rebate ' + replace(str(datepart(month,date),2),' ','0')  +  substring(cast(datepart(year,date) as varchar(4)),3,2)   as dateHVC,
		sum( round(isnull(Rebate,0.00),2)) as HVC 
 

      	  FROM  pharmacymaster..PM_Rebates_Conference  where ( date in ('04/01/2011','05/01/2011'))
			 group by PMID ,date
	) as PPTable


	PIVOT 
	(
	  SUM(HVI) 
	  FOR dateHVI IN  ( [Conf Volume 0411],[Conf Volume 0511] ) 
	) as P1
	PIVOT 
	(
	  SUM(HVC)
	  FOR dateHVC IN  ( [Conf Rebate 0411],[Conf Rebate 0511] ) 
	) as P2
	

	group by PMID 

)vol

----------------------

		 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_RCRebate_Leader_jmw')
		 BEGIN
          DROP TABLE tmp_RCRebate_Leader_jmw
         END

-- Create temp table for pivoted Conference Rebates fields
SELECT * INTO tmp_RCRebate_Leader_jmw from (
	SELECT   
	  PMID, 


		MAX([Leader AAP 2011Q1])  as [Leader AAP 2011Q1],
		MAX([Leader AAP 2011Q2])  as [Leader AAP 2011Q2],
		MAX([Leader AAP 2011Q3])  as [Leader AAP 2011Q3],
		MAX([Leader AAP 2011Q4])  as [Leader AAP 2011Q4] 
 
	FROM (
	  SELECT PMID,date,

		  	  'Leader AAP ' +  cast(datepart(year,date) as varchar(4)) +
           case when date = '03/01/2011' then 'Q1'   
                when date = '0601/2011' then 'Q2' 
                when date = '0601/2011' then 'Q3'else 'Q4' end  as dateLR,
		   sum(round(isnull(LeaderRebate,0),2))as LR  

      	  FROM  pharmacymaster..PM_Rebates_CHAAP where ( date in ('03/01/2011','06/01/2011','09/01/2011','12/01/2011'))
			 group by PMID ,date
	) as PPTable


	PIVOT 
	(
	  SUM(LR) 
	  FOR dateLR IN  (  [Leader AAP 2011Q1], [Leader AAP 2011Q2], [Leader AAP 2011Q3], [Leader AAP 2011Q4] ) 
	) as P1

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


		MAX([01/11 Source Sales]) as [01/11 Source Sales],
		MAX([01/11 AAP Gen Rebate])  as [01/11 AAP Gen Rebate],
		MAX( [01/11 Avg%])  as  [01/11 Avg%],
		MAX([01/11 HRTA%])  as [01/11 HRTA%]
 
	FROM (
	  SELECT PMID,date,

		   replace(str(datepart(month,date),2),' ','0')  + '/' +  substring(cast(datepart(year,date) as varchar(4)),3,2) + ' Source Sales'   as dateSS,
		sum(round(isnull([SourceGenericSales],0.00),2))as SS ,
		    replace(str(datepart(month,date),2),' ','0')  + '/' +  substring(cast(datepart(year,date) as varchar(4)),3,2)  + ' AAP Gen Rebate'  as dateGR,
		sum( round(GenericRebate,2)) as GR , 

		   replace(str(datepart(month,date),2),' ','0')  + '/' +  substring(cast(datepart(year,date) as varchar(4)),3,2) + ' Avg%'   as dateAvg,
		sum(round(EffRebatePerc,2))as AVGPerc ,
		    replace(str(datepart(month,date),2),' ','0')  + '/' +  substring(cast(datepart(year,date) as varchar(4)),3,2)  + ' HRTA%'  as dateHRTA,
		sum(  round(HRTA,2)) as HRTA 

      	  FROM   pharmacymaster..PM_Rebates_CHAAP  where ( year(date) in (2011))
			 group by PMID ,date
	) as PPTable


	PIVOT 
	(
	  SUM(SS) 
	  FOR dateSS IN  ( [01/11 Source Sales] ) 
	) as P1
	PIVOT 
	(
	  SUM(GR)
	  FOR dateGR IN  ( [01/11 AAP Gen Rebate] ) 
	) as P2


	PIVOT 
	(
	  SUM(AVGPerc) 
	  FOR dateAvg IN  ( [01/11 Avg%] ) 
	) as P3
	PIVOT 
	(
	  SUM(HRTA)
	  FOR dateHRTA IN  ( [01/11 HRTA%] ) 
	) as P4
	

	group by PMID 

)vol

--	SELECT   
--	  PMID, 
--
--
--		MAX([HV Incentive 0116])  as [HV Incentive 0116],
--		MAX([HV COG Reduction 0116])  as [HV COG Reduction 0116],
--		MAX([HV Incentive 0216])  as [HV Incentive 0216],
--		MAX([HV COG Reduction 0216])  as [HV COG Reduction 0216] 
-- 
--	FROM (
--	  SELECT PMID,date,
--
--		  'HV Incentive ' +  replace(str(datepart(month,date),2),' ','0')  +  substring(cast(datepart(year,date) as varchar(4)),3,2)    as dateHVI,
--		sum(round(isnull([High Volume Incentive],0.00),2))as HVI ,
--		    'HV COG Reduction ' + replace(str(datepart(month,date),2),' ','0')  +  substring(cast(datepart(year,date) as varchar(4)),3,2)   as dateHVC,
--		sum( [COG Reduction]) as HVC 
-- 
--
--      	  FROM  pharmacymaster..pm_rebates_HighVolume where ( date in ('01/01/2016','02/01/2016'))
--			 group by PMID ,date
--	) as PPTable
--
--
--	PIVOT 
--	(
--	  SUM(HVI) 
--	  FOR dateHVI IN  ( [HV Incentive 0116],[HV Incentive 0216] ) 
--	) as P1
--	PIVOT 
--	(
--	  SUM(HVC)
--	  FOR dateHVC IN  ( [HV COG Reduction 0116],[HV COG Reduction 0216] ) 
--	) as P2
--group by PMID 

END








GO
