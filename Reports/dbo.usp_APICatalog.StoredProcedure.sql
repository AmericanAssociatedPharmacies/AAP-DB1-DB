USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_APICatalog]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[usp_APICatalog]

AS

SET NOCOUNT ON

BEGIN
	
	MERGE [dbo].[APICatalog] AS T
	USING (SELECT [NDC], [APIItemNum], [Tier1Item], [Tier2Item], [GroupID], [ProductHandlingStatusCode]
		   FROM [Staging].[APICatalog]) AS S
			   ([NDC], [APIItemNum], [Tier1Item], [Tier2Item], [GroupID], [ProductHandlingStatusCode])
			   ON T.[NDC] = S.[NDC]
			   AND T.[APIItemNum] = S.[APIItemNum]
	
	WHEN MATCHED THEN

	UPDATE SET T.[NDC] = S.[NDC] 
			 , T.[APIItemNum] = S.[APIItemNum]
			 , T.[Tier1Item] = S.[Tier1Item]
			 , T.[Tier2Item] = S.[Tier2Item]
			 , T.[GroupID] = S.[GroupID]
			 , T.[ProductHandlingStatusCode] = S.[ProductHandlingStatusCode]
	
	WHEN NOT MATCHED THEN

	INSERT ([NDC], [APIItemNum], [Tier1Item], [Tier2Item], [GroupID], [ProductHandlingStatusCode])
	VALUES ([NDC], [APIItemNum], [Tier1Item], [Tier2Item], [GroupID], [ProductHandlingStatusCode]);

END
GO
