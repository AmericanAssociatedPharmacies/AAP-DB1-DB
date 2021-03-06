USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PriceProtection_ListNoMatchDetail]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 9/23/2014
-- Description:	QA Cardinal   Price Protection  
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PriceProtection_ListNoMatchDetail] 
	-- Add the parameters for the stored procedure here

AS
 

BEGIN

SET ARITHABORT OFF 
SET ANSI_WARNINGS OFF



 

IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPDetailNoMatch')
		 BEGIN
          DROP TABLE tmp_PPDetailNoMatch
         END 
SELECT * into tmp_PPDetailNoMatch
from
(
  select t.AuditFailReason, p.*    from tmp_PPCompareNoMatchPPDueToDate t 

    join
    (
			 select * from tmp_PPPurchases3MoPrior
    ) p
    ON t.customer_no = p. customer_no and t.ndc = p.ndc
    where AuditFailReason 
			like '%Prev3MonthUsage%' or AuditFailReason like '%AvgMonthUsage%' 
  ) pp 

insert into tmp_PPDetailNoMatch
      select t.AuditFailReason, p.*    from tmp_PPCompareNoMatchPPDueToDate t 

    join
    (
			 select * from tmp_PPPurchases3MoPrior
    ) p
    ON t.customer_no = p. customer_no and t.ndc = p.ndc
    where AuditFailReason 
			like '%Effective Date%'  

insert into tmp_PPDetailNoMatch
      select t.AuditFailReason, p.*    from tmp_PPCompareNoMatchPPDueToDate t 

    join
    (
			 select * from tmp_PPPurchasesValid
    ) p
    ON t.customer_no = p. customer_no and t.ndc = p.ndc
    where AuditFailReason 
			like '%ActualUsageToDate%'  


insert into tmp_PPDetailNoMatch
      select t.AuditFailReason, p.*    from tmp_PPCompareNoMatchPPDueToDate t 

    join
    (
			 select * from tmp_PPPurchasesValid
    ) p
    ON t.customer_no = p. customer_no and t.ndc = p.ndc
    where AuditFailReason 
			like '%Not in Cardinal as Valid%'  


insert into tmp_PPDetailNoMatch
      select t.AuditFailReason, p.*    from tmp_PPCompareNoMatchPPDueToDate t 

    join
    (
			 select * from tmp_PPPurchasesValid
    ) p
    ON t.customer_no = p. customer_no and t.ndc = p.ndc
    where AuditFailReason 
			like '%Not in AAP as Valid%'  


select * from tmp_PPDetailNoMatch order by customer_no

 
END

GO
