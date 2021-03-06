USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PriceProtection_ListNoCA_Purchases]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 9/23/2014
-- Description:	QA Cardinal   Price Protection  
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PriceProtection_ListNoCA_Purchases] 
	-- Add the parameters for the stored procedure here
 
AS
 

BEGIN

SET ARITHABORT OFF 
SET ANSI_WARNINGS OFF



 



-- Get Purchases we have that CA doesn't (used both import and Production load of CA data 
-- to get this - to make sure we're not missing any zero-filled or non zero-filled customer no.
-- The file I was sent did not have zero fill but as far as I can tell the purchase table
-- has them zero filled -- PAIN
 
IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPAllNoPurchases')
		 BEGIN
          DROP TABLE tmp_PPAllNoPurchases
         END

SELECT * into tmp_PPAllNoPurchases from
(
	SELECT * from tmp_PPPurchasesValid where   customer_no not in 
	(select customernumber from  pharmacymaster..CA_PriceProtection where isvalid = 'Y' )  
	and customer_no not in (select customernumber from import_priceprotection)
	and customer_no in (select customer_no from tmp_PPPurchases3MoPrior)
)pp

--GET PMID and other info from PM for those purchases in previous query 
 

IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPAllNoPurchasesPharm')
		 BEGIN
          DROP TABLE tmp_PPAllNoPurchasesPharm
         END

SELECT * into tmp_PPAllNoPurchasesPharm from
(
 	SELECT PMID,AccountName,AAPAccountNo,AAPEffectiveDate,AAPQuitdate,APIAccountNo,APIStatus
	 from pharmacymaster..PM_Pharmacy where PMID in
   (
		select distinct PMID from tmp_PPPurchasesValid where   customer_no not in 
		(select customernumber from  pharmacymaster..CA_PriceProtection where isvalid = 'Y')  
		and customer_no not in (select customernumber from import_priceprotection)
		and customer_no in (select customer_no from tmp_PPPurchases3MoPrior)
	 
	)
)pp




 
END

GO
