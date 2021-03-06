USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_CardinalAcctZeroExcAll]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Execute Contributions Report
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_CardinalAcctZeroExcAll]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  

SELECT distinct customer_no as DetailAcctNo,ch.pmid as DetailPMID ,customer_name as DetailName,
pm.chaccountnoprimary as OurAcctNo,pm.pmid as OurPMID,pm.accountname as OurAcctName,pm.corporatename as OurCorporateName
from purchases..chph_aap ch
join
(
  SELECT '0' + chaccountnoprimary as chacctno ,   chaccountnoprimary ,cha.pmid, p.accountname,p.corporatename from pharmacymaster..pm_chaccounts_adj cha
 join
	(
		select accountname,pmid,corporatename from pharmacymaster..pm_pharmacy 
	) p
	on cha.pmid = p.pmid

 where len(chaccountnoprimary) = 5
) pm
on ch.customer_no = pm.chacctno

END










GO
