USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_search_PM_CHAccountsNotes]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Call Controlled Substance report
-- =============================================
CREATE PROCEDURE [dbo].[sppm_search_PM_CHAccountsNotes]
 (@in_acct as varchar(50))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @SQL varchar(500);
	SET @SQL = ' SELECT PMID,Name,Notes  from PharmacyMaster..PM_CHAccounts_ADJ where notes like ''%' + @in_acct  + '%''';
    EXEC (@SQL);

END










GO
