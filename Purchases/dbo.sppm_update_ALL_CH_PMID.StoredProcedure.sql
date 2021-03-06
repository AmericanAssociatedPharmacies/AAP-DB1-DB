USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[sppm_update_ALL_CH_PMID]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <07/09/2010>
-- Description:	UPdate chph_api,chph_aap,chph_ud,chaap_sales,chaap_admin,chaap_genrebate with PMID from Jeffs update to CH_PMIDxref
-- =============================================
CREATE PROCEDURE [dbo].[sppm_update_ALL_CH_PMID]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  

--These update from the table Jeff populates after he does look ups trying to resolve stores
	UPDATE  su  set 
			pmid = ch.pmid  
	   FROM purchases..chph_api   su 
		inner join 
			( select pmid,chaccountno from purchases..CH_PMIDXref where pmid is not null ) ch
	   on su.customer_no = ch.chaccountno   where su.pmid is null

-- use the table that Jeff populates from lookups he does
	UPDATE  su  set 
			pmid = ch.pmid  
	   FROM purchases..chph_aap   su 
		inner join 
			( select pmid,chaccountno from purchases..CH_PMIDXref where pmid is not null ) ch
	   on su.customer_no = ch.chaccountno   where su.pmid is null


-- This is from table Jeff updates after resarching stores
	UPDATE  su  set 
			pmid = ch.pmid  
	   FROM purchases..chph_ud   su 
		inner join 
			( select pmid,chaccountno from purchases..CH_PMIDXref where pmid is not null ) ch
	   on su.customer_no = ch.chaccountno   where su.pmid is null

-- use the table that Jeff populates from lookups he does
	UPDATE  su  set 
			pmid = ch.pmid  
	   FROM pharmacymaster..chaap_admin   su 
		inner join 
			( select pmid,chaccountno from purchases..CH_PMIDXref where pmid is not null ) ch
	   on su.chaccountno = ch.chaccountno   where su.pmid is null

-- use the table that Jeff populates from lookups he does
	UPDATE  su  set 
			pmid = ch.pmid  
	   FROM pharmacymaster..chaap_GENRebate   su 
		inner join 
			( select pmid,chaccountno from purchases..CH_PMIDXref where pmid is not null ) ch
	   on su.chaccountno = ch.chaccountno   where su.pmid is null

-- use the table that Jeff populates from lookups he does
	UPDATE  su  set 
			pmid = ch.pmid  
	   FROM pharmacymaster..chaap_sales   su 
		inner join 
			( select pmid,chaccountno from purchases..CH_PMIDXref where pmid is not null ) ch
	   on su.chaccountno = ch.chaccountno where su.pmid is null
 
END








GO
