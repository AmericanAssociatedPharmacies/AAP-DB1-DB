USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_TEReportV1]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: David Bohler
-- Create date: 10/19/2017
-- Description: Recreation of the sproc for the TEReport V1 due to the orginal being over-written. 
-- Sample Test Parameters: NDC: 63629294707 GPI: 65991702100305
-- =============================================
CREATE PROCEDURE [dbo].[usp_TEReportV1] 
@NDC VARCHAR(14) = NULL,
@GPI VARCHAR(14) = NULL
AS
     BEGIN
         SET NOCOUNT ON;
         SELECT dm.NDC,
                dt.GPI,
                dm.DrugName,
                dm.MFG,
                dm.DrugType,
                dm.Form,
                dm.Strength,
                dm.RouteAdmin,
                dm.PS
         FROM
         (
             SELECT DISTINCT
                    GPI
             FROM Medispan.dbo.DrugMaster
             WHERE NDC = ISNULL(@NDC, NDC)
                   AND GPI = ISNULL(@GPI, GPI)
         ) AS dt
         INNER JOIN Medispan.dbo.DrugMaster AS dm ON dt.GPI = dm.GPI
	    ORDER BY dm.PS;
     END;
GO
