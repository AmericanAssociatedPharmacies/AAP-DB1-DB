USE [WebDev]
GO
/****** Object:  UserDefinedFunction [dbo].[fnSurveyGetDate]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnSurveyGetDate]
(
	@SurveyId INT,
	@PMId INT, 
	@Login NVARCHAR(50)
)
RETURNS DATETIME
WITH EXECUTE AS CALLER
AS
BEGIN
DECLARE @SurveyDate DATETIME

	SELECT @SurveyDate =( SELECT TOP 1 DateTimeEnter
							-- SELECT *
							FROM dbo.surveyanswer 
							WHERE pmid = @PMId and IsSubmitted = 1 and
								optionid in (select so.id from dbo.surveyoption so where so.questionid in (select DISTINCT sq.id from dbo.surveyquestion sq where sq.surveyid = @SurveyId))
							ORDER BY DateTimeEnter DESC	
						)
   
RETURN @SurveyDate
END;
-- usage:
-- dbo.[dbo].[fnSurveyGetDate] (2, 123123, '')
GO
