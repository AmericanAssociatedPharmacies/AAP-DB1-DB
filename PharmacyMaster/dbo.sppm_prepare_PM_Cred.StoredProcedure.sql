USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_prepare_PM_Cred]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <03/29/2010>
-- Description:	Backup and Truncate PM_Cred to recreate
-- =============================================
CREATE PROCEDURE [dbo].[sppm_prepare_PM_Cred]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table


   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'PM_Cred_bkp')
          DROP TABLE PM_Cred_bkp
  
   SELECT * into  PM_Cred_bkp from PM_Cred

 --  TRUNCATE TABLE PM_Cred
END








GO
