USE [PMBackups]
GO
/****** Object:  StoredProcedure [dbo].[sppm_compare_APIPMID_PMID]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <03/29/2010>
-- Description:	Backup and Truncate AddressMaster to recreate
-- =============================================
CREATE PROCEDURE [dbo].[sppm_compare_APIPMID_PMID]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table


   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_CompareAPIPMID_PMID')
          DROP TABLE tmp_CompareAPIPMID_PMID
 

SELECT  * into tmp_CompareAPIPMID_PMID from (
	SELECT p1.pmid as PMID,p1.apiaccountno as APIAccountNo,p1.AccountName,p1.PMID as PM_PMID,p2.apipmid as API_PMID from pharmacymaster..pm_Pharmacy p1 
	join 
	(
		SELECT * from pharmacymaster..pm_Pharmacy where apiaccountno is not null
	) p2

	ON p1.pmid = p2.pmid
	WHERE p1.apiaccountno is not null and ( p1.pmid != p2.apipmid or (p2.apipmid is null and p1.pmid is not null))
)tmp
END








GO
