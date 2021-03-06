USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[SurveyCredentialing2015Rpt]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Ngo
-- Create date: 4/16/2015
-- Description:	SurveyCredentialing2015Rpt
-- =============================================
CREATE PROCEDURE [dbo].[SurveyCredentialing2015Rpt]
	-- Add the parameters for the stored procedure here
	@StatusId INT,
	@Opt NVARCHAR(MAX) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here

IF @StatusId = 1 BEGIN
	SELECT  PharmacyMaster.dbo.v_test.PMID as McPmid, Accountname, NCPDP,  phone, PharmacyMaster.dbo.v_test.fax, email,
	PharmacyMaster.dbo.v_test.territory, firstname+' '+lastname as TMname, cell, 'Complete' as status
	from PharmacyMaster.dbo.v_test left join
	PharmacyMaster.dbo.pm_territory on PharmacyMaster.dbo.v_test.territory = PharmacyMaster.dbo.pm_territory.territory
	where PharmacyMaster.dbo.v_test.isMCorNPP=1 and PharmacyMaster.dbo.v_test.pmid 
	  in (select distinct SurveyAnswer.PMId
	FROM         						SurveyQuestion LEFT OUTER JOIN  
						  SurveyOption ON SurveyQuestion.Id = SurveyOption.QuestionId LEFT OUTER JOIN
						  SurveyAnswer ON SurveyOption.Id = SurveyAnswer.OptionId 
	WHERE     (SurveyQuestion.SurveyId IN ( 25)) AND (SurveyQuestion.IsActive = 1) AND (SurveyOption.IsActive = 1) 
	AND                       (SurveyAnswer.IsSubmitted =1))
END

IF @StatusId = 2 OR @StatusId = 3 BEGIN
	SELECT  PharmacyMaster.dbo.v_test.PMID as McPmid, Accountname, NCPDP,  phone,PharmacyMaster.dbo.v_test.fax, email,
	PharmacyMaster.dbo.v_test.territory, firstname+' '+lastname as TMname, cell, 'InProgress' as status
	from PharmacyMaster.dbo.v_test left join
	PharmacyMaster.dbo.pm_territory on PharmacyMaster.dbo.v_test.territory = PharmacyMaster.dbo.pm_territory.territory
	where PharmacyMaster.dbo.v_test.isMCorNPP=1 and PharmacyMaster.dbo.v_test.pmid 
	  in (select distinct SurveyAnswer.PMId
	FROM         						SurveyQuestion LEFT OUTER JOIN  
						  SurveyOption ON SurveyQuestion.Id = SurveyOption.QuestionId LEFT OUTER JOIN
						  SurveyAnswer ON SurveyOption.Id = SurveyAnswer.OptionId 
	WHERE     (SurveyQuestion.SurveyId IN ( 25)) AND (SurveyQuestion.IsActive = 1) AND (SurveyOption.IsActive = 1) 
	AND                       (SurveyAnswer.IsSubmitted =0))
END

IF @StatusId = 2 OR @StatusId = 4 BEGIN
	SELECT  PharmacyMaster.dbo.v_test.PMID as McPmid, Accountname, NCPDP,  phone,PharmacyMaster.dbo.v_test.fax, email,
	PharmacyMaster.dbo.v_test.territory, firstname+' '+lastname as TMname, cell, 'Not started' as status
	from PharmacyMaster.dbo.v_test left join
	PharmacyMaster.dbo.pm_territory on PharmacyMaster.dbo.v_test.territory = PharmacyMaster.dbo.pm_territory.territory
	where PharmacyMaster.dbo.v_test.isMCorNPP=1 and PharmacyMaster.dbo.v_test.pmid 
	not in (select distinct SurveyAnswer.PMId
	FROM         						SurveyQuestion LEFT OUTER JOIN  
						  SurveyOption ON SurveyQuestion.Id = SurveyOption.QuestionId LEFT OUTER JOIN
						  SurveyAnswer ON SurveyOption.Id = SurveyAnswer.OptionId 
	WHERE     (SurveyQuestion.SurveyId IN ( 25)) AND (SurveyQuestion.IsActive = 1) AND (SurveyOption.IsActive = 1) 
	AND                     (  (SurveyAnswer.IsSubmitted =0)OR(SurveyAnswer.IsSubmitted =1))
	)

END




/****
-- SELECT * FROM dbo.SurveyAnswer
-- SELECT top 20 * FROM PharmacyMaster.dbo.v_PM_AllWithAffiliates a

GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[SurveyCredentialing2015Rpt]
			@statusId = 10,
			@PMId =104339,
			@Login = 'itdev3',
			@Options = ''

SELECT	'Return Value' = @return_value

*/
END

GO
