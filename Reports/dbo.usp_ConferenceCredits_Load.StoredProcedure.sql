USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_ConferenceCredits_Load]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ConferenceCredits_Load]

AS

SET NOCOUNT ON;

BEGIN
BEGIN TRY


DECLARE @StartOfYear DATETIME
, @EndOfYear DATETIME

	SET @StartOfYear = DATEADD(yy, DATEDIFF(yy, 0, GETDATE()), 0) 
	SET @EndOfYear =  DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) + 1, -1) 

	TRUNCATE TABLE Staging.ConferenceCredit;

	INSERT INTO Staging.ConferenceCredit(Date, PMID, ConferenceCreditAmount)
	SELECT [date]
	,[PMID]
	,[Rebate]
	FROM [PharmacyMaster].[dbo].[PM_Rebates_Conference]
	WHERE Date BETWEEN @StartOfYear AND @EndOfYear 
	--WHERE Date BETWEEN '20180101' AND '20191231' --Initial seeding
	AND PMID IS NOT NULL


	INSERT INTO Staging.ConferenceCredit(Date, PMID, ConferenceCreditAmount)
	SELECT DATEADD(month, DATEDIFF(month, 0, s.InvDate), 0) AS TheDate, pd.PMID, SUM(ConferenceCreditAmount) AS ConferenceCreditAmount
	FROM API.dbo.APISalesDetail AS s
	INNER JOIN RXMaster.dbo.PharmacyDim AS pd ON s.WHAccountID = pd.APINumber
	INNER JOIN ODSIntake.dbo.DateDim AS d ON s.InvDate = d.TheDate
	LEFT OUTER JOIN(SELECT PMID, MAX(Date) AS MaxDate
					FROM Staging.ConferenceCredit
					GROUP BY PMID
					) AS cj ON pd.PMID = cj.PMID
							AND s.InvDate > cj.MaxDate
	WHERE s.InvDate BETWEEN @StartOfYear AND @EndOfYear 
	AND s.InvDate BETWEEN pd.APIEffectiveDate AND pd.APIQuitDate
	AND s.[DiscountPercentage] = 21.00
	GROUP BY pd.PMID, DATEADD(month, DATEDIFF(month, 0, s.InvDate), 0)



	MERGE [dbo].[ConfereceCredits] AS TARGET
	USING(SELECT PMID
			, [TheDate]
			, ISNULL([1],0.00) AS Jan
			, ISNULL([2],0.00) AS Feb
			, ISNULL([3],0.00) AS March
			, ISNULL([4],0.00) AS Aril
			, ISNULL([5],0.00) AS May
			, ISNULL([6],0.00) AS June
			, ISNULL([7],0.00) AS July
			, ISNULL([8],0.00) AS August
			, ISNULL([9],0.00) AS September
			, ISNULL([10],0.00) AS October
			, ISNULL([11],0.00) AS November
			,ISNULL([12],0.00) AS December
			FROM(SELECT c.Date AS TheDate, c.PMID, c.ConferenceCreditAmount, d.MonthOfYear
				 FROM Staging.ConferenceCredit AS c
				 INNER JOIN ODSIntake.dbo.DateDim AS d ON c.Date = d.TheDate
				 ) AS dt
			PIVOT(SUM(ConferenceCreditAmount) FOR dt.MonthOfYear IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])
					) AS pvt
			) AS SOURCE (PMID, TheDate, Jan, Feb, March, April, May, June, July, August, September, October, November, December)
			ON TARGET.Date = SOURCE.TheDate
			AND TARGET.PMID = SOURCE.PMID

	WHEN MATCHED THEN

	UPDATE
	SET Jan = SOURCE.Jan
	, Feb = SOURCE.Feb
	, March = SOURCE.March
	, April = SOURCE.April
	, May = SOURCE.May
	, June = SOURCE.June
	, July = SOURCE.July
	, August = SOURCE.August
	, September = SOURCE.September
	, October = SOURCE.October
	, November = SOURCE.November
	, December = SOURCE.December

	WHEN NOT MATCHED THEN

	INSERT(PMID, [Date], Jan, Feb, March, April, May, June, July, August, September, October, November, December)
	VALUES(SOURCE.PMID, SOURCE.TheDate, SOURCE.Jan, SOURCE.Feb, SOURCE.March, SOURCE.April, SOURCE.May, SOURCE.June, SOURCE.July, SOURCE.August, SOURCE.September, SOURCE.October, SOURCE.November, SOURCE.December)
	;

	UPDATE x
	SET Annual = (Jan+Feb+March+April+May+June+July+August+September+October+November+December)
	FROM [dbo].[ConfereceCredits] AS x
	WHERE x.Date BETWEEN @StartOfYear AND @EndOfYear


END TRY
BEGIN CATCH

	ROLLBACK TRAN

	DECLARE @ErrorMessage NVARCHAR(4000)
        , @ErrorNumber INT
        , @ErrorSeverity INT
        , @ErrorState INT
        , @ErrorLine INT
        , @ErrorProcedure NVARCHAR(200)

		SELECT 
        @ErrorNumber = ERROR_NUMBER()
        , @ErrorSeverity = ERROR_SEVERITY()
        , @ErrorState = ERROR_STATE()
        , @ErrorLine = ERROR_LINE()
        , @ErrorProcedure = ISNULL(ERROR_PROCEDURE(), '-')
		, @ErrorMessage = ERROR_MESSAGE();

		RAISERROR 
        (@ErrorMessage 
        , @ErrorSeverity, 1               
        , @ErrorNumber    -- parameter: original error number.
        , @ErrorSeverity  -- parameter: original error severity.
        , @ErrorState     -- parameter: original error state.
        , @ErrorProcedure -- parameter: original error procedure name.
        , @ErrorLine       -- parameter: original error line number.
        );

	

END CATCH
END

GO
