USE [ODSIntake]
GO
/****** Object:  StoredProcedure [Staging].[usp_SRBSRO_Load]    Script Date: 12/22/2020 4:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Staging].[usp_SRBSRO_Load]

AS

SET NOCOUNT ON

BEGIN

	SELECT *
	FROM [10.96.0.3].[APIASW].[AX1492BFRX].[SRBSRO]


END
GO
