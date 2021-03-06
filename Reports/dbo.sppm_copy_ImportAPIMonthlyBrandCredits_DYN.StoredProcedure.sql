USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_copy_ImportAPIMonthlyBrandCredits_DYN]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/28/2011>
-- Description:	Create table from import to production for API WH Quarterly rebates
-- =============================================
CREATE PROCEDURE [dbo].[sppm_copy_ImportAPIMonthlyBrandCredits_DYN]
(@date varchar(10))
 
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
 
-- There are 2 situations we have to be careful of here.  One is where there are 2 different account no's with the same PMID.  In this 
-- case we roll up by PMID and then update the APIAccount No with the current PMID from PM_Pharamcy.  The other situation is where you 
-- have two different PMID's but the APIAccount stayed the same - in this case the old PMID will have the APIAccountNo with a -BIA
-- on it. When the update occurs at the end of this stored proc we want to make sure we do not update with -BIA account.  The file we 
-- get from API will have the correct API #.  The problem occurs because of the long time frame from when we get the API rebates.  In that
-- time frame a new PMID could be issued and if the APIAccount No. stays the same they will put a -BIA on the end in PM_Pharmacy.
 
	--------USE THIS TO UPDATE blank PMIDs in the import table before load to production

		UPDATE  i  set 
			pmid = a.pmid  
	    FROM import_APIMonthlyBrandCredits    i 
		inner join 
		(
			select a1.pmid,i1.apiaccountno from import_APIMonthlyBrandCredits  i1
			join
			(
			   select *    from pharmacymaster..PM_Pharmacy where apiaccountno not like '%-%'
			) a1 on i1.apiaccountno = a1.apiaccountno where (i1.pmid is null or i1.pmid = '')  and  i1.date = @date
        ) a
	    on i.apiaccountno = a.apiaccountno   where i.date = @date


		UPDATE  i  set 
			pmid = a.pmid  
	    FROM import_APIMonthlyBrandCredits    i 
		inner join 
		(
			select a1.pmid,i1.apiaccountno from import_APIMonthlyBrandCredits  i1
			join
			(
			   select *    from pharmacymaster..PM_APIAccounts where apiaccountno not like '%-%'
			) a1 on i1.apiaccountno = a1.apiaccountno where (i1.pmid is null or i1.pmid = '')  and  i1.date = @date
        ) a
	    on i.apiaccountno = a.apiaccountno   where i.date = @date

	INSERT into PharmacyMaster..PM_BrandCredits_APIMonthly (
			[Date],
			[PMID],
			[APIAccountNo],
			[AccountName],
			[Territory],
			[BrandCredits],
			[BrandSales],
			[ACH],
			[PayTerms])
		SELECT @date, 
            [PMID],
            max([APIAccountNo]),
			max([AccountName]),
			max([Territory]),
			sum([BrandCredits]),
			sum([BrandSales]),
            max(convert(int,[ACH])), 
			max([PayTerms])
    		 FROM import_APIMonthlyBrandCredits where pmid != '' and pmid != 'NON' and date = @date group by PMID ,date



 

--Need  to update to current APIAccountNo *** Need to add in where the apiaccountno not like '-' because if they
-- changed PMID by the time these are done it may pick up the -BIA in the PM_APIAccounts table.

--UPDATE PharmacyMaster..PM_BrandCredits_APIMonthly   set apiaccountno = 
--	(select apiaccountno from  pharmacymaster..pm_pharmacy where pmid =  PharmacyMaster..PM_BrandCredits_APIMonthly.pmid 
--     and apiaccountno  not like '%-%') where date = @date

UPDATE su set apiaccountno = ch.apiaccountno
   FROM PharmacyMaster..PM_BrandCredits_APIMonthly  su 
	inner join 
		(select apiaccountno,pmid from  PharmacyMaster..PM_Pharmacy where apiaccountno  not like '%-%') ch
   on su.pmid = ch.pmid and date = @date




END








GO
