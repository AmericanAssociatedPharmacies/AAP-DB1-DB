USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[SurveyCareMarkCredentialingRpt]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John, Ngo
-- Create date: 3/31/2015
-- Description:	Generate The Excel Credentialing File for CareMark
/* 
	EXEC	[dbo].[SurveyCareMarkCredentialingRpt] @PMId = 102333, @Opt = N'caremark'
	EXEC	[dbo].[SurveyCareMarkCredentialingRpt] @PMId = 102333, @Opt = N''
*/
-- =============================================
CREATE PROCEDURE [dbo].[SurveyCareMarkCredentialingRpt]
	@PMId INT,
	@Opt NVARCHAR(250) = 'caremark'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF (@Opt = 'y') BEGIN --  @Opt start 'y' or 't' mean that all stores need to load @pmid is null
		SELECT @PMId = NULL -- NULL mean to load all stores
	END
	DECLARE @NPI INT, @OwnerName NVARCHAR(500)
	-- Insert statements for procedure here
	--DECLARE     @SQL    NVARCHAR(MAX)

	--EXEC dbo.SurveyGetStoredProcTableDefinition
	--	@ProcedureName='dbo.SurveyGetDocument',
	--	@TableName='##dbo_SurveyGetDocument',@SQL = @SQL OUTPUT

	--INSERT INTO ##dbo_SurveyGetDocument
-- while	
--DECLARE  @x INT = 10000
--WHILE @x > 0
--BEGIN
--INSERT INTO CursorTest (fld1, fld2, fld3)
--SELECT 1, RAND() * 100 * DATEPART(ms, GETDATE()), LEFT(REPLICATE(CAST(NEWID() AS VARCHAR(36)),30),800)
--SET @x -= 1
--END

IF ( @Opt = 'y') BEGIN
	-- Cursor
	DECLARE @curPMId INT
	DECLARE CursorName CURSOR FAST_FORWARD FOR
	-- SELECT idcol FROM CursorTest
	SELECT DISTINCT SurveyAnswer.PMId
	FROM SurveyQuestion LEFT OUTER JOIN  
		SurveyOption ON SurveyQuestion.Id = SurveyOption.QuestionId LEFT OUTER JOIN
		SurveyAnswer ON SurveyOption.Id = SurveyAnswer.OptionId 
	WHERE (SurveyQuestion.SurveyId IN (25)) AND (SurveyQuestion.IsActive = 1) AND (SurveyOption.IsActive = 1) AND (SurveyAnswer.IsSubmitted =1)
	OPEN CursorName
	FETCH NEXT FROM CursorName INTO @curPMId
	WHILE @@FETCH_STATUS = 0 BEGIN
		--PRINT CAST(@curPMId AS VARCHAR(5))
		EXEC [dbo].[SurveyGetDocument] 'credentialing2015', 'pharmacy', @curPMId, 25, @Opt, '##dbo_SurveyGetDocument'
		FETCH NEXT FROM CursorName
		INTO @curPMId
	END
	CLOSE CursorName
	DEALLOCATE CursorName
	
	SELECT DISTINCT * FROM ##dbo_SurveyGetDocument
	
	IF OBJECT_ID('tempdb..##dbo_SurveyGetDocument') IS NOT NULL	
		Drop Table ##dbo_SurveyGetDocument
		
END ELSE BEGIN
	DECLARE @SQL NVARCHAR(MAX)
-- I. Pharmacy Information tab
   EXEC [dbo].[SurveyGetDocument] 'Credentialing2015', 'pharmacy', @PMId, 25, @Opt, '##dbo_SurveyGetDocument'         
 --   EXEC [dbo].[SurveyGetDocument] 'credentialing2015', 'pharmacy', 100348, 25, @Opt, '##dbo_SurveyGetDocument'
   	SELECT @SQL = 
	'IF OBJECT_ID(''tempdb..##dbo_SurveyGetDocument'') IS NOT NULL BEGIN	
		SELECT DISTINCT * FROM ##dbo_SurveyGetDocument;  		
		Drop Table ##dbo_SurveyGetDocument; 
	END ELSE BEGIN 
		EXEC [dbo].[SurveyGetDocument] ''Credentialing2015'', ''pharmacy'', 0, 25, '''', '''',0 
	END;';
--	'IF OBJECT_ID(''tempdb..' + @TmpGlobalTable + ''') IS NOT NULL BEGIN	
--		SELECT DISTINCT * FROM ' + @TmpGlobalTable + ';  		
--		Drop Table ' + @TmpGlobalTable  + '; 
--	END';

	EXEC sp_executesql @SQL;
--	SELECT DISTINCT * FROM ##dbo_SurveyGetDocument
--	
--	IF OBJECT_ID('tempdb..##dbo_SurveyGetDocument') IS NOT NULL	
--		Drop Table ##dbo_SurveyGetDocument


-- II. OwnershipControl Tab
	-- 1. table with all collectionids and Cursor
   	DECLARE @curCollectId INT, @SurveyId INT, @TmpGlobalTable NVARCHAR(150), @DocumentName NVARCHAR(150), @Section NVARCHAR(150)

	SELECT @SurveyId = 17, @DocumentName = 'Credentialing2015', @Section = 'OwnershipControl', @TmpGlobalTable = '##dbo_OwnershipControl'

	DECLARE CursorName CURSOR FAST_FORWARD FOR
	SELECT DISTINCT a.CollectionId FROM dbo.SurveyAnswer a INNER JOIN dbo.SurveyOption o ON a.OptionId = o.Id INNER JOIN dbo.SurveyQuestion q ON o.QuestionId = q.Id WHERE a.PMId = @PMId AND q.SurveyId = @SurveyId AND a.CollectionId IS NOT NULL AND a.CollectionId <> 0
	--SELECT DISTINCT Id FROM dbo.SurveyControlEntity WHERE IsControlEntity = 1 AND IsActive = 1 AND PMId = ISNULL(@PMId,PMID) -- AND HasOwnershipWithOtherStore IS NOT NULL -- AND IsSubmitted = 1;
	OPEN CursorName
	FETCH NEXT FROM CursorName INTO @curCollectId
	WHILE @@FETCH_STATUS = 0 BEGIN
		--PRINT CAST(@curCollectId AS VARCHAR(5))
		EXEC [dbo].[SurveyGetDocument] @DocumentName, @Section, @PMId, @SurveyId , @Opt, @TmpGlobalTable,@curCollectId  --'##dbo_SurveyGetDocument'
		FETCH NEXT FROM CursorName
		INTO @curCollectId
	END
	CLOSE CursorName
	DEALLOCATE CursorName

	SELECT @SQL = 
	'IF OBJECT_ID(''tempdb..' + @TmpGlobalTable + ''') IS NOT NULL BEGIN	
		SELECT DISTINCT * FROM ' + @TmpGlobalTable + ';  		
		Drop Table ' + @TmpGlobalTable  + '; 
	END ELSE BEGIN 
		EXEC [dbo].[SurveyGetDocument] ''Credentialing2015'', ''OwnershipControl'', 0, 17, '''', '''',0 
	END;';
--	'IF OBJECT_ID(''tempdb..' + @TmpGlobalTable + ''') IS NOT NULL BEGIN	
--		SELECT DISTINCT * FROM ' + @TmpGlobalTable + ';  		
--		Drop Table ' + @TmpGlobalTable  + '; 
--	END';

	EXEC sp_executesql @SQL;

--	SELECT DISTINCT * FROM ##dbo_SurveyGetDocument
--	
--	IF OBJECT_ID('tempdb..##dbo_SurveyGetDocument') IS NOT NULL	
--		Drop Table ##dbo_SurveyGetDocument


	--	SELECT * FROM 
	--	(SELECT 
	--		'Store' LocationType, [NPI], [Title], EffectiveDate [Effective Date], PercentOwnership [% Ownership], PharmacistLicense [Pharmacist's License], LicenseExpirationDate [Expiration Date]
	--		, [Entity] , DBA [Entity's DBA], FName [First Name], MName [Middle Name], LName [Last Name], [SSN], [FEIN], [DOB]
	--		, [Address], Address2 [Address 2], [City], [State], [Zip], '' [Reserved21], CriminalOffense [Criminal Offense], '' [Reserved23], HasOwnershipWithOtherStore [Other Ownerhip], HasRelationshipWithOtherOwner [Relation]  
	--		FROM dbo.SurveyControlEntity
	--		WHERE IsControlEntity =1 AND IsActive = 1 AND PMId = ISNULL(@PMId,PMID) AND HasOwnershipWithOtherStore IS NOT NULL -- AND IsSubmitted = 1;
	--	)  AS controlEntity WHERE 0 = 1
--
--	select t.*
--	from (select 1 as adummy) [NPI] -- ensure no empty dataset
--	left join (
--		SELECT 
--			'Store' LocationType, [NPI], [Title], EffectiveDate [Effective Date], PercentOwnership [% Ownership], PharmacistLicense [Pharmacist's License], LicenseExpirationDate [Expiration Date]
--			, [Entity] , DBA [Entity's DBA], FName [First Name], MName [Middle Name], LName [Last Name], [SSN], [FEIN], [DOB]
--			, [Address], Address2 [Address 2], [City], [State], [Zip], '' [Reserved21], CriminalOffense [Criminal Offense], '' [Reserved23], HasOwnershipWithOtherStore [Other Ownerhip], HasRelationshipWithOtherOwner [Relation]  
--			FROM dbo.SurveyControlEntity
--			WHERE IsControlEntity =1 AND IsActive = 1 AND PMId = ISNULL(@PMId,PMID) AND HasOwnershipWithOtherStore IS NOT NULL -- AND IsSubmitted = 1;
--	) t on 1=1


-- III. OtherOwnership
   	-- DECLARE @curCollectId INT, @TmpGlobalTable NVARCHAR(150), @DocumentName NVARCHAR(150), @Section NVARCHAR(150), @SQL NVARCHAR(MAX)
-- EXEC	[dbo].[SurveyCareMarkCredentialingRpt] @PMId = 104339, @Opt = N'caremark'
	SELECT  @SurveyId = 23, @DocumentName = 'Credentialing2015', @Section = 'OtherOwnership', @TmpGlobalTable = '##dbo_OtherOwnership'

	DECLARE CursorName CURSOR FAST_FORWARD FOR
	--SELECT DISTINCT Id FROM dbo.SurveyControlEntity WHERE IsControlEntity = 1 AND IsActive = 1 AND PMId = ISNULL(@PMId,PMID) AND HasOwnershipWithOtherStore IS NOT NULL -- AND IsSubmitted = 1;
  	SELECT DISTINCT a.CollectionId FROM dbo.SurveyAnswer a INNER JOIN dbo.SurveyOption o ON a.OptionId = o.Id INNER JOIN dbo.SurveyQuestion q ON o.QuestionId = q.Id WHERE a.PMId = @PMId AND q.SurveyId = @SurveyId AND a.CollectionId IS NOT NULL AND a.CollectionId <> 0
	OPEN CursorName
	FETCH NEXT FROM CursorName INTO @curCollectId
	WHILE @@FETCH_STATUS = 0 BEGIN
		--PRINT CAST(@curCollectId AS VARCHAR(5))
		EXEC [dbo].[SurveyGetDocument] @DocumentName, @Section, @PMId, @SurveyId, @Opt, @TmpGlobalTable,@curCollectId  --'##dbo_SurveyGetDocument'
		-- hanlding missing NPI and Owner columns
		
		FETCH NEXT FROM CursorName
		INTO @curCollectId
	END
	CLOSE CursorName
	DEALLOCATE CursorName
-- EXEC [dbo].[SurveyGetDocument] 'Credentialing2015', 'OtherOwnership', 0, 23, '', '',0 
	SELECT @SQL = 
	'IF OBJECT_ID(''tempdb..' + @TmpGlobalTable + ''') IS NOT NULL BEGIN	
		SELECT DISTINCT * FROM ' + @TmpGlobalTable + ';  		
		Drop Table ' + @TmpGlobalTable  + '; 
	END ELSE BEGIN 
		EXEC [dbo].[SurveyGetDocument] ''Credentialing2015'', ''OtherOwnership'', 0, 23, '''', '''',0 
	END;';
--	'SELECT DISTINCT * FROM ' + @TmpGlobalTable + '; 	
--	IF OBJECT_ID(''tempdb..' + @TmpGlobalTable + ''') IS NOT NULL	
--		Drop Table ' + @TmpGlobalTable;

	EXEC sp_executesql @SQL;


	--	SELECT * FROM 
	--	(SELECT 
	--		o.*
	--		FROM dbo.SurveyOwnership o 
	--		WHERE o.IsActive = 1 
	--			AND o.SurveyControlEntityId 
	--			IN (
	--				SELECT e.Id FROM dbo.SurveyControlEntity e
	--						WHERE e.IsControlEntity =1 AND e.IsActive = 1 AND e.PMId = ISNULL(@PMId,e.PMId) AND e.HasOwnershipWithOtherStore IS NOT NULL -- AND IsSubmitted = 1;
	--			)
	--	) AS Ownership WHERE 0 = 1

--	select t.*
--	from (select 1 as adummy) [NPI] -- ensure no empty dataset
--	left join (SELECT 
--			o.*
--			FROM dbo.SurveyOwnership o 
--			WHERE o.IsActive = 1 
--				AND o.SurveyControlEntityId 
--				IN (
--					SELECT e.Id FROM dbo.SurveyControlEntity e
--							WHERE e.IsControlEntity =1 AND e.IsActive = 1 AND e.PMId = ISNULL(@PMId,e.PMId) AND e.HasOwnershipWithOtherStore IS NOT NULL -- AND IsSubmitted = 1;
--				)
--	) t on 1=1


-- EXEC	[dbo].[SurveyCareMarkCredentialingRpt] @PMId = 104339, @Opt = N'caremark'
-- IV. OwnerRelationship
   	-- DECLARE @PMId INT, @SurveyId INT, @Opt NVARCHAR(MAX), @curCollectId INT, @TmpGlobalTable NVARCHAR(150), @DocumentName NVARCHAR(150), @Section NVARCHAR(150), @SQL NVARCHAR(MAX)
	-- SELECT @PMId = 104339, @SurveyId = 24, @Opt =  'caremark'
	SELECT @SurveyId = 24, @DocumentName = 'Credentialing2015', @Section = 'Relationship', @TmpGlobalTable = '##dbo_OwnerRelationship'

	DECLARE CursorName CURSOR FAST_FORWARD FOR
	SELECT DISTINCT a.CollectionId FROM dbo.SurveyAnswer a INNER JOIN dbo.SurveyOption o ON a.OptionId = o.Id INNER JOIN dbo.SurveyQuestion q ON o.QuestionId = q.Id WHERE a.PMId = @PMId AND q.SurveyId = @SurveyId AND a.CollectionId IS NOT NULL AND a.CollectionId <> 0
	--SELECT DISTINCT Id FROM dbo.SurveyControlEntity WHERE IsControlEntity = 1 AND IsActive = 1 AND PMId = ISNULL(@PMId,PMID) AND HasOwnershipWithOtherStore IS NOT NULL -- AND IsSubmitted = 1;
	OPEN CursorName
	FETCH NEXT FROM CursorName INTO @curCollectId
	WHILE @@FETCH_STATUS = 0 BEGIN
		--PRINT CAST(@curCollectId AS VARCHAR(5))
-- EXEC [dbo].[SurveyGetDocument] 'Credentialing2015', 'Relationship', 104339, 24, 'caremark', '',2023 
		EXEC [dbo].[SurveyGetDocument] @DocumentName, @Section, @PMId, @SurveyId, @Opt, @TmpGlobalTable,@curCollectId  --'##dbo_SurveyGetDocument'
		-- hanlding missing NPI and Owner columns
		
		FETCH NEXT FROM CursorName
		INTO @curCollectId
	END
	CLOSE CursorName
	DEALLOCATE CursorName

	SELECT @SQL = 
	'IF OBJECT_ID(''tempdb..' + @TmpGlobalTable + ''') IS NOT NULL BEGIN	
		SELECT DISTINCT * FROM ' + @TmpGlobalTable + ';  		
		Drop Table ' + @TmpGlobalTable  + '; 
	END ELSE BEGIN 
		EXEC [dbo].[SurveyGetDocument] ''Credentialing2015'', ''Relationship'', 0, 24, '''', '''',0 
	END;';

--	'SELECT DISTINCT * FROM ' + @TmpGlobalTable + '; 	
--	IF OBJECT_ID(''tempdb..' + @TmpGlobalTable + ''') IS NOT NULL	
--		Drop Table ' + @TmpGlobalTable;

	EXEC sp_executesql @SQL;

--	select t.*
--	from (select 1 as adummy) [NPI] -- ensure no empty dataset
--	left join (SELECT 
--				r.*
--			FROM dbo.SurveyOwnerRelationship  r 
--			WHERE r.IsActive = 1 
--				AND r.SurveyControlEntityId 
--				IN (
--					SELECT e.Id FROM dbo.SurveyControlEntity e
--							WHERE e.IsControlEntity =1 AND e.IsActive = 1 AND e.PMId = ISNULL(@PMId,e.PMId) AND e.HasOwnershipWithOtherStore IS NOT NULL -- AND IsSubmitted = 1;
--				)
--		) t on 1=1

		-- compounding
		--SELECT c.* 
		--FROM dbo.v_SurveyCareMarkCompounding c
		--WHERE c.PMId = @PMId
		EXEC [dbo].[SurveyGetDocument] 'Credentialing2015', 'compounding', @PMId, 25, @Opt
		
	END  -- End of PMId 


END -- end store procedured
/*

GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[SurveyCareMarkCredentialingRpt] @PMId = 104339, @Opt = N''

SELECT	'Return Value' = @return_value

GO

*/
GO
