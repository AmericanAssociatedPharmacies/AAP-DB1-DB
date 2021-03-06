USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[sppm_update_CHAAP_DETAIL_PMID_Deprecated_20201117]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <04/28/2010>
-- Description:	UPdate PM_Programs table
-- =============================================
CREATE PROCEDURE [dbo].[sppm_update_CHAAP_DETAIL_PMID_Deprecated_20201117]

AS

/*****************************************************************************

	DO NOT USE THIS SPROC. 

	The CAH Sales ETL has correct data and logic. The logic in sproc is outdated and will cause
	major data issues. -- RSE 11/17/2020


********************************************************************************/


BEGIN


 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
  RETURN
 


--		UPDATE  s  set 
--		pmid = pc.pmid  
--			FROM chph_aap   s 
--		join
--		(
--			SELECT  chaccountnoprimary,  pmid  from pharmacymaster..PM_CHAccounts_ADJ 
--             where chaccountnoprimary is not null and chaccountnoprimary != ''   
	
--		) pc
----		on   cast(cast(s.customer_no as int) as varchar(31)) = pc.chaccountnoprimary or s.customer_no = pc.chaccountnoprimary
----        where s.pmid is null and pc.pmid is not null   
----        on   cast(cast(s.customer_no as int) as varchar(31)) = 
----        SUBSTRING(pc.CHAccountNoPrimary,1,len(pc.CHAccountNoPrimary)- PATINDEX('%[0-9]%', reverse(pc.CHAccountNoPrimary))+1 ) or 
----        s.customer_no =  SUBSTRING(pc.CHAccountNoPrimary,1,len(pc.CHAccountNoPrimary)- PATINDEX('%[0-9]%', reverse(pc.CHAccountNoPrimary))+1 )
----        where s.pmid is null and pc.pmid is not null  

--        on   cast(cast(s.customer_no as int) as varchar(31)) = 
--			case when PATINDEX('%-%',pc.CHAccountNoPrimary  ) -1  > 0 then 
--			substring( pc.CHAccountNoPrimary,1,PATINDEX('%-%',pc.CHAccountNoPrimary  ) -1) else 
--			CHAccountNoPrimary end or 
--					s.customer_no = 
--			 case when PATINDEX('%-%',pc.CHAccountNoPrimary  ) -1  > 0 then 
--			substring( pc.CHAccountNoPrimary,1,PATINDEX('%-%',pc.CHAccountNoPrimary  ) -1) else 
--			CHAccountNoPrimary end 
--        where s.pmid is null and pc.pmid is not null 

-- --Try the secondary   Number 
 
 

--		UPDATE  s  set 
--		pmid = pc.pmid  
--			FROM chph_aap   s 
--		join
--		(
--			SELECT chaccountno2,pmid  from pharmacymaster..PM_CHAccounts_ADJ  
--             where chaccountno2 is not null and chaccountno2 != '' 

--		) pc
--		on cast(cast(s.customer_no as int) as varchar(31)) = pc.chaccountno2 or s.customer_no = pc.chaccountno2
--        where s.pmid is null and pc.pmid is not null
         


-- --Try the third   Number 


 
--		UPDATE  s  set 
--		pmid = pc.pmid  
--			FROM chph_aap   s 
--		join
--		(
--			SELECT  chaccountno3, pmid  from pharmacymaster..PM_CHAccounts_ADJ
--               where chaccountno3 is not null and chaccountno3 != '' 
  
--		) pc
--		on  cast(cast(s.customer_no as int) as varchar(31)) = pc.chaccountno3 or s.customer_no   = pc.chaccountno3
--        where s.pmid is null and pc.pmid is not null


-- --Try the CSOS Acct.  Number 

 
--		UPDATE  s  set 
--		pmid = pc.pmid  
--			FROM chph_aap   s 
--		join
--		(
--			SELECT  CSOSAcct,   pmid  from pharmacymaster..PM_CHAccounts_ADJ   
--			 where CSOSAcct is not null and CSOSAcct != '' 
--		) pc
--		on cast(cast(s.customer_no as int) as varchar(31)) = pc.CSOSAcct or s.customer_no = pc.CSOSAcct
--        where s.pmid is null and pc.pmid is not null


-- --Try the POS Acct.  Number 

 

--		UPDATE  s  set 
--		pmid = pc.pmid  
--			FROM chph_aap   s 
--		join
--		(
--			SELECT  POSAcct,   pmid  from pharmacymaster..PM_CHAccounts_ADJ   
--				where POSAcct is not null and POSAcct != '' 
			 
--		) pc
--		on cast(cast(s.customer_no as int) as varchar(31)) = pc.POSAcct or s.customer_no = pc.POSAcct
--        where s.pmid is null and pc.pmid is not null



-- --Try the ScanTossAcct  Number 

----		UPDATE  s  set 
----		pmid = pc.pmid  
----			FROM chph_aap   s 
----		join
----		(
----			SELECT  ScanTossAcct,   pmid  from pharmacymaster..PM_CHAccounts_ADJ   
----			 
----		) pc
----		on s.customer_no = pc.ScanTossAcct
----        where s.pmid is null and pc.pmid is not null

--		UPDATE  s  set 
--		pmid = pc.pmid  
--			FROM chph_aap   s 
--		join
--		(
--			SELECT  ScanTossAcct,   pmid  from pharmacymaster..PM_CHAccounts_ADJ   
--             where ScanTossAcct is not null and ScanTossAcct != '' 
			 
--		) pc
--		on cast(cast(s.customer_no as int) as varchar(31)) = pc.ScanTossAcct or s.customer_no = pc.ScanTossAcct 
--        where s.pmid is null and pc.pmid is not null

---------------------------------------New fields ------------------------------------
----We no longer get these fields from Cardinal -LA 12/28/2017

-- --Try the SecondPrimaryNumber Number 

 

--		--UPDATE  s  set 
--		--pmid = pc.pmid  
--		--	FROM chph_aap   s 
--		--join
--		--(
--		--	SELECT  SecondPrimaryNumber,   pmid  from pharmacymaster..PM_CHAccounts_ADJ   
--		--		where SecondPrimaryNumber is not null and SecondPrimaryNumber != '' 
			 
--		--) pc
--		--on cast(cast(s.customer_no as int) as varchar(31)) = pc.SecondPrimaryNumber or s.customer_no = pc.SecondPrimaryNumber
--  --      where s.pmid is null and pc.pmid is not null

-- --Try the Second2nd Number 

 

--		--UPDATE  s  set 
--		--pmid = pc.pmid  
--		--	FROM chph_aap   s 
--		--join
--		--(
--		--	SELECT  Second2nd,   pmid  from pharmacymaster..PM_CHAccounts_ADJ   
--		--		where Second2nd is not null and Second2nd != '' 
			 
--		--) pc
--		--on cast(cast(s.customer_no as int) as varchar(31)) = pc.Second2nd or s.customer_no = pc.Second2nd 
--  --      where s.pmid is null and pc.pmid is not null

-- --Try the Second3rd Number 

 

--		--UPDATE  s  set 
--		--pmid = pc.pmid  
--		--	FROM chph_aap   s 
--		--join
--		--(
--		--	SELECT  Second3rd,   pmid  from pharmacymaster..PM_CHAccounts_ADJ   
--		--		where Second3rd is not null and Second3rd != '' 
			 
--		--) pc
--		--on cast(cast(s.customer_no as int) as varchar(31)) = pc.Second3rd or s.customer_no = pc.Second3rd
--  --      where s.pmid is null and pc.pmid is not null

-- --Try the SecondPOS Number 

 

--		--UPDATE  s  set 
--		--pmid = pc.pmid  
--		--	FROM chph_aap   s 
--		--join
--		--(
--		--	SELECT  SecondPOS,   pmid  from pharmacymaster..PM_CHAccounts_ADJ   
--		--		where SecondPOS is not null and SecondPOS != '' 
			 
--		--) pc
--		--on cast(cast(s.customer_no as int) as varchar(31)) = pc.SecondPOS or s.customer_no = pc.SecondPOS 
--  --      where s.pmid is null and pc.pmid is not null


-- --Try the SecondCSOS Number 

 

--		--UPDATE  s  set 
--		--pmid = pc.pmid  
--		--	FROM chph_aap   s 
--		--join
--		--(
--		--	SELECT  SecondCSOS,   pmid  from pharmacymaster..PM_CHAccounts_ADJ   
--		--		where SecondCSOS is not null and SecondCSOS != '' 
			 
--		--) pc
--		--on cast(cast(s.customer_no as int) as varchar(31)) = pc.SecondCSOS or s.customer_no  = pc.SecondCSOS
--  --      where s.pmid is null and pc.pmid is not null



-- --Try the SecondCST Number 

 

--		--UPDATE  s  set 
--		--pmid = pc.pmid  
--		--	FROM chph_aap   s 
--		--join
--		--(
--		--	SELECT  SecondCST,   pmid  from pharmacymaster..PM_CHAccounts_ADJ   
--		--		where SecondCST is not null and SecondCST != '' 
			 
--		--) pc
--		--on cast(cast(s.customer_no as int) as varchar(31)) = pc.SecondCST or s.customer_no = pc.SecondCST
--  --      where s.pmid is null and pc.pmid is not null


-- --Try the ThirdPrimaryNumber Number 

 

--		--UPDATE  s  set 
--		--pmid = pc.pmid  
--		--	FROM chph_aap   s 
--		--join
--		--(
--		--	SELECT  ThirdPrimaryNumber,   pmid  from pharmacymaster..PM_CHAccounts_ADJ   
--		--		where ThirdPrimaryNumber is not null and ThirdPrimaryNumber != '' 
			 
--		--) pc
--		--on cast(cast(s.customer_no as int) as varchar(31)) = pc.ThirdPrimaryNumber or s.customer_no = pc.ThirdPrimaryNumber
--  --      where s.pmid is null and pc.pmid is not null

-- --Try the Third2nd Number 

 

--		--UPDATE  s  set 
--		--pmid = pc.pmid  
--		--	FROM chph_aap   s 
--		--join
--		--(
--		--	SELECT  Third2nd,   pmid  from pharmacymaster..PM_CHAccounts_ADJ   
--		--		where Third2nd is not null and Third2nd != '' 
			 
--		--) pc
--		--on cast(cast(s.customer_no as int) as varchar(31)) = pc.Third2nd or s.customer_no = pc.Third2nd 
--  --      where s.pmid is null and pc.pmid is not null



-- --Try the ThirdPOS Number 

 

--		--UPDATE  s  set 
--		--pmid = pc.pmid  
--		--	FROM chph_aap   s 
--		--join
--		--(
--		--	SELECT  ThirdPOS,   pmid  from pharmacymaster..PM_CHAccounts_ADJ   
--		--		where ThirdPOS is not null and ThirdPOS != '' 
			 
--		--) pc
--		--on cast(cast(s.customer_no as int) as varchar(31)) = pc.ThirdPOS or s.customer_no = pc.ThirdPOS
--  --      where s.pmid is null and pc.pmid is not null



-- --Try the ThirdCSOS Number 

 

--		--UPDATE  s  set 
--		--pmid = pc.pmid  
--		--	FROM chph_aap   s 
--		--join
--		--(
--		--	SELECT  ThirdCSOS,   pmid  from pharmacymaster..PM_CHAccounts_ADJ   
--		--		where ThirdCSOS is not null and ThirdCSOS != '' 
			 
--		--) pc
--		--on cast(cast(s.customer_no as int) as varchar(31)) = pc.ThirdCSOS or s.customer_no = pc.ThirdCSOS
--  --      where s.pmid is null and pc.pmid is not null


-- --Try the ThirdCST Number 

 

--		--UPDATE  s  set 
--		--pmid = pc.pmid  
--		--	FROM chph_aap   s 
--		--join
--		--(
--		--	SELECT  ThirdCST,   pmid  from pharmacymaster..PM_CHAccounts_ADJ   
--		--		where ThirdCST is not null and ThirdCST != '' 
			 
--		--) pc
--		--on cast(cast(s.customer_no as int) as varchar(31)) = pc.ThirdCST or s.customer_no = pc.ThirdCST
--  --      where s.pmid is null and pc.pmid is not null






----Problems where Bettys file dropped leading zeros that Cardinal put in - created a table to Map these - Betty is going to ask Cardinal to not put in leading zeros

--		UPDATE s set  
    
--		s.pmid = pc.pmid   
--			FROM chph_aap   s 
--		join
--		(
--			SELECT  AcctNoCHDetail ,   pmid  from chaap_acctno_mismatch   
			 
--		) pc
--		on s.customer_no = pc.AcctNoCHDetail
--        where s.pmid is null and pc.pmid is not null


----UPdate using the WholesalerAccount No that comes from API Load (where the wholesaler is Cardinal)


----	 UPDATE  s  set 
----		pmid = pv.pmid  
----			FROM purchases..chph_aap   s 
----	 join
----	(
----		SELECT pmid,   wholesalerAccountNo ,wholesaler  from  pharmacymaster..pm_pharmacy  where wholesaler = 'CA'
----	) pv
----	  on s.customer_no   =  pv.wholesalerAccountNo  where 
----            s.pmid is null and pv.pmid is not null


 
---- Update by VendAcctNum from PM_VendAccts
----
----	UPDATE  s  set 
----		pmid = pv.pmid  
----			FROM chph_aap   s 
----	 join
----	(
----	SELECT v.pmid,v.vendacctnum from pharmacymaster..pm_vendoraccts v
----      join pharmacymaster..pm_pharmacy p on v.pmid = p.pmid
----	) pv
----	  on s.customer_no   =  pv.vendacctnum  where 
----            s.pmid is null and pv.pmid is not null


 
----
--	UPDATE  s  set 
--		pmid = pv.pmid  
--			FROM chph_aap   s 
--	 join
--	(
--		SELECT pmid,   aapaccountno  from  pharmacymaster..pm_pharmacy  where aapaccountno is not null and aapaccountno != ''
--	) pv
--	  on s.store   =  pv.aapaccountno  where 
--            s.pmid is null and pv.pmid is not null and  pv.aapaccountno is not null and  pv.aapaccountno != ''


 

----	UPDATE  s  set 
----		pmid = pv.pmid  
----			FROM chph_aap   s 
----	 join
----	(
----		SELECT pmid,   udaccountno  from  pharmacymaster..pm_pharmacy  
----	) pv
----	  on s.store   =  pv.udaccountno  where 
----            s.pmid is null and pv.pmid is not null and  pv.udaccountno is not null




-- --I don't think this table is being updated anymore - probably pointless to even use it,

---- use the table that Jeff populates from lookups he does
----	UPDATE  su  set 
----			pmid = ch.pmid  
----	   FROM purchases..chph_aap   su 
----		inner join 
----			( select pmid,chaccountno from purchases..CH_PMIDXref where pmid is not null ) ch
----	   on su.customer_no = ch.chaccountno   where su.pmid is null

--	UPDATE x
--	SET PMID = dt.PMID
--	FROM dbo.CHPH_AAP AS x
--	INNER JOIN(SELECT DISTINCT PMID, CAHPrimaryAccount, AAPNumber
--				FROM RXMaster.dbo.PharmacyDim
--				WHERE CAHPrimaryAccount IS NOT NULL
--			  ) AS dt ON x.CUSTOMER_NO = dt.CAHPrimaryAccount
--	WHERE x.PMID IS NULL
--		OR x.PMID = ''
 
 
END












GO
