USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[usp_APIInstantRebate]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: David Bohler 
-- Create Date: 08/01/2019 
-- Description:	Purchase Activity Tracker 
-- =============================================
CREATE PROCEDURE [dbo].[usp_APIInstantRebate] 

@APIAccountNumber VARCHAR(8)

AS
     SET NOCOUNT ON;

    BEGIN

        DECLARE @Type VARCHAR(1000)= 'Generic';
        DECLARE @InstantRebatePercentage DECIMAL(6, 2)= 0.20;
        DECLARE @MaxInvDate DATETIME;

        SELECT @MaxInvDate = MAX(InvDate)
        FROM API.dbo.APISalesDetail
        WHERE WHAccountID = @APIAccountNumber;

        SELECT d.InvDate
             , SUM(d.APIGeneric) AS [APIGeneric]
             , SUM(d.TotalIR) AS [InstantRebate]
             , SUM(d.RebateI) AS [MonthlyRebate]
             , SUM(d.TotalIR) + SUM(d.RebateI) AS [TotalRebate]
             , (SUM(d.TotalIR) + SUM(d.RebateI)) / SUM(d.APIGeneric) AS [TotalRebatePer]
        FROM
        (
            SELECT c.InvDate
                 , c.TotalGenericPurchased
                   -- Total Generic Tier I Sales 
                 , (c.SalesI) AS APIGeneric
                   -- Tier I Instant Rebate amount in dollars 
                 , (c.SalesI * @InstantRebatePercentage) AS IRI
                   -- Tier II Instant Rebate amount in dollars 
                 , (c.SalesII * @InstantRebatePercentage) AS IRII
                   -- Total Instant Rebate amount for the invoice
                 , (c.SalesI * @InstantRebatePercentage) AS TotalIR
                   -- Tier I Line item Rebate less the insant rebate.  The rebate column is the max rebate amount so to determined the monthly rebate you need to substract 
                   -- the Tier I Rebate amount from the FinalRebateAmount column since it has the holdback included. 
                 , c.RebateI - (c.SalesI * @InstantRebatePercentage) AS RebateI
            FROM
            (
                SELECT b.InvDate
                       -- Identifies the total count of items purchased 
                     , COUNT(*) AS [TotalGenericPurchased]
                       -- Tier I Sales 
                     , CASE
                           WHEN b.ItemGrp <> 'G06'
                           THEN SUM(b.ExtSales)
                           ELSE 0
                       END AS SalesI
                       -- Tier II Sales 
                     , CASE
                           WHEN b.ItemGrp = 'G06'
                           THEN SUM(b.ExtSales)
                           ELSE 0
                       END AS SalesII
                       -- Tier I Rebate which includes the Tier I instant Rebate 
                     , SUM(b.FinalRebateAmount) AS RebateI
                FROM
                (
                    SELECT *
                    FROM API.dbo.APISalesDetail AS a
                    WHERE a.WHAccountID = @APIAccountNumber
                          -- Selects on Generic Products 
                          AND a.Type = @Type
                          -- Last invoice selected 
                          AND a.InvDate = @MaxInvDate
                          -- Removes Returens and Credits 
                          AND a.ExtSales > 0
						  AND a.ItemGrp <> 'G06'
                ) AS b
                GROUP BY b.InvDate
                       , b.ItemGrp
            ) AS c
        ) AS d
        GROUP BY d.InvDate
        HAVING SUM(d.TotalGenericPurchased) >= 5;
    END;
GO
