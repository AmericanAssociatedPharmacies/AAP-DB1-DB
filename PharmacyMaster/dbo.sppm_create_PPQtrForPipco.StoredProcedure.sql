USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_PPQtrForPipco]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/10/2012>
-- Description:	 Create PP Quarterly for Pipco
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_PPQtrForPipco]
(@paidDate varchar(10))
AS
BEGIN


IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PP_Pipco')
		 BEGIN
          DROP TABLE tmp_PP_Pipco
         END

SELECT * into tmp_PP_Pipco from (
	SELECT p.PMID,v.VendorName,p.AccountName,p.Addr1,p.Addr2,p.City,p.State,p.Zip,Rebate as [Payment Amount],p.NCPDP  from v_pm_allwithaffiliates p

	join 
	(
	 
		SELECT VendorName,PMID, round(sum(Rebate *.9),2) as Rebate  from
		(
		SELECT v.Vendorname,pmid  ,sum(volumeamt) as Volume,    sum(rebateamt)  as Rebate from vendorvolumerebate vvr
			left outer join
			(
			 SELECT vendorid,vendorname from partners
			) v
		on vvr.vendorid = v.vendorid 
		where storepaiddt = @paidDate and eligibility = 1
		 and pmid in (select pmid from v_pm_allwithaffiliates where affiliate like 'pipco%')
		group by v.vendorname,pmid
		)ch Group by VendorName,PMID
	) v on p.pmid = v.pmid  
) pv
 

-- For QA 
IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PP_Pipco_Group')
		 BEGIN
          DROP TABLE tmp_PP_Pipco_Group
         END


SELECT * into tmp_PP_Pipco_Group from 
(
	SELECT PMID,sum([Payment Amount]) as Payment from tmp_PP_Pipco
	group by pmid
) ch


 SELECT * from tmp_PP_Pipco order by PMID



--Chris did it like this - same results

--select v_pm_allwithaffiliates.pmid, vendorname,accountname, address,address2, pm_addressmaster.city, pm_addressmaster.state, pm_addressmaster.zip, sum(round(rebateamt *.9,2)) as [Payment Amount], ncpdp
--from vendorvolumerebate, v_pm_allwithaffiliates, partners, pm_addressmaster
--where 
--v_pm_allwithaffiliates.pmid = vendorvolumerebate.pmid 
--and vendorvolumerebate.vendorid = partners.vendorid
--and v_pm_allwithaffiliates.pmid = pm_addressmaster.pmid and address_type_id = 1
--and v_pm_allwithaffiliates.affiliate like 'PIPCO%'
--and storepaiddt = '2012-08-21' and eligibility = 1
--group by v_pm_allwithaffiliates.pmid,vendorname, accountname, address, address2, pm_addressmaster.city, pm_addressmaster.state, pm_addressmaster.zip ,ncpdp
-- 
 
END








GO
