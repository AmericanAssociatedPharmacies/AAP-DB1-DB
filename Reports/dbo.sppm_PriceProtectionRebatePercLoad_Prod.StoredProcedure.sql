USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PriceProtectionRebatePercLoad_Prod]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 04/01/2015
-- Description:	load Cardinal   Price Protection with Rebate % and new Price Protection Rebate
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PriceProtectionRebatePercLoad_Prod] 
	-- Add the parameters for the stored procedure here
	@in_date varchar(10) 
AS
 

BEGIN
INSERT INTO PharmacyMaster..CA_PriceProtectionRebatePerc (
Date,
State,
SubAffiliation,
CustomerUnique,
L01AfltnName,
DC,
CustomerNumber,
CustomerName,
CorporateItemNumber,
Description,
NDC,
Supplier,
Size,
OldSell,
NewSell,
PercChange,
ProtectionStartDate,
ProtectionEndDate,
Previous3MonthsHistoricalUsage,
AverageMonthlyUsage,
UnitSellDlr,
Usage,
Returns,
TotalUsage,
PriorMonthUsage,
AvailableFromLastMonth,
OverageLastMonth,
TotalOwed,
UsageForCalculation,
PriceProtectionDue,
Comments,
RebatePerc,
FinalPriceProtectionDue

)  

SELECT 
Date,
State,
SubAffiliation,
CustomerUnique,
L01AfltnName,
DC,
CustomerNumber,
CustomerName,
CorporateItemNumber,
Description,
NDC,
Supplier,
Size,
OldSell,
NewSell,
PercChange,
ProtectionStartDate,
ProtectionEndDate,
Previous3MonthsHistoricalUsage,
AverageMonthlyUsage,
UnitSellDlr,
Usage,
Returns,
TotalUsage,
PriorMonthUsage,
AvailableFromLastMonth,
OverageLastMonth,
TotalOwed,
UsageForCalculation,
PriceProtectionDue,
Comments,
RebatePerc,
FinalPriceProtectionDue

 from import_PRiceProtectionRebatePerc where date = @in_date

--Update Customer Number - Cardinal Purchase data is Zero filled 
UPDATE PharmacyMaster..CA_PriceProtectionRebatePerc set  customerNumber = replicate('0', 6-len(customerNumber) )+ customerNumber  
 
--Update NDC - NDC is 11 digits zero filled - the file I receive isn't
UPDATE PharmacyMaster..CA_PriceProtectionRebatePerc set  ndc = replicate('0', 11-len(ndc) )+ ndc

UPDATE  PharmacyMaster..CA_PriceProtectionRebatePerc set Usage = 0 where Usage is null;
UPDATE  PharmacyMaster..CA_PriceProtectionRebatePerc set Returns = 0 where Returns is null;
UPDATE  PharmacyMaster..CA_PriceProtectionRebatePerc set PriorMonthUsage = 0 where PriorMonthUsage is null;
UPDATE  PharmacyMaster..CA_PriceProtectionRebatePerc set AvailableFromLastMonth = 0 where AvailableFromLastMonth is null;
UPDATE  PharmacyMaster..CA_PriceProtectionRebatePerc set OverageLastMonth = 0 where OverageLastMonth is null;
UPDATE  PharmacyMaster..CA_PriceProtectionRebatePerc  set TotalOwed = 0 where TotalOwed is null;
UPDATE  PharmacyMaster..CA_PriceProtectionRebatePerc  set UsageForCalculation = 0 where UsageForCalculation is null;

--Do not want to zero out now - need to move the data from PriceProtectionDueToData to FinalPriceProtectionDue in the CA_PriceProtection
-- first - I'll check for nulls to determing those that weren't updated 
-- UPDATE  PharmacyMaster..CA_PriceProtection  set  RebatePerc  = 0 where RebatePerc is null
-- UPDATE  PharmacyMaster..CA_PriceProtection set FinalPriceProtectionDue = 0 where FinalPriceProtectionDue is null

END

GO
