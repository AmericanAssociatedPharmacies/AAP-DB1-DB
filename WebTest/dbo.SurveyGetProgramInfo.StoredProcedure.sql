USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[SurveyGetProgramInfo]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Ngo
-- Create date: 10/16/2014
-- Description:	SurveyGetProgramInfo
-- =============================================
CREATE PROCEDURE [dbo].[SurveyGetProgramInfo]
	@SurveyId INT, 
	@PMID NVARCHAR(15),
	@ProgramID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
--	CREATE TABLE #tmp ( [name] NVARCHAR(500), [value] NVARCHAR(MAX) )

--IF @SurveyID = 11 BEGIN
--	INSERT INTO #tmp SELECT 'pharmacyname', 'testing pharmacy';
--	INSERT INTO #tmp SELECT 'participatedate', '12/12/12';
--	INSERT INTO #tmp SELECT 'ud_president', 'Rob McMahan';
--END

	SELECT COALESCE(o.scopename,q.Name, q.Title) [name], a.AnswerInput [value]	
	FROM dbo.SurveyQuestion q 
			INNER JOIN dbo.SurveyOption o on q.id = o.QuestionId
			LEFT JOIN dbo.SurveyAnswer a on o.id = a.OptionId
	WHERE  q.SurveyId = @SurveyId AND a.pmid = @PMID

    

/*
DECLARE	@return_value int

EXEC	@return_value = [dbo].[SurveyGetProgramInfo]
		@SurveyId = 11, @PMID = 104339, @ProgramID = 183

SELECT	'Return Value' = @return_value


GO
*/
END
GO
