USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[SurveyGetStatus]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Ngo
-- Create date: 9/10/2014
-- Description:	SurveyGetStatus
-- =============================================
CREATE PROCEDURE [dbo].[SurveyGetStatus]
	-- Add the parameters for the stored procedure here
	@SurveyId INT,
	@PMId INT, 
	@Login NVARCHAR(50), 
	@Option NVARCHAR(500) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	
	IF (@Option = '') SET @Option = NULL;
	
	DECLARE @GoliveDate NVARCHAR(12), @IsSubmitted BIT, @StatusMsg NVARCHAR(MAX), @IsSurvey10Submitted BIT, @IsPublished BIT
  
	DECLARE @StatusId INT   -- 1. Yes, Can taking survey now
							-- 2. Survey Submitted, 
							-- 3. Not Time Expired
							-- 4. not time yet msg will be display - Not Published Yet -- any other constrains that limit from survey to display or create now
							-- 5. go to page with @StatusMsg = url
							-- 6. BizCondition is not meet to taking survey and display msg @StatusMsg = 'You are not able to take this survey, please do....'
--- check status 

	SELECT @IsPublished = Published FROM dbo.Survey WHERE Id = @SurveyId;  

	-- if published is false then IsSubmitted will always be true
	SELECT @IsSubmitted = CAST((CASE WHEN COUNT(*) > 1 OR @IsPublished = 0 THEN 1 ELSE 0 END) AS BIT)
	FROM dbo.SurveyAnswer a 
	WHERE a.IsSubmitted = 1 
		AND a.PMId = @PMId 
		AND a.OptionId IN (SELECT DISTINCT op.Id FROM dbo.SurveyQuestion q INNER JOIN dbo.SurveyOption op ON q.SurveyId = @SurveyId AND q.Id = op.QuestionId AND q.IsActive = 1)



SET @IsSurvey10Submitted = 0;

IF ( @IsSubmitted = 1 AND (@SurveyId = 4  OR @SurveyId = 10) ) BEGIN

	SET @GoliveDate = (SELECT TOP 1 ISNULL(AnswerInput,'') FROM dbo.SurveyAnswer WHERE OptionID = 188 AND PMID = @PMId ORDER BY ID DESC )

	SELECT @IsSurvey10Submitted = CAST((CASE WHEN COUNT(*) > 1 THEN 1 ELSE 0 END) AS BIT)
	FROM dbo.SurveyAnswer a 
	WHERE a.IsSubmitted = 1 
		AND a.PMId = @PMId 
		AND a.OptionId IN (SELECT DISTINCT op.Id FROM dbo.SurveyQuestion q INNER JOIN dbo.SurveyOption op ON q.SurveyId = 10 AND q.Id = op.QuestionId AND q.IsActive = 1)	
END

-- option to view recredentialing report
IF ( @SurveyId = 3 AND  @Option LIKE '%Rpt%' ) SET @IsSubmitted = 0;

DECLARE @HIPAATrainingStatus INT, @FWATrainingStatus INT
-- Attestation or Recredentialing 2014
IF ( @SurveyId = 2 OR @SurveyId = 3 OR @SurveyId = 39 ) BEGIN
	
	SET @HIPAATrainingStatus = 1;
	
	--SELECT TOP 1 @HIPAATrainingStatus = ISNULL(HIPAATrainingStatus,0), @FWATrainingStatus = ISNULL(FWATrainingStatus,0)
	-- select *, pmid
	--FROM dbo.v_CA_StoreStatus s
	-- WHERE s.pmid = @PMId

END

-- set status id and status msg
-- SELECT @IsSubmitted, @SurveyId, @IsSurvey10Submitted

	SELECT @StatusId = (CASE WHEN @SurveyId = 23 OR @SurveyId = 24 OR @SurveyId = 17 OR @SurveyId = 26 OR @SurveyId = 27 OR @SurveyId = 28
									OR @SurveyId = 31 OR @SurveyId = 32 OR @SurveyId = 33 THEN 0 -- Item Collection Add or Update
							 WHEN @SurveyId = 3 AND  @Option LIKE '%Rpt%' THEN 0 -- view recredentialing report
							 WHEN ( @SurveyId = 2 OR @SurveyId = 3 OR @SurveyId = 39 ) AND  @IsSurvey10Submitted = 0 AND (@HIPAATrainingStatus = 0 OR @FWATrainingStatus = 0 ) THEN 6
							 -- WHEN @SurveyId = 2 THEN @IsSubmitted
							 WHEN @IsPublished = 0	THEN 4
							 WHEN @IsSubmitted = 1 AND @SurveyId = 4 AND @IsSurvey10Submitted = 0 THEN 5
							 WHEN @IsSubmitted = 1 THEN 1 ELSE 0 END)

			,@StatusMsg = ( CASE WHEN @SurveyId = 23 OR @SurveyId = 24 OR @SurveyId = 17 OR @SurveyId = 26 OR @SurveyId = 27 OR @SurveyId = 28  
												OR @SurveyId = 31 OR @SurveyId = 32 OR @SurveyId = 33 THEN '' -- Item Collection Add or Update
								 WHEN @SurveyId = 3 AND  @Option LIKE '%Rpt%' THEN '' -- view recredentailing report
								 WHEN @IsPublished = 0 AND @SurveyId = 15 THEN 'This form will be enter and update by Linda.Jensen@rxaap.com.' -- view recredentailing report
								 WHEN @IsPublished = 0 THEN 'This form is not published yet.' -- view recredentailing report
								 WHEN ( @SurveyId = 2 OR @SurveyId = 39) AND  @IsSurvey10Submitted = 0 AND (@HIPAATrainingStatus = 0 OR @FWATrainingStatus = 0 ) THEN 'Not all employees completed the HIPAA and FWA training.  Please makesure all your employee complete the training(s) before you can complete attestation.'
								 WHEN ( @SurveyId = 3 ) AND  @IsSurvey10Submitted = 0 AND (@HIPAATrainingStatus = 0 OR @FWATrainingStatus = 0 ) THEN 'Not all employees completed the HIPAA and FWA training.  Please makesure all your employee complete the training(s) before you can complete re-credentialing.'
								 WHEN @IsSubmitted = 1 AND ( (@SurveyId = 4 AND @IsSurvey10Submitted = 1) OR @SurveyId = 10 ) THEN 'This pharmacy has completed the AAP Specialty Pharmacy training and requests the go-live date on ' + CONVERT(VARCHAR(10), ISNULL(@GoliveDate,''), 101) + '. Please process them and confirm when they are operational.'
								 --WHEN @IsSubmitted = 1 AND @SurveyId = 4 AND @IsSurvey10Submitted = 0 THEN '/survey/surveyweb/#/viewSurvey10?surveyid=10&login=' + @Login + '&pmid=' + CAST(@PMId AS NVARCHAR(15))
								 WHEN @IsSubmitted = 1 AND @SurveyId = 4 AND @IsSurvey10Submitted = 0 THEN '#/viewSurvey10?surveyid=10&login=' + @Login + '&pmid=' + CAST(@PMId AS NVARCHAR(15))
								 WHEN @IsSubmitted = 1 AND @SurveyId = 9 THEN 'Your enrollment has been completed.' 
								 WHEN @IsSubmitted = 1 AND @SurveyId = 15 THEN 'This pharmacy (pmid: ' + CAST(@PMId as NVARCHAR(20)) + ') is already a Specialty Pharmacy participant' 
								 WHEN @IsSubmitted = 1 AND @SurveyId = 25 THEN 'Your pharmacy has completed the online Credentialing 2015. Please mail required documentation. If you would like to review please wait until loading complete.' 
								 WHEN @IsSubmitted = 1 THEN 'Your submission has been received.' 
								 -- ELSE '' + CAST(@IsSubmitted AS NVARCHAR(15)) + CAST(@SurveyId AS NVARCHAR(15)) + CAST(@IsSurvey10Submitted AS NVARCHAR(15)) END);
								 ELSE '' END);

	SELECT @IsSubmitted IsSubmitted, @StatusId StatusId, @StatusMsg StatusMsg, @@Error Errors
/****
-- SELECT * FROM dbo.SurveyAnswer

GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[SurveyGetStatus]
			@SurveyId = 10,
			@PMId =104339,
			@Login = 'itdev3'

SELECT	'Return Value' = @return_value

SELECT Top 1 * FROM PharmacyMaster..PM_ProgramStepMember  WHERE  ProgramID = 183 AND ProgramStepID = 3

*/
END
GO
