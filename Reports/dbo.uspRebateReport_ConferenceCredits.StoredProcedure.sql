USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[uspRebateReport_ConferenceCredits]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspRebateReport_ConferenceCredits]

	@ConfCreditPMID INT
	, @ConfCreditStartDate DATETIME
	, @ConfCreditEndDate DATETIME


AS

SET NOCOUNT ON;

BEGIN

	DECLARE @RowCount INT
	
	DECLARE @PMIDTable TABLE (PMID INT PRIMARY KEY)

	INSERT INTO @PMIDTable 
	SELECT LinkedPMIDs as PMID
	FROM WebDev.dbo.RebateLinkedPMIDs
	WHERE PMID = @ConfCreditPMID
	UNION ALL 
	SELECT @ConfCreditPMID

	SELECT @RowCount = COUNT(*)
	FROM Reports.[dbo].[ConfereceCredits] AS c
	WHERE EXISTS(SELECT 1
				FROM @PMIDTable AS p
				WHERE c.PMID = p.PMID
				)
	AND c.Date BETWEEN @ConfCreditStartDate AND @ConfCreditEndDate

	IF @RowCount > 0
	BEGIN

	SELECT cj.LastAuditedDate, cj.RebateType, dt.Jan, dt.Feb, dt.Mar, dt.Apr, dt.May, dt.Jun, dt.Jul, dt.Aug, dt.Sep, dt.Oct, dt.Nov, dt.[Dec], dt.Annual
	FROM(SELECT SUM(c.Jan) AS Jan, SUM(c.Feb) AS Feb, SUM(c.March) AS Mar, SUM(c.April) AS Apr, SUM(c.May) AS May, SUM(c.June) AS Jun
			, SUM(c.July) AS Jul, SUM(c.August) AS Aug, SUM(c.September) AS Sep, SUM(c.October) AS Oct, SUM(c.November) AS Nov, SUM(c.December) AS [Dec]
			, SUM(c.Annual) AS Annual
		 FROM Reports.[dbo].[ConfereceCredits] AS c
		 WHERE EXISTS(SELECT 1
						FROM @PMIDTable AS p
						WHERE c.PMID = p.PMID
					 )
		AND c.Date BETWEEN @ConfCreditStartDate AND @ConfCreditEndDate
		 ) AS dt
	CROSS JOIN(SELECT MAX(Date) AS [LastAuditedDate]
				, 'AAP Conference Credit' AS RebateType
				FROM PharmacyMaster.dbo.PM_Rebates_Conference
				) AS cj

	END

	ELSE IF @RowCount = 0

	BEGIN

	SELECT dt.LastAuditedDate, dt.RebateType, 0.00 AS Jan, 0.00 AS Feb, 0.00 AS Mar, 0.00 AS Apr, 0.00 AS May, 0.00 AS Jun, 0.00 AS Jul, 0.00 AS Aug, 0.00 AS Sep, 0.00 AS Oct, 0.00 AS Nov, 0.00 AS [Dec], 0.00 AS Annual
	FROM(SELECT MAX(Date) AS [LastAuditedDate]
				, 'AAP Conference Credit' AS RebateType
				FROM PharmacyMaster.dbo.PM_Rebates_Conference	
				) AS dt

	END





END
GO
