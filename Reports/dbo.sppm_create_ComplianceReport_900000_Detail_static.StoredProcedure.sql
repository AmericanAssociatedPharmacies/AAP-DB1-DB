USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_ComplianceReport_900000_Detail_static]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create Monthly Global Report
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_ComplianceReport_900000_Detail_static]
(@in_month varchar(50), @in_year varchar(4))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	SELECT  

		a.territory as TM,
	    cast('' as varchar(10)) as PMID,  
		cast(null as varchar(20)) as AAP# ,  
		cast(null as varchar(20)) as Parent# ,
		a.accountno as [API#] ,     
		cast(null as varchar(20)) as [AAP Eff], 
		a.DateOpened as [API Acct Eff],   
		cast(null as varchar(20)) as [AAP Quit],   
        a.Status as [API Status] , 
		cast('' as varchar(10)) as Description ,  
		cast('' as varchar(10)) as Affiliate ,    
		a.accountname as [Account DBA Name] ,  
		a.City,
	    a.state as ST,
		cast('' as varchar(10)) as [MC Chain Code] ,  
		cast('' as varchar(10)) as PVA ,  
    
		cast(0 as numeric(18,2)) as [CAH 07-10],	 
		cast(0 as numeric(18,2))  as [CAH 08-10],		 
		cast(0 as numeric(18,2))  as [CAH 09-10], 
		cast(0 as numeric(18,2))  as [CAH 10-10],	  
		cast(0 as numeric(18,2))  as [CAH Total Sales ], 
		cast(0 as numeric(18,2))  as [ML 07-10],
		cast(0 as numeric(18,2))  as [ML 08-10],
		cast(0 as numeric(18,2))  as [ML 09-10],
		cast(0 as numeric(18,2))   as [ML 10-10],
		cast(0 as numeric(18,2))  as [ML Total Sales],

	case when [API 07-10] is null then 0 else [API 07-10] end  as [API 07-10],
	case when [API 08-10] is null then 0 else   [API 08-10] end  as [API 08-10]  ,
	case when [API 09-10]  is null then 0 else [API 09-10] end  as [API 09-10],

	case when [API 10-10] is null then 0 else [API 10-10] end as [API 10-10],

  	case when [API 07-10] is null then 0 else [API 07-10] end + 
	case when [API 08-10] is null then 0 else   [API 08-10] end +
	case when [API 09-10]  is null then 0 else [API 09-10] end + 
    case when [API 10-10]  is null then 0 else [API 10-10] end as [API Total Sales]


	from pmbackups..tmp_apiaccountmaster_orig a
	left outer join
	(
	select whaccountid,sum(extsales) as [API 07-10]  from  api..v_apisalesdetail a
	 WHERE      month(invdate) in(07) and year(invdate) = 2010  
	and not exists
	(
	 select apiaccountno from pharmacymaster..all_volume p where a.whaccountid = p.apiaccountno 
	and month(date)  in(07) and year(date) = 2010   ) and a.whaccountid not in (select apiaccountno  from pharmacymaster..pm_apiaccounts  where date is not null)
	group by whaccountid
	) m1 
	on m1.whaccountid = a.accountno    
	 
	left outer join
	(
	select whaccountid,sum(extsales) as [API 08-10]  from  api..v_apisalesdetail a
	 WHERE      month(invdate) in(08) and year(invdate) = 2010  
	and not exists
	(
	 select apiaccountno from pharmacymaster..all_volume p where a.whaccountid = p.apiaccountno 
	and month(date)  in(08) and year(date) = 2010 ) and a.whaccountid not in (select apiaccountno  from pharmacymaster..pm_apiaccounts  where date is not null)
	group by whaccountid
	) m2 
	on m2.whaccountid = a.accountno  
	left outer join
	(
	select whaccountid,sum(extsales) as [API 09-10]  from  api..v_apisalesdetail a
	 WHERE      month(invdate) in(09) and year(invdate) = 2010    
	and not exists
	(
	 select apiaccountno from pharmacymaster..all_volume p where a.whaccountid = p.apiaccountno 
	and month(date)  in(09) and year(date) = 2010  ) and a.whaccountid not in (select apiaccountno  from pharmacymaster..pm_apiaccounts  where date is not null)
	group by whaccountid
	) m3 
	on m3.whaccountid = a.accountno 

    left outer join
	(
	select whaccountid,sum(extsales) as [API 10-10]  from  api..v_apisalesdetail a
	 WHERE      month(invdate) in(10) and year(invdate) = 2010    
	and not exists
	(
	 select apiaccountno from pharmacymaster..all_volume p where a.whaccountid = p.apiaccountno 
	and month(date)  in(10) and year(date) = 2010  ) and a.whaccountid not in (select apiaccountno  from pharmacymaster..pm_apiaccounts  where date is not null)
	group by whaccountid
	) m4 
	on m4.whaccountid = a.accountno 

    where ( [API 07-10]  is not null or [API 08-10]  is not null or  [API 09-10]  is not null or  [API 10-10]  is not null)

	order by a.territory desc

END










GO
