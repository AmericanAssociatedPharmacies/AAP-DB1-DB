USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_populate_ConferenceRebates]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <05/24/2011>
-- Description:	Populate Rebate from  Import
-- =============================================
CREATE PROCEDURE [dbo].[sppm_populate_ConferenceRebates]
(@in_date varchar(10))
 

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--Make sure API Account No is 8 characters
	UPDATE Reports.dbo.import_ConferenceRebates
	SET APIAccountNo = replicate('0', 8 - len(APIAccountNo)) + APIAccountNo
	WHERE Date = @in_date
  
   --FIRST update  import table with PMID using   supplied apiaccountno
   UPDATE  s  set 
		pmid = p.pmid  
			FROM reports..import_ConferenceRebates   s 
		join
		(
			SELECT pmid,apiaccountno from pharmacymaster..pm_pharmacy 
		) p
		on s.apiaccountno = p.apiaccountno where 
			s.apiaccountno  is not null and s.pmid is null
  --Backup up the Conference Rebate table
    IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'PM_Rebates_Conference_BKP')
          DROP TABLE PM_Rebates_Conference_BKP
 

	SELECT * into PM_Rebates_Conference_BKP from PharmacyMaster..PM_Rebates_Conference 

	INSERT INTO PharmacyMaster..PM_Rebates_Conference ( date,
	rebate_type,
	PMID,
	accountname,
	Volume,
	Rebate
	)  

	SELECT Date,'Conference',
	PMID,
	AccountName,
	Volume,
	Rebate from reports..import_ConferenceRebates where date = @in_date

END











GO
