USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PM_AnnualRebates_CardinalAdminFee_Merge]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/08/2010>
-- Description:	 Populate ALL_VOlume table with API WH Sales 
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PM_AnnualRebates_CardinalAdminFee_Merge]
 
AS
BEGIN
 
 
 -- Merging in old tables

-- 2010 - didn't have the original file - that was a weird year and I think the values were in
-- four separate files (PM_APIAdminQ1_2010 ,PM_APIAdminQ2_2010,PM_APIAdminQ3_2010,PM_APIAdminQ4_2010
-- that Betty had sent - values were in with API rebates.  2010 original will not be in the 
-- import_RebateCAAnnualAdminFeePivot they will be in the import_RebateCAAnnualAdminFee

----2010 DONE

-- INSERT  into reports..import_RebateCAAnnualAdminFee (Date, PMID,ExtSales)   
-- 
--SELECT date,pmid,extsales from reports..PM_CH_AnnualAdminFee_2010


------2011
--
---- Insert Original
-- INSERT  into reports..import_RebateCAAnnualAdminFeePivot (Year,pmid,caaccountno,January,February,March,April,
--		May,June,July,August,September,October,November,December,extsales )
-- SELECT '2011',PMID,CAAcctNo,SumOfJan,SumOfFeb,SumOfMar,SumOfApr,
--        SumOfMay,SumOfJun,SumOfJul,SumOfAug,SumOfSep,SumOfOct,SumOfNov,SumOfDec,ExtSales 
--        from PM_CH_AnnualAdminFee_2011Pivot
--
----Insert unpivoted table
-- INSERT  into reports..import_RebateCAAnnualAdminFee (Date, PMID,ExtSales)    
--	SELECT date,pmid,extsales from reports..PM_CH_AnnualAdminFee_2011
-- 
 
------2012
--
---- Insert Original
-- INSERT  into reports..import_RebateCAAnnualAdminFeePivot (Year,pmid,caaccountno,AccountName,January,February,March,April,
--		May,June,July,August,September,October,November,December,extsales ,AnnualAdminFee)
-- SELECT '2012',PMID,CA#,[Cust Name],[JAN 2012],[FEB 2012],[MAR 2012],[APR 2012],[MAY 2012],[JUN 2012],
--       [JUL 2012],[AUG 2012],[SEP 2012],[OCT 2012],[NOV 2012],[DEC 2012],[Sum Extended Sales],[Addl Admin Fee]
--        from pharmacymaster..PM_CH_AnnualAdminFee_2012Pivot
--
----Insert unpivoted table
-- INSERT  into reports..import_RebateCAAnnualAdminFee (Date, PMID,ExtSales)    
--	SELECT date,pmid,extsales from pharmacymaster..PM_CH_AnnualAdminFee_2012
 
----2013

-- Insert Original
 INSERT  into reports..import_RebateCAAnnualAdminFeePivot (Year,pmid,caaccountno,AccountName,January,February,March,April,
		May,June,July,August,September,October,November,December,extsales ,AnnualAdminFee)
 SELECT '2013',PMID,AccountNo,AccountName,Jan,Feb,Mar,Apr,May,Jun,
		Jul,Aug,Sep,Oct,Nov,Dec,ExtSalesTotal,AnnualAdminFee
        from pharmacymaster..PM_CH_AnnualAdminFee_2013_Pivot

--Insert unpivoted table
 INSERT  into reports..import_RebateCAAnnualAdminFee (Date, PMID,ExtSales)    
	SELECT date,pmid,extsales from pharmacymaster..PM_CH_AnnualAdminFee_2013

--Did 2014 from the original file to the new table (import_RebateCAAnnualAdminFeePivot) and did the unpivot 
-- to the import_RebateCAAnnualAdminFee table with the code I will put into production in
-- dbo.sppm_PM_AnnualRebates_CardinalAdminFee_Pivot
END








GO
