USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_list_PM_CHAccounts]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Call Controlled Substance report
-- =============================================
CREATE PROCEDURE [dbo].[sppm_list_PM_CHAccounts]
  

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--SELECT PMID,DEA,Status,CHAccountNoPrimary,CHAccountNo2,CHAccountNo3,POSAcct,ScanTossAcct,CSOSAcct,
	--		SecondPrimaryNumber,Second2nd,Second3rd,SecondPOS,SecondCSOS,SecondCST,ThirdPrimaryNumber,Third2nd,ThirdPOS,ThirdCSOS,ThirdCST,Notes 
	--		from pharmacymaster..pm_chaccounts_adj

	--Edited by LA 12/28/2017
	--2nd and 3rd data is no longer received from Cardinal
	SELECT PMID,DEA,Status,CHAccountNoPrimary,CHAccountNo2,CHAccountNo3,POSAcct,ScanTossAcct,CSOSAcct
			from pharmacymaster..pm_chaccounts_adj
END











GO
