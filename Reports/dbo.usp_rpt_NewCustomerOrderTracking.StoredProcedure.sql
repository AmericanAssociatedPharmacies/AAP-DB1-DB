USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_rpt_NewCustomerOrderTracking]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_rpt_NewCustomerOrderTracking] 

	@StartDate DATETIME
	, @EndDate   DATETIME

AS

SET NOCOUNT ON;

BEGIN

	SELECT d1.APIAccountNo
	, d1.AccountName
	, d1.Territory
	, d1.TMName
	, d1.Sales
	, d1.Qty
	, d1.Mnth
	, d1.Yr
	, d1.Type
	, d1.DateOpened
	, d1.AgeAsOfEndate
	,d1.PurCheck
	FROM(SELECT pm.APIAccountNo
			 , pm.AccountName
			 , sd.Territory
			 , CONCAT(pm.TMFirstName, ' ', pm.TMLastName) AS TMName
			 , ISNULL(SUM(sd.ExtSales),NULL) AS Sales
			 , SUM(sd.Qty) AS Qty
			 , MONTH(sd.InvDate) AS Mnth
			 , YEAR(sd.InvDate) AS Yr
			 , sd.Type
			 , pm.DateOpened
			 , DATEDIFF(dd, pm.DateOpened, @EndDate) AS AgeAsOfEndate
			,CASE
			  WHEN MAX(sd.InvDate) < pm.DateOpened THEN 0
			  ELSE 1
			  End AS PurCheck
		FROM API.dbo.APISalesDetail AS sd
		INNER JOIN PharmacyMaster.dbo.v_PM_AllWithAffiliates AS pm ON sd.PMID = pm.PMID
		WHERE pm.DateOpened BETWEEN @StartDate AND @EndDate
		GROUP BY pm.APIAccountNo
			   , pm.AccountName
			   , sd.Territory
			   , sd.Type
			   , pm.DateOpened
			   , CONCAT(pm.TMFirstName, ' ', pm.TMLastName)
			   , MONTH(sd.InvDate)
			   , YEAR(sd.InvDate)
		) AS d1



END;




GO
