USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[sppm_update_CHUD_DETAIL_STORE]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <04/28/2010>
-- Description:	UPdate PM_Programs table
-- =============================================
CREATE PROCEDURE [dbo].[sppm_update_CHUD_DETAIL_STORE]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  


	-- Update by CHAccountNo aka CAAccountNo - get dea from PM_CHAccounts and then get the AAPAccountNo from there


		UPDATE  s  set 
		store = pc.udaccountno  
			FROM chph_ud   s 
		join
		(
			SELECT c.caaccountno,c.dea,p.udaccountno  from pharmacymaster..v_PM_CHAccounts_DEA c 
				join (select udaccountno, dea  from pharmacymaster..pm_pharmacy ) p
			on c.dea = p.dea
		) pc
		on s.customer_no = pc.caaccountno
        where s.store = '' and pc.udaccountno is not null


--		SELECT s.store,s.customer_no,s.customer_name,pc.udaccountno,pc.caaccountno ,pc.accountname from chph_ud s
--		 join
--		(
--		SELECT c.caaccountno,c.dea ,p.udaccountno,p.accountname from pharmacymaster..v_PM_CHAccounts_DEA c 
--		join (select udaccountno, dea ,accountname from pharmacymaster..pm_pharmacy ) p
--		on c.dea = p.dea
--
--		) pc on s.customer_no = pc.caaccountno
-- where s.store = '' and pc.udaccountno is not null

--TRY BY the PM_VendorAccts table
	UPDATE  s  set 
		store = pv.accountno  
			FROM chph_ud   s 
	 join
	(
		SELECT v.pmid,v.vendacctnum,case when p.aapaccountno is null then p.udaccountno else p.aapaccountno end as accountno from pharmacymaster..pm_vendoraccts v
		 join pharmacymaster..pm_pharmacy p on v.pmid = p.pmid
	) pv
	  on s.customer_no   =  pv.vendacctnum  where 
            s.store = ''


--	SELECT s.customer_no,pv.accountno, pv.vendacctnum  from chph_ud s
--	 join
--	(
--	SELECT v.pmid,v.vendacctnum,case when p.aapaccountno is null then p.udaccountno else p.aapaccountno end as accountno from pharmacymaster..pm_vendoraccts v
--      join pharmacymaster..pm_pharmacy p on v.pmid = p.pmid
--	) pv
--	  on s.customer_no   =  pv.vendacctnum  where 
--            s.store is null
-- 


 
 
END








GO
