USE [ODSIntake]
GO
/****** Object:  StoredProcedure [dbo].[usp_APICatalogDB1]    Script Date: 12/22/2020 4:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_APICatalogDB1]

AS

SET NOCOUNT ON

BEGIN
	
	INSERT [Reports].[Staging].[APICatalogDB1] ([NDC], [APIItemNum], [Tier1Item], [Tier2Item], [GroupID]
		 , [ProductHandlingStatusCode])
	SELECT [NDC], [APIItemNum], [Tier1Item], [Tier2Item], [GroupID], [ProductHandlingStatusCode]
	FROM dbo.vwAPICatalogDB1
	
END
GO
