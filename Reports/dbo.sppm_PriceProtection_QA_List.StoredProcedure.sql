USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PriceProtection_QA_List]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <12/10/2014>
-- Description:	Price Protection QA Queries
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PriceProtection_QA_List]
(@in_date varchar(10))
 

AS
BEGIN

-- These queries can be used to determine where the differences are and how to determine who is in error - Cardinal
-- or you


-- To see where we're off on the Price Protection due to date - good place to start
-- To determine differences.  The tmp_PPCompare is the final table created that is compared to
-- the values in the PharmacyMaster..CA_PriceProtection table (file from Cardinal)

IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPComparePPDD_QA')
		 BEGIN
          DROP TABLE tmp_PPComparePPDD_QA
         END

SELECT * into tmp_PPComparePPDD_QA from (
	 SELECT * from v_tmp_PPCompare  where CAPriceProtectionDueToDate != AAPPriceProtectionDueToDate  
)ch

-- Use this to find the ones where the PriceProtectionDueToDate is not equal and the prior 3 months are
-- not equal. This can be helpful in finding cause of difference.  It is a good rule of thumb to look
-- at all the values in the tmp_PPCompare file to see which are different. You can also looks at the Comments
-- column to see what was different
IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPComparePPDD3MO_QA')
		 BEGIN
          DROP TABLE tmp_PPComparePPDD3MO_QA
         END

SELECT * into tmp_PPComparePPDD3MO_QA from (
	 SELECT * from v_tmp_PPCompare  where CAPriceProtectionDueToDate != AAPPriceProtectionDueToDate  
	 and aapprev3monthusage != caprev3monthusage
)ch

-- To find those I pulled as valid but Cardinal is not including  
-- CHANGE DATE

IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPCompareNotInCA_QA')
		 BEGIN
          DROP TABLE tmp_PPCompareNotInCA_QA
         END


SELECT * into tmp_PPCompareNotInCA_QA from (
	SELECT t.*  from v_tmp_PPCompare  t
	left outer join
	(
		SELECT * from  pharmacymaster..ca_priceprotection where date = @in_date
	)c
	on c.ndc = t.ndc and c.customernumber = t.customer_no and 
	c.unitselldlr = t.aapunitcost
	 where customernumber is null 
)ch
 
-- To find those Cardinal pulled as valid but I did not include - at this point it might be because I applied
-- a return to an incorrect purchase - until we get the order number in there there is no way to tell which
-- one it actually should be applied against.  If you determine this is the issue just move on and realize the
-- error is yours
-- CHANGE DATE

IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPCompareNotInAAP_QA')
		 BEGIN
          DROP TABLE tmp_PPCompareNotInAAP_QA
         END

SELECT* into tmp_PPCompareNotInAAP_QA from (
	SELECT  c.* from  pharmacymaster..ca_priceprotection   c
	left outer join
	(
		SELECT * from  v_tmp_PPCompare
	)t
	on c.ndc = t.ndc and c.customernumber = t.customer_no and 
	c.unitselldlr = t.aapunitcost
	 where customer_no is null and  date = @in_date
	and priceprotectionduetodate > 0
)ch
 
 

END










GO
