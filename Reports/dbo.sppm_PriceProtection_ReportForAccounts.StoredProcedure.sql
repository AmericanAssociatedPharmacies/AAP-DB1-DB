USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PriceProtection_ReportForAccounts]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <02/23/2014>
-- Description:	Price Protection Report for a csutomer/account
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PriceProtection_ReportForAccounts]
 AS
 BEGIN
   SELECT    dbo.MonthFromNumber(Month(Date)) + ' ' + cast(Year(Date) as varchar(4)) as [Month/Year],DCNumber,CustomerNumber,CustomerName,CorpItemNumber,Description,
		NDC,Supplier,Size,ProtectedSelPrice,NewSellPrice,ProtectionStartDate,ProtectionEndDate,
		Prev3MonthUsage,AvgMonthlyUsage,UnitSellDlr,ActualUsageToDate,PriceProtectionDueToDate,
		State,SubAffiliation,Usage,Returns,PriorMonthUsage,Available,OverageLastMonth,
		TotalOwed,UsageForCalculation,Comment
    FROM pharmacymaster..[CA_PriceProtection] where (( month(date) in( 9,10,11,12) and year(date) = 2014 ) or  ( month(date) in(01) and year(date) = 2015 ))
        and customernumber IN 
		(
           SELECT  AccountNo from pharmacymaster..pm_chaccounts_adj
			UNPIVOT
			(
			  AccountNo for details1 in 
			  (
			  chaccountnoprimary, chaccountno2, chaccountno3, CSOSAcct, POSAcct, ScanTossAcct, SecondPrimaryNumber, Second2nd, Second3rd,
			 SecondPOS, SecondCSOS, SecondCST, ThirdPrimaryNumber, Third2nd, ThirdPOS, ThirdCSOS, ThirdCST
			 )

			) as UnPvt where pmid = 107414
        ) order by date
 

 -- For Grouped by NDC

    SELECT    dbo.MonthFromNumber(Month(Date)) + ' ' + cast(Year(Date) as varchar(4)) as [Month/Year],CustomerNumber,CustomerName,Description,
		NDC,Sum(PriceProtectionDueToDate) as TotalPriceProtectionDueToDate
 
    FROM pharmacymaster..[CA_PriceProtection] where (( month(date) in( 9,10,11,12) and year(date) = 2014 ) or  ( month(date) in(01) and year(date) = 2015 ))
        and customernumber IN 
		(
           SELECT  AccountNo from pharmacymaster..pm_chaccounts_adj
			UNPIVOT
			(
			  AccountNo for details1 in 
			  (
			  chaccountnoprimary, chaccountno2, chaccountno3, CSOSAcct, POSAcct, ScanTossAcct, SecondPrimaryNumber, Second2nd, Second3rd,
			 SecondPOS, SecondCSOS, SecondCST, ThirdPrimaryNumber, Third2nd, ThirdPOS, ThirdCSOS, ThirdCST
			 )

			) as UnPvt where pmid = 107414
        ) group by date,CustomerNumber,CustomerName,Description,NDC order by date

END










GO
