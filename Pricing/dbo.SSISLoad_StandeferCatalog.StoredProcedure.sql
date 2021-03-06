USE [Pricing]
GO
/****** Object:  StoredProcedure [dbo].[SSISLoad_StandeferCatalog]    Script Date: 12/22/2020 4:51:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<LeeAnn Carrell>
-- Create date: <1-16-2017>
-- Description:	<The purpose of this stored procedure is to import Cardinal's pricing data
--into the CardinalPricing_forCompare table that is used by Ben at API and into CardinalPricing_History
--for AAP to track historical price changes.>
-- =============================================
CREATE PROCEDURE [dbo].[SSISLoad_StandeferCatalog]

AS
--DELETE FROM Pricing.[dbo].[CardinalPricing_forCompare] WHERE
--DATEDIFF("day", Date, GETDATE()) >= 90

TRUNCATE TABLE ODSIntake.staging.StandeferCatalog

--SSIS File Execution
--Loads Standefer Catalog into ODSIntake.staging.StandeferCatalog
BEGIN TRAN
	DECLARE @intExecutionID bigint
	EXEC SSISDB.catalog.create_execution 'SSIS_Executions', 'CardinalPricing', 'SSIS_CardinalPricing.dtsx', NULL, 0, @intExecutionID out
	--EXEC catalog.set_execution_parameter_value @intExecutionID, 30, 'Parameter_Name', "VALUE"
	EXEC [SSISDB].catalog.start_execution @intExecutionID
COMMIT
GO
