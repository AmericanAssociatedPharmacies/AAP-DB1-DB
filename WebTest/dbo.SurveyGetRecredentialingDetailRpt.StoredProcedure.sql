USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[SurveyGetRecredentialingDetailRpt]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Ngo
-- Create date: 11/13/2014
-- Description:	SurveyGetRecredentialingDetailRpt
-- =============================================
CREATE PROCEDURE [dbo].[SurveyGetRecredentialingDetailRpt]
	-- Add the parameters for the stored procedure here
	@PMIds NVARCHAR(MAX),
	@Options NVARCHAR(MAX) = '' -- options is the sql that will give out distinct pmids
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


--IF (@Options IS NOT NULL AND @Options <> '') BEGIN
	-- create tmp table
	--EXEC sp_executesql 'INSERT INTO tmpRecredenDetail ' @Options;
--	EXEC sp_executesql 'INSERT INTO tmpRecredenDetail SELECT DISTINCT PMId FROM dbo.surveyanswer WHERE (OptionId = 42 AND AnswerInput like ''%42%'') OR (OptionId = 44 AND AnswerInput like ''%44%'') OR (OptionId = 46 AND AnswerInput like ''%46%'') OR (OptionId = 108 AND AnswerInput like ''%108%'')'
--END 

--IF ( tmpRecredenDetail 

	SELECT DISTINCT
		a.PMID, 
		a.NCPDP,
		a.NPI,
		-- a.Status,
		--'' Rx30Status, 
		a.AccountName,
		a.ContactFullName,
		a.Email,
		a.Addr1,
		a.Addr2,
		a.City,
		a.State,
		a.Zip,
		a.Phone,
		a.Fax
	FROM PharmacyMaster.dbo.v_PM_AllWithAffiliates a
	WHERE a.PMID IN (SELECT DISTINCT IdInt FROM dbo.SplitInToTable (@PMIds, ',') WHERE IdInt <> 0 )
--		OR a.PMID IN (SELECT DISTINCT PMID FROM tmpRecredenDetail )

	-- ORDER BY isCompletedTraining


/****
-- SELECT * FROM dbo.SurveyAnswer
-- SELECT top 20 * FROM PharmacyMaster.dbo.v_PM_AllWithAffiliates a

GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[SurveyGetRecredentialingDetailRpt]
			@PMIds = '104339,',
			@Options = ''

SELECT	'Return Value' = @return_value

SELECT * FROM PharmacyMaster..PM_ProgramStep  WHERE  ProgramID = 183
SELECT Top 1 * FROM PharmacyMaster..PM_ProgramStepMember  WHERE  ProgramID = 183 AND ProgramStepID = 3

*/
END

GO
