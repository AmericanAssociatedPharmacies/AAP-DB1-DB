USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[usp_APIInstantRebate_20190829]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_APIInstantRebate_20190829]

-- Add the parameters for the stored procedure here
@APIAccountNumber VARCHAR(8)

AS

SET NOCOUNT ON;

BEGIN
        DECLARE @Type VARCHAR(1000)= 'Generic';
        DECLARE @InstantRebatePercentage DECIMAL(6, 2)= 0.20
		, @MaxInvDate DATETIME;

        SELECT @MaxInvDate = MAX(InvDate)
        FROM API.dbo.APISalesDetail
        WHERE WHAccountID = @APIAccountNumber;

        SELECT [TotalGenericPurchased]
             , [api2].[WHAccountID] AS [APIAccountNumber]
             , CONVERT(VARCHAR(10), [api2].[InvoiceDate], 101) AS [InvoiceDate]
             , '$' + CAST(CAST([api2].[Sales] AS DECIMAL(18, 2)) AS VARCHAR(18)) AS [VolumeAmount]
             , '$' + CAST(CAST([api2].[Rebate] AS DECIMAL(18, 2)) AS VARCHAR(18)) AS [FullRebateAmount]
             , CAST(CAST(([api2].[Rebate] / NULLIF([api2].[Sales], 0)) * 100 AS DECIMAL(18, 2)) AS VARCHAR(18)) + '%' AS [FullRebatePercentage]
             , CAST(CAST((([api2].[Rebate] / NULLIF([api2].[Sales], 0)) - @InstantRebatePercentage) * 100 AS DECIMAL(18, 2)) AS VARCHAR(18)) + '%' AS [RemainingRebatePercentage]
             , '$' + CAST(CAST([api2].[Sales] * @InstantRebatePercentage AS DECIMAL(18, 2)) AS VARCHAR(18)) AS [InstantRebate]
             , '$' + CAST(CAST(([api2].[Sales] * (([api2].[Rebate] / NULLIF([api2].[Sales], 0)) - @InstantRebatePercentage)) AS DECIMAL(18, 2)) AS VARCHAR(18)) AS [RemainingRebate]
        FROM
        (
            SELECT @MaxInvDate AS [InvoiceDate]
                 , COUNT(*) AS [TotalGenericPurchased]
                 , SUM(ExtSales) AS [Sales]
                 , SUM(FinalRebateAmount) AS [Rebate]
                 , @APIAccountNumber AS [WHAccountID]
            FROM api.dbo.[APISalesDetail]
            WHERE [WHAccountID] = @APIAccountNumber
                  AND [Type] = @Type
                  AND [InvDate] = @MaxInvDate
                  AND API.dbo.APISalesDetail.ExtSales > 0
        ) AS [api2];
END


GO
