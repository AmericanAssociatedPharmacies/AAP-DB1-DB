USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[SurveyRemoveSurveyData]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Ngo
-- Create date: 8/27/2014
-- Description:	SurveyRemoveSurveyData
-- =============================================
CREATE PROCEDURE [dbo].[SurveyRemoveSurveyData]
	-- Add the parameters for the stored procedure here
	@SurveyId INT,
	@SurveyEntityId INT,  -- pmid for now
--	@SurveyEntityName NVARCHAR(50), -- PMId get this field from table survey.AppleToEntity
	@participatorlogin NVARCHAR(50),
	@IsSubmitted BIT = 0, -- live and submitted data is not suppose to clean unless this @IsSubmitted is true
    @CollectionId INT = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF @SurveyId = 25 AND @IsSubmitted = 1 BEGIN

		DELETE r
		FROM dbo.SurveyOwnerRelationship r 
		WHERE  (r.IsSubmitted = 0 OR @IsSubmitted = 1) 
				AND r.SurveyControlEntityId IN (SELECT e.ID FROM dbo.SurveyControlEntity e WHERE e.PMID IN(@SurveyEntityId));

		DELETE o
		FROM dbo.SurveyOwnership o 
		WHERE  (o.IsSubmitted = 0 OR @IsSubmitted = 1) 
				AND o.SurveyControlEntityId IN (SELECT e.ID FROM dbo.SurveyControlEntity e WHERE e.PMID IN(@SurveyEntityId));

		DELETE c
		FROM dbo.SurveyControlEntityCert c 
		WHERE  (c.IsSubmitted = 0 OR @IsSubmitted = 1) 
				AND c.ControlEntityId IN (SELECT e.ID FROM dbo.SurveyControlEntity e WHERE e.PMID IN(@SurveyEntityId)) ;

		DELETE e
		FROM dbo.SurveyControlEntity e 
		WHERE (e.IsSubmitted = 0 OR @IsSubmitted = 1) 
				AND e.PMID IN(@SurveyEntityId) ;

		DELETE a
		FROM dbo.SurveyAnswer a INNER JOIN dbo.surveyoption o ON a.OptionId = o.Id
			INNER JOIN dbo.surveyquestion q ON o.QuestionID = q.Id
		WHERE q.SurveyId IN (17,23,24,25,26,27,28,31,32,33) 
				AND a.PMID IN(@SurveyEntityId)
				AND a.ParticipatorLogin = @participatorlogin
				AND (a.IsSubmitted = 0 OR @IsSubmitted = 1);

	END ELSE BEGIN
		DELETE FROM dbo.SurveyAnswer
		WHERE	OptionId IN (SELECT DISTINCT op.Id FROM dbo.SurveyQuestion q INNER JOIN dbo.SurveyOption op ON q.SurveyId = @SurveyId AND q.Id = op.QuestionId) 
				AND ParticipatorLogin = @participatorlogin 
				AND PMId = @SurveyEntityId
				AND (IsSubmitted = 0 OR @IsSubmitted = 1)
				AND CollectionId = @CollectionId

		SELECT @@ERROR errors, 1 [status]
	END
/****
-- SELECT * FROM dbo.SurveyAnswer
GO

GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[SurveyRemoveSurveyData]
		@SurveyId = 1, 
		@SurveyEntityId = 100000, -- PMID
		@participatorlogin = 'itdev3',
		@IsSubmitted = 0

SELECT	'Return Value' = @return_value

GO
*/
END

GO
