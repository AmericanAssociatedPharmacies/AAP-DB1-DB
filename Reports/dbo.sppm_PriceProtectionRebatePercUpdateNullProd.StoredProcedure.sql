USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PriceProtectionRebatePercUpdateNullProd]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 5/19/2015
-- Description:	QA Cardinal   Price Protection  
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PriceProtectionRebatePercUpdateNullProd] 
	-- Add the parameters for the stored procedure here
@in_date varchar(10) 
AS
 

BEGIN

SET ARITHABORT OFF 
SET ANSI_WARNINGS OFF


  
--TO UPDATE THOSE JOSHUA DIDN"T HAVE IN DETAIL FILE
UPDATE  PharmacyMaster.dbo.CA_PriceProtection set FinalPriceProtectionDue = PriceProtectionDueToDate where
FinalPriceProtectionDue is null

 --QA 
--This finds any in original file that wasn't in the detail from Joshua
--select*  from dbo.CA_PriceProtection c
-- left join
--(
--select *  from PharmacyMaster..CA_PriceProtectionRebatePerc 
--) p on c.customernumber = p.customernumber  and c.ndc = p.ndc
--and c.unitselldlr = p.unitselldlr
--where c.date = '02/01/2015' and p.customernumber is null 

----THIS SHOULD EQUAL THE TOTAL IN THE DETAIL FILE JOSHUA SENDS WITH REBATE PERC AND FINAL PP REBATE
--select sum(FinalPriceProtectionDue ) - (
--select sum(PriceProtectionDueToDate)  from dbo.CA_PriceProtection c
-- left join
--(
--select *  from PharmacyMaster..CA_PriceProtectionRebatePerc 
--) p on c.customernumber = p.customernumber  and c.ndc = p.ndc
--and c.unitselldlr = p.unitselldlr
--where c.date = '02/01/2015' and p.customernumber is null ) as  CA
--  from dbo.CA_PriceProtection where date = '02/01/2015' 

 
 
END

GO
