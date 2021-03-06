USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_find_APIAcct_DuplicateArchive]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <11/17/2010>
-- Description:	Find APIAccountNo's that are duplicate archive (same PMID and APIAccountno in pm_apiaccounts)
-- =============================================
CREATE PROCEDURE [dbo].[sppm_find_APIAcct_DuplicateArchive]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
    SELECT t.*
	FROM pharmacymaster..pm_apiaccounts  t
	inner join 
	(
		SELECT pmid,apiaccountno
		FROM   pharmacymaster..pm_apiaccounts   
		GROUP BY pmid,apiaccountno
		HAVING count(*) > 1
	) d on t.pmid = d.pmid  and t.apiaccountno = d.apiaccountno

END










GO
