USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[sppm_update_CHAAP_DETAIL_STORE_Deprecated_20201117]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <04/28/2010>
-- Description:	UPdate PM_Programs table
-- =============================================
CREATE PROCEDURE [dbo].[sppm_update_CHAAP_DETAIL_STORE_Deprecated_20201117]

AS

/*****************************************************************************

	DO NOT USE THIS SPROC. 

	The CAH Sales ETL has correct data and logic. The logic in sproc is outdated and will cause
	major data issues. -- RSE 11/17/2020


********************************************************************************/


BEGIN


	RETURN
 
--	-- SET NOCOUNT ON added to prevent extra result sets from
--	-- interfering with SELECT statements.
--	SET NOCOUNT ON;
  


--		UPDATE  s  set 
--		store = pm.aapaccountno  
--			FROM chph_aap   s 
--		join
--		(
--			SELECT pmid,aapaccountno  from pharmacymaster..PM_pharmacy where aapaccountno is not null and  aapaccountno != ''
				 
--		) pm
--		on s.pmid = pm.pmid
--        where ( s.store = '' or s.store is null) and pm.aapaccountno is not null  and pm.aapaccountno != '' and s.pmid is not null and s.pmid != ''


 
--	-- Update by CHAccountNo aka CAAccountNo - get dea from PM_CHAccounts_ADJ and then get the AAPAccountNo from there


--		UPDATE  s  set 
--		store = pc.aapaccountno  
--			FROM chph_aap   s 
--		join
--		(
--			SELECT c.chaccountnoprimary,c.dea,p.aapaccountno  from pharmacymaster..PM_CHAccounts_ADJ c 
--				join (select aapaccountno, dea  from pharmacymaster..pm_pharmacy where  aapaccountno is not null and  aapaccountno != '') p
--			on c.dea = p.dea
--		) pc
--		on s.customer_no = pc.chaccountnoprimary
--        where ( s.store = '' or s.store is null) and pc.aapaccountno is not null and pc.aapaccountno != ''

--		UPDATE  s  set 
--		store = pc.aapaccountno  
--			FROM chph_aap   s 
--		join
--		(
--			SELECT c.chaccountno2,c.dea,p.aapaccountno  from pharmacymaster..PM_CHAccounts_ADJ c 
--				join (select aapaccountno, dea  from pharmacymaster..pm_pharmacy where  aapaccountno is not null and  aapaccountno != '') p
--			on c.dea = p.dea
--		) pc
--		on s.customer_no = pc.chaccountno2
--        where ( s.store = '' or s.store is null) and pc.aapaccountno is not null  and pc.aapaccountno != ''

--		UPDATE  s  set 
--		store = pc.aapaccountno  
--			FROM chph_aap   s 
--		join
--		(
--			SELECT c.chaccountno3,c.dea,p.aapaccountno  from pharmacymaster..PM_CHAccounts_ADJ c 
--				join (select aapaccountno, dea  from pharmacymaster..pm_pharmacy where  aapaccountno is not null and  aapaccountno != '' ) p
--			on c.dea = p.dea
--		) pc
--		on s.customer_no = pc.chaccountno3
--        where ( s.store = '' or s.store is null) and pc.aapaccountno is not null  and pc.aapaccountno != ''



---- Update by VendAcctNum from PM_VendAccts

----	UPDATE  s  set 
----		store = pv.aapaccountno  
----			FROM chph_aap   s 
----	 join
----	(
----	SELECT v.pmid,v.vendacctnum,  p.aapaccountno  from pharmacymaster..pm_vendoraccts v
----      join pharmacymaster..pm_pharmacy p on v.pmid = p.pmid
----	) pv
----	  on s.customer_no   =  pv.vendacctnum  where 
----            s.store = '' and pv.aapaccountno is not null


----	SELECT s.customer_no,pv.aapaccountno, pv.vendacctnum  from chph_aap s
----	 join
----	(
----	SELECT v.pmid,v.vendacctnum,  p.aapaccountno  from pharmacymaster..pm_vendoraccts v
----      join pharmacymaster..pm_pharmacy p on v.pmid = p.pmid
----	) pv
----	  on s.customer_no   =  pv.vendacctnum  where 
----            s.store = ''

--	UPDATE x
--	SET STORE = dt.AAPNumber
--	FROM dbo.CHPH_AAP AS x
--	INNER JOIN(SELECT DISTINCT PMID, CAHPrimaryAccount, AAPNumber
--				FROM RXMaster.dbo.PharmacyDim
--				WHERE CAHPrimaryAccount IS NOT NULL
--			  ) AS dt ON x.CUSTOMER_NO = dt.CAHPrimaryAccount
--	WHERE x.Store IS NULL
--		OR x.Store = ''
 


 
 
END











GO
