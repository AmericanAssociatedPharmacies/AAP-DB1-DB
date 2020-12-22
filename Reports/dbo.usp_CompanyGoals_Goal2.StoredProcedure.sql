USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_CompanyGoals_Goal2]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CompanyGoals_Goal2]
AS

DECLARE @Goal TABLE
(ID INT IDENTITY(1, 1) PRIMARY KEY
, Date DATETIME NOT NULL
, Totals DECIMAL(18,2) NOT NULL
) 

INSERT INTO @Goal
EXEC Reports.dbo.usp_CompanyGoals_Goal2A

SELECT *
FROM @Goal
GO
