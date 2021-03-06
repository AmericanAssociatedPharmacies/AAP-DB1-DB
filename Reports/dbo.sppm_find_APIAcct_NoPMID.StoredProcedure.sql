USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_find_APIAcct_NoPMID]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <11/17/2010>
-- Description:	Find APIAccountNo's for a certain month/year with no Match in PM_Pharmacy - XX's are excluded
-- =============================================
CREATE PROCEDURE [dbo].[sppm_find_APIAcct_NoPMID]
(@in_month varchar(2), @in_year varchar(4))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	--USE this to find apiaccountno's with no PMID before loading ALL_Volume (excludes 'XX' territory)
	SELECT * from pmbackups..tmp_apiaccountmaster_orig t
	join ( 

	SELECT distinct whaccountid , p.* FROM api..v_apisalesdetail a
	left outer join (
	SELECT * FROM pharmacymaster..pm_pharmacy WHERE apiaccountno is not null

	)p
	on a.whaccountid = p.apiaccountno  
	WHERE
	month(invdate) = @in_month and year(invdate) = @in_year
	and whaccountid is not null
	and p.pmid is null
	) tmp 
	on t.accountno = tmp.whaccountid
	WHERE t.territory != 'XX' and t.accountno not in (SELECT apiaccountno FROM  pharmacymaster..pm_apiaccounts WHERE date is not null)


END










GO
