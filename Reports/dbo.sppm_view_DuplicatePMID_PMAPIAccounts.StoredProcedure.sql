USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_view_DuplicatePMID_PMAPIAccounts]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <11/17/2010>
-- Description:	Find APIAccountNo's that are invalid archive (have a date in the pm_apiaccounts when they shouldn't have)
-- =============================================
CREATE PROCEDURE [dbo].[sppm_view_DuplicatePMID_PMAPIAccounts]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
SELECT t.*
	from pharmacymaster..pm_apiaccounts t
	inner join 
	(
		SELECT pmid
		from   pharmacymaster..pm_apiaccounts
		group by pmid
		having count(*) > 1
	) d on t.pmid = d.pmid order by pmid,date

END










GO
