USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_rpt_AAPOnePager_AccountInfo_RSE]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_rpt_AAPOnePager_AccountInfo_RSE]
@PMID INT

AS
SET NOCOUNT ON;
	
	


	DECLARE @APIAccountNo VARCHAR(10);
	CREATE TABLE #ResultsTable (PMID INT NOT NULL, AccountName VARCHAR(150), ContactName VARCHAR(150), OwnerName VARCHAR(150)
		, Email VARCHAR(150), ACHEmail VARCHAR(150), Phone VARCHAR(50), AAPAccountNo VARCHAR(15), APIAccountNo VARCHAR(15)
		, NCPDP VARCHAR(20), Addr1 VARCHAR(150), Addr2 VARCHAR(150), City VARCHAR(150), State VARCHAR(2), Zip VARCHAR(50)
		, Program_EDI VARCHAR(50), Program_PlanOGram VARCHAR(50), Program_CSOS VARCHAR(50), Program_Software VARCHAR(50)
		, Program_ScanToss VARCHAR(5), Program_ManagedCare VARCHAR(50), Program_LastConferenceAttended VARCHAR(4)
		, YTDGenericPurchases MONEY, CurrentCOG DECIMAL(18,4), LastGenericPurchaseDate DATETIME, CustPayTermsAPI VARCHAR(50))
	
	SELECT @APIAccountNo = APIAccountNo
	FROM PharmacyMaster.dbo.PM_Pharmacy
	WHERE APIAccountNo NOT LIKE '%-%'
	AND PMID = @PMID

	/*
	Insert Account Data
	*/
	INSERT INTO #ResultsTable (PMID, AccountName, ContactName, OwnerName, Email, ACHEmail, Phone
		, AAPAccountNo, APIAccountNo, NCPDP, Addr1, Addr2, City, State, Zip, Program_Software, CustPayTermsAPI)
	SELECT pm.PMID
		, pm.AccountName
		, pm.ContactFullName
		, pm.OwnerName
		, pm.Email
		, pm.ACHEmail
		, Phone
		, pm.AAPAccountNo
		, pm.APIAccountNo
		, pm.NCPDP
		, pm.Addr1
		, pm.Addr2
		, pm.City
		, pm.State
		, pm.Zip
		, pm.ComputerSoftware
		, pm.CustPayTermsAPI
	FROM [PharmacyMaster].dbo.v_PM_AllWithAffiliates AS pm
	WHERE pm.PMID = @PMID 
	ORDER BY pm.AccountName

	/*
	EDI - STILL NEEDED FROM DYNAMICS
	*/
	UPDATE #ResultsTable
	SET Program_EDI = 'N/A'

	/*
	PlanOGram - STILL NEEDED FROM DYNAMICS
	*/
	UPDATE #ResultsTable
	SET Program_PlanOGram = 'N/A'

	/*
	CSOS, ScanToss, COG
	*/
	UPDATE rt
	SET Program_CSOS = IIF(ad.CSOSAcct IS NOT NULL AND ad.CSOSAcct <> '', 'Y', 'N')
		, Program_ScanToss =IIF(ad.ScanTossAcct IS NOT NULL AND ad.ScanTossAcct <> '', 'Y', 'N')
		, CurrentCOG = ad.CurrCHCOG
	FROM #ResultsTable as rt
	INNER JOIN PharmacyMaster.dbo.PM_CHAccounts_ADJ as ad
	ON rt.PMID = ad.PMID

	/*
	Managed Care - STILL NEEDED FROM DYNAMICS
	*/
	UPDATE #ResultsTable
	SET Program_ManagedCare = 'N/A'

	/*
	Last Conference Attended
	*/
	UPDATE rt
	SET rt.Program_LastConferenceAttended = pm.LastConferenceAttended
	FROM #ResultsTable as rt
	INNER JOIN (SELECT PMID, MAX(YEAR(Date)) as LastConferenceAttended
				FROM PharmacyMaster.dbo.PM_Rebates_Conference
				GROUP BY PMID
		) as pm ON rt.PMID = pm.PMID

	/*
	YTD Generic Purchases
	LastPurchaseDate
	*/
	UPDATE rt
	SET rt.YTDGenericPurchases = pm.YTDGenPurchases
		, rt.LastGenericPurchaseDate = sd.LastPurchaseDate
	FROM #ResultsTable as rt
	INNER JOIN (SELECT WHAccountID
					, SUM(ExtSales) as YTDGenPurchases
				FROM API.dbo.APISalesDetail
				WHERE Type = 'Generic'
					AND InvDate >= DATEADD(yy, DATEDIFF(yy, 0, GETDATE()), 0) 
				GROUP BY WHAccountID
		) as pm ON rt.APIAccountNo = pm.WHAccountID
	INNER JOIN (SELECT WHAccountID
				 , MAX(InvDate) as LastPurchaseDate
			FROM API.dbo.APISalesDetail
			WHERE Type = 'Generic'
			GROUP BY WHAccountID
	) as sd ON rt.APIAccountNo = pm.WHAccountID

	/*
	UPDATE Remaining NULL Values
	*/
	UPDATE #ResultsTable SET Program_EDI = 'N/A' WHERE Program_EDI IS NULL
	UPDATE #ResultsTable SET Program_PlanOGram = 'N/A' WHERE Program_PlanOGram IS NULL
	UPDATE #ResultsTable SET Program_CSOS = 'N' WHERE Program_CSOS IS NULL
	UPDATE #ResultsTable SET Program_ScanToss = 'N' WHERE Program_ScanToss IS NULL
	UPDATE #ResultsTable SET Program_ManagedCare = 'N/A' WHERE Program_ManagedCare IS NULL
	UPDATE #ResultsTable SET YTDGenericPurchases = 0.00 WHERE YTDGenericPurchases IS NULL
	UPDATE #ResultsTable SET CurrentCOG = 0.00 WHERE CurrentCOG IS NULL

	/*
	Display Results
	*/
	SELECT PMID, AccountName, AAPAccountNo, APIAccountNo, ContactName, OwnerName, Email, ACHEmail
		, Phone, NCPDP, Addr1, Addr2, City, State, Zip, Program_EDI , Program_PlanOGram , Program_CSOS 
		, Program_Software, Program_ScanToss, Program_ManagedCare , Program_LastConferenceAttended
		, YTDGenericPurchases , CurrentCOG, LastGenericPurchaseDate, CustPayTermsAPI 
	FROM #ResultsTable
GO
