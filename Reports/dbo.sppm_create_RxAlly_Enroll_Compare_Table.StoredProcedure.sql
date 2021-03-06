USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_RxAlly_Enroll_Compare_Table]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <09/10/2010>
-- Description:	Create Compare tables for Non MC for Solomon
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_RxAlly_Enroll_Compare_Table]

AS
	BEGIN
 
 
-- Compare for API Data

   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_CompareRxAllyEnroll')
          DROP TABLE tmp_CompareRxAllyEnroll;
 

	SELECT * into tmp_CompareRxAllyEnroll from (

	SELECT MIN(TableName) as TableName,  count(*) 
	NDUPS,PMID,AccountName,NCPDP,OwnerName,Email,Phone,Fax,OtherInformation,StartDate
	FROM
	(

	  SELECT 'Outdated_RxAllyEnroll' as TableName, count(*) NDUPS,PMID, AccountName,NCPDP,OwnerName,Email,Phone,Fax,OtherInformation,StartDate
	  FROM tmp_RxAlly_Enroll_Bkp A
		GROUP BY  PMID,AccountName,NCPDP,OwnerName,Email,Phone,Fax,OtherInformation,StartDate

	  UNION ALL

	  SELECT 'New_RxAllyEnroll' as TableName,  count(*) NDUPS,PMID,AccountName,NCPDP,OwnerName,Email,Phone,Fax,OtherInformation,StartDate
	  FROM tmp_RxAlly_Enroll  B
	   GROUP BY PMID,AccountName,NCPDP,OwnerName,Email,Phone,Fax,OtherInformation,StartDate
	) tmp

	GROUP BY  
	NDUPS,PMID,AccountName,NCPDP,OwnerName,Email,Phone,Fax,OtherInformation,StartDate

	HAVING COUNT(*) = 1
	) tmp

END
GO
