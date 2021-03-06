USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_find_APIAcct_InvalidArchive]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <11/17/2010>
-- Description:	Find APIAccountNo's that are invalid archive (have a date in the pm_apiaccounts when they shouldn't have)
-- =============================================
CREATE PROCEDURE [dbo].[sppm_find_APIAcct_InvalidArchive]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	SELECT a.pmid,p.pmid as PM_PMID,a.apiaccountno,p.apiaccountno as PM_API,a.date from pharmacymaster..pm_apiaccounts a
	join
		(SELECT * from pharmacymaster..pm_pharmacy) p 
	on a.pmid = p.pmid and a.apiaccountno = p.apiaccountno
	WHERE date is not null 

	union

	SELECT a.pmid,p.pmid as PM_PMID,a.apiaccountno,p.apiaccountno as PM_API,a.date from pharmacymaster..pm_apiaccounts a
	join
		(SELECT * from pharmacymaster..pm_pharmacy) p 
	on a.apiaccountno = p.apiaccountno
	WHERE date is not null 

END










GO
