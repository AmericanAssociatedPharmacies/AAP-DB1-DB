USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[spRebate_PriceProt_Detail_MovedToReportsDB]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[spRebate_PriceProt_Detail_MovedToReportsDB]

	@date varchar(10)
	,@affiliate_substring varchar(50)

/*
BG 10/2014
Detail linked from paid amount in website financial-services/rebate_report.php
Note that the file date in pharmacymaster..PM_Rebates_CHAAP is ONE MONTH GREATER than the detail file date
in  pharmacymaster..CA_PriceProtection
Starts with 8/14 rebate paid in 9/2014 payment file made 10/2014 - 


sum of 'isvalid=Y' entries should match payment amount
note that the [date] column is a varchar and must match exactly, "09/01/2014" not 9/1/14 -- this was changed
to datetime field JMW

Column aliases based on feedback WB,BE
*/
/* JMW
pharmacymaster..CA_PriceProtection is QA'd
based on Cardinal purchases  - the file sent to me  is named for the month the purrchases were made in - I put in that same date.
There would be too much confusion if I was pulling February purchases to QA against the file I'm sent but I put a date in
of January.
The difference is that payments are made from the previous month.  So for the February 2015 Rebate they
pay the January 2015 Price Protection. That's just the way it is at the moment - this may change though.  Hopefully as it will
as this causing confusion.

*/
AS
BEGIN
DECLARE @affiliate varchar(50)
SET @affiliate = @affiliate_substring + '%'

 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_PriceProt_Detail')
 BEGIN
  DROP TABLE tmp_PriceProt_Detail
 END

SELECT * into tmp_PriceProt_Detail from 
(
SELECT 
distinct
v.PMID,v.accountname as [Account Name],v.City,v.State 
,right('000000'+a.CAHAccountNo,6) as CHAcct
--,convert(varchar,p.[date],101) as [File Date]
,p.[date] as [File Date]
--,'$' + convert(varchar(50),round(priceprotectionduetodate,2,1),-1) as [Due To Date]
,priceprotectionduetodate as [Due To Date]
,CorpItemNumber as [Item#]
,Description
,NDC
--,ProtectedSelPrice as [Protected Price]
--,NewSellPrice as [New Price]
--,'$' + convert(varchar(50),round(isnull(ProtectedSelPrice,0.0),2,1),-1)  as [Protected Price]
--,'$' + convert(varchar(50),round(isnull(NewSellPrice,0.0),2,1),-1)  as [New Price]
,ProtectedSelPrice as [Protected Price]
,NewSellPrice  as [New Price]
--,convert(varchar,ProtectionStartDate,101) as [Protection Start]
--,convert(varchar,ProtectionEndDate,101) as [Protection End]
, ProtectionStartDate as  [Protection Start]
, ProtectionEndDate as [Protection End]
,cast(AvgMonthlyUsage as int) as [Protected Qty] --[Avg Usage]
,cast(ActualUsageToDate as int) as [Usage To Date]

FROM pharmacymaster..v_pm_allwithaffiliates v
--left join pharmacymaster..v_CHAccountPMID a on a.PMID=v.PMID
LEFT OUTER JOIN Purchases.Staging.CAHAccount AS a on a.PMID=v.PMID
--left join pharmacymaster..CA_PriceProtection p on p.customernumber=right('000000'+a.CHAcct,6)
LEFT OUTER JOIN pharmacymaster..CA_PriceProtection AS p ON p.customernumber = right('000000'+a.CAHAccountNo,6)
WHERE isnull(v.affiliate,'') like @affiliate
and p.customernumber is not null
and p.[date]=@date

)ch 

SELECT * from tmp_PriceProt_Detail where [Due To Date] <>0 order by PMID
 
END


GO
