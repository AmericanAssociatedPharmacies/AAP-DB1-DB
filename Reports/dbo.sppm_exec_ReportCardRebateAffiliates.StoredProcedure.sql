USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_exec_ReportCardRebateAffiliates]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Execute Report Card Rebate
-- =============================================
CREATE PROCEDURE [dbo].[sppm_exec_ReportCardRebateAffiliates]
(@in_month varchar(2),@in_year varchar(4))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @SQL varchar(max);
  
	   --- Drop the previous runs table

 EXEC dbo.sppm_create_ReportCardRebate_DYN  @in_month,@in_year 
 

	SET @SQL = 'SELECT r.* from tmp_RCRebate_jmw  r ' +
			' left join pharmacymaster..v_PM_AllWithAffiliates p on r.pmid=p.pmid '+

			' where p.pmid is not null '+
	        ' and (isnull([Total YTD All Rebates ' + @in_year + '],0) <>0 or ([Total YTD All Rebates ' + @in_year + '] = 0 and p.pmid in (select pmid from ' +
            ' pharmacymaster..pm_rebates_APImonthly where year(date) = ' + @in_year + '))) '+
			' and (p.Affiliate in (''PIPCO'',''PFOA'') or p.Affiliate like ''KEYSTONE%'' or p.Affiliate like ''LEGEND%'')';
	EXEC (@SQL);

END










GO
