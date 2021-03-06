USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PriceProtectionRebatePercCopyUpdateFields]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 9/23/2014
-- Description:	QA Cardinal   Price Protection  
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PriceProtectionRebatePercCopyUpdateFields] 
	-- Add the parameters for the stored procedure here
@in_date varchar(10) 
AS
 

BEGIN

SET ARITHABORT OFF 
SET ANSI_WARNINGS OFF

--After you do this need to see if there are any Joshua didn't have in detail and copy whats in PharmacyMaster..CA_PriceProtection.PriceProtectionDueToDate to
--PharmacyMaster..CA_PriceProtection.FinalPriceProtectionDue

--select p.rebateperc,i.rebateperc ,
--p.finalpriceprotectiondue, i.finalpriceprotectiondue
 
UPDATE p SET
p.rebateperc = i.rebateperc ,
p.finalpriceprotectiondue = i.finalpriceprotectiondue
 FROM PharmacyMaster..CA_PriceProtection p 
 join
(
	SELECT * FROM PharmacyMaster..CA_PriceProtectionRebatePerc WHERE date = @in_date
) i on p.customernumber = i.customernumber and p.ndc = i.ndc 
and p.unitselldlr = i.unitselldlr and p.protectionstartdate = i.protectionstartdate
WHERE p.date = @in_date

--AFTER DO THIS NEED TO COPY PRICEPROTECTIONDUETODATE to any FinalPriceProtectionDue that Joshua didn't have
-- MAY NO have to do this check first by:

--select * from PharmacyMaster..CA_PriceProtection
-- WHERE  date = '03/01/2015' and FinalPriceProtectionDue is   null

--If the above SQL returns anything you will need to update the FinalPriceProtectionDue with the
-- PriceProtectionDueToDate in the CA_PriceProtection table

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
 
--TO UPDATE THOSE JOSHUA DIDN"T HAVE IN DETAIL FILE
--UPDATE  dbo.CA_PriceProtection set FinalPriceProtectionDue = PriceProtectionDueToDate where
--FinalPriceProtectionDue is null
 
 
END

GO
