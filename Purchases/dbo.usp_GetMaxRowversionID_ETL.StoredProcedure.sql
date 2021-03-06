USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetMaxRowversionID_ETL]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetMaxRowversionID_ETL]

AS

SET NOCOUNT ON

BEGIN


	DECLARE @p1 INT

	SET @p1 = cast(CONVERT(varchar(20),DATEADD(yy, DATEDIFF(yy, 0, GETDATE()), 0),112) as INT) 


	SELECT dt.MaxRowversionID
	FROM(SELECT CONVERT(VARCHAR(50), master.dbo.fn_varbintohexstr(MAX([RowversionID]))) AS MaxRowversionID
		FROM [dbo].[CHPH_AAP]
		WHERE DateKey >= @p1
		) AS dt



END
GO
