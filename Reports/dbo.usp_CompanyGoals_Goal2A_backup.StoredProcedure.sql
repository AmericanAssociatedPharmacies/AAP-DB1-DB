USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_CompanyGoals_Goal2A_backup]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CompanyGoals_Goal2A_backup]
AS

     --API 
     WITH CTE_A(Date
              , APIMonthly
              , Instant
              , PayDiscount)
          AS (SELECT CAST(a.Date AS DATE) AS Date
                   , SUM(a.APIInstantRebate) AS Instant
                   , SUM(a.[Rebate to Pay Acct/Admin]) + SUM(a.[Previous Month Held Rebate]) + SUM(a.True10Rebate) AS APIMonthly
                   , SUM(a.[Accelerated Pay Discount]) AS PayDiscount
              FROM PharmacyMaster.dbo.PM_Rebates_APIMonthly AS a
              WHERE a.Date >= '20180101'
                    AND a.Date <= '20191231'
              GROUP BY a.Date)
     --Generic Loyalty 
     --Patronage Dividend 
     --Planogram 
     ,
          CTE_B(Date
              , GenericIncentive
              , PatronageDividend
              , Planograms)
          AS (SELECT CAST((a.Year + '-12-01') AS DATE) AS Date
                   , SUM(a.GenericIncentive) AS GenericIncentive
                   , SUM(a.PatronageDividend) AS PatronageDividend
                   , SUM(a.PlanOGramRebate) AS Planograms
              FROM PharmacyMaster.dbo.PM_AnnualRebates AS a
              WHERE a.YEAR >= 2018
              GROUP BY a.Year),
          --Prefered Partner 
          CTE_C(Date
              , PrefPartner)
          AS (SELECT CAST((a.Period + '-12-01') AS DATE) AS Date
                   , SUM(a.[Paid To Store]) AS PrefPartner
              FROM PharmacyMaster.dbo.PM_Rebates_PPartner AS a
              WHERE a.Period = '2018'
                    OR a.Period = '2018'
              GROUP BY a.Period),
          --CAH Monthly
          CTE_D(Date
              , CardnialMonthly)
          AS (SELECT a.Date
                   , SUM(a.TotalToPayOut) AS CAHMonthly
              FROM PharmacyMaster.dbo.PM_Rebates_CHAAP AS a
              WHERE a.Date >= '20180101'
              GROUP BY a.Date),
          --CAH Direct 
          CTE_E(Date
              , CAHDirect)
          AS (SELECT a.date
                   , SUM(a.GenericRebate) + SUM(a.COGRebate) + SUM(a.PriceProtectionRebate) + SUM(a.GenericRebateAdj) + SUM(a.LeaderRebate) + SUM(a.MSIRebate) AS CAHDirect
              FROM Reports.dbo.import_Rebates_CAHDirect AS a
              WHERE a.Date >= '20180101'
              GROUP BY a.Date),
          CTE_F(Date
              , BrandCredits)
          AS (SELECT a.Date
                   , SUM(a.BrandCredits) AS BrandCredits
              FROM pharmacymaster.dbo.PM_BrandCredits_APIMonthly AS a
              WHERE YEAR(a.Date) >= 2017
              GROUP BY a.Date),
          CTE_G(Date
              , HighVolume)
          AS (SELECT a.date
                   , SUM(a.[High Volume Incentive]) AS HighVolume
              FROM PharmacyMaster.dbo.pm_rebates_highvolume AS a
              WHERE a.date >= '20170101'
              GROUP BY a.date),
          CTE_H(Date
              , GAC)
          AS (SELECT b.Date
                   , ISNULL(SUM(b.GAC), 0) AS GAC
              FROM
              (
                  SELECT a.Date
                       , a.APIAccountNo
                       , CASE
                             WHEN SUM(a.[API Generic Sales]) <= 0
                             THEN 0
                             ELSE FLOOR(SUM(a.[API Generic Sales]) / 7000) * 26
                         END AS GAC
                  FROM PharmacyMaster.dbo.PM_Rebates_APIMonthly AS a
                  WHERE a.Date >= '20180201'
                        AND a.Date <= '20191231'
                  GROUP BY a.Date
                         , a.APIAccountNo
              ) AS b
              GROUP BY b.Date)

          --COMBINED TABLES--
          SELECT t1.[Date]
               , (t4.CardnialMonthly + t5.CAHDirect + t1.APIMonthly + t1.Instant + ISNULL(t2.GenericIncentive, 0) + ISNULL(t8.GAC, 0) + t1.PayDiscount + ISNULL(t6.BrandCredits, 0) + t7.HighVolume + ISNULL(t2.Planograms, 0) + ISNULL(t3.PrefPartner, 0) + ISNULL(t2.PatronageDividend, 0)) AS Totals
          FROM CTE_A AS t1
               LEFT JOIN CTE_B AS t2 ON t1.Date = t2.Date
               LEFT JOIN CTE_C AS t3 ON t1.Date = t3.Date
               LEFT JOIN CTE_D AS t4 ON t1.Date = t4.Date
               LEFT JOIN CTE_E AS t5 ON t1.Date = t5.Date
               LEFT JOIN CTE_F AS t6 ON t1.Date = t6.Date
               LEFT JOIN CTE_G AS t7 ON t1.Date = t7.Date
               LEFT JOIN CTE_H AS t8 ON t1.Date = t8.Date
          ORDER BY t1.Date;
GO
