USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[SurveyGetSurveyOptionTmp]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Ngo
-- Create date: 8/18/2014
-- Description:	SurveyGetSurveyOptionTmp
-- =============================================
CREATE PROCEDURE [dbo].[SurveyGetSurveyOptionTmp]
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
    -- if there are no data in surveyanswer then load the data from table
    --, else load from surveyanswer which (@CollectionId = 0)
  --  IF EXISTS (SELECT a.Id
		--FROM dbo.SurveyAnswer a 
		--WHERE a.PMId = @PMId 
		--	AND a.CollectionId = @CollectionId 
		--	AND OptionId IN (SELECT TOP 10 o.Id FROM dbo.SurveyOption o INNER JOIN dbo.SurveyQuestion q 
		--						ON o.QuestionId = q.Id 
		--						WHERE q.SurveyId =  @SurveyId
		--					) 
		--) BEGIN
		
		--SELECT @Option = '1';  -- do not load data from table
    
  --  END
--------------    
CREATE TABLE #AnswerTbl (
    		opId INT,
			Txt NVARCHAR(MAX),
			[Name] NVARCHAR(MAX),
			ScopeName NVARCHAR(150),
			opValue VARCHAR(MAX)
    );

CREATE INDEX OpIndex ON #AnswerTbl (opId);

INSERT #AnswerTbl
SELECT o.Id, o.Text, o.Name, o.ScopeName, NULL
FROM dbo.SurveyOption o 
	INNER JOIN dbo.SurveyQuestion q ON o.QuestionId = q.Id
WHERE q.SurveyId = @SurveyId AND o.IsActive <> 0 AND q.IsActive <> 0

-- SELECT *, Max(Id) OVER(PARTITION BY OptionId) AS MaxId FROM dbo.SurveyAnswer WHERE PMId = @PMId AND CollectionId = @CollectionId;

UPDATE t SET t.opValue = a.AnswerInput
FROM #AnswerTbl t INNER JOIN (SELECT DISTINCT i.*, Max(i.Id) OVER(PARTITION BY OptionId) AS MaxId FROM dbo.SurveyAnswer i WHERE i.PMId = @PMId AND i.CollectionId = @CollectionId) a ON t.opId = a.OptionId
WHERE a.PMId = @PMId AND a.CollectionId = @CollectionId AND a.Id = a.MaxId

--INSERT #AnswerTbl
--SELECT o.Id, dbo.fnSurveyGetAnswerTmp(o.Id,@PMId,@Option,@SurveyId, q.Id, @CollectionId)
--FROM dbo.SurveyOption o	
--		INNER JOIN dbo.SurveyQuestion q ON o.QuestionId = q.Id
--WHERE (o.IsActive IS NULL OR o.IsActive = 1) 
--	AND q.SurveyId = @SurveyId 
--	AND ( q.IsActive IS NULL OR q.IsActive = 1 ) 

--INSERT #AnswerTbl
--SELECT Distinct o.Id, r.AnswerInput,o.ScopeName, o.Text , o.Name
--FROM (	SELECT AnswerInput,Id, OptionId, 
--				Max(Id) OVER(PARTITION BY OptionId) AS MaxId
--		FROM webdev..surveyanswer
--		WHERE pmid = @PMId AND CollectionId = @CollectionId								
--	) r RIGHT JOIN webdev..SurveyOption o ON r.OptionId = o.Id WHERE r.Id = MaxId

--SELECT u.OptionId, u.AnswerInput
--FROM
--(SELECT a.OptionId, Max(Id) MaxId
--FROM dbo.SurveyAnswer a
--WHERE a.PMId = @PMId AND CollectionId = ISNULL(@CollectionId,CollectionId) 
--	AND a.OptionId IN (SELECT o.Id FROM dbo.SurveyOption o INNER JOIN dbo.SurveyQuestion q 
--								ON o.QuestionId = q.Id 
--								WHERE q.SurveyId =  @SurveyId AND o.IsActive = 1 AND (	q.IsActive IS NULL OR q.IsActive = 1 ))
--Group By a.OptionId) inn INNER JOIN dbo.SurveyAnswer u ON inn.MaxId = u.Id

SELECT '0', @Option Opt , @SurveyId [sId], * FROM #AnswerTbl
------------------------
IF ( @SurveyId IN (11,17,26,31,32,33,27,28,23,24) AND (@Option IS NULL OR @Option <> '1') ) BEGIN
-- AND (@answer IS NULL OR @answer = ''
	IF @SurveyId = 11 BEGIN 

		IF EXISTS (SELECT * FROM #AnswerTbl WHERE ScopeName = 'participatedate') AND (opValue IS NULL OR opValue = '')  BEGIN 
			UPDATE a SET a.opValue =  (SELECT TOP 1 CONVERT(VARCHAR(10), StartDate, 101)  FROM PharmacyMaster..PM_ProgramStepMember WHERE ProgramID = 183 AND ProgramStepID = 4 AND @PMId = PMID )
			FROM #AnswerTbl a WHERE a.ScopeName = 'participatedate'
		END

		IF EXISTS (SELECT * FROM #AnswerTbl WHERE ScopeName = 'ud_president') AND (opValue IS NULL OR opValue = '')  BEGIN 
			UPDATE a SET a.opValue =  (SELECT TOP 1 [Value] FROM dbo.SurveySetting WHERE [Name] = 'ud_president' )
			FROM #AnswerTbl a WHERE a.ScopeName = 'ud_president'
		END

		IF EXISTS (SELECT * FROM #AnswerTbl WHERE ScopeName = 'pharmacyname') AND (opValue IS NULL OR opValue = '')  BEGIN 
			UPDATE a SET a.opValue =  (SELECT TOP 1 AccountName FROM PharmacyMaster.dbo.v_PM_AllWithAffiliates WHERE PMID = @PMId	)
			FROM #AnswerTbl a WHERE a.ScopeName = 'pharmacyname'
		END
	END

	-- control entity
	IF ((@SurveyId = 17 OR @SurveyId = 26 OR @SurveyId = 31 OR @SurveyId = 32 OR @SurveyId = 33) 
		AND @CollectionId > 0 
		AND (@Option IS NULL OR @Option <> '1')
		) BEGIN
SELECT '1', @Option Opt , @SurveyId [sId], * FROM #AnswerTbl
		UPDATE a SET 
		a.opValue = (CASE WHEN a.ScopeName LIKE 'ControlEntityTitle' THEN c.Title 
						WHEN a.ScopeName LIKE 'Type' THEN c.Type
						WHEN a.ScopeName LIKE 'LocationType' THEN c.LocationType
						WHEN a.ScopeName LIKE 'npi' THEN c.npi
						WHEN a.ScopeName LIKE 'Title' AND a.Txt Like c.Title THEN c.Title
						WHEN a.ScopeName LIKE 'EffectiveDate' THEN CONVERT(VARCHAR(10), c.EffectiveDate, 101) 
						WHEN a.ScopeName LIKE 'PercentOwnership' THEN CONVERT(VARCHAR, c.PercentOwnership)
						WHEN a.ScopeName LIKE 'PharmacistLicense' THEN c.PharmacistLicense
						WHEN a.ScopeName LIKE 'StateIssueLicense' THEN c.StateIssueLicense
						WHEN a.ScopeName LIKE 'LicenseExpirationDate' THEN CONVERT(VARCHAR(10), c.LicenseExpirationDate, 101)
						WHEN a.ScopeName LIKE 'Entity' THEN c.Entity
						WHEN a.ScopeName LIKE 'DBA' THEN c.DBA
						WHEN a.ScopeName LIKE 'FName' THEN c.FName
						WHEN a.ScopeName LIKE 'MName' THEN c.MName
						WHEN a.ScopeName LIKE 'LName' THEN c.LName
						WHEN a.ScopeName LIKE 'SSN' THEN c.SSN
						WHEN a.ScopeName LIKE 'FEIN' THEN c.FEIN
						WHEN a.ScopeName LIKE 'DOB' THEN CONVERT(VARCHAR(10), c.DOB, 101) 
						WHEN a.ScopeName LIKE 'Address' THEN c.Address
						WHEN a.ScopeName LIKE 'Address2' THEN c.Address2
						WHEN a.ScopeName LIKE 'City' THEN c.City
						WHEN a.ScopeName LIKE 'State' THEN c.State
						WHEN a.ScopeName LIKE 'Zip' THEN c.Zip
						WHEN a.ScopeName LIKE 'IsActive'  AND c.IsActive = [dbo].[fnTextToBit](a.Name) 
							THEN CONVERT(VARCHAR, a.opId)
						WHEN a.ScopeName LIKE 'CriminalOffense'   AND c.CriminalOffense = [dbo].[fnTextToBit](a.Name) 
							THEN CONVERT(VARCHAR, a.opId)
						WHEN a.ScopeName LIKE 'HasOwnershipWithOtherStore'  AND c.HasOwnershipWithOtherStore = [dbo].[fnTextToBit](a.Name) 
								THEN CONVERT(VARCHAR, a.opId) 
						WHEN a.ScopeName LIKE 'HasRelationshipWithOtherOwner' AND c.HasRelationshipWithOtherOwner = [dbo].[fnTextToBit](a.Name) 
								THEN CONVERT(VARCHAR, a.opId)
						WHEN a.ScopeName LIKE 'IsPIC'  AND c.IsPIC = [dbo].[fnTextToBit](a.Name) 
								THEN CONVERT(VARCHAR, a.opId)
						WHEN a.ScopeName LIKE 'IsControlEntity' AND c.IsControlEntity = [dbo].[fnTextToBit](a.Name) 
							THEN CONVERT(VARCHAR, a.opId)
						WHEN a.ScopeName LIKE 'IsTechnician' AND c.IsTechnician = [dbo].[fnTextToBit](a.Name) 
							THEN CONVERT(VARCHAR, a.opId)
						WHEN a.ScopeName LIKE 'IsCertifiedTechnician'  AND c.IsCertifiedTechnician = [dbo].[fnTextToBit](a.Name) 
							THEN CONVERT(VARCHAR, a.opId)
						WHEN a.ScopeName LIKE 'IsPharmacist'  AND c.IsPharmacist = [dbo].[fnTextToBit](a.Name) 
							THEN CONVERT(VARCHAR, a.opId)
						WHEN a.ScopeName LIKE 'IsStoreManager' AND c.IsStoreManager = [dbo].[fnTextToBit](a.Name) 
							THEN CONVERT(VARCHAR, a.opId)
						WHEN a.ScopeName LIKE 'PharState' THEN c.PharState
						WHEN a.ScopeName LIKE 'PharExpDate' THEN CONVERT(VARCHAR(10), c.PharExpDate, 101)
						WHEN a.ScopeName LIKE 'StateLicNo' THEN c.StateLicNo

					END)
		FROM #AnswerTbl a, dbo.SurveyControlEntity c 
		WHERE	c.Id = @CollectionId 
				AND (a.opValue IS NULL Or a.opValue = '')
				AND a.ScopeName IS NOT NULL AND a.ScopeName <> '';
	END  -- end ControlEntity
SELECT '2', @Option Opt , @SurveyId [sId], * FROM #AnswerTbl
	-- Cetification and License
	IF ((@SurveyId = 27 OR @SurveyId = 28 ) 
		AND @CollectionId > 0 
		AND (@Option IS NULL OR @Option <> '1')
		) BEGIN

		UPDATE a SET a.opValue = (CASE WHEN a.ScopeName LIKE 'ControlEntityId' THEN CONVERT(VARCHAR,c.ControlEntityId)
							WHEN a.ScopeName LIKE 'CertName' THEN c.CertName
							WHEN a.ScopeName LIKE 'CertType' THEN c.CertType
							WHEN a.ScopeName LIKE 'CertProfession' THEN c.CertProfession
							WHEN a.ScopeName LIKE 'CertNumber' THEN c.CertNumber
							WHEN a.ScopeName LIKE 'IssuedDate' THEN CONVERT(VARCHAR(10), c.IssuedDate, 101) 
							WHEN a.ScopeName LIKE 'ExpiredDate' THEN CONVERT(VARCHAR(10), c.ExpiredDate, 101) 
							WHEN a.ScopeName LIKE 'StateIssued' THEN c.StateIssued
							WHEN a.ScopeName LIKE 'IsActive'  AND c.IsActive = [dbo].[fnTextToBit](a.Name) 
								THEN CONVERT(VARCHAR, a.opId)						
						END)
		FROM #AnswerTbl a, dbo.SurveyControlEntityCert c 
		WHERE	c.Id = @CollectionId 
				AND (a.opValue IS NULL Or a.opValue = '')
				AND a.ScopeName IS NOT NULL AND a.ScopeName <> ''
	END 

	-- Ownership
	IF ((@SurveyId = 23) 
		AND @CollectionId > 0 
		AND (@Option IS NULL OR @Option <> '1')
		) BEGIN

		UPDATE a SET a.opValue = (CASE WHEN a.ScopeName LIKE 'SurveyControlEntityId' THEN CONVERT(VARCHAR,c.SurveyControlEntityId)
					WHEN a.ScopeName LIKE 'OtherLegalName' THEN c.OtherLegalName
					WHEN a.ScopeName LIKE 'OtherNPI' THEN CONVERT(VARCHAR,c.OtherNPI)
					WHEN a.ScopeName LIKE 'OtherDBA' THEN c.OtherDBA
					WHEN a.ScopeName LIKE 'OtherNCPDP' THEN CONVERT(VARCHAR, c.OtherNCPDP) 
					WHEN a.ScopeName LIKE 'OtherAddress' THEN c.OtherAddress 
					WHEN a.ScopeName LIKE 'OtherAddress2' THEN c.OtherAddress2
					WHEN a.ScopeName LIKE 'OtherCity' THEN c.OtherCity
					WHEN a.ScopeName LIKE 'OtherState' THEN c.OtherState
					WHEN a.ScopeName LIKE 'OtherZip' THEN CONVERT(VARCHAR,c.OtherZip)
					WHEN a.ScopeName LIKE 'IsActive'  AND c.IsActive = [dbo].[fnTextToBit](a.Name) 
						THEN CONVERT(VARCHAR, a.opId)						
				END)
		FROM #AnswerTbl a, dbo.SurveyOwnership  c 
		WHERE	c.Id = @CollectionId 
				AND (a.opValue IS NULL Or a.opValue = '')
				AND a.ScopeName IS NOT NULL AND a.ScopeName <> ''
	END 

	-- OwnerRelationship
	IF ((@SurveyId = 24 ) 
		AND @CollectionId > 0 
		AND (@Option IS NULL OR @Option <> '1')
		) BEGIN

		UPDATE a SET a.opValue = (CASE WHEN a.ScopeName LIKE 'SurveyControlEntityId' THEN CONVERT(VARCHAR,c.SurveyControlEntityId)
							WHEN a.ScopeName LIKE 'Relationship' AND a.Txt Like c.Relationship THEN c.Relationship
							WHEN a.ScopeName LIKE 'FName' THEN c.FName
							WHEN a.ScopeName LIKE 'MName' THEN c.MName
							WHEN a.ScopeName LIKE 'LName' THEN c.LName
							WHEN a.ScopeName LIKE 'IsActive'  AND c.IsActive = [dbo].[fnTextToBit](a.Name) 
								THEN CONVERT(VARCHAR, a.opId)						
						END)
		FROM #AnswerTbl a, dbo.SurveyOwnerRelationship  c 
		WHERE	c.Id = @CollectionId 
				AND (a.opValue IS NULL Or a.opValue = '')
				AND a.ScopeName IS NOT NULL AND a.ScopeName <> ''
	END 

END -- @answer IS NULL OR @answer = ''


------------------------
	SELECT
		's' + CAST(@SurveyId AS NVARCHAR(50)) + 'q' + CAST(o.QuestionId AS NVARCHAR(20)) + 'op' + CAST(o.Id AS NVARCHAR(20)) opId,
		--a.opValue,
        --(CASE WHEN @PMID IS NULL OR @PMID = 0 OR SurveyId = 3  OR @Option = 'DefaultOpValue' THEN o.DefaultValue ELSE  dbo.fnSurveyGetAnswer(o.Id,@PMId,@Option,@SurveyId, q.Id, @CollectionId) END) opValue,
		 (CASE WHEN @PMID IS NULL OR @PMID = 0 OR SurveyId = 3  OR @Option = 'DefaultOpValue' THEN o.DefaultValue ELSE  a.opValue END) opValue,
		-- (CASE WHEN @PMID IS NULL OR @PMID = 0 THEN o.DefaultValue ELSE  DefaultValue END) opValue,
		--NULL IsSelected,
		o.Id, o.QuestionId, o.Text, o.[Index], o.Html, o.Name, o.IsActive, o.IsTrackChange, o.IsReadOnly
		, o.DefaultValue, o.EnableQIds, o.DisableQIds, o.ScopeName, o.opFormat
		-- , (SELECT top 1 q.Section from dbo.surveyquestion q WHERE q.Id = o.QuestionId) Section
		, q.Section
		--, CAST((CASE WHEN o.DefaultValue LIKE 'select' THEN 1 ELSE 0 END) AS BIT) IsSelect
      
		--, (CASE WHEN [dbo].[fnSurveyGetSelectOpId](@PMId,NULL,@SurveyId, q.Id, @CollectionId) = o.ID THEN 1 ELSE 0 END) IsSelect
        --, [dbo].[fnSurveyGetIsSelect](o.Id,@PMId,NULL,@SurveyId, q.Id, @CollectionId) IsSelect 
--        ,CONVERT(BIT,(CASE WHEN
--						(dbo.fnSurveyGetAnswer(o.Id,@PMId,@Option,@SurveyId, q.Id, @CollectionId) 
--								= CONVERT(NVARCHAR,o.Id) 
--						) OR (
--						   dbo.fnSurveyGetAnswer(o.Id,@PMId,@Option,@SurveyId, q.Id, @CollectionId) = 'true'								
--						)
--					THEN 1 ELSE 0 END)) IsSelect
        ,CONVERT(BIT,(CASE WHEN
						(a.opValue = CONVERT(NVARCHAR,o.Id) 
						) OR (
						   a.opValue = 'true'								
						) 
--						OR (
--						   (a.opValue IS NULL OR a.opValue = '') AND o.DefaultValue LIKE 'select%'								
--						)
					THEN 1 ELSE 0 END)) IsSelect
		, MaxLength
	FROM dbo.SurveyOption o	
		INNER JOIN dbo.SurveyQuestion q ON o.QuestionId = q.Id
		LEFT JOIN #AnswerTbl a ON o.Id = a.opId
	WHERE(o.IsActive IS NULL OR o.IsActive = 1)
	-- AND o.QuestionId IN (SELECT DISTINCT SQ.Id FROM dbo.SurveyQuestion SQ WHERE SQ.SurveyId = @SurveyId AND (SQ.IsActive IS NULL OR SQ.IsActive = 1))
	AND ( q.SurveyId = @SurveyId AND (	q.IsActive IS NULL OR q.IsActive = 1 ) )
	ORDER BY [Index], QuestionId


IF OBJECT_ID('tempdb..#AnswerTbl') IS NOT NULL
	Drop TABLE #AnswerTbl

/****


USE webdev
GO
100682

DECLARE	@return_value int

EXEC	@return_value = [dbo].[SurveyGetSurveyOptionTmp]
		@SurveyId = 17, @PMID = 104339, @CollectionId = 1905
		-- @SurveyId = 17, @PMID = 100682, @CollectionId = 1531

SELECT	'Return Value' = @return_value

dbo.fnSurveyGetAnswer(o.Id,@PMId,NULL,@SurveyId, q.Id, @CollectionId)

SELECT dbo.fnSurveyGetAnswer(423,104339,NULL,17, 260, 1)


GO
*/
END
GO
