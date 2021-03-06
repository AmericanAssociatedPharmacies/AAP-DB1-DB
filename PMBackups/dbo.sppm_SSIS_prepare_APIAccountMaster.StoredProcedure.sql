USE [PMBackups]
GO
/****** Object:  StoredProcedure [dbo].[sppm_SSIS_prepare_APIAccountMaster]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <03/29/2010>
-- Description:	Backup and Truncate APIAccountMaster_Orig to recreate
-- =============================================
CREATE PROCEDURE [dbo].[sppm_SSIS_prepare_APIAccountMaster]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table


   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_APIAccountMaster_Orig_bkp')
          DROP TABLE tmp_APIAccountMaster_Orig_bkp
  
   SELECT * into  tmp_APIAccountMaster_Orig_bkp from tmp_APIAccountMaster_Orig

   TRUNCATE TABLE tmp_APIAccountMaster_Orig
END








GO
