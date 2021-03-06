USE [ODSIntake]
GO
/****** Object:  StoredProcedure [Staging].[usp_KPI_AllyScript_DataLoad_SSIS]    Script Date: 12/22/2020 4:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [Staging].[usp_KPI_AllyScript_DataLoad_SSIS]
	@ExecutionID BIGINT OUTPUT

AS

SET NOCOUNT ON;

BEGIN

DECLARE @intExecutionID BIGINT

	EXEC [SSISDB].[catalog].[create_execution] 
		@folder_name = 'KPI'
		, @Project_name = 'KPI_AllyScripts'
		, @package_name = 'KPI_AllyScripts_ODSIntake_DataLoad.dtsx'
		, @use32bitruntime = FALSE
		, @execution_id = @intExecutionID OUT

	EXEC [SSISDB].[catalog].[start_execution] @intExecutionID

	SET @ExecutionID = @intExecutionID

END



GO
