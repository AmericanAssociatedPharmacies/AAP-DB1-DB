USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_Commission_QTR_DYN]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create Monthly Global Report
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_Commission_QTR_DYN]
 (@in_qtr varchar(2), @in_year varchar(4))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    DECLARE @SQL varchar(max);
	DECLARE @months varchar(50);

	IF(@in_qtr = 'Q1')
		BEGIN
			SET @months = '(01,02,03)';
		END
	IF(@in_qtr = 'Q2')
		BEGIN
			SET @months = '(04,05,06)';
		END
	IF(@in_qtr = 'Q3')
		BEGIN
			SET @months = '(07,08,09)';
		END
	IF(@in_qtr = 'Q4')
		BEGIN
			SET @months = '(10,11,12)';
		END

	   --- Drop the previous runs table
		 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_Qtr_Comm_jmw')
		 BEGIN
          DROP TABLE tmp_Qtr_Comm_jmw
         END
 
	SET @SQL = 'SELECT * INTO tmp_Qtr_Comm_jmw from ( '+
	           ' SELECT   '+
               ' cast(null as varchar(10)) as TM , '+
               ' PMID,  '+
			   ' cast(null as varchar(20)) as AAP# ,  '+
			   ' cast(null as varchar(20)) as Parent# ,  '+
			   ' cast(null as varchar(20)) as [API Warehouse#] ,  '+
               ' cast(null as varchar(10)) as [AAP Eff] ,'+
               ' cast(null as varchar(10)) as [AAP Quit] ,'+
               ' cast(null as  varchar(100)) as [Description] , '+
			   ' cast(null as  varchar(200)) as Affiliate ,    '+
			   ' cast(null as  varchar(100)) as [Account DBA Name] ,  '+
			   ' cast(null as  varchar(100)) as [City] ,  '+
			   ' cast(null as  varchar(100)) as ST , '+
			   ' cast(null as varchar(10) ) as [Whse Acct Date Opened] , '+
               ' cast(null as varchar(20)) as [Status] ,'+
			   ' cast(null as  varchar(10)) as Wholesaler,  '+
			   ' MAX([API Br]) as [API ' + @in_qtr + ' Brand Sales],  '+
			   ' MAX([API Gen]) as [API ' + @in_qtr +' Generic Sales],  '+
			   ' MAX([API OTC]) as [API '+ @in_qtr +' OTC Sales], '+
			   ' MAX([API Total]) as [API '+ @in_qtr +' Total Sales], '+
			   ' MAX([CH Total]) as [CAH '+ @in_qtr +' Total Sales],  '+
			   ' MAX([ML Total]) as [ML '+ @in_qtr +' Total Sales]  ';
   
	SET @SQL = @SQL + 'FROM (  '+
	  ' SELECT PMID ,  '+

           '''CH Total'' as dateCHT,  '+
			' sum(isnull(AAPNetSales,0))as AAPNetSales ,  '+
           '''API Gen'' as dateAPIG,  '+
			' sum(isnull(WHAPIGeneric,0))as WHAPIGeneric,  '+
			'''API Br'' as dateAPIB,  '+
			' sum(isnull(WHAPIBrand,0))as WHAPIBrand,  '+
			'''API OTC'' as dateAPIO,  '+
			' sum(isnull(WHAPIOTC,0))as WHAPIOTC ,  '+
			'''API Total'' as dateAPIT,  '+
			'sum(isnull(WHAPIGeneric,0)) + sum(isnull(WHAPIBrand,0)) + sum(isnull(WHAPIOTC,0))as WHAPITot,  '+
			'''ML Total'' as dateMLT,  '+
			' sum(isnull(MLTotal,0))as MLTotal   '+      
 

	  ' FROM pharmacymaster..all_volume  where ( month(date) in ' + @months + ' and year(date) = ' + @in_year + ') '+
				         
	  '		 group by PMID  '+
  ' ) as TableDate '+

    ' PIVOT '+
	' ( '+
	'  SUM(AAPNetSales) '+
	'  FOR dateCHT IN  ([CH Total]) '+
	' )as P7 '+
    ' PIVOT '+
	' ( '+
	'  SUM(WHAPIGeneric) '+
	'  FOR dateAPIG IN  ([API Gen]) '+
	' )as P8 '+
    ' PIVOT '+
	' ( '+
	'  SUM(WHAPIBrand) '+
	'  FOR dateAPIB IN  ([API Br]) '+
	' )as P9 '+
    ' PIVOT  '+
	' ( '+
	'  SUM(WHAPIOTC) '+
	'  FOR dateAPIO IN  ([API OTC]) '+
	' )as P10 '+
    ' PIVOT '+
	' ( '+
	'  SUM(WHAPITot) '+
	'  FOR dateAPIT IN  ([API Total]) '+
	' )as P11 '+
	'  PIVOT '+
	' ( '+
	'  SUM(MLTotal) '+
	'  FOR dateMLT IN  ([ML Total]) '+
	' )as P12 '+

	' group by PMID  '+

    ' )vol ';

	EXEC (@SQL)

	UPDATE v set
		TM = p.territory  ,
		[AAP#] = p.aapaccountno,
		[Parent#] = p.aapparentno ,
		[API Warehouse#] = p.apiaccountno ,
		[AAP Eff] = CONVERT(VARCHAR(10), p.aapeffectivedate, 101) ,
        [AAP Quit] = CONVERT(VARCHAR(10), p.aapquitdate, 101) ,
		[Description] = p.AccountDescription,
		Affiliate = p.Affiliate,
		[Account DBA Name] = p.[accountname],
		City = p.City, 
		ST = p.State ,
        [Whse Acct Date Opened] = CONVERT(VARCHAR(10), p.DateOpened, 101) ,
		[Status] = p.apistatus,
        Wholesaler = case when w.vendor is null then 'CH' else w.vendor end    
	 FROM tmp_Qtr_Comm_jmw v
	left join pharmacymaster..v_PM_AllWithAffiliates p on v.pmid=p.pmid
	left join pharmacymaster..v_wholesaler_primary w on v.pmid=w.pmid

    -- Update the CH to CAH
	UPDATE tmp_Qtr_Comm_jmw set  Wholesaler = 'CAH' where Wholesaler = 'CH'

	-- Update those funky PMID's
	UPDATE t set  [Account DBA Name]= p.accountname
	FROM tmp_Qtr_Comm_jmw t
	join(
	SELECT pmid,accountname FROM ( 
	SELECT * , Rank() OVER (Partition BY pmid order by date desc) as Rank
	FROM (SELECT     *
				FROM        pharmacymaster..All_Volume where pmid < 99       ) pm 
	) tmp where   Rank = 1  
	)p on t.pmid = p.pmid

	UPDATE   tmp_Qtr_Comm_jmw set  [Account DBA Name] = 'No PMID' where pmid = 900000

-- To Get the detail of 9000000 account
--select a.territory as TM,cast('' as varchar(10)) as PMID,
--cast('' as varchar(10)) as AAP#,
--cast('' as varchar(10)) as Parent#,
--a.accountno as [API Warehouse#],
--cast('' as varchar(10)) as [AAP Eff],
--cast('' as varchar(10)) as [AAP Quit],
--cast('' as varchar(10)) as [Description],
--cast('' as varchar(10)) as [Affiliate],
--a.accountname as [Account DBA Name],
--a.City,
--a.state as ST,
--a.dateopened as [Whse Acct Date Opened],
--a.Status,
--cast('' as varchar(10)) as Wholesaler,
-- case when [API Q3 Generic Sales] is null then 0 else [API Q3 Generic Sales] end  as [API Q3 Generic Sales],
--   case when [API Q3 Brand Sales] is null then 0 else   [API Q3 Brand Sales] end  as [API Q3 Brand Sales]  ,
--  case when [API Q3 OTC Sales]  is null then 0 else [API Q3 OTC Sales] end  as [API Q3 OTC Sales],
--
-- case when [API Q3 Generic Sales] is null then 0 else [API Q3 Generic Sales] end + 
--  case when [API Q3 Brand Sales] is null then 0 else   [API Q3 Brand Sales] end +
--case when [API Q3 OTC Sales]  is null then 0 else [API Q3 OTC Sales] end as [API Q3 Total Sales]
--
--from pmbackups..tmp_apiaccountmaster_orig a
--left outer join
--(
--select whaccountid,sum(extsales) as [API Q3 Generic Sales]  from  api..v_apisalesdetail a
-- WHERE      month(invdate) in(07,08,09) and year(invdate) = 2010 and type = 'Generic' 
--and not exists
--(
-- select apiaccountno from all_volume p where a.whaccountid = p.apiaccountno 
--and month(date) in(07,08,09) and year(date )= 2010 ) and a.whaccountid not in (select apiaccountno  from pm_apiaccounts  where date is not null)
--group by whaccountid
--) gen 
--on gen.whaccountid = a.accountno    
-- 
--left outer join
--(
--select whaccountid,sum(extsales) as [API Q3 Brand Sales]  from  api..v_apisalesdetail a
-- WHERE      month(invdate) in(07,08,09) and year(invdate) = 2010 and type = 'Brand' 
--and not exists
--(
-- select apiaccountno from all_volume p where a.whaccountid = p.apiaccountno 
--and month(date) in(07,08,09) and year(date )= 2010 ) and a.whaccountid not in (select apiaccountno  from pm_apiaccounts  where date is not null)
--group by whaccountid
--) br 
--on br.whaccountid = a.accountno  
--left outer join
--(
--select whaccountid,sum(extsales) as [API Q3 OTC Sales]  from  api..v_apisalesdetail a
-- WHERE      month(invdate) in(07,08,09) and year(invdate) = 2010 and type = 'OTC' 
--and not exists
--(
-- select apiaccountno from all_volume p where a.whaccountid = p.apiaccountno 
--and month(date) in(07,08,09) and year(date )= 2010 ) and a.whaccountid not in (select apiaccountno  from pm_apiaccounts  where date is not null)
--group by whaccountid
--) otc 
--on otc.whaccountid = a.accountno where (  [API Q3 Brand Sales] is not null or [API Q3 Generic Sales] is not null or  [API Q3 OTC Sales] is not null)
--
--order by a.territory desc
-- put in the not exists here - see sppm_create_ReportCardVoulem_DYN

END








GO
