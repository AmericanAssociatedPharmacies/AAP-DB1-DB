USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[sppm_update_CHAAP_DETAIL_PMID_TEST]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <04/28/2010>
-- Description:	UPdate PM_Programs table
-- =============================================
Create PROCEDURE [dbo].[sppm_update_CHAAP_DETAIL_PMID_TEST]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  


 


		UPDATE  s  set 
		pmid = pc.pmid  
			FROM chph_aap_test   s 
		join
		(
			SELECT  chaccountnoprimary,  pmid  from pharmacymaster..PM_CHAccounts_ADJ 
             where chaccountnoprimary is not null and chaccountnoprimary != ''   
	
		) pc
		on   cast(cast(s.customer_no as int) as varchar(31)) = pc.chaccountnoprimary
        where s.pmid is null and pc.pmid is not null   


 --Try the secondary   Number 
 
 

		UPDATE  s  set 
		pmid = pc.pmid  
			FROM chph_aap_test   s 
		join
		(
			SELECT chaccountno2,pmid  from pharmacymaster..PM_CHAccounts_ADJ  
             where chaccountno2 is not null and chaccountno2 != '' 

		) pc
		on cast(cast(s.customer_no as int) as varchar(31)) = pc.chaccountno2
        where s.pmid is null and pc.pmid is not null
         


 --Try the third   Number 


 
		UPDATE  s  set 
		pmid = pc.pmid  
			FROM chph_aap_test   s 
		join
		(
			SELECT  chaccountno3, pmid  from pharmacymaster..PM_CHAccounts_ADJ
               where chaccountno3 is not null and chaccountno3 != '' 
  
		) pc
		on  cast(cast(s.customer_no as int) as varchar(31)) = pc.chaccountno3
        where s.pmid is null and pc.pmid is not null


 --Try the CSOS Acct.  Number 

 
		UPDATE  s  set 
		pmid = pc.pmid  
			FROM chph_aap_test   s 
		join
		(
			SELECT  CSOSAcct,   pmid  from pharmacymaster..PM_CHAccounts_ADJ   
			 where CSOSAcct is not null and CSOSAcct != '' 
		) pc
		on cast(cast(s.customer_no as int) as varchar(31)) = pc.CSOSAcct
        where s.pmid is null and pc.pmid is not null


 --Try the POS Acct.  Number 

 

		UPDATE  s  set 
		pmid = pc.pmid  
			FROM chph_aap_test   s 
		join
		(
			SELECT  POSAcct,   pmid  from pharmacymaster..PM_CHAccounts_ADJ   
				where POSAcct is not null and POSAcct != '' 
			 
		) pc
		on cast(cast(s.customer_no as int) as varchar(31)) = pc.POSAcct
        where s.pmid is null and pc.pmid is not null



 --Try the ScanTossAcct  Number 

--		UPDATE  s  set 
--		pmid = pc.pmid  
--			FROM chph_aap_test   s 
--		join
--		(
--			SELECT  ScanTossAcct,   pmid  from pharmacymaster..PM_CHAccounts_ADJ   
--			 
--		) pc
--		on s.customer_no = pc.ScanTossAcct
--        where s.pmid is null and pc.pmid is not null

		UPDATE  s  set 
		pmid = pc.pmid  
			FROM chph_aap_test   s 
		join
		(
			SELECT  ScanTossAcct,   pmid  from pharmacymaster..PM_CHAccounts_ADJ   
             where ScanTossAcct is not null and ScanTossAcct != '' 
			 
		) pc
		on cast(cast(s.customer_no as int) as varchar(31)) = pc.ScanTossAcct
        where s.pmid is null and pc.pmid is not null

--Problems where Bettys file dropped leading zeros that Cardinal put in - created a table to Map these - Betty is going to ask Cardinal to not put in leading zeros

		UPDATE s set  
    
		s.pmid = pc.pmid   
			FROM chph_aap_test   s 
		join
		(
			SELECT  AcctNoCHDetail ,   pmid  from chaap_acctno_mismatch   
			 
		) pc
		on s.customer_no = pc.AcctNoCHDetail
        where s.pmid is null and pc.pmid is not null


--UPdate using the WholesalerAccount No that comes from API Load (where the wholesaler is Cardinal)


--	 UPDATE  s  set 
--		pmid = pv.pmid  
--			FROM purchases..chph_aap_test   s 
--	 join
--	(
--		SELECT pmid,   wholesalerAccountNo ,wholesaler  from  pharmacymaster..pm_pharmacy  where wholesaler = 'CA'
--	) pv
--	  on s.customer_no   =  pv.wholesalerAccountNo  where 
--            s.pmid is null and pv.pmid is not null


 
-- Update by VendAcctNum from PM_VendAccts
--
--	UPDATE  s  set 
--		pmid = pv.pmid  
--			FROM chph_aap_test   s 
--	 join
--	(
--	SELECT v.pmid,v.vendacctnum from pharmacymaster..pm_vendoraccts v
--      join pharmacymaster..pm_pharmacy p on v.pmid = p.pmid
--	) pv
--	  on s.customer_no   =  pv.vendacctnum  where 
--            s.pmid is null and pv.pmid is not null


 
--
--	UPDATE  s  set 
--		pmid = pv.pmid  
--			FROM chph_aap_test   s 
--	 join
--	(
--		SELECT pmid,   aapaccountno  from  pharmacymaster..pm_pharmacy  
--	) pv
--	  on s.store   =  pv.aapaccountno  where 
--            s.pmid is null and pv.pmid is not null and  pv.aapaccountno is not null


 

--	UPDATE  s  set 
--		pmid = pv.pmid  
--			FROM chph_aap_test   s 
--	 join
--	(
--		SELECT pmid,   udaccountno  from  pharmacymaster..pm_pharmacy  
--	) pv
--	  on s.store   =  pv.udaccountno  where 
--            s.pmid is null and pv.pmid is not null and  pv.udaccountno is not null




 --I don't think this table is being updated anymore - probably pointless to even use it,

-- use the table that Jeff populates from lookups he does
--	UPDATE  su  set 
--			pmid = ch.pmid  
--	   FROM purchases..chph_aap_test   su 
--		inner join 
--			( select pmid,chaccountno from purchases..CH_PMIDXref where pmid is not null ) ch
--	   on su.customer_no = ch.chaccountno   where su.pmid is null
 
 
END








GO
