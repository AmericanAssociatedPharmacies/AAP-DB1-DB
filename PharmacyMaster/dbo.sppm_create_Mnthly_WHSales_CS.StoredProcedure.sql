USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_Mnthly_WHSales_CS]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <08/05/2010>
-- Description:	 Create FYTD WH Sales for Chriss S.
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_Mnthly_WHSales_CS]

AS
BEGIN


   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_mnthly_WH_Sales_CS')
          DROP TABLE tmp_mnthly_WH_Sales_CS


select * into tmp_mnthly_WH_Sales_CS from (
select p.pmid as PMID,p.aapaccountno as AAP#,p.aapparentno as AAPParent#, 
case when  p.territory is null then o.territory else p.territory end as Territory,  
 a.whaccountid as Acct#,
case when p.apistatus is null then o.status else p.apistatus end as Status,  
case when  p.accountname is null then o.accountname else p.accountname end as Name,  
case when  p.state is null then o.state else p.state end as ST,  
case when p.dateopened is null then o.dateopened else p.dateopened end as [Date Opened],  
 july_br as [July BR],july_gen as [July GEN],july_otc as [July OTC] from api..API_WHSales_Mnthly_ByType a 
left outer join pharmacymaster..v_PM_AllWithAffiliates p on p.apiaccountno = a.whaccountid
 left outer join   
 (  
	select territory,accountname,city,state,status,dateopened,accountno from pmbackups..tmp_apiaccountmaster_orig   
 ) o  on  a.whaccountid = o.accountno
where a.year = 2010 
) ch 
 
 
 

 
 
END








GO
