USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_NonMC_Compare_Table]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <09/10/2010>
-- Description:	Create Compare tables for Non MC for Solomon
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_NonMC_Compare_Table]

AS
	BEGIN
 
 
-- Compare for API Data

   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_CompareNonMC')
          DROP TABLE tmp_CompareNonMC;
 

	SELECT * into tmp_CompareNonMC from (

	SELECT MIN(TableName) as TableName,  count(*) 
	NDUPS,PMID,AAPAccountNo,AccountName,AAPEffectivedate,AAPQuitDate,Address,Address2,City,State,Zip,ContactFullName,NCPDP,FedID,CorporateName
	FROM
	(

	  SELECT 'Outdated_NonMCData' as TableName, count(*) NDUPS, 	  PMID,AAPAccountNo,AccountName,AAPEffectivedate,AAPQuitDate,Address,Address2,City,State,Zip,ContactFullName,NCPDP,FedID,CorporateName

	  FROM tmp_NonMC_SOL_Bkp A
		GROUP BY 
	        PMID,AAPAccountNo,AccountName,AAPEffectivedate,AAPQuitDate,Address,Address2,City,State,Zip,ContactFullName,NCPDP,FedID,CorporateName

	  UNION ALL

	  SELECT 'New_NonMCData' as TableName,  count(*) 
	NDUPS,PMID,AAPAccountNo,AccountName,AAPEffectivedate,AAPQuitDate,Address,Address2,City,State,Zip,ContactFullName,NCPDP,FedID,CorporateName

	  FROM tmp_NonMC_SOL  B
	   GROUP BY PMID,AAPAccountNo,AccountName,AAPEffectivedate,AAPQuitDate,Address,Address2,City,State,Zip,ContactFullName,NCPDP,FedID,CorporateName
	) tmp

	GROUP BY  
	NDUPS,PMID,AAPAccountNo,AccountName,AAPEffectivedate,AAPQuitDate,Address,Address2,City,State,Zip,ContactFullName,NCPDP,FedID,CorporateName

	HAVING COUNT(*) = 1
	) tmp

END
GO
