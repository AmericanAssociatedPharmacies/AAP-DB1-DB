USE [WebDev]
GO
/****** Object:  UserDefinedFunction [dbo].[fnSurveyGetFlagsStr]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnSurveyGetFlagsStr]
(
	@SurveyId INT,
	@PMId INT, 
	@Login NVARCHAR(50)
)
RETURNS NVARCHAR(MAX)
WITH EXECUTE AS CALLER
AS
BEGIN

DECLARE @FlagsStr NVARCHAR(MAX), @PMIDStr NVARCHAR(15)

SELECT @PMIDStr = CAST(@PMId AS NVARCHAR(15)), @FlagsStr = ''


--select @FlagsStr = @FlagsStr + (CAST(f.id AS NVARCHAR(15)) + f.flagname + f.optionids)
--from   dbo.SurveyFlag f cross apply
--       dbo.SplitInToTable(f.EntityIds,',') b
--where  b.IdInt= @PMId

--SELECT @FlagsStr = isnull(@FlagsStr , '') +Convert(varchar,a.Id)  +  a.FlagName + a.OptionIds
--FROM (SELECT FlagName , OptionIds, Id from SurveyFlag 
--		where surveyid=@SurveyId and EntityIds like '%'+ @PMIDStr +'%') a

SELECT @FlagsStr = isnull(@FlagsStr , '') + a.FlagName 
FROM (SELECT FlagName , OptionIds, Id from SurveyFlag 
		where surveyid=@SurveyId and EntityIds like '%'+ @PMIDStr +'%') a


RETURN(@FlagsStr)

/*

DECLARE 	@SurveyId INT, @PMId INT
SELECT @SurveyId = 2, @PMId = 106175

DECLARE @FlagsStr NVARCHAR(MAX), @PMIDStr NVARCHAR(15)

SELECT @PMIDStr = CAST(@PMId AS NVARCHAR(15)), @FlagsStr = ''


SELECT @FlagsStr = isnull(@FlagsStr , '') +Convert(varchar,a.Id)  +  a.FlagName 
FROM (SELECT FlagName , OptionIds, Id from SurveyFlag 
		where surveyid=@SurveyId and EntityIds like '%'+ @PMIDStr +'%') a

SELECT @FlagsStr
*/

END;
-- usage: SELECT [dbo].[fnSurveyGetFlagsStr](2, 111111, '')
GO
