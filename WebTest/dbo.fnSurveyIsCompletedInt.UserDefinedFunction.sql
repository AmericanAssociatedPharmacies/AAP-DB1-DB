USE [WebTest]
GO
/****** Object:  UserDefinedFunction [dbo].[fnSurveyIsCompletedInt]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnSurveyIsCompletedInt]
(
	@SurveyId INT,
	@PMId INT, 
	@Login NVARCHAR(50)--,
    --,@CollectionId INT = 0 add this parameter cause ComplianceGuardian Crashed be careful
)
RETURNS INT
WITH EXECUTE AS CALLER
AS
BEGIN
DECLARE @IsSubmitted INT
	
	SELECT @IsSubmitted = 
					CASE WHEN EXISTS(
						SELECT DISTINCT PMID 
						-- SELECT *
						FROM dbo.surveyanswer 
						WHERE pmid = @PMId and IsSubmitted = 1 AND -- CollectionId = @CollectionId AND
							optionid in (select so.id from dbo.surveyoption so where so.questionid in (select DISTINCT sq.id from dbo.surveyquestion sq where sq.surveyid = @SurveyId))	
					) THEN 1 ELSE 0 END;
	-- IF ( @IsSubmitted = 0 AND @SurveyId = 9 ) -- look into PharmacyMaster..ProgramMemberStep
RETURN(@IsSubmitted)
END;
-- usage:
-- select [dbo].[fnSurveyIsCompletedInt](3,104339333,'')
GO
