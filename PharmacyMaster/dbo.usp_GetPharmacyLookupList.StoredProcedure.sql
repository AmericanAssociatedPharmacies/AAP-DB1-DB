USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetPharmacyLookupList]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chris McKinnie
-- Create date: January 8, 2018
-- Description:	Get a key/value pair 
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetPharmacyLookupList]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT *
FROM (SELECT DISTINCT [pm].[PMID] AS [Key],
	   LTRIM(RTRIM('<strong>' + LTRIM(RTRIM(ISNULL([pm].[AccountName],'-'))) +'</strong>')) + ' | PMID: ' + CAST(ISNULL([pm].[PMID],'-') AS VARCHAR(20))+ ' | AAPNo: ' + CAST(ISNULL([pm].[AAPAccountNo],'-') AS VARCHAR(20)) + ' | APINo: ' + ISNULL([pm].[APIAccountNo],'-') +'<br/>' + LTRIM(RTRIM(ISNULL([pm].[Addr1],'-'))) + ' ' + LTRIM(RTRIM(ISNULL([pm].[City],'-'))) + ', ' + LTRIM(RTRIM(ISNULL([pm].[State],'-'))) AS [Value]
FROM [v_web_pm_userdata] AS [pm]
WHERE [pm].[IsAPI] = 1 OR [pm].[IsAAP] = 1 AND [pm].[PMID] IN (SELECT DISTINCT [DefaultPMID] FROM [WebDev]..[Userlogin])) AS [l]
WHERE [l].[Value] IS NOT NULL
ORDER BY [l].[Value]
END
GO
