USE [Reports]
GO
/****** Object:  StoredProcedure [Staging].[usp_APICatalog]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [Staging].[usp_APICatalog]

AS

SET NOCOUNT ON

BEGIN
	
 
	INSERT [Staging].[APICatalog] ([NDC], [APIItemNum], [Tier1Item], [Tier2Item], [GroupID]
		 , [ProductHandlingStatusCode])
	SELECT [NDC], [APIItemNum], [Tier1Item], [Tier2Item], [GroupID], [ProductHandlingStatusCode]
	FROM ODSIntake.dbo.vwAPICatalogDB1
	
END
GO
