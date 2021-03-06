USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[SurveyIsNewValueEnteredForOption]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Ngo
-- Create date: 8/27/2014
-- Description:	SurveyIsNewValueEnteredForOption
-- =============================================
CREATE PROCEDURE [dbo].[SurveyIsNewValueEnteredForOption]
	-- Add the parameters for the stored procedure here
	@OpId INT,
	@PMId INT,
	@ParticipatorLogin NVARCHAR(50),
	@NewValue NVARCHAR(MAX),
	@CollectionId INT = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	DECLARE @curValue NVARCHAR(MAX), @opHtml NVARCHAR(50), @IsNewValue BIT, @curOpId INT, @QuestionId INT
	-- 1. questiontype checkbox, radio button, text, date?
	-- checkbox, text, date are opValue
	-- radio button need question and opId to detect last entered
	SELECT @curValue = RTRIM(LTRIM(a.AnswerInput)), 
		   @opHtml = (SELECT op.Html FROM dbo.SurveyOption op WHERE op.Id = @OpId),
		   @NewValue = RTRIM(LTRIM(@NewValue)), 
		   @QuestionId = (SELECT op.QuestionId FROM dbo.SurveyOption op WHERE op.Id = @OpId)
	FROM dbo.SurveyAnswer a 
	WHERE a.OptionId = @OpId AND a.PMId = @PMId AND a.ParticipatorLogin = @ParticipatorLogin AND CollectionId = @CollectionId;

	 -- SELECT @curValue curValue, @opHtml, @NewValue NewValue, @QuestionId questionId
	
	--SELECT CAST((CASE WHEN @curValue = @NewValue THEN 1 ELSE 0 END) AS BIT) Result, @@Error Errors
	IF ( @opHtml = 'radio'  ) BEGIN
		SELECT	@curOpId = a.OptionId, 
				@curValue = CAST(a.OptionId AS NVARCHAR(50))			 
			FROM dbo.SurveyOption op 
				INNER JOIN dbo.SurveyAnswer a 
					ON op.Id = a.OptionId AND op.QuestionId = @QuestionId AND op.Id = @OpId AND a.PMId = @PMId AND a.ParticipatorLogin = @ParticipatorLogin AND a.CollectionId = @CollectionId
		--SELECT @QuestionId QuestionId, @curOpId curOpId
		SELECT @IsNewValue = CAST((CASE WHEN @curOpId = @OpId THEN 0 ELSE 1 END) AS BIT)
	END ELSE BEGIN -- ( @opHtml = 'text' OR @opHtml = 'date' or @opHtml = 'checkbox' )
		SELECT @IsNewValue = CAST((CASE WHEN @curValue = @NewValue THEN 0 ELSE 1 END) AS BIT)
	END

	SELECT @IsNewValue Result, @curValue oldValue, @@Error Errors
/****
-- SELECT * FROM dbo.SurveyAnswer
USE [SweetSurvey]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[SurveyIsNewValueEnteredForOption]
			@OpId = 10,
			@NewValue = 'Yes'

SELECT	'Return Value' = @return_value

GO
*/
END

GO
