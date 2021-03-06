USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PriceProtection_ListNoMatchCompare]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 9/23/2014
-- Description:	QA Cardinal   Price Protection  
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PriceProtection_ListNoMatchCompare] 
 
AS
 

BEGIN

--Where the PriceProtectionDueToDate did not match

IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPCompareNoMatchPPDueToDate')
		 BEGIN
          DROP TABLE tmp_PPCompareNoMatchPPDueToDate
         END
 
SELECT * into tmp_PPCompareNoMatchPPDueToDate from (
  SELECT * from tmp_PPCompare 
where  auditok = 'No' and ( CAPriceProtectionDueToDate != AAPPriceProtectionDueToDate) or
(CAPriceProtectionDueToDate is null and AAPPriceProtectionDueToDate is not null) or
(CAPriceProtectionDueToDate is not null and AAPPriceProtectionDueToDate is   null)
)pp

SELECT * from tmp_PPCompareNoMatchPPDueToDate -- ****************
 
 
END

GO
