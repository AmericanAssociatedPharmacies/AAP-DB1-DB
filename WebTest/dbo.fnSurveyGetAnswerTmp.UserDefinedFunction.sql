USE [WebTest]
GO
/****** Object:  UserDefinedFunction [dbo].[fnSurveyGetAnswerTmp]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[fnSurveyGetAnswerTmp]
(
	@OptionId INT,
	@PMId INT, 
	--@ScopeName NVARCHAR(500), 
	@Opt NVARCHAR(50) = '',  -- withDefault '' load from other table, '1' load from answer only
	@SurveyId INT = 0,
	@QuestionId INT = 0,
    @CollectionId INT = 0
)
RETURNS NVARCHAR(MAX)
WITH EXECUTE AS CALLER
AS
BEGIN

--DECLARE	@OptionId INT, @PMId INT, @Opt NVARCHAR(50) , @SurveyId INT ,@QuestionId INT ,@CollectionId INT 
--SELECT @OptionId = 589, @PMId = 104339, @Opt = NULL,@SurveyId = 17, @QuestionId = 283, @CollectionId = 73
    
DECLARE @answer NVARCHAR(MAX), @ScopeName NVARCHAR(500), @DefaultValue NVARCHAR(500), @OptionHtml NVARCHAR(500), @Text NVARCHAR(MAX), @Name NVARCHAR(MAX)

IF ( (@OptionId IS NULL OR @OptionId = 0) AND @QuestionId > 0 ) BEGIN
    --SELECT * FROM dbo.SurveyOption o INNER JOIN dbo.SurveyAnswer a ON o.Id = a.OptionId WHERE o.QuestionId = @QuestionId AND o.IsActive = 1 AND a.CollectionId = @CollectionId AND a.PMId = @PMId
	SELECT TOP 1 @OptionId = o.Id, @OptionHtml = o.Html, @Text = o.[Text], @Name = o.[Name]
		FROM dbo.SurveyOption o INNER JOIN dbo.SurveyAnswer a ON o.Id = a.OptionId 
			WHERE o.QuestionId = @QuestionId AND o.IsActive = 1 AND a.CollectionId = @CollectionId AND a.PMId = @PMId
		ORDER BY DateTimeEnter DESC
END ELSE BEGIN
	SELECT TOP 1 @OptionHtml = o.Html, @Text = o.[Text], @Name = o.[Name]
		FROM dbo.SurveyOption o --INNER JOIN dbo.SurveyAnswer a ON o.Id = a.OptionId 
			WHERE o.Id = @OptionId AND o.IsActive = 1 -- AND a.CollectionId = @CollectionId AND a.PMId = @PMId
    --ORDER BY DateTimeEnter DESC
END 
-- SELECT @OptionId, @OptionHtml, @Text, @Name

	-- SELECT @answer =( SELECT TOP 1 (CASE WHEN @OptionHtml = 'radio' THEN AnswerText ELSE AnswerInput END)
	SELECT 
--			@answer =( SELECT TOP 1 AnswerInput
--							FROM webdev..surveyanswer 
--							WHERE pmid = @PMId AND OptionId = @OptionId AND CollectionId = @CollectionId
--							ORDER BY DateTimeEnter DESC	
--						),
			@answer = (SELECT r.AnswerInput 
					  FROM (	SELECT AnswerInput,Id, --, pmid, OptionId, 
										Max(Id) OVER(PARTITION BY OptionId) AS MaxId
								FROM webdev..surveyanswer
								WHERE pmid = @PMId AND OptionId = @OptionId AND CollectionId = @CollectionId								
							) r WHERE r.Id = MaxId),
			@ScopeName = ( SELECT TOP 1 ScopeName
							-- SELECT *
							FROM webdev..SurveyOption 
							WHERE Id = @OptionId
						);
-- SELECT @answer,@ScopeName
IF (@answer IS NULL OR @answer = '') BEGIN

	IF @SurveyId = 11 BEGIN
		-- participatedate
		-- ud_president
		-- loadsqldata
		IF ( @ScopeName = 'participatedate' ) BEGIN
			SET @answer = (SELECT TOP 1 CONVERT(VARCHAR(10), StartDate, 101)  FROM PharmacyMaster..PM_ProgramStepMember WHERE ProgramID = 183 AND ProgramStepID = 4 AND @PMId = PMID )
		END

		IF (@ScopeName = 'ud_president' ) BEGIN
			SET @answer = (SELECT TOP 1 [Value] FROM dbo.SurveySetting WHERE [Name] = @ScopeName )
		END

		IF (@ScopeName = 'pharmacyname' ) BEGIN
			SET @answer = (SELECT TOP 1 AccountName FROM PharmacyMaster.dbo.v_PM_AllWithAffiliates WHERE PMID = @PMId	)
		END
	END


	IF ((@SurveyId = 17 OR @SurveyId = 26 OR @SurveyId = 31 OR @SurveyId = 32 OR @SurveyId = 33) 
		AND @CollectionId > 0 
		AND (@Opt IS NULL OR @Opt <> '1')
		) BEGIN
		SELECT @answer = (CASE WHEN @ScopeName LIKE 'ControlEntityTitle' THEN c.Title 
							WHEN @ScopeName LIKE 'Type' THEN c.Type
							WHEN @ScopeName LIKE 'LocationType' THEN c.LocationType
							WHEN @ScopeName LIKE 'npi' THEN c.npi
							WHEN @ScopeName LIKE 'Title' AND @Text Like c.Title THEN c.Title
							WHEN @ScopeName LIKE 'EffectiveDate' THEN CONVERT(VARCHAR(10), c.EffectiveDate, 101) 
							WHEN @ScopeName LIKE 'PercentOwnership' THEN CONVERT(VARCHAR, c.PercentOwnership)
							WHEN @ScopeName LIKE 'PharmacistLicense' THEN c.PharmacistLicense
							WHEN @ScopeName LIKE 'StateIssueLicense' THEN c.StateIssueLicense
							WHEN @ScopeName LIKE 'LicenseExpirationDate' THEN CONVERT(VARCHAR(10), c.LicenseExpirationDate, 101)
							WHEN @ScopeName LIKE 'Entity' THEN c.Entity
							WHEN @ScopeName LIKE 'DBA' THEN c.DBA
							WHEN @ScopeName LIKE 'FName' THEN c.FName
							WHEN @ScopeName LIKE 'MName' THEN c.MName
							WHEN @ScopeName LIKE 'LName' THEN c.LName
							WHEN @ScopeName LIKE 'SSN' THEN c.SSN
							WHEN @ScopeName LIKE 'FEIN' THEN c.FEIN
							WHEN @ScopeName LIKE 'DOB' THEN CONVERT(VARCHAR(10), c.DOB, 101) 
							WHEN @ScopeName LIKE 'Address' THEN c.Address
							WHEN @ScopeName LIKE 'Address2' THEN c.Address2
							WHEN @ScopeName LIKE 'City' THEN c.City
							WHEN @ScopeName LIKE 'State' THEN c.State
							WHEN @ScopeName LIKE 'Zip' THEN c.Zip
							WHEN @ScopeName LIKE 'IsActive'  AND c.IsActive = [dbo].[fnTextToBit](@Name) 
								THEN CONVERT(VARCHAR, @OptionId)
							WHEN @ScopeName LIKE 'CriminalOffense'   AND c.CriminalOffense = [dbo].[fnTextToBit](@Name) 
								THEN CONVERT(VARCHAR, @OptionId)
							WHEN @ScopeName LIKE 'HasOwnershipWithOtherStore'  AND c.HasOwnershipWithOtherStore = [dbo].[fnTextToBit](@Name) 
									THEN CONVERT(VARCHAR, @OptionId) 
							WHEN @ScopeName LIKE 'HasRelationshipWithOtherOwner' AND c.HasRelationshipWithOtherOwner = [dbo].[fnTextToBit](@Name) 
									THEN CONVERT(VARCHAR, @OptionId)
							WHEN @ScopeName LIKE 'IsPIC'  AND c.IsPIC = [dbo].[fnTextToBit](@Name) 
									THEN CONVERT(VARCHAR, @OptionId)
							WHEN @ScopeName LIKE 'IsControlEntity' AND c.IsControlEntity = [dbo].[fnTextToBit](@Name) 
								THEN CONVERT(VARCHAR, @OptionId)
							WHEN @ScopeName LIKE 'IsTechnician' AND c.IsTechnician = [dbo].[fnTextToBit](@Name) 
								THEN CONVERT(VARCHAR, @OptionId)
							WHEN @ScopeName LIKE 'IsCertifiedTechnician'  AND c.IsCertifiedTechnician = [dbo].[fnTextToBit](@Name) 
								THEN CONVERT(VARCHAR, @OptionId)
							WHEN @ScopeName LIKE 'IsPharmacist'  AND c.IsPharmacist = [dbo].[fnTextToBit](@Name) 
								THEN CONVERT(VARCHAR, @OptionId)
							WHEN @ScopeName LIKE 'IsStoreManager' AND c.IsStoreManager = [dbo].[fnTextToBit](@Name) 
								THEN CONVERT(VARCHAR, @OptionId)
							WHEN @ScopeName LIKE 'PharState' THEN c.PharState
							WHEN @ScopeName LIKE 'PharExpDate' THEN CONVERT(VARCHAR(10), c.PharExpDate, 101)
							WHEN @ScopeName LIKE 'StateLicNo' THEN c.StateLicNo

						END)
		FROM dbo.SurveyControlEntity c WHERE c.Id = @CollectionId
	END 

	-- Cetification and License
	IF ((@SurveyId = 27 OR @SurveyId = 28 ) 
		AND @CollectionId > 0 
		AND (@Opt IS NULL OR @Opt <> '1')
		) BEGIN
		SELECT @answer = (CASE WHEN @ScopeName LIKE 'ControlEntityId' THEN CONVERT(VARCHAR,c.ControlEntityId)
							WHEN @ScopeName LIKE 'CertName' THEN c.CertName
							WHEN @ScopeName LIKE 'CertType' THEN c.CertType
							WHEN @ScopeName LIKE 'CertProfession' THEN c.CertProfession
							WHEN @ScopeName LIKE 'CertNumber' THEN c.CertNumber
							WHEN @ScopeName LIKE 'IssuedDate' THEN CONVERT(VARCHAR(10), c.IssuedDate, 101) 
							WHEN @ScopeName LIKE 'ExpiredDate' THEN CONVERT(VARCHAR(10), c.ExpiredDate, 101) 
							WHEN @ScopeName LIKE 'StateIssued' THEN c.StateIssued
							WHEN @ScopeName LIKE 'IsActive'  AND c.IsActive = [dbo].[fnTextToBit](@Name) 
								THEN CONVERT(VARCHAR, @OptionId)						
						END)
		FROM dbo.SurveyControlEntityCert c WHERE c.Id = @CollectionId
	END 

	-- Ownership
	IF ((@SurveyId = 23) 
		AND @CollectionId > 0 
		AND (@Opt IS NULL OR @Opt <> '1')
		) BEGIN
		SELECT @answer = (CASE WHEN @ScopeName LIKE 'SurveyControlEntityId' THEN CONVERT(VARCHAR,c.SurveyControlEntityId)
							WHEN @ScopeName LIKE 'OtherLegalName' THEN c.OtherLegalName
							WHEN @ScopeName LIKE 'OtherNPI' THEN CONVERT(VARCHAR,c.OtherNPI)
							WHEN @ScopeName LIKE 'OtherDBA' THEN c.OtherDBA
							WHEN @ScopeName LIKE 'OtherNCPDP' THEN CONVERT(VARCHAR, c.OtherNCPDP) 
							WHEN @ScopeName LIKE 'OtherAddress' THEN c.OtherAddress 
							WHEN @ScopeName LIKE 'OtherAddress2' THEN c.OtherAddress2
							WHEN @ScopeName LIKE 'OtherCity' THEN c.OtherCity
							WHEN @ScopeName LIKE 'OtherState' THEN c.OtherState
							WHEN @ScopeName LIKE 'OtherZip' THEN CONVERT(VARCHAR,c.OtherZip)
							WHEN @ScopeName LIKE 'IsActive'  AND c.IsActive = [dbo].[fnTextToBit](@Name) 
								THEN CONVERT(VARCHAR, @OptionId)						
						END)
		FROM dbo.SurveyOwnership c WHERE c.Id = @CollectionId
	END 

	-- OwnerRelationship
	IF ((@SurveyId = 24 ) 
		AND @CollectionId > 0 
		AND (@Opt IS NULL OR @Opt <> '1')
		) BEGIN
		SELECT @answer = (CASE WHEN @ScopeName LIKE 'SurveyControlEntityId' THEN CONVERT(VARCHAR,c.SurveyControlEntityId)
							WHEN @ScopeName LIKE 'Relationship' AND @Text Like c.Relationship THEN c.Relationship
							WHEN @ScopeName LIKE 'FName' THEN c.FName
							WHEN @ScopeName LIKE 'MName' THEN c.MName
							WHEN @ScopeName LIKE 'LName' THEN c.LName
							WHEN @ScopeName LIKE 'IsActive'  AND c.IsActive = [dbo].[fnTextToBit](@Name) 
								THEN CONVERT(VARCHAR, @OptionId)						
						END)
		FROM dbo.SurveyOwnerRelationship c WHERE c.Id = @CollectionId
	END 

END -- @answer IS NULL OR @answer = '

	-- SELECT @answer
			
RETURN @answer
END;
-- usage:
-- dbo.[dbo].[fnSurveyGetDate] (2, 123123, '')

GO
