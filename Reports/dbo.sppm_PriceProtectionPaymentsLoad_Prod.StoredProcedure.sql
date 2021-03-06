USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PriceProtectionPaymentsLoad_Prod]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 9/22/2014
-- Description:	load Cardinal   Price Protection from import and zero fill two columns
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PriceProtectionPaymentsLoad_Prod] 
	-- Add the parameters for the stored procedure here
	@in_date varchar(10) 
AS
 

BEGIN
INSERT INTO PharmacyMaster..CA_PriceProtectionPayments (
Date,
CustomerNumber,
CustomerName,
PriceProtectionDueToDate,
State,
SubAffiliation,
DC,
Protection,
AdjForPriorNegBal,
AmountDue
)  

SELECT 
Date,
CustomerNumber,
CustomerName,
PriceProtectionDueToDate,
State,
SubAffiliation,
DC,
Protection,
AdjForPriorNegBal,
AmountDue
 from import_PriceProtectionPayments  where date = @in_date

--Update Customer Number - Cardinal Purchase data is Zero filled 
UPDATE PharmacyMaster..CA_PriceProtectionPayments set  customerNumber = replicate('0', 6-len(customerNumber) )+ customerNumber  
where  customerNumber is not null
 
--Update NDC - NDC is 11 digits zero filled - the file I receive isn't
--UPDATE PharmacyMaster..CA_PriceProtectionII set  ndc = replicate('0', 11-len(ndc) )+ ndc

delete from PharmacyMaster..CA_PriceProtectionII where CustomerName is null
 

END

GO
