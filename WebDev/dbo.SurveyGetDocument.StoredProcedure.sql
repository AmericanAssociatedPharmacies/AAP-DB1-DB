USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[SurveyGetDocument]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John, Ngo
-- Create date: 4/3/2015
-- Description:	Generate Document Data
-- EXEC [dbo].[SurveyGetDocument] 'credentialing2015', 'pharmacy', 106489, 25, 'caremark'
-- =============================================
CREATE PROCEDURE [dbo].[SurveyGetDocument]
	@DocumentName NVARCHAR(150),
	@Section NVARCHAR(150),
	@PMId INT,
	@SurveyId INT,
	@Opt NVARCHAR(250) = '', 
	@TmpGlobalTable NVARCHAR(250) = NULL,
	@CollectionId INT = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
--DECLARE 	@DocumentName NVARCHAR(150), @Section NVARCHAR(150), @PMId INT,@SurveyId INT, @Opt NVARCHAR(250)
--SELECT @DocumentName = 'credentialing2015', @Section = 'pharmacy', @PMId = 106489,@SurveyId = 25

DECLARE @DynamicPivotQuery AS NVARCHAR(MAX), @intoTmpGlobalTable NVARCHAR(250), @insertIntoTmpGlobalTable NVARCHAR(500)
DECLARE @ColumnName AS NVARCHAR(MAX)

IF (@TmpGlobalTable IS NULL) SELECT @TmpGlobalTable = ''

IF ( @CollectionId IS NULL ) SELECT @CollectionId = 0
	
SELECT @intoTmpGlobalTable = '', @insertIntoTmpGlobalTable = ''

IF ( @TmpGlobalTable <> '') BEGIN
	IF ( OBJECT_ID('tempdb..' + @TmpGlobalTable) IS NULL )
		SELECT @intoTmpGlobalTable = ' INTO ' + @TmpGlobalTable + ' '
	IF ( OBJECT_ID('tempdb..' + @TmpGlobalTable) IS NOT NULL )
			SELECT @insertIntoTmpGlobalTable = ' INSERT INTO ' + @TmpGlobalTable + ' '				
END

SELECT @ColumnName= ISNULL(@ColumnName + ',','') 
       + QUOTENAME(ColumnName)
FROM dbo.SurveyDocument 
WHERE DocumentName = @DocumentName AND (Section IS NULL OR Section = @Section) AND IsActive = 1
ORDER BY [Index]

-- SELECT @ColumnName
-- EXEC [dbo].[SurveyGetDocument] 'credentialing2015', 'pharmacy', 106489, 25, 'caremark'
--Prepare the PIVOT query using the dynamic 
SET @DynamicPivotQuery = @insertIntoTmpGlobalTable +
  N'SELECT * '
  + @intoTmpGlobalTable + 
'FROM (SELECT (CASE WHEN QuestionId IS NULL THEN DefaultValue ELSE [dbo].[fnSurveyGetAnswerByQuestion](QuestionId,' + CONVERT(NVARCHAR,@PMId) + ' ,' + CONVERT(NVARCHAR,@SurveyId) + ' ,' +  CONVERT(NVARCHAR,@CollectionId) + ',''' + @Opt + ''' ) END) AS Answer,ColumnName
FROM dbo.SurveyDocument WHERE DocumentName = ''' + @DocumentName + ''' AND (Section IS NULL OR Section = ''' + @Section + ''') AND IsActive = 1
) AS d          
PIVOT( MAX(Answer)             
	FOR ColumnName IN (' + @ColumnName + ')) AS PVTTable'

----Prepare the PIVOT query using the dynamic 
--SET @DynamicPivotQuery = 
--  N'SELECT *
--INTO #tmpDoc
--FROM (SELECT (CASE WHEN QuestionId IS NULL THEN DefaultValue ELSE [dbo].[fnSurveyGetAnswerByQuestion](QuestionId,' + CONVERT(NVARCHAR,@PMId) + ' ,' + CONVERT(NVARCHAR,@SurveyId) + ' ,0,NULL) END) AS Answer,ColumnName
--FROM dbo.SurveyDocument WHERE DocumentName = ''' + @DocumentName + ''' AND (Section IS NULL OR Section = ''' + @Section + ''') AND IsActive = 1
--) AS d          
--PIVOT( MAX(Answer)             
--	FOR ColumnName IN (' + @ColumnName + ')) AS PVTTable;  SELECT * FROM #tmpDoc;'

--Execute the Dynamic Pivot Query

-- SELECT @DynamicPivotQuery

EXEC sp_executesql @DynamicPivotQuery;
--SELECT * FROM #tmpDoc;

--IF OBJECT_ID('tempdb..#tmpDoc') IS NOT NULL
--	Drop TABLE #tmpDoc

END
GO
