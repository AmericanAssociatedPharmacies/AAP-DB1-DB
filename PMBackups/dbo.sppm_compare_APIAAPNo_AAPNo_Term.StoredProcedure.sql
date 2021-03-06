USE [PMBackups]
GO
/****** Object:  StoredProcedure [dbo].[sppm_compare_APIAAPNo_AAPNo_Term]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <03/29/2010>
-- Description:	Backup and Truncate AddressMaster to recreate
-- =============================================
CREATE PROCEDURE [dbo].[sppm_compare_APIAAPNo_AAPNo_Term]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table


 

SELECT p1.PMID,p2.AccountNo as APIAccountNo,p2.AccountName,p1.AAPAccountNo as PM_AAP,p2.ASWAAPMemNo as ASW_AAP, AAPQuitdate from pharmacymaster..pm_Pharmacy  p1 
	join 
	(
		SELECT * from pmbackups..tmp_APIAccountMaster_Orig where accountno is not null
	) p2

	ON p1.apiaccountno = p2.accountno where (AAPQuitdate is not null or AAPQuitdate != '' ) and ( p2.ASWAAPMemNo not like '%T%' or p2.ASWAAPMemNo is null)
END








GO
