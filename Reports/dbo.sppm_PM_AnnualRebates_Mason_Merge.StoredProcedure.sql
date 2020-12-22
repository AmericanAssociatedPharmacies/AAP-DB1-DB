USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PM_AnnualRebates_Mason_Merge]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/08/2010>
-- Description:	 Populate ALL_VOlume table with API WH Sales 
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PM_AnnualRebates_Mason_Merge]
(@in_year varchar(4) )
AS
BEGIN
 
  

 
--2012
--  INSERT  into reports..import_RebateMasonRebate 
--    (Year,PMID,CAAccountNo,DC,AccountName,Dollars,Rebate,Affiliate   )   
--
-- SELECT '2012',PMID,AccountNo,DCNumber,AccountName,Dollars,Rebate,Affiliate from
--	reports..import_masonrebate2012

--2013
  INSERT  into reports..import_RebateMasonRebate 
    (Year,PMID,CAAccountNo,DC,AccountName,Rebate   )   

 SELECT '2013',PMID,CANumber,Division,AccountName,Rebate from
	reports..import_masonrebate2013
 

 
END








GO
