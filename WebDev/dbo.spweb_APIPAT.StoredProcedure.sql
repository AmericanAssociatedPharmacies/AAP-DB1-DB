USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spweb_APIPAT]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[spweb_APIPAT]
(
@apiaccountno varchar(15)
)
AS
/*
API_SalesMTD is updated daily by a job, for example on 2/4/17 start is 2/1, end is 2/3
2/3/17 added previous months sales per MM
*/
DECLARE @MTD datetime
DECLARE @LastMonth datetime
SELECT @MTD=StartDate from WebDev..API_SalesMTD where apiaccountno=@apiaccountno
SELECT @LastMonth=DATEADD(month,-1,@MTD)

BEGIN
SELECT * from
(
SELECT     
	a.APIAccountNo as [API Account No]
	--, a.PMID
	,'Month to Date' as 'Month'
	, convert(varchar,a.StartDate,101) as [Start Date]
	, convert(varchar,a.EndDate ,101) as [End Date]
	, dbo.fnFormatCurrency(a.BrandSales) as [Brand Sales]
	, dbo.fnFormatCurrency(a.GenericSales) as [Generic Sales]
	, dbo.fnFormatCurrency(a.OTCSales) as [OTC Sales]
	, dbo.fnFormatCurrency(a.TotalSales) as [Total Sales]
	FROM   WebDev..API_SalesMTD a
		where apiaccountno=@apiaccountno
UNION 
SELECT 
	'' as [API Account No]
	,'Previous Month' as 'Month'
	,convert(varchar,@LastMonth,101) as [Start Date]
	,convert(varchar,DATEADD(day,-1,@MTD),101) as [End Date]
	, dbo.fnFormatCurrency(v.WHAPIBrand) as [Brand Sales]
	, dbo.fnFormatCurrency(v.WHAPIGeneric) as [Generic Sales]
	, dbo.fnFormatCurrency(v.WHAPIOTC) as [OTC Sales]
	, dbo.fnFormatCurrency(v.whapitotal) as [Total Sales]
	FROM webdev..v_web_pm_AllVolume v
		where apiaccountno=@apiaccountno and [date]=@LastMonth
) DT
order by [API Account No] desc --return current month first
END
/*
QA
spweb_APIPAT '02187223'

select top 1  * from v_web_pm_AllVolume
where date='1/1/2017' and apiaccountno='02187223'

API Account No	Month	Start Date	End Date	Brand Sales	Generic Sales	OTC Sales	Total Sales
02187223	Month to Date	2017-02-01 00:00:00.000	2017-02-03 00:00:00.000	1581.75	3073.27	627.89	5282.91
API Account No	Month	Start Date	End Date	Brand Sales	Generic Sales	OTC Sales	Total Sales
	Previous Month	2017-01-01 00:00:00.000	2017-01-01 00:00:00.000	36863.86	23662.52	116.09	60642.47


create view v_web_pm_AllVolume
as
select * from pharmacymaster..all_volume
--grant select on v_web_pm_AllVolume to webdevuser
--grant exec on [spweb_APIPAT] to webdevuser

select top 10 * from  WebDev..API_SalesMTD a
select * from [v_web_APISalesMTD]
select [date],whapitotal from pharmacymaster..all_volume where apiaccountno=01044920 and date='1/1/2017'
expected:7842
date	whapitotal
2017-01-01 00:00:00.000	7842

select [date],whapitotal from pharmacymaster..all_volume where apiaccountno=02187223 and date='1/1/2017'
expected:60642.5
date	whapitotal
2017-01-01 00:00:00.000	60642.47


*/

GO
