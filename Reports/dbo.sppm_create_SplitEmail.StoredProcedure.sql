USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_SplitEmail]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table with just PMID and Email pivoted out from PM_Pharmacy -- the name is misleading
-- this does not ccreate duplicate emails it seperates out comma separated emails
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_SplitEmail]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	 IF EXISTS(SELECT name FROM sys.tables
		 WHERE name = 'tmp_SplitEmail')
	 BEGIN
	  DROP TABLE tmp_SplitEmail
	 END
---- Will need to change tmp_PM_SplitEmail to pm_pharmacy when done testing
 
 SELECT * into tmp_SplitEmail from (
 	SELECT ca.PMID AS PMID, ca.Email AS Email FROM pharmacymaster..pm_pharmacy t
 CROSS APPLY (SELECT * FROM dbo.EmailToTableWithPMID(t.PMID, t.Email)) ca
 	)ch where ch.email != ''

	SELECT * from tmp_SplitEmail 

--Just an example on how to join to get results
--SELECT p.pmid,t.email,p.accountname,p.city,p.state from tmp_SplitEmail t
--join
--(
--	select * from pharmacymaster..v_pm_allwithaffiliates 
--) p
--on t.pmid = p.pmid

 
END








GO
