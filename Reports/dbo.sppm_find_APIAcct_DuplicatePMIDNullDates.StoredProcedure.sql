USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_find_APIAcct_DuplicatePMIDNullDates]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <11/17/2010>
-- Description:	Find APIAccountNo's that are duplicate archive (same PMID and APIAccountno in pm_apiaccounts)
-- =============================================
create PROCEDURE [dbo].[sppm_find_APIAcct_DuplicatePMIDNullDates]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
                SELECT t.*
	FROM pharmacymaster..pm_apiaccounts  t
	inner join 
	(
		SELECT pmid 
		FROM   pharmacymaster..pm_apiaccounts where date is null  
		GROUP BY pmid 
		HAVING count(*) > 1
	) d on t.pmid = d.pmid  where date is null  


END










GO
