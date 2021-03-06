USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_GlobalRpt_900000_Detail_New_20200917]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create Monthly Global Report
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_GlobalRpt_900000_Detail_New_20200917]
(@in_month varchar(50), @in_year varchar(4))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    DECLARE @SQL varchar(4000);
	DECLARE @date datetime;
	DECLARE @dateOut varchar(10);
 

	SET @date = @in_month + '/01/' + @in_year

	SET @dateOut =  (SELECT SUBSTRING(CONVERT(VARCHAR(11),@date, 109), 10, 2) )
	SET @dateOut = @dateOut + '-';

	SET @dateOut =  @dateOut + (SELECT SUBSTRING(CONVERT(VARCHAR(11),@date, 109), 1, 3) )
 
 
  
	SET @SQL = 'SELECT  DISTINCT cast('''' as varchar(10)) as PMID, '+
	'cast('''' as varchar(10)) as AAP#, '+
	'cast('''' as varchar(10)) as Parent#, '+
	'cast('''' as varchar(10)) as [AAP Eff], '+
	'cast('''' as varchar(10)) as [AAP Quit], '+
	'a.APIAccountNo as [API#], '+
	'cast('''' as varchar(10)) as [Chain Code], '+
	'a.accountname as [Account Name], '+
	'p.City, '+
	'p.state as ST, '+
	'a.territory as TM, '+
	'a.DEA as DEA, '+
	'cast('''' as varchar(10)) as [Affiliate], '+
	'a.businessclass as BC, '+
	'cast(''' + @dateOut + ''' as varchar(10)) as Period, '+
	'cast(0 as numeric(18,2)) as [CH Gen Src],'+
	'cast(0 as numeric(18,2)) as [CH Gen Exc],'+
	'cast(0 as numeric(18,2)) as [CH Gen Total],'+
	'cast(0 as numeric(18,2)) as [CH Brand],'+
	'cast(0 as numeric(18,2)) as [CH Other],'+

-- Start New 
	'cast(0 as numeric(18,2)) as [CH Total RX],'+
	'cast(0 as numeric(18,2)) as [CH Excluded from Total RX],'+
	'cast(0 as numeric(18,2)) as [CH NonRX - OTC&HH],'+
	'cast(0 as numeric(18,2)) as [CH Source Compliance],'+
--End New
--	'cast(0 as numeric(18,2)) as [CH Bashas],'+
	'cast(0 as numeric(18,2)) as [CH Total],'+

	'case when [API Gen] is null then 0 else [API Gen] end  as [API Gen], '+
	'case when [API Br] is null then 0 else   [API Br] end  as [API Br]  , '+
	'case when [API OTC]  is null then 0 else [API OTC] end  as [API OTC], '+

	'case when [API Gen] is null then 0 else [API Gen] end + '+
	'case when [API Br] is null then 0 else   [API Br] end + '+
	'case when [API OTC]  is null then 0 else [API OTC] end as [API Total], '+
	'cast(0 as numeric(18,2)) as [ML Total], '+
--	'cast(0 as numeric(18,2)) as [Anda Total], '+
	'case when [API Gen] is null then 0 else [API Gen] end +  '+
	'case when [API Br] is null then 0 else   [API Br] end + '+
	'case when [API OTC]  is null then 0 else [API OTC] end as [All Total] '+
	'from PharmacyMaster.dbo.PM_Pharmacy AS a
	LEFT OUTER JOIN PharmacyMaster.[dbo].[PM_AddressMaster] AS p ON a.PMID = p.PMID '+
	--'from pmbackups..tmp_apiaccountmaster_orig a '+
	'left outer join '+
	'( '+
	' select whaccountid,sum(extsales) as [API Gen]  from  api..v_apisalesdetail a '+
	 ' WHERE      month(invdate) in( ' + @in_month + ') and year(invdate) = ' +@in_year +' and type = ''Generic'''+
	' and not exists '+
	' ( '+
	 ' select apiaccountno from pharmacymaster..all_volume p where a.whaccountid = p.APIAccountNo '+
	' and month(date) in( ' + @in_month + ') and year(date )= ' +@in_year +' ) and a.whaccountid not in (select substring(apiaccountno,1,8)   from pharmacymaster..pm_apiaccounts  where date is not null)'+
	' group by whaccountid '+
	' ) gen '+
	--' on gen.whaccountid = a.accountno    '+
	 ' on gen.whaccountid = a.APIAccountNo ' +
	 
	' left outer join '+
	' ( '+
	' select whaccountid,sum(extsales) as [API Br]  from  api..v_apisalesdetail a '+
	' WHERE      month(invdate) in( ' + @in_month + ') and year(invdate) =' +@in_year +' and type = ''Brand''' +
	' and not exists '+
	' ( '+
	' select apiaccountno from pharmacymaster..all_volume p where a.whaccountid = p.APIAccountNo  '+
	' and month(date) in( ' + @in_month + ') and year(date )= ' +@in_year +' ) and a.whaccountid not in (select substring(apiaccountno,1,8)   from pharmacymaster..pm_apiaccounts  where date is not null) '+
	' group by whaccountid '+
	' ) br  '+
	--' on br.whaccountid = a.accountno  '+
	' on br.whaccountid = a.APIAccountNo '+


	' left outer join '+
	' ( '+
	' select whaccountid,sum(extsales) as [API OTC]  from  api..v_apisalesdetail a '+
	' WHERE      month(invdate) in( ' + @in_month + ') and year(invdate) =' +@in_year +' and type = ''OTC''' +
	' and not exists '+
	' ( '+
	' select apiaccountno from pharmacymaster..all_volume p where a.whaccountid = p.APIAccountNo  '+
	' and month(date) in( ' + @in_month + ') and year(date )= ' +@in_year +' ) and a.whaccountid not in (select substring(apiaccountno,1,8)   from pharmacymaster..pm_apiaccounts  where date is not null) '+
	' group by whaccountid '+
	' ) otc '+
	--' on otc.whaccountid = a.accountno 
	' on otc.whaccountid = a.APIAccountNo ' +
	' where (  [API Br] is not null or [API Gen] is not null or  [API OTC] is not null) '+
	'AND p.Address_Type_ID = 1' +

	' order by a.territory desc ';

    print @sql;
	EXEC (@SQL);

END











GO
