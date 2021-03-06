USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PriceProtection_ListNoCA_NDC]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 9/23/2014
-- Description:	QA Cardinal   Price Protection  
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PriceProtection_ListNoCA_NDC] 
	-- Add the parameters for the stored procedure here
 
AS
 

BEGIN

SET ARITHABORT OFF 
SET ANSI_WARNINGS OFF



-- Get any NDC's Cardinal didn't include (this may have multiple occurances of same NDC
 
IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPNoNDC')
		 BEGIN
          DROP TABLE tmp_PPNoNDC
         END

SELECT * INTO tmp_PPNoNDC FROM
(
	 SELECT distinct ndc from tmp_PPPurchasesValid where ndc not in
	 (
			 SELECT distinct ndc from  pharmacymaster..CA_PriceProtection where isvalid = 'Y'
	 )
 )pp


--Purchases made with the missing eligible NDC's

IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPNoNDCPurchases')
		 BEGIN
          DROP TABLE tmp_PPNoNDCPurchases
         END

SELECT * INTO tmp_PPNoNDCPurchases FROM 
(
	SELECT   * FROM tmp_PPPurchasesValid where ndc in (select distinct ndc from tmp_PPNoNDC)
)pp

--List of stores with purchases that are affected by NDC's not included
 

IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPNoNDCStores')
		 BEGIN
          DROP TABLE tmp_PPNoNDCStores
         END

SELECT * INTO tmp_PPNoNDCStores from
(
	SELECT PMID,AccountName,AAPAccountNo,AAPEffectiveDate,AAPQuitdate,APIAccountNo,APIStatus
	 from pharmacymaster..PM_Pharmacy where PMID in
   (
		SELECT   DISTINCT PMID  from tmp_PPPurchasesValid where 
		NDC in	(SELECT  DISTINCT NDC from  tmp_PPNoNDC)
	 
	)
)pp


 
END

GO
