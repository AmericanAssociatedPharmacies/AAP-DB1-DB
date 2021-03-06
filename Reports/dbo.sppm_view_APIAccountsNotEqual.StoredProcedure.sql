USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_view_APIAccountsNotEqual]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <11/17/2010>
-- Description:	Find APIAccountNo's that are invalid archive (have a date in the pm_apiaccounts when they shouldn't have)
-- =============================================
CREATE PROCEDURE [dbo].[sppm_view_APIAccountsNotEqual]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
SELECT a.*,p.pmid as PM_PMID,p.apiaccountNo as PM_APIAccountNo from pharmacymaster..pm_apiaccounts a
join
(
	SELECT * from pharmacymaster..pm_pharmacy
) p on a.pmid = p.pmid where a.apiaccountno != p.apiaccountno order by a.pmid

END










GO
