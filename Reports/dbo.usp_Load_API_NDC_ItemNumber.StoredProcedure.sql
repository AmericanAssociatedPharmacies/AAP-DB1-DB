USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_Load_API_NDC_ItemNumber]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_Load_API_NDC_ItemNumber]

AS

SET NOCOUNT ON;

BEGIN

	TRUNCATE TABLE dbo.API_NDC_ItemNumber
	
	INSERT INTO dbo.API_NDC_ItemNumber(API_ItemNumber, NDC)
	SELECT dt.API_ItemNumber
	, dt.NDC
	FROM(SELECT DISTINCT CONVERT(VARCHAR(25), [API ITEM #]) AS API_ItemNumber
			, CONVERT(VARCHAR(11), [NDC #]) AS NDC
			FROM [ODSIntake].Staging.[ContractUp]
		) AS dt
	WHERE NOT EXISTS(SELECT 1
						FROM dbo.API_NDC_ItemNumber AS a
						WHERE dt.API_ItemNumber = a.API_ItemNumber
						AND dt.NDC = a.NDC
					)

END


GO
