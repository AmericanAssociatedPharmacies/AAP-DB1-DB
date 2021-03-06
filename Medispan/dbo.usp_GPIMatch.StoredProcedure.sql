USE [Medispan]
GO
/****** Object:  StoredProcedure [dbo].[usp_GPIMatch]    Script Date: 12/22/2020 4:38:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GPIMatch]

	@GPI VARCHAR(14) = NULL
	, @NDC VARCHAR(11) = NULL
	, @DrugName VARCHAR (200) = Null
	, @APINum VARCHAR (14) = Null


AS

SET NOCOUNT ON;

BEGIN

	SELECT dt.NDC
	, dt.GPI
	, dt.DrugName
	, dt.MFG
	, dt.DrugType
	, dt.Form
	, dt.Strength
	, dt.RouteAdmin
	, dt.PS
	, dt.APINum
	FROM(SELECT DISTINCT dm.NDC
				  , dm.GPI
				  , dm.DrugName
				  , dm.MFG
				  , dm.DrugType
				  , dm.Form
				  , dm.Strength
				  , dm.RouteAdmin
				  , dm.PS
				  , ISNULL (API_ItemNumber, 'NOAPINUM') AS APINum
				  FROM Medispan.dbo.DrugMaster AS dm
				  LEFT OUTER JOIN Reports.dbo.API_NDC_ItemNumber AS it ON dm.NDC = it.NDC
				  WHERE dm.NDC = ISNULL(@NDC, dm.NDC)
					AND dm.GPI = ISNULL(@GPI, GPI)
					AND dm.DrugName LIKE ISNULL(CONCAT(@DrugName,'%'), dm.DrugName)
				  ) AS dt
	WHERE dt.APINum = ISNULL(@APINum, dt.APINum)
	ORDER BY dt.DrugName, dt.MFG, dt.NDC, dt.PS

END
GO
