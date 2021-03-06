USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[sppm_update_CHAPI_DETAIL_PMID]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <04/28/2010>
-- Description:	UPdate PM_Programs table
-- =============================================
CREATE PROCEDURE [dbo].[sppm_update_CHAPI_DETAIL_PMID]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  


	-- Update by CHAccountNo aka CAAccountNo - get dea from PM_CHAccounts and then get the PMID from there


		UPDATE  s  set 
		pmid = pc.pmid  
			FROM chph_api   s 
		join
		(
			SELECT c.caaccountno,c.dea,p.pmid  from pharmacymaster..v_PM_CHAccounts_DEA c 
				join (select pmid, dea  from pharmacymaster..pm_pharmacy ) p
			on c.dea = p.dea
		) pc
		on s.customer_no = pc.caaccountno
        where s.pmid is null and pc.pmid is not null


--		SELECT s.store,s.customer_no,s.customer_name,pc.pmid,pc.caaccountno ,pc.accountname from chph_api s
--		 join
--		(
--		SELECT c.caaccountno,c.dea ,p.pmid,p.accountname from pharmacymaster..v_PM_CHAccounts_DEA c 
--		join (select pmid, dea ,accountname from pharmacymaster..pm_pharmacy ) p
--		on c.dea = p.dea
--
--		) pc on s.customer_no = pc.caaccountno
-- where s.pmid is null and pc.pmid is not null

-- Update by VendAcctNum from PM_VendAccts

	UPDATE  s  set 
		pmid = pv.pmid  
			FROM chph_api   s 
	 join
	(
	SELECT v.pmid,v.vendacctnum from pharmacymaster..pm_vendoraccts v
      join pharmacymaster..pm_pharmacy p on v.pmid = p.pmid
	) pv
	  on s.customer_no   =  pv.vendacctnum  where 
            s.pmid is null and pv.pmid is not null


--	SELECT s.customer_no,pv.pmid, pv.vendacctnum  from chph_api s
--	 join
--	(
--	SELECT v.pmid,v.vendacctnum,  p.aapaccountno  from pharmacymaster..pm_vendoraccts v
--      join pharmacymaster..pm_pharmacy p on v.pmid = p.pmid
--	) pv
--	  on s.customer_no   =  pv.vendacctnum  where 
--           s.pmid is null and pv.pmid is not null

-- Update by store = apiaccountno - may not have found by DEA - cardinal may have bad DEA

	UPDATE  s  set 
		pmid = pv.pmid  
			FROM chph_api   s 
	 join
	(
		SELECT pmid,   apiaccountno  from  pharmacymaster..pm_pharmacy  
	) pv
	  on s.store   =  pv.apiaccountno  where 
            s.pmid is null and pv.pmid is not null


--	SELECT s.store,pv.pmid  from chph_api s
--	 join
--	(
--		SELECT pmid,   apiaccountno  from  pharmacymaster..pm_pharmacy  
--	) pv
--	  on s.store   =  pv.apiaccountno  where 
--            s.pmid is null and pv.pmid is not null

-- Update by store = aapaccountno (CH puts in the aapaccountno instead of apiaccountno) - may not have found by DEA - cardinal may have bad DEA
	UPDATE  s  set 
		pmid = pv.pmid  
			FROM chph_api   s 
	 join
	(
		SELECT pmid,   aapaccountno  from  pharmacymaster..pm_pharmacy  
	) pv
	  on s.store   =  pv.aapaccountno  where 
            s.pmid is null and pv.pmid is not null

--	SELECT s.store,pv.pmid  from chph_api s
--	 join
--	(
--		SELECT pmid,   aapaccountno  from  pharmacymaster..pm_pharmacy  
--	) pv
--	  on s.store   =  pv.aapaccountno  where 
--            s.pmid is null and pv.pmid is not null
--These update from the table Jeff populates after he does look ups tryin to resolve stores
	UPDATE  su  set 
			pmid = ch.pmid  
	   FROM purchases..chph_api   su 
		inner join 
			( select pmid,chaccountno from purchases..CH_PMIDXref where pmid is not null ) ch
	   on su.customer_no = ch.chaccountno   where su.pmid is null
 
END








GO
