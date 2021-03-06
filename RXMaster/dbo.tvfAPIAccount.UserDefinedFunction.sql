USE [RXMaster]
GO
/****** Object:  UserDefinedFunction [dbo].[tvfAPIAccount]    Script Date: 12/22/2020 5:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[tvfAPIAccount](@APIAccountNo VARCHAR(50))

RETURNS TABLE

AS 

RETURN


    (SELECT p.PMID, p.[APIAccountNumHistorical] AS APIAccountNo, p.[APIAccountNumHistoricalEndDate], pd.[APIEffectiveDate], ISNULL(pd.[APIQuitDate], '29991231') AS APIQuitDate
	FROM PharmacyMaster.dbo.PM_Pharmacy AS p
	INNER JOIN RXMaster.dbo.PharmacyDim AS pd ON p.PMID = pd.PMID
	WHERE p.APIAccountNumHistorical = @APIAccountNo

	UNION 

	SELECT p.PMID, p.[APIAccountNumHistorical] AS APIAccountNo, p.[APIAccountNumHistoricalEndDate], pd.[APIEffectiveDate], ISNULL(pd.[APIQuitDate], '29991231') AS APIQuitDate
	FROM PharmacyMaster.dbo.PM_Pharmacy AS p
	INNER JOIN RXMaster.dbo.PharmacyDim AS pd ON p.PMID = pd.PMID
	WHERE p.APIAccountNo = @APIAccountNo

	UNION

	SELECT p.PMID, p.APIAccountNo , p.[APIAccountNumHistoricalEndDate], pd.[APIEffectiveDate], ISNULL(pd.[APIQuitDate], '29991231') AS APIQuitDate
	FROM PharmacyMaster.dbo.PM_Pharmacy AS p
	INNER JOIN RXMaster.dbo.PharmacyDim AS pd ON p.PMID = pd.PMID
	WHERE p.APIAccountNo = @APIAccountNo
	);
GO
