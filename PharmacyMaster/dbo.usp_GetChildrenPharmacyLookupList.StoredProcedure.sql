USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetChildrenPharmacyLookupList]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Chris McKinnie
-- Create date: January 8, 2018
-- Description:	Get a key/value pair 
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetChildrenPharmacyLookupList]
@PMID Int
AS
BEGIN
DECLARE @AAPAccountNo VARCHAR(20)
DECLARE @ChildPMIDs TABLE (PMID Int)

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

 SELECT @AAPAccountNo = [AAPAccountNo]
FROM [PM_Pharmacy] AS [t0]
WHERE [PMID] = @PMID


INSERT INTO @ChildPMIDs SELECT [t0].[PMID]
FROM [PM_Pharmacy] AS [t0]
WHERE ([t0].[AAPParentNo] = @AAPAccountNo) AND ([t0].[PMID] <> @PMID)

--SELECT *
--FROM (SELECT DISTINCT [pm].[PMID] AS [Key],
--	   LTRIM(RTRIM('<strong>' + LTRIM(RTRIM(ISNULL([pm].[AccountName],'-'))) +'</strong>')) + ' | PMID: ' + CAST(ISNULL([pm].[PMID],'-') AS VARCHAR(20))+ ' | AAPNo: ' + CAST(ISNULL([pm].[AAPAccountNo],'-') AS VARCHAR(20)) + ' | APINo: ' + ISNULL([pm].[APIAccountNo],'-') +'<br/>' + LTRIM(RTRIM(ISNULL([pm].[Addr1],'-'))) + ' ' + LTRIM(RTRIM(ISNULL([pm].[City],'-'))) + ', ' + LTRIM(RTRIM(ISNULL([pm].[State],'-'))) AS [Value]
--FROM [v_web_pm_userdata] AS [pm]
--WHERE [pm].[IsAPI] = 1 OR [pm].[IsAAP] = 1 AND [pm].[PMID] IN (SELECT [PMID] FROM @ChildPMIDs)) AS [l]
--WHERE [l].[Value] IS NOT NULL
--ORDER BY [l].[Value]

SELECT DISTINCT [pm].[PMID] AS [Key],
	   LTRIM(RTRIM('<strong>' + LTRIM(RTRIM(ISNULL([pm].[AccountName],'-'))) +'</strong>')) + ' | PMID: ' + CAST(ISNULL([pm].[PMID],'-') AS VARCHAR(20))+ ' | AAPNo: ' + CAST(ISNULL([pm].[AAPAccountNo],'-') AS VARCHAR(20)) + ' | APINo: ' + ISNULL([pm].[APIAccountNo],'-') +'<br/>' + LTRIM(RTRIM(ISNULL([pm].[Addr1],'-'))) + ' ' + LTRIM(RTRIM(ISNULL([pm].[City],'-'))) + ', ' + LTRIM(RTRIM(ISNULL([pm].[State],'-'))) AS [Value]
FROM [v_web_pm_userdata] AS [pm] INNER JOIN [WebDev]..[Userlogin] AS [ul]
ON [ul].[DefaultPMID] = [pm].[PMID]
WHERE [pm].[isAAP] = 1 AND [pm].[isAPI] = 1 AND [pm].[PMID] IN (SELECT [PMID] FROM @ChildPMIDs)
ORDER BY LTRIM(RTRIM('<strong>' + LTRIM(RTRIM(ISNULL([pm].[AccountName],'-'))) +'</strong>')) + ' | PMID: ' + CAST(ISNULL([pm].[PMID],'-') AS VARCHAR(20))+ ' | AAPNo: ' + CAST(ISNULL([pm].[AAPAccountNo],'-') AS VARCHAR(20)) + ' | APINo: ' + ISNULL([pm].[APIAccountNo],'-') +'<br/>' + LTRIM(RTRIM(ISNULL([pm].[Addr1],'-'))) + ' ' + LTRIM(RTRIM(ISNULL([pm].[City],'-'))) + ', ' + LTRIM(RTRIM(ISNULL([pm].[State],'-')))
END
GO
