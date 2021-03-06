USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PriceProtectionLoad_Prod]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 9/22/2014
-- Description:	load Cardinal   Price Protection from import and zero fill two columns
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PriceProtectionLoad_Prod] 
	-- Add the parameters for the stored procedure here
	@in_date varchar(10) 
AS
 
-- Update field in import_PriceProtection before copy over

UPDATE  reports..import_PriceProtection  set 
RebateReportMonth = dateadd(month,1, date) where RebateReportMonth is null


BEGIN
INSERT INTO PharmacyMaster..CA_PriceProtection (
Date,
RebateReportMonth,
L01AfltnName,
DCNumber,
CustomerNumber,
CustomerName,
CorpItemNumber,
Description,
NDC,
Supplier,
Size,
ProtectedSelPrice,
NewSellPrice,
ProtectionStartDate,
ProtectionEndDate,
Prev3MonthUsage,
AvgMonthlyUsage,
UnitSellDlr,
ActualUsageToDate,
PriceProtectionDueToDate,
State,
SubAffiliation,
CustomerUnique,
Usage,
Returns,
PriorMonthUsage,
Available,
OverageLastMonth,
TotalOwed,
UsageForCalculation,
Comment
)  

SELECT 
Date,
RebateReportMonth,
L01AfltnName,
DCNumber,
CustomerNumber,
CustomerName,
CorpItemNumber,
Description,
NDC,
Supplier,
Size,
ProtectedSelPrice,
NewSellPrice,
ProtectionStartDate,
ProtectionEndDate,
Prev3MonthUsage,
AvgMonthlyUsage,
UnitSellDlr,
ActualUsageToDate,
PriceProtectionDueToDate,
State,
SubAffiliation,
CustomerUnique,
Usage,
Returns,
PriorMonthUsage,
Available,
OverageLastMonth,
TotalOwed,
UsageForCalculation,
Comment

 from import_priceprotection where date = @in_date

--Update Customer Number - Cardinal Purchase data is Zero filled 
UPDATE PharmacyMaster..CA_PriceProtection set  customerNumber = replicate('0', 6-len(customerNumber) )+ customerNumber  
 
--Update NDC - NDC is 11 digits zero filled - the file I receive isn't
UPDATE PharmacyMaster..CA_PriceProtection set  ndc = replicate('0', 11-len(ndc) )+ ndc

UPDATE  PharmacyMaster..CA_PriceProtection set Usage = 0 where Usage is null;
UPDATE  PharmacyMaster..CA_PriceProtection set Returns = 0 where Returns is null;
UPDATE  PharmacyMaster..CA_PriceProtection set PriorMonthUsage = 0 where PriorMonthUsage is null;
UPDATE  PharmacyMaster..CA_PriceProtection set Available = 0 where Available is null;
UPDATE  PharmacyMaster..CA_PriceProtection set OverageLastMonth = 0 where OverageLastMonth is null;
UPDATE  PharmacyMaster..CA_PriceProtection  set TotalOwed = 0 where TotalOwed is null;
UPDATE  PharmacyMaster..CA_PriceProtection  set UsageForCalculation = 0 where UsageForCalculation is null;

-- USE THE UPDATE FORM OF THIS TO UPDATE NEW PAYOUTDATE field (when I get it in there)
--select date ,dateadd(month,1, date)  as PayoutDate from PharmacyMaster..CA_PriceProtection 

--update  reports..import_PriceProtection_test set 
--payoutdate = dateadd(month,1, date) where payoutdate is null
--
--update  reports..CA_PriceProtection_test set 
--payoutdate = dateadd(month,1, date) where payoutdate is null


--Do not want to zero out now - need to move the data from PriceProtectionDueToData to FinalPriceProtectionDue in the CA_PriceProtection
-- first - I'll check for nulls to determing those that weren't updated 
-- UPDATE  PharmacyMaster..CA_PriceProtection  set  RebatePerc  = 0 where RebatePerc is null
-- UPDATE  PharmacyMaster..CA_PriceProtection set FinalPriceProtectionDue = 0 where FinalPriceProtectionDue is null

END

GO
