USE [API]
GO
/****** Object:  StoredProcedure [dbo].[usp_APISalesDetail_GetIDs]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_APISalesDetail_GetIDs]

AS

SET NOCOUNT ON;

BEGIN

	
	DECLARE @1stDate DATETIME

	--Get the 1st date of the previous  to get all ID's (Primary Key values) from source system. This is to ensure we do not miss any rows.
	SET @1stDate = DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) -1, 0)

	SELECT ID, CAST(CONVERT(VARCHAR(20), INVDATE, 112) AS INT) AS DateKey
	FROM dbo.APISalesDetail 
	WHERE DateLoaded >= @1stDate
	AND ID > 0
	ORDER BY ID ASC, DateKey ASC

END
GO
