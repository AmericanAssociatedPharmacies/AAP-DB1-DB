USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PM_AnnualRebates_PlanOGram_Merge]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/08/2010>
-- Description:	 Populate ALL_VOlume table with API WH Sales 
-- =============================================
Create PROCEDURE [dbo].[sppm_PM_AnnualRebates_PlanOGram_Merge]
 
AS
BEGIN
 
 
 -- Merging in old tables

----2011
-- INSERT  into reports..import_RebatePlanOGram (Year, PMID, AccountName,Owner,Address1,City,State,Zip,
--             Description,Affiliate,AAPAccountNo,APIAccountNo,Rebate)   
--
--      SELECT '2011' ,a.PMID,p.AccountName,Fullname,Address1,City,ST,Zip,Type,SubType,p.AAPAccountNo ,
--                   p.APIAccountNo, SUM(Rebate) as Rebate
--				 FROM  reports..import_planogram2011 a  
--					join pharmacymaster..pm_pharmacy p on a.pmid = p.pmid
--				 
--				 GROUP BY a.PMID,p.AccountName,Fullname,Address1,City,ST,Zip,Type,SubType,p.AAPAccountNo ,
--                   p.APIAccountNo
-- 
 
----2012
-- INSERT  into reports..import_RebatePlanOGram (Year, PMID, AccountName,Owner,Address1,City,State,Zip,
--             Description,Affiliate,AAPAccountNo,APIAccountNo,Rebate)   
--
--      SELECT '2012' ,a.PMID,p.AccountName,Fullname,Address1,City,ST,Zip,ype,SubType,p.AAPAccountNo ,
--                   p.APIAccountNo, SUM(Rebate) as Rebate
--				 FROM  reports..import_planogram2012 a  
--					join pharmacymaster..pm_pharmacy p on a.pmid = p.pmid
--				 
--				 GROUP BY a.PMID,p.AccountName,Fullname,Address1,City,ST,Zip,ype,SubType,p.AAPAccountNo ,
--                   p.APIAccountNo

----2013
-- INSERT  into reports..import_RebatePlanOGram (Year, PMID, AccountName,Owner,Address1,City,State,Zip,
--             Description,Affiliate,AAPAccountNo,APIAccountNo,Rebate)   
--
--      SELECT '2013' ,a.PMID,p.AccountName,Fullname,Address1,City,ST,Zip,type,affiliate,p.AAPAccountNo ,
--                   p.APIAccountNo, SUM([2013 Rebate]) as Rebate
--				 FROM  reports..import_planogram2013 a  
--					join pharmacymaster..pm_pharmacy p on a.pmid = p.pmid
--				 
--				 GROUP BY a.PMID,p.AccountName,Fullname,Address1,City,ST,Zip,type,affiliate,p.AAPAccountNo ,
--                   p.APIAccountNo
 
 
--2014
 INSERT  into reports..import_RebatePlanOGram (Year, PMID, AccountName,Owner,Address1,City,State,Zip,
             Description,Affiliate,AAPAccountNo,APIAccountNo,Rebate)   

      SELECT '2014' ,a.PMID,p.AccountName,Fullname,Address1,City,ST,Zip,type,subtype,p.AAPAccountNo ,
                   p.APIAccountNo, SUM([2014 Rebate]) as Rebate
				 FROM  reports..import_planogram2014 a  
					join pharmacymaster..pm_pharmacy p on a.pmid = p.pmid
				 
				 GROUP BY a.PMID,p.AccountName,Fullname,Address1,City,ST,Zip,type,subtype,p.AAPAccountNo ,
                   p.APIAccountNo
 
END








GO
