USE [PMBackups]
GO
/****** Object:  StoredProcedure [dbo].[sppm_compare_APIDEA_PMDEA]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <03/29/2010>
-- Description:	Backup and Truncate AddressMaster to recreate
-- =============================================
CREATE PROCEDURE [dbo].[sppm_compare_APIDEA_PMDEA]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

SELECT p.PMID,p.AccountName,p.APIAccountNo as PM_APIAccountNo,p.DEA as PM_DEA, t.AccountNo as ASW_APIAccountNo,t.dea as ASW_DEA 
	FROM pharmacymaster..pm_pharmacy p
	join pmbackups..tmp_apiaccountmaster_Orig  t 
	ON p.apiaccountno = t.accountno  
	WHERE t.dea != p.dea ORDER BY ASW_DEA desc
END








GO
