USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_RxAlly_Compare_Table]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <09/10/2010>
-- Description:	Create Compare tables for Non MC for Solomon
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_RxAlly_Compare_Table]

AS
	BEGIN
 
 
-- Compare for API Data

   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_CompareRxAlly')
          DROP TABLE tmp_CompareRxAlly;
 

	SELECT * into tmp_CompareRxAlly from (

	SELECT MIN(TableName) as TableName,  count(*) 
	NDUPS,PMID,IdentificationID,NCPDP,NPI,[Owner/Officer] ,Name,StreetNumber,StreetName1,StreetName2,CityName,State,ZipCode,[Owner/Officer email],[Fax number] ,Affiliate,Notes
	FROM
	(

	  SELECT 'Outdated_RxAlly' as TableName, count(*) NDUPS, 	  PMID,IdentificationID,NCPDP,NPI,[Owner/Officer] ,Name,StreetNumber,StreetName1,StreetName2,CityName,State,ZipCode,[Owner/Officer email],[Fax number] ,Affiliate,Notes

	  FROM tmp_RxAlly_Bkp A
		GROUP BY 
	        PMID,IdentificationID,NCPDP,NPI,[Owner/Officer] ,Name,StreetNumber,StreetName1,StreetName2,CityName,State,ZipCode,[Owner/Officer email],[Fax number] ,Affiliate,Notes

	  UNION ALL

	  SELECT 'New_RxAlly' as TableName,  count(*) 
	NDUPS,PMID,IdentificationID,NCPDP,NPI,[Owner/Officer] ,Name,StreetNumber,StreetName1,StreetName2,CityName,State,ZipCode,[Owner/Officer email],[Fax number] ,Affiliate,Notes
	  FROM tmp_RxAlly  B
	   GROUP BY PMID,IdentificationID,NCPDP,NPI,[Owner/Officer] ,Name,StreetNumber,StreetName1,StreetName2,CityName,State,ZipCode,[Owner/Officer email],[Fax number] ,Affiliate,Notes
	) tmp

	GROUP BY  
	NDUPS,PMID,IdentificationID,NCPDP,NPI,[Owner/Officer] ,Name,StreetNumber,StreetName1,StreetName2,CityName,State,ZipCode,[Owner/Officer email],[Fax number] ,Affiliate,Notes

	HAVING COUNT(*) = 1
	) tmp

END
GO
