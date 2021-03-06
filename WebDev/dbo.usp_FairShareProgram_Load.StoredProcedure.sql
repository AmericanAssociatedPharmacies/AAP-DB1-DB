USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[usp_FairShareProgram_Load]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_FairShareProgram_Load]

AS

SET NOCOUNT ON;

BEGIN

	INSERT INTO [dbo].[FairShareProgram](CustNum, ProdNum, ProdDesc, [Count], Price, MonthlyQty, RequestedQty, LastUpdated, NDC, BeginDate, EndDate, ShipWeekOf, ExpirationDate, DateKey)
	SELECT CustNum, ProdNum, ProdDesc, [Count], Price, MonthlyQty, RequestedQty, LastUpdated, NDC, BeginDate, EndDate, ShipWeekOf, ExpirationDate, DateKey
	FROM [Staging].[FairShareProgram] AS s
	WHERE NOT EXISTS(SELECT 1
						FROM [dbo].[FairShareProgram] AS f
						WHERE s.[CustNum] = f.[CustNum]
							AND s.[ProdNum] = f.[ProdNum]
							AND s.[BeginDate] = f.[BeginDate]
							AND s.[EndDate] = f.[EndDate]
						)


END
GO
