USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_APIOrderHistoryByDate]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		LeeAnn Carrell
-- Create date: 5/21/2018
-- Description:	SysAid ticket request #2305. Allow customers to get 
-- order history by date via website
-- =============================================
CREATE PROCEDURE [dbo].[usp_APIOrderHistoryByDate] 

	@APIAccountNo varchar(10)
	, @StartDate DATETIME
	, @EndDate DATETIME

AS

SET NOCOUNT ON;

BEGIN


    SELECT api.WHAccountID as APIAccountNo
	, api.APIItemNbr as APIItemNo
	, api.ItemDescription as APIItemDescription
	, CASE WHEN dm.DEA = 1 THEN 'C1'
		WHEN dm.DEA = 2 THEN 'C2' 
		WHEN dm.DEA = 3 THEN 'C3'
		WHEN dm.DEA = 4 THEN 'C4'
		WHEN dm.DEA = 5 THEN 'C5'
		ELSE NULL
		END as Class
	, CAST(IIF(api.ExtSales < 0, -1 * Qty, Qty) as INT) as ShipQty
	, api.InvNbr as InvoiceNo
	, api.InvDate as InvoiceDate
	, api.NDC
	FROM API.dbo.APISalesDetail AS api
	LEFT JOIN Medispan.dbo.v_DrugMaster_ControlledSubstance AS dm ON api.NDC = dm.NDC
	CROSS APPLY RXMaster.dbo.tvfAPIAccount(@APIAccountNo) AS ca		
	WHERE api.WHAccountid = ca.APIAccountNo
	AND api.InvDate BETWEEN ca.APIEffectiveDate AND ca.APIQuitDate
	AND InvDate >= @StartDate 
	AND InvDate < DATEADD(dd, 1, @EndDate)
	ORDER BY api.InvDate

	



END


GO
