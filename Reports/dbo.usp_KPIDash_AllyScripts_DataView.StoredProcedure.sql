USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_KPIDash_AllyScripts_DataView]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[usp_KPIDash_AllyScripts_DataView]
AS
	SELECT DATEADD(month, DATEDIFF(month, 0, Date), 0) as [RxDate]
		, SUM(RxFilled) as [TotalFilled]
		, SUM(RxReceived) as [TotalReceived]
	FROM Reports.dbo.KPIDash_AllyScripts
	WHERE IsValid = 1
	AND DeletedBy IS NULL
	AND DeletedOn IS NULL
	GROUP BY DATEADD(month, DATEDIFF(month, 0, Date), 0)

	



GO
