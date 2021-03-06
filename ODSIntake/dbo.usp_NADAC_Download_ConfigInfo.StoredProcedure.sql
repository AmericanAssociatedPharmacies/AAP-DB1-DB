USE [ODSIntake]
GO
/****** Object:  StoredProcedure [dbo].[usp_NADAC_Download_ConfigInfo]    Script Date: 12/22/2020 4:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_NADAC_Download_ConfigInfo]

AS

SET NOCOUNT ON;

BEGIN


	SELECT dt.URLDownload
	, cj.FileDestination
	FROM(SELECT 1 AS C1
		--, URLDownload
		--, CONVERT(VARCHAR(1000), 'http://data.medicaid.gov/api/views/a4y5-998d/rows.csv?accessType=DOWNLOAD&bom=true&format=true') AS URLDownload
		, CONVERT(VARCHAR(1000), 'https://data.medicaid.gov/api/views/6gk3-9bxc/rows.csv?accessType=DOWNLOAD&bom=true&format=true') AS URLDownload -- New 08/05/2020 RSE
		FROM dbo.NADAC_Config
		) AS dt
	CROSS JOIN(SELECT 1 AS C1 
				, CONVERT(VARCHAR(500), '\\fs1.aap.local\Server\IT Department\NADAC\NADAC_' + CONVERT(VARCHAR, DateKey) + '.csv') AS FileDestination
				FROM Pricing.dbo.DateDim
				WHERE TheDate =  DATEADD(DAY, 0 ,DATEDIFF(DAY, 0 ,GETDATE()))
				) AS cj
	WHERE dt.C1 = cj.C1


END
GO
