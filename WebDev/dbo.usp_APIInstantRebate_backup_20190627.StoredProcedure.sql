USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[usp_APIInstantRebate_backup_20190627]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_APIInstantRebate_backup_20190627]

	-- Add the parameters for the stored procedure here
	@APIAccountNumber varchar(8)

AS

SET NOCOUNT ON;

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

	DECLARE @Type VarChar(1000) = 'Generic'
	DECLARE @InstantRebatePercentage Decimal(6,2) = 0.20
	, @MaxInvDate DATETIME

	SELECT @MaxInvDate = MAX(InvDate)
	FROM API.dbo.APISalesDetail
	WHERE WHAccountID = @APIAccountNumber

	SELECT [TotalGenericPurchased],[api2].[WHAccountID] AS [APIAccountNumber]
	, CONVERT(VARCHAR(10), [api2].[InvoiceDate], 101) As [InvoiceDate]
	, '$' + Cast(Cast([api2].[Sales] as decimal(18,2)) as varchar(18))  AS [VolumeAmount]
	, '$' + Cast(Cast([api2].[Rebate] as decimal(18,2)) as varchar(18)) AS [FullRebateAmount]
	, Cast(Cast(([api2].[Rebate] / NULLIF([api2].[Sales],0)) * 100 as decimal(18,2)) as varchar(18)) + '%' AS [FullRebatePercentage]
	, Cast(Cast((([api2].[Rebate] / NULLIF([api2].[Sales],0)) - @InstantRebatePercentage) * 100 as decimal(18,2)) as varchar(18)) + '%' AS [RemainingRebatePercentage]
	, '$' + Cast(Cast([api2].[Sales] * @InstantRebatePercentage as decimal(18,2)) as varchar(18)) AS [InstantRebate]
	, '$' + Cast(Cast(([api2].[Sales] * (([api2].[Rebate] / NULLIF([api2].[Sales],0)) - @InstantRebatePercentage)) as decimal(18,2)) as varchar(18)) AS [RemainingRebate]
FROM(SELECT @MaxInvDate AS [InvoiceDate]
	, COUNT(*) AS [TotalGenericPurchased]
	, SUM(ExtSales) AS [Sales]
	, SUM(FinalRebateAmount) AS [Rebate]
	, @APIAccountNumber AS [WHAccountID]
    FROM api.dbo.[APISalesDetail] 
    WHERE [WHAccountID] = @APIAccountNumber 
	AND [Type] = @Type 
	AND [InvDate] = @MaxInvDate
    ) AS [api2]

END





--FROM (
--    SELECT MAX([api1].[InvDate]) AS [InvoiceDate], 
--		   COUNT(*) AS [TotalGenericPurchased], 
--		   SUM([api1].[ExtSales]) AS [Sales], 
--		   SUM([api1].FinalRebateAmount) AS [Rebate], 
--		   [api1].[WHAccountID]
--    FROM api..[APISalesDetail] AS [api1]
--    WHERE ([api1].[WHAccountID] = @APIAccountNumber) AND 
--		  ([api1].[Type] = @Type) AND 
--		  ([api1].[InvDate] = ((
--	        SELECT MAX([APISalesDetail].[InvDate])
--	        FROM api..[APISalesDetail]
--	        )))
--    GROUP BY [api1].[WHAccountID]
--    ) AS [api2]
    






GO
