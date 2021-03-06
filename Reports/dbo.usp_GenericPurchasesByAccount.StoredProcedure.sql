USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_GenericPurchasesByAccount]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GenericPurchasesByAccount]

	@AcctNum VARCHAR(15)


AS


SET NOCOUNT ON;


BEGIN

	SELECT af.APIAccountNo
	, af.AccountName
	, adr.InvDate
	, SUM(ad.Qty) AS Quantity
	FROM API.[dbo].[APISalesDetail_Report] AS adr
	INNER JOIN API.[dbo].[APISalesDetail] AS AD ON adr.ID = AD.ID
	INNER JOIN PharmacyMaster.[dbo].[v_PM_AllWithAffiliates] AS af ON AD.[WHAccountID] = LEFT(af.[APIAccountNo], 8)
	WHERE AD.[WHAccountID] = @AcctNum
	AND [Type] = 'Generic'
	GROUP BY af.APIAccountNo
	, af.AccountName
	, adr.InvDate



END 
GO
