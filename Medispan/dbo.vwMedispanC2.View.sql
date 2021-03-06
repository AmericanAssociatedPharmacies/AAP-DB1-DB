USE [Medispan]
GO
/****** Object:  View [dbo].[vwMedispanC2]    Script Date: 12/22/2020 9:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vwMedispanC2]

AS

SELECT dt.NDC
, dt.PS
, dt.GPI
, dt.IsC2Exclusion
FROM(SELECT NDC
	, PS
	, GPI
	, CONVERT(BIT,1) AS IsC2Exclusion
	FROM Medispan.dbo.DrugMaster
	WHERE DEA_Class_Code <> 'C-II' 	

	UNION ALL

	SELECT NDC
	, PS
	, GPI
	, CONVERT(BIT,0) AS IsC2Exclusion
	FROM Medispan.dbo.DrugMaster
	) AS dt






GO
