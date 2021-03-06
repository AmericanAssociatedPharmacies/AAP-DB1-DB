USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[SurveyGetScopeNameAnswer]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Ngo
-- Create date: 3/30/2015
-- Description:	SurveyGetScopeNameAnswer
-- =============================================
CREATE PROCEDURE [dbo].[SurveyGetScopeNameAnswer]
	-- Add the parameters for the stored procedure here
	@SurveyId INT, 
	@PMId INT = NULL,
    @CollectionId INT = 0,
    @Option NVARCHAR(200)= NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
    
   SELECT DISTINCT o.ScopeName , [dbo].[fnSurveyGetAnswerByQuestion](q.Id,@PMId,@SurveyId,@CollectionId,@Option) AnswerInput -- dbo.fnSurveyGetAnswer(NULL,@PMId,NULL,@SurveyId,q.Id,@CollectionId) AnswerInput
	FROM dbo.SurveyOption o 
			INNER JOIN dbo.SurveyQuestion q ON o.QuestionId = q.Id 		
	WHERE SurveyId = @SurveyId AND q.IsActive = 1 AND o.IsActive = 1 

/****

GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[SurveyGetScopeNameAnswer]
		@SurveyId = 17, @PMID = 104339, @CollectionId = 110

SELECT	'Return Value' = @return_value

dbo.fnSurveyGetAnswer(o.Id,@PMId,NULL,@SurveyId, q.Id, @CollectionId)

SELECT dbo.fnSurveyGetAnswer(423,104339,NULL,17, 260, 1)


GO
*/
END
GO
