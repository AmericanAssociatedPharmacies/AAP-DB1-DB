USE [ODSIntake]
GO
/****** Object:  StoredProcedure [dbo].[usp_StartSQLJob_PharmacyMasterETL]    Script Date: 12/22/2020 4:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_StartSQLJob_PharmacyMasterETL]

AS

SET NOCOUNT ON;

BEGIN
  
	EXEC msdb.dbo.sp_start_job N'PharmacyMaster ETL'   

END
GO
