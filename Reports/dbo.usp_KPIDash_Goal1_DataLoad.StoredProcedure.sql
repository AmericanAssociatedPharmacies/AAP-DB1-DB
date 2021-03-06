USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_KPIDash_Goal1_DataLoad]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_KPIDash_Goal1_DataLoad]

AS

SET NOCOUNT ON ;

BEGIN

	MERGE [dbo].[KPIDash_Goal1]  AS t
	USING [Staging].[KPIDash_Goal1] AS s ON s.[Date] = t.Date 

	WHEN MATCHED AND (s.UniquePharmacies <> t.UniquePharmacies OR s.Penetration <> t.Penetration) THEN
	UPDATE SET [UniquePharmacies] = s.[UniquePharmacies]
	, [Penetration] = s.[Penetration]


	WHEN NOT MATCHED THEN
	INSERT ([Date], UniquePharmacies, Penetration)
	VALUES(s.[Date], s.UniquePharmacies, s.Penetration)
	;

END

GO
