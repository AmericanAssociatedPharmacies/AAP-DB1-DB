USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[SurveyUpdateCollectionIdInAnswer]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Ngo
-- Create date: 8/27/2014
-- Description:	SurveyUpdateCollectionIdInAnswer
-- =============================================
CREATE PROCEDURE [dbo].[SurveyUpdateCollectionIdInAnswer]
	-- Add the parameters for the stored procedure here
    @CollectionId INT, -- collectionid must > 0
	@SurveyId INT,
	@SurveyEntityId INT,  -- pmid for now
--	@SurveyEntityName NVARCHAR(50), -- PMId get this field from table survey.AppleToEntity
	@participatorlogin NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	UPDATE dbo.SurveyAnswer SET CollectionId = @CollectionId
	WHERE	OptionId IN (SELECT DISTINCT op.Id FROM dbo.SurveyQuestion q INNER JOIN dbo.SurveyOption op ON q.SurveyId = @SurveyId AND q.Id = op.QuestionId) 
			AND ParticipatorLogin = @participatorlogin 
			AND PMId = @SurveyEntityId
			AND (CollectionId = 0 OR CollectionId IS NULL)

	SELECT @@ERROR errors, 1 [status]
/****
-- SELECT * FROM dbo.SurveyAnswer

GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[SurveyUpdateCollectionIdInAnswer]
		@SurveyId = 1, 
		@SurveyEntityId = 100000, -- PMID
		@participatorlogin = 'itdev3',
		@IsSubmitted = 0

SELECT	'Return Value' = @return_value

GO
*/
END

GO
