USE [PMBackups]
GO
/****** Object:  StoredProcedure [dbo].[sppm_compare_APIAAPNo_AAPNo]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <03/29/2010>
-- Description:	Backup and Truncate AddressMaster to recreate
-- Modified : Added the Replace T with blank when comparing ASW field 02/11/2011
-- =============================================
CREATE PROCEDURE [dbo].[sppm_compare_APIAAPNo_AAPNo]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table


   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_CompareAPIAAPNo')
          DROP TABLE tmp_CompareAPIAAPNo
 

SELECT  * into tmp_CompareAPIAAPNo from (
		SELECT p2.AccountNo as APIAccountNo,p2.AccountName,p1.AAPAccountNo as PM_AAP,p2.ASWAAPMemNo as ASW_AAP from pharmacymaster..pm_Pharmacy  p1 
	join 
	(
		SELECT * from pmbackups..tmp_APIAccountMaster_Orig where accountno is not null
	) p2

	ON p1.apiaccountno = p2.accountno
		WHERE   p1.aapaccountno != replace(p2.aswaapmemno,'T','')  or  (p2.aswaapmemno is null and  (p1.aapaccountno is not null and p1.aapaccountno != ''))

)tmp
END








GO
