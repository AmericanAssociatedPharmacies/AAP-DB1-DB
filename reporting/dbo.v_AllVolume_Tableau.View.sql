USE [reporting]
GO
/****** Object:  View [dbo].[v_AllVolume_Tableau]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_AllVolume_Tableau]
AS

SELECT *
FROM PharmacyMaster..ALL_Volume
WHERE year(date) >= 2016
GO
