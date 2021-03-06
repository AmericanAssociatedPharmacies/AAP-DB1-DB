USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_update_CH_ALLPVA_SALES_AAP]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <04/28/2010>
-- Description:	UPdate PM_Programs table
-- =============================================
CREATE PROCEDURE [dbo].[sppm_update_CH_ALLPVA_SALES_AAP]

AS
BEGIN
    --  - NOT USING THIS TO LOAD ALL PVA USING COMBINED FILE FROM BETTY!!!!!!!
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    DECLARE @date varchar(10);
	SET @date = '06/01/2010' --Change

UPDATE  chaap_sales set gentotal = 0 where gentotal is null
UPDATE  chaap_sales set genexcl = 0 where genexcl is null
UPDATE  chaap_sales set gensrc = 0 where gensrc is null
UPDATE  chaap_sales set gensrctop = 0 where gensrctop is null
UPDATE  chaap_sales set genchpresrcbu = 0 where genchpresrcbu is null
UPDATE  chaap_sales set cogappliedsales = 0 where cogappliedsales is null
UPDATE  chaap_sales set brand = 0 where brand is null
UPDATE  chaap_sales set netsales = 0 where netsales is null
UPDATE  chaap_sales set other = 0 where other is null
UPDATE  chaap_sales set otc = 0 where otc is null

--SELECT TO VERIFY
--		select 
--		AAPNetSales , vol.netsales,
--        AAPBrand ,  vol.brand,
--		AAPGenTotal ,vol.gentotal,
--		AAPGenTotalSrc , vol.gensrctotal,
--		AAPGenExcl, vol.genexcl,
--		AAPOTC , vol.otc,
--		AAPOther , vol.other  ,su.date
--	    FROM   pharmacymaster..CH_ALLPVA_SALES_JUNE su 
--			inner join 
--			 (  
--              	select sum(netsales) as netsales, sum(brand) as brand,sum(gentotal) as gentotal,sum(gensrc) + sum(gensrctop) + sum(genchpresrcbu) as gensrctotal,
--					sum(genexcl) as genexcl,sum(otc) as otc,sum(other) as other,n.pmid
--				from chaap_sales n
--				left outer join
--					(SELECT pmid,accountname FROM PM_Pharmacy) pm on pm.pmid = n.pmid  
--				where month(n.date) = 05 and year(n.date) = 2010  
--				group by n.pmid,pm.accountname  
--
--			 ) vol
--		  on su.pmid = vol.pmid where month(su.date) = 05 and year(su.date) = 2010
  
 --TO UPDATE UDNetSales from Volume
		UPDATE su set 
		AAPNetSales = vol.netsales,
        AAPBrand =  vol.brand,
		AAPGenTotal = vol.gentotal,
		AAPGenTotalSrc = vol.gensrctotal,
		AAPGenExcl = vol.genexcl,
		AAPOTC = vol.otc,
		AAPOther = vol.other  
	     FROM   pharmacymaster..CH_ALLPVA_SALES_JUNE su 
			inner join 
			 (  
              	select sum(netsales) as netsales, sum(brand) as brand,sum(gentotal) as gentotal,sum(gensrc) + sum(gensrctop) + sum(genchpresrcbu) as gensrctotal,
					sum(genexcl) as genexcl,sum(otc) as otc,sum(other) as other,n.pmid
				from chaap_sales n
				left outer join
					(SELECT pmid,accountname FROM PM_Pharmacy) pm on pm.pmid = n.pmid  
				where month(n.date) = 06 and year(n.date) = 2010  -- CHANGE  DATE HERE
				group by n.pmid,pm.accountname  

			 ) vol
		  on su.pmid = vol.pmid where month(su.date) = 06 and year(su.date) = 2010 -- CHANGE  DATE HERE
 

 
--FOR INSERT  of CHAAP_SALES 

  	  INSERT  into CH_ALLPVA_SALES_JUNE (date,AAPNetSales,AAPBrand,AAPGenTotal,AAPGenTotalSrc,AAPGenExcl,AAPOTC,AAPOther,PMID,AccountName) 
      SELECT * FROM ( 
		SELECT @date as date,sum(netsales) as netsales, 
                   sum(brand) as brand,sum(gentotal) as gentotal,
                    sum(gensrc) + sum(gensrctop) + sum(genchpresrcbu) as gensrctotal,
					sum(genexcl) as genexcl,sum(otc) as otc,sum(other) as other,n.pmid,pm.accountname
				from chaap_sales n
				left outer join
					(SELECT pmid,accountname FROM PM_Pharmacy) pm on pm.pmid = n.pmid  
				where month(n.date) = 06 and year(n.date) = 2010  -- CHANGE  DATE HERE
				group by n.pmid,pm.accountname 
		 )vol
	 WHERE not exists  (select pmid from pharmacymaster..CH_ALLPVA_SALES_JUNE  where month(date) = 06 and year(date) = 2010 and pmid = vol.pmid); -- Change DATE HERE


--To Update UDAccountno with Generic and Brand from Indexing Gen Rebate



 


--SET TO ZERO WHERE NULL
	UPDATE CH_ALLPVA_SALES_JUNE SET APICOGAppliedSales = 0.00 where APICOGAppliedSales is null;
	UPDATE CH_ALLPVA_SALES_JUNE SET APINetSales  = 0.00 where APINetSales is null;
	UPDATE CH_ALLPVA_SALES_JUNE SET APIGENRx = 0.00 where APIGENRx is null;
	UPDATE CH_ALLPVA_SALES_JUNE SET APIGENTotalSrc = 0.00 where APIGENTotalSrc is null;
	UPDATE CH_ALLPVA_SALES_JUNE SET APIGENTotalP2P3 = 0.00 where APIGENTotalP2P3 is null;
	UPDATE CH_ALLPVA_SALES_JUNE SET APIGENTotal = 0.00 where APIGENTotal is null;
	UPDATE CH_ALLPVA_SALES_JUNE SET APIBrand = 0.00 where APIBrand is null;
	UPDATE CH_ALLPVA_SALES_JUNE SET APIOTC = 0.00 where APIOTC is null;
	UPDATE CH_ALLPVA_SALES_JUNE SET APIGBRPerc = 0.00 where APIGBRPerc is null;
	UPDATE CH_ALLPVA_SALES_JUNE SET AAPCOGAppliedSales = 0.00 where AAPCOGAppliedSales is null;
	UPDATE CH_ALLPVA_SALES_JUNE SET AAPNetSales = 0.00 where AAPNetSales is null;
	UPDATE CH_ALLPVA_SALES_JUNE SET AAPBrand = 0.00 where AAPBrand is null;
	UPDATE CH_ALLPVA_SALES_JUNE SET AAPGENTotal = 0.00 where AAPGENTotal is null;
	UPDATE CH_ALLPVA_SALES_JUNE SET AAPGENTotalSrc = 0.00 where AAPGENTotalSrc is null;
	UPDATE CH_ALLPVA_SALES_JUNE SET AAPGENExcl = 0.00 where AAPGENExcl is null;
	UPDATE CH_ALLPVA_SALES_JUNE SET AAPOTC = 0.00 where AAPOTC is null;
	UPDATE CH_ALLPVA_SALES_JUNE SET AAPOther = 0.00 where AAPOther is null;
	UPDATE CH_ALLPVA_SALES_JUNE SET UDNetSales = 0.00 where UDNetSales is null;
	UPDATE CH_ALLPVA_SALES_JUNE SET UDBrand = 0.00 where UDBrand is null;
	UPDATE CH_ALLPVA_SALES_JUNE SET UDGENTotal = 0.00 where UDGENTotal is null;
	UPDATE CH_ALLPVA_SALES_JUNE SET UDGENTotalSrc = 0.00 where UDGENTotalSrc is null;
	UPDATE CH_ALLPVA_SALES_JUNE SET UDOTC = 0.00 where UDOTC is null;
	UPDATE CH_ALLPVA_SALES_JUNE SET UDOther = 0.00 where UDOther is null;
	UPDATE CH_ALLPVA_SALES_JUNE SET CombNetSales = 0.00 where CombNetSales is null;
	UPDATE CH_ALLPVA_SALES_JUNE SET CombBrands = 0.00 where CombBrands is null;
	UPDATE CH_ALLPVA_SALES_JUNE SET CombOTC = 0.00 where CombOTC is null;
	UPDATE CH_ALLPVA_SALES_JUNE SET CombGENTotal = 0.00 where CombGENTotal is null;
	UPDATE CH_ALLPVA_SALES_JUNE SET CombGENTotalSrc = 0.00 where CombGENTotalSrc is null;
    UPDATE CH_ALLPVA_SALES_JUNE SET CombOther = 0.00 where CombOther is null;

	UPDATE CH_ALLPVA_SALES_JUNE set CombNetSales = APINetSales + AAPNetSales + UDNetSales;
	UPDATE CH_ALLPVA_SALES_JUNE set CombBrands = APIBrand + AAPBrand + UDBrand;
    UPDATE CH_ALLPVA_SALES_JUNE SET CombOTC = APIOTC + AAPOTC + UDOTC; -- TODO THIS MAY CHANGE UDOTC may become UDOther
    UPDATE CH_ALLPVA_SALES_JUNE SET CombGENTotal = APIGENTotal + AAPGENTotal + UDGENTotal;
    UPDATE CH_ALLPVA_SALES_JUNE SET CombGENTotalSrc = APIGENTotalSrc + AAPGENTotalSrc + UDGENTotalSrc;
    UPDATE CH_ALLPVA_SALES_JUNE SET CombOther = AAPOther + UDOther

-- UPDATE DEA

   UPDATE  a  set 
	   a.dea = p.dea
          FROM CH_ALLPVA_SALES_JUNE a
		  join 
			( select   pmid,dea  from pm_pharmacy   ) p
	      on a.pmid  = p.pmid   

-- DOn't know if want to do this - can use pmid to get the accountno
--		UPDATE  su  set 
--			aapaccountno = ch.aapaccountno  
--	   FROM CH_ALLPVA_SALES_TEST_BKP  su 
--		inner join 
--			( select aapaccountno,udaccountno,dea from pm_pharmacy where dea is not null and aapaccountno is not null ) ch
--	   on su.dea = ch.dea where su.aapaccountno is null and su.udaccountno is not null   
--
--	select su.aapaccountno,su.udaccountno,ch.aapaccountno,ch.udaccountno 
--	   FROM CH_ALLPVA_SALES_TEST_BKP  su 
--		inner join 
--			( select aapaccountno,udaccountno,dea from pm_pharmacy where dea is not null and aapaccountno is not null ) ch
--	   on su.dea = ch.dea where su.aapaccountno is null and su.udaccountno is not null
--------------------
--		UPDATE  su  set 
--			aapaccountno = ch.aapaccountno  
--	   FROM CH_ALLPVA_SALES_TEST_BKP  su 
--		inner join 
--			( select aapaccountno,udaccountno,dea from pm_pharmacy where dea is not null and aapaccountno is not null ) ch
--	   on su.dea = ch.dea where su.aapaccountno is null and su.udaccountno is not null   
--
--	select su.udaccountno,su.aapaccountno,ch.udaccountno,ch.aapaccountno 
--	   FROM CH_ALLPVA_SALES_TEST_BKP  su 
--		inner join 
--			( select aapaccountno,udaccountno,dea from pm_pharmacy where dea is not null and udaccountno is not null ) ch
--	   on su.dea = ch.dea where su.udaccountno is null and su.aapaccountno is not null

END








GO
