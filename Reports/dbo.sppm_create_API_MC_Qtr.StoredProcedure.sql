USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_API_MC_Qtr]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <04/15/2015>
-- Description:	API MC Qtr and YTD Totals for Roz
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_API_MC_Qtr]
(@in_qtr varchar(2), @in_year varchar(4))
AS
BEGIN
 
-- Good for a month
DECLARE @SQL  nvarchar(max);
DECLARE @endMonth int;
DECLARE @amount money;
DECLARE @amountYTD money;

DECLARE @startMonthQtr varchar(50);
DECLARE @startMonthYTD varchar(50);

DECLARE @startMonthQtrCtr varchar(50);
DECLARE @startMonthYTDCtr varchar(50);
 

DECLARE @colQtr varchar(255);
DECLARE @colQtrMC varchar(255);
DECLARE @colYTD varchar(255);
DECLARE @colYTDMC varchar(255);




SET @startMonthYTD = 1;
SET @startMonthYTDCtr = 1;
SET @amount = 0 
SET @amountYTD = 0 

 
IF(@in_qtr = 'Q1')
		BEGIN
			SET @startMonthQtrCtr = '1';
			SET @startMonthQtr = '1';
			SET @endMonth = '3';
 		END
IF(@in_qtr = 'Q2')
		BEGIN
			SET @startMonthQtrCtr = '4';
			SET @startMonthQtr = '4';
			SET @endMonth = '6';
 		END

IF(@in_qtr = 'Q3')
		BEGIN
			SET @startMonthQtrCtr = '7';
			SET @startMonthQtr = '7';
			SET @endMonth = '9';
 		END
IF(@in_qtr = 'Q4')
		BEGIN
			SET @startMonthQtrCtr = '10';
			SET @startMonthQtr = '10';
			SET @endMonth = '12';
 		END

SET @colQtr = 'Total API Sales ' + @in_qtr + ' ' + @in_year;
SET @colQtrMC = 'Total API Sales ' + @in_qtr + ' ' + @in_year + ' - MC Only';

SET @colYTD = 'Total YTD API Sales (Jan - ' + (select reports.dbo.MonthFromNumber(@endMonth)) + ') ' + @in_year;
SET @colYTDMC = 'Total YTD API Sales (Jan - ' + (select reports.dbo.MonthFromNumber(@endMonth)) + ') ' + @in_year  + ' - MC Only';
--Truncate table 
Truncate table reports..APIMCQtr
 
--Get the Quarter data first for MC Only
WHILE @startMonthQtrCtr <= @endMonth
BEGIN

	SET @amount = @amount + (
		SELECT sum(whapitotal) from pharmacymaster..all_volume where pmid in (
			SELECT pmid from (
				SELECT case when  
				 (mcquitdate is null or month(mcquitdate) = @startMonthQtrCtr ) and  
				chaincode is not null and 
				 (( (aapquitdate is  null or month(aapquitdate)  = @startMonthQtrCtr )
				and aapaccountno is not null and aapaccountno != '' ) or isnpp= -1)
				then chaincode else null end as MC,pmid
			FROM pharmacymaster..v_pm_allwithaffiliates )ch
		WHERE MC is not null
	) and month( date)  = @startMonthQtrCtr and year(date) = @in_year)

	SET @startMonthQtrCtr = @startMonthQtrCtr + 1;
END


INSERT into reports..APIMCQtr (StoresIncluded,Amount) values (@colQtrMC,@amount)
-- Now do ALL for Qtr 
-- Reset values
SET @startMonthQtrCtr = @startMonthQtr;
SET @amount = 0;
WHILE @startMonthQtrCtr <= @endMonth
BEGIN

	SET @amount = @amount + (
		SELECT sum(whapitotal) from pharmacymaster..all_volume  where
	     month( date)  = @startMonthQtrCtr and year(date) = @in_year  and PMID < 900000)

	SET @startMonthQtrCtr = @startMonthQtrCtr + 1;
END

INSERT into reports..APIMCQtr (StoresIncluded,Amount) values (@colQtr,@amount)
--Get the YTD data
WHILE @startMonthYTDCtr <= @endMonth
BEGIN

	SET @amountYTD = @amountYTD + (
		SELECT sum(whapitotal) from pharmacymaster..all_volume where pmid in (
			SELECT pmid from (
				SELECT case when  
				 (mcquitdate is null or month(mcquitdate) = @startMonthYTDCtr ) and  
				chaincode is not null and 
				 (( (aapquitdate is  null or month(aapquitdate)  = @startMonthYTDCtr )
				and aapaccountno is not null and aapaccountno != '' ) or isnpp= -1)
				then chaincode else null end as MC,pmid
			FROM pharmacymaster..v_pm_allwithaffiliates )ch
		WHERE MC is not null
	) and month( date)  = @startMonthYTDCtr and year(date) = @in_year and PMID < 900000)

	SET @startMonthYTDCtr = @startMonthYTDCtr + 1;
END
INSERT into reports..APIMCQtr (StoresIncluded,Amount) values (@colYTDMC,@amountYTD) 

SET @startMonthYTDCtr = @startMonthYTD;

-- Now do year all
-- Reset values
SET @startMonthYTDCtr = @startMonthYTD;
SET @amountYTD = 0;
WHILE @startMonthYTDCtr <= @endMonth
BEGIN

	SET @amountYTD = @amountYTD + (
		SELECT sum(whapitotal) from pharmacymaster..all_volume  where
	     month( date)  = @startMonthYTDCtr and year(date) = @in_year  and PMID < 900000)

	SET @startMonthYTDCtr = @startMonthYTDCtr + 1;
END
INSERT into reports..APIMCQtr (StoresIncluded,Amount) values (@colYTD,@amountYTD) 

SELECT StoresIncluded as [Stores Included] , round(Amount,0) as Amount from reports..APIMCQtr
 END






GO
