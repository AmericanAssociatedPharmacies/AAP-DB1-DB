USE [WebDev]
GO
/****** Object:  UserDefinedFunction [dbo].[fnSurveyGetIsSelect]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnSurveyGetIsSelect]
(
	@OptionId INT,
	@PMId INT, 
	--@ScopeName NVARCHAR(500), 
	@Opt NVARCHAR(50) = '',  -- withDefault '' load from other table, '1' load from answer only
	@SurveyId INT = 0,
	@QuestionId INT = 0,
    @CollectionId INT = 0
)
RETURNS BIT
WITH EXECUTE AS CALLER
AS
BEGIN

DECLARE @isSelect BIT, @surveyOpId INT -- , @ScopeName NVARCHAR(500), @DefaultValue NVARCHAR(500), @OptionHtml NVARCHAR(500)

SELECT TOP 1 @surveyOpId = o.Id -- , @OptionHtml = o.Html 
	FROM dbo.SurveyOption o INNER JOIN dbo.SurveyAnswer a ON o.Id = a.OptionId 
	WHERE o.QuestionId = @QuestionId AND o.IsActive = 1 AND a.CollectionId = @CollectionId AND a.PMId = @PMId
	ORDER BY DateTimeEnter DESC

SELECT @isSelect = CAST((CASE WHEN @surveyOpId = @OptionId THEN 1 ELSE 0 END) AS BIT)
--	SELECT @isSelect =( SELECT TOP 1 (CASE WHEN COUNT(*) > 0 THEN 1 ELSE 0 END)
--							-- SELECT *
--							FROM dbo.surveyanswer 
--							WHERE pmid = @PMId AND OptionId = @OptionId AND CollectionId = @CollectionId
--						),
--			@ScopeName = ( SELECT TOP 1 ScopeName
--							-- SELECT *
--							FROM dbo.SurveyOption 
--							WHERE Id = @OptionId
--						);
--
--IF (@isSelect = 0 AND (@ScopeName IS NOT NULL OR @ScopeName <> '') AND @SurveyId = 17 AND @CollectionId > 0 AND @Opt <> '1') BEGIN 
--	SELECT @isSelect =(CASE 
--						WHEN @ScopeName = 'CriminalOffense' THEN c.CriminalOffense
--						WHEN @ScopeName = 'HasOwnershipWithOtherStore' THEN c.HasOwnershipWithOtherStore
--						WHEN @ScopeName = 'HasRelationshipWithOtherOwner' THEN c.HasRelationshipWithOtherOwner
--						ELSE 0
--					END) 
--	FROM dbo.SurveyControlEntity c WHERE c.Id = @CollectionId
--END 
			
RETURN @isSelect
END;
-- usage:
-- dbo.[dbo].[fnSurveyGetDate] (2, 123123, '')
GO
