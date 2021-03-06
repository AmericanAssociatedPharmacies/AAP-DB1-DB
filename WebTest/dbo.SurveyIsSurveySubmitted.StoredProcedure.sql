USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[SurveyIsSurveySubmitted]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Ngo
-- Create date: 8/27/2014
-- Description:	SurveyIsSurveySubmitted
-- =============================================
CREATE PROCEDURE [dbo].[SurveyIsSurveySubmitted]
	-- Add the parameters for the stored procedure here
	@SurveyId INT,
	@PMId INT, 
    @CollectionId INT = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	DECLARE @IsSubmitted BIT
	
	SELECT @IsSubmitted = CAST((CASE WHEN COUNT(*) > 1 THEN 1 ELSE 0 END) AS BIT) 
	FROM dbo.SurveyAnswer a 
	WHERE a.IsSubmitted = 1 
		AND a.PMId = @PMId 
		AND a.OptionId IN (SELECT DISTINCT op.Id FROM dbo.SurveyQuestion q INNER JOIN dbo.SurveyOption op ON q.SurveyId = @SurveyId AND q.Id = op.QuestionId AND q.IsActive = 1)
	    AND CollectionId = @CollectionId

	SELECT @IsSubmitted Result, @@Error Errors
/****
-- SELECT * FROM dbo.SurveyAnswer
USE [SweetSurvey]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[SurveyIsSurveySubmitted]
			@SurveyId = 138,
			@PMId =100000

SELECT	'Return Value' = @return_value
*/
END

GO
