USE [API]
GO
/****** Object:  StoredProcedure [dbo].[usp_APISalesDetail_Delete_DW]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_APISalesDetail_Delete_DW]

AS

SET NOCOUNT ON;

BEGIN

	SELECT [ID], CAST(CONVERT(VARCHAR(20), INVDATE, 112) AS INT) AS DateKey
	FROM [dbo].[APISalesDetail_Delete_DW]

END
GO
