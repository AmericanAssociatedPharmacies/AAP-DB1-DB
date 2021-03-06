USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[spRebate_PriceProt_Total_MovedToReportsDB]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spRebate_PriceProt_Total_MovedToReportsDB]
(
	@date varchar(10)
	,@affiliate_substring varchar(50)
)
AS
DECLARE @affiliate varchar(50)
SET @affiliate = @affiliate_substring + '%'

 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_PriceProt_Total')
 BEGIN
  DROP TABLE tmp_PriceProt_Total
 END

SELECT * into tmp_PriceProt_Total from
(
	SELECT 
	--convert(varchar,[date],101) as [date]
	[Date]
	,p.PMID
	,p.NCPDP
	,PriceProtectionRebate as [Price Protection Rebate]
	,p.accountname as [Account Name],p.City,p.State
	FROM pharmacymaster..PM_Rebates_CHAAP r
	left join pharmacymaster..v_pm_allwithaffiliates p on p.pmid=r.pmid
	WHERE 
	[date]=@date
	--and
	--isnull([PriceProtectionRebate],0.0) <> 0.0
	and
	isnull(p.affiliate,'') like @affiliate
) ch

--Need to update any PriceProtection Direct Pay Rebates  
UPDATE  tp  set 
	[Price Protection Rebate] = ch.[PriceProtectionRebate]  
FROM tmp_PriceProt_Total   tp 
inner join 
	( select PMID,[PriceProtectionRebate] from reports..import_Rebates_CAHDirect where date =  @date and 
      [PriceProtectionRebate] <>0 ) ch
on tp.pmid = ch.pmid    where tp.[Price Protection Rebate] = 0

SELECT * from tmp_PriceProt_Total where [Price Protection Rebate] <> 0 order by PMID --NCPDP

----Get those that don't match amounts from Rebate table to Cardinal detail table
--select t.*,d.detailRebate as [Due To Date from CA]  from tmp_PriceProt_Total t
--join
--(
--	select distinct pmid,sum([Due To Date]) as detailRebate from tmp_PriceProt_Detail group by pmid
--) d
--on t.pmid = d.pmid where [Price Protection Rebate]  != detailRebate
--
---- Get Detail from Cardinal table for those that didn't match 
--select * from tmp_PriceProt_Detail where pmid in
--(
--
--select distinct t.pmid from tmp_PriceProt_Total t
--join
--(
--	select distinct pmid,sum([Due To Date]) as detailRebate from tmp_PriceProt_Detail group by pmid
--) d
--on t.pmid = d.pmid where [Price Protection Rebate]  != detailRebate

--Table Names tmp_PPDiff_Pipco,tmp_PPDiff_Keystone,tmp_PPDiff_Legend,tmp_PPDiff_PFOA,tmp_PPDiff_RxPlus
GO
