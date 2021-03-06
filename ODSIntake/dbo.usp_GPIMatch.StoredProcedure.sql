USE [ODSIntake]
GO
/****** Object:  StoredProcedure [dbo].[usp_GPIMatch]    Script Date: 12/22/2020 4:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GPIMatch]

	@GPI VARCHAR(14) = NULL
	, @NDC VARCHAR(11) = NULL



AS

SET NOCOUNT ON;

BEGIN

	SELECT dm.NDC
	, Dt.GPI
	, dm.DrugName
	, dm.MFG
	, dm.DrugType
	, dm.Form
	, dm.Strength
	, dm.RouteAdmin
	, dm.PS
	FROM(SELECT DISTINCT GPI
		   FROM Medispan.dbo.DrugMaster
			WHERE NDC = ISNULL(@NDC, NDC)
			AND GPI = ISNULL(@GPI, GPI)
		) AS Dt 
	INNER JOIN Medispan.dbo.DrugMaster AS dm ON Dt.GPI = dm.GPI


END
GO
