USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[SurveyEnableCredentialing]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Deepa
-- Create date: 4/19/2016
-- Description:	Open survey application for Credentialing 2015 on website for the pharmacy
-- =============================================
CREATE PROCEDURE [dbo].[SurveyEnableCredentialing] 
	
	@PMID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	update SurveyAnswer
	set issubmitted=0
	where id in (select a.id
	FROM dbo.SurveyAnswer a INNER JOIN dbo.surveyoption o ON a.OptionId = o.Id
		INNER JOIN dbo.surveyquestion q ON o.QuestionID = q.Id
	WHERE q.SurveyId IN (17,23,24,25,26,27,28,31,32,33) AND PMID in (@PMID))

END
GO
