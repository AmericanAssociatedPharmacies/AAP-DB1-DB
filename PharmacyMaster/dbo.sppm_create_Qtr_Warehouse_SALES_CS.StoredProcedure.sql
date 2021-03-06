USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_Qtr_Warehouse_SALES_CS]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <04/28/2010>
-- Description:	UPdate PM_Programs table
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_Qtr_Warehouse_SALES_CS]
(@in_QTR varchar(2), @in_year varchar(4) )


AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @MONTH1 varchar(15);
	DECLARE @MONTH2 varchar(15);
	DECLARE @MONTH3 varchar(15);
	DECLARE @M1 varchar(2);
	DECLARE @M2 varchar(2);
	DECLARE @M3 varchar(2);
    DECLARE @SQL varchar(6000);

	IF( @in_QTR = 'Q1' or  @in_QTR = 'q1')
		 BEGIN
		   SET @M1 = '01';
		   SET @M2 = '02';
           SET @M3 = '03';
		   SET @MONTH1 = 'January';
		   SET @MONTH2 = 'February';
           SET @MONTH3 = 'March';
		 END

	IF( @in_QTR = 'Q2' or  @in_QTR = 'q2')
		 BEGIN
		   SET @M1 = '04';
		   SET @M2 = '05';
           SET @M3 = '06';
		   SET @MONTH1 = 'April';
		   SET @MONTH2 = 'May';
           SET @MONTH3 = 'June';
		 END

	IF( @in_QTR = 'Q3' or  @in_QTR = 'q3')
		 BEGIN
		   SET @M1 = '07';
		   SET @M2 = '08';
           SET @M3 = '09';
		   SET @MONTH1 = 'July';
		   SET @MONTH2 = 'August';
           SET @MONTH3 = 'September';
		 END
	IF( @in_QTR = 'Q4' or  @in_QTR = 'q4')
		 BEGIN
		   SET @M1 = '10';
		   SET @M2 = '11';
           SET @M3 = '12';
		   SET @MONTH1 = 'October';
		   SET @MONTH2 = 'November';
           SET @MONTH3 = 'December';
		 END
     
	select  case when p.pmid is null then pmapi.pmid else p.pmid end as PMID, 
case when p.Territory is null then api.Territory else p.Territory end as [TM #],
  p.AAPAccountNo  as [AAP#] ,
  p.AAPParentNo  as [AAP Parent #],
a.whaccountid as [API #],
case when p.accountname is null then api.accountname else p.accountname end as AccountName,
case when p.city is null then api.city else p.city end as City , 
case when p.state is null then api.state else p.state end as ST,
 p.DateOpened as [Date Opened] ,
 a.April_BR as [Apr Brand],a.April_GEN as [Apr Generic], a.April_OTC as [Apr OTC],a.April_BR +a.April_GEN +  a.April_OTC as [Apr Total],
a.May_BR as [May Brand],a.May_GEN as [May Generic], a.May_OTC as [May OTC],a.May_BR +a.May_GEN +  a.May_OTC as [May Total],
a.June_BR as [Jun Brand],a.June_GEN as [Jun Generic], a.June_OTC as [Jun OTC],a.June_BR +a.June_GEN +  a.June_OTC as [Jun Total],
 a.April_BR + a.May_BR + a.June_BR as [Grand Total Brand],
 a.April_GEN + a.May_GEN + a.June_GEN as [Grand Total Generic],
 a.April_OTC + a.May_OTC + a.June_OTC as [Grand Total OTC],
 a.April_BR + a.May_BR + a.June_BR + a.April_GEN + a.May_GEN + a.June_GEN +  a.April_OTC + a.May_OTC + a.June_OTC  as [Grand Total Sales]

  from api..API_WHSales_Mnthly_ByType a 
left outer join 
( select pa.*,ad.city,ad.state from pm_pharmacy pa
	left outer join
		( select city,state,pmid from pm_addressmaster where address_type_id = 1) ad
	on pa.pmid = ad.pmid  

 )p 
	on a.whaccountid = p.apiaccountno
left outer join
(
	select territory,accountname,city,state,accountno from pmbackups..tmp_apiaccountmaster_orig
) api
on a.whaccountid = api.accountno

left outer join 
(
	select pm.apiaccountno , pmid  from pm_apiaccounts pm
 
) pmapi
on a.whaccountid = pmapi.apiaccountno
 
where a.year = 2010


--QA

--select sum(june_otc) from     api..API_WHSales_Mnthly_ByType where year = 2010
--select sum([Jun OTC]) from tmp_ws_q2
--select sum(extsales) from api..apisalesdetail where month(invdate) = 06 and year(invdate) = 2010
--and type = 'OTC'
--
--select * from pmbackups..tmp_apiaccountmaster_orig
--
--select sum(april_br)  + sum (april_otc) + sum(april_gen) from api..API_WHSales_Mnthly_ByType where year = 2010
--select sum([Apr Total]) from tmp_ws_q2
--select sum(may_br)  + sum (may_otc) + sum(may_gen) from api..API_WHSales_Mnthly_ByType where year = 2010
--select sum([May Total]) from tmp_ws_q2
--select sum(june_br)  + sum (june_otc) + sum(june_gen) from api..API_WHSales_Mnthly_ByType where year = 2010
--select sum([Jun Total]) from tmp_ws_q2
--
--select sum(april_br)  + sum (april_otc) + sum(april_gen) + sum(may_br)  + sum (may_otc) + sum(may_gen)
--	+ sum(june_br)  + sum (june_otc) + sum(june_gen) from api..API_WHSales_Mnthly_ByType where year = 2010
--select sum([Grand Total Sales]) from tmp_ws_q2
END








GO
