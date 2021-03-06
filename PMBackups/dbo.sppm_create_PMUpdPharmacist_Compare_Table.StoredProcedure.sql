USE [PMBackups]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_PMUpdPharmacist_Compare_Table]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <04/14/2010>
-- Description:	Create Compare tables from the backups
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_PMUpdPharmacist_Compare_Table]

AS
	BEGIN
 
 
-- Compare for API Data

   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_ComparePMUPDPharmacist')
          DROP TABLE tmp_ComparePMUPDPharmacist
 

	SELECT * into tmp_ComparePMUPDPharmacist from (

	SELECT MIN(TableName) as TableName,  count(*) 
	NDUPS,
   [ID]
      ,[PMID]
      ,[PharPrime]
      ,[PharFullName]
      ,[PharTitle]
      ,[PharState]
      ,[PharLicNo]
      ,[PharExpDate]
	FROM
	(

	  SELECT 'Outdated_APIData' as TableName, count(*) NDUPS, 	[ID]
      ,[PMID]
      ,[PharPrime]
      ,[PharFullName]
      ,[PharTitle]
      ,[PharState]
      ,[PharLicNo]
      ,[PharExpDate]

	  FROM PharmacyMaster..PM_Pharmacists_BeforeUpd021511 A
		GROUP BY 
	[ID]
      ,[PMID]
      ,[PharPrime]
      ,[PharFullName]
      ,[PharTitle]
      ,[PharState]
      ,[PharLicNo]
      ,[PharExpDate]
	  UNION ALL

	  SELECT 'New_APIData' as TableName,  count(*) 
	NDUPS,
  [ID]
      ,[PMID]
      ,[PharPrime]
      ,[PharFullName]
      ,[PharTitle]
      ,[PharState]
      ,[PharLicNo]
      ,[PharExpDate]

	  FROM PharmacyMaster..PM_Pharmacists  B
	   GROUP BY [ID]
      ,[PMID]
      ,[PharPrime]
      ,[PharFullName]
      ,[PharTitle]
      ,[PharState]
      ,[PharLicNo]
      ,[PharExpDate]
	) tmp

	GROUP BY  
	NDUPS,
 [ID]
      ,[PMID]
      ,[PharPrime]
      ,[PharFullName]
      ,[PharTitle]
      ,[PharState]
      ,[PharLicNo]
      ,[PharExpDate]
	HAVING COUNT(*) = 1
	) tmp

END
GO
