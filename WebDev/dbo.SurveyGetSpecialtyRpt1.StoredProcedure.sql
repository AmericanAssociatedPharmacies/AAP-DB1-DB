USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[SurveyGetSpecialtyRpt1]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Deepa
-- Create date: 6/22/2015
-- Description:	SurveyGetSpecialtyRpt
-- =============================================
CREATE PROCEDURE [dbo].[SurveyGetSpecialtyRpt1]
	-- Add the parameters for the stored procedure here
	@SurveyId INT,
	@PMId INT, 
	@Login NVARCHAR(50), 
    @Options NVARCHAR(MAX) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
-- Specialty ProgramID = 183

SELECT DISTINCT 
	CASE WHEN EXISTS(SELECT * FROM PharmacyMaster.dbo.PM_ProgramStepMember o WHERE o.PMID = i.pmid AND o.ProgramID = 183 AND o.ProgramStepID = 1) THEN 'Yes' ELSE 'No' END IsEnrolled,
	CASE WHEN EXISTS(SELECT * FROM PharmacyMaster.dbo.PM_ProgramStepMember o WHERE o.PMID = i.pmid AND o.ProgramID = 183 AND o.ProgramStepID = 2 OR o.ProgramStepID = 3 ) THEN 'Yes' ELSE 'No' END isCompletedTraining,
	(SELECT TOP 1 o.StartDate FROM PharmacyMaster.dbo.PM_ProgramStepMember o WHERE o.PMID = i.pmid AND o.ProgramID = 183 AND o.ProgramStepID = 2 ORDER BY o.StartDate DESC) CompletedTrainingDate,
	(SELECT TOP 1 o.AnswerInput  FROM dbo.SurveyAnswer o WHERE o.PMId = a.pmid AND o.OptionID = 188 ORDER BY o.Id DESC) StoreRequestDate,
	CASE WHEN EXISTS(SELECT * FROM PharmacyMaster.dbo.PM_MemberPrograms o WHERE o.PMID = i.pmid AND o.ProgramID = 183) THEN 'Yes' ELSE 'No' END isActiveParticipant,
   (SELECT TOP 1 CONVERT(VARCHAR(10), o.StartDate, 101) FROM PharmacyMaster.dbo.PM_MemberPrograms o WHERE o.ProgramID = 183 AND o.PMID = a.PMID) LiveDate,
--	CASE WHEN EXISTS(SELECT * FROM PharmacyMaster.dbo.PM_ProgramStepMember o WHERE o.PMID = i.pmid AND o.ProgramID = 183 AND o.ProgramStepID = 4 ) THEN 'Yes' ELSE 'No' END isActiveParticipant,
-- (SELECT TOP 1 AnswerInput FROM dbo.SurveyAnswer WHERE (OptionID = 188 OR OptionID = 245) AND PMID = a.PMID ORDER BY OptionID, ID DESC ) LiveDate,
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
	LEFT JOIN PharmacyMaster.dbo.PM_ProgramStepMember i ON a.pmid = i.pmid
WHERE i.ProgramID = 183 -- AND a.pmid <> 104339 -- test pmid = 104339 is actually an active participant step 4 in rx30 and 
ORDER BY isCompletedTraining


/****
-- SELECT * FROM dbo.SurveyAnswer
-- SELECT top 20 * FROM PharmacyMaster.dbo.v_PM_AllWithAffiliates a
USE [WebDev]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[SurveyGetSpecialtyRpt1]
			@SurveyId = 10,
			@PMId =104339,
			@Login = 'dgaikwad',
			@Options = ''

SELECT	'Return Value' = @return_value

SELECT * FROM PharmacyMaster..PM_ProgramStep  WHERE  ProgramID = 183
SELECT Top 1 * FROM PharmacyMaster..PM_ProgramStepMember  WHERE  ProgramID = 183 AND ProgramStepID = 3

*/
END

GO
