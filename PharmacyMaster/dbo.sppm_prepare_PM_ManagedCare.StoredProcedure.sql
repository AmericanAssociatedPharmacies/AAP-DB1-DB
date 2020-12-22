USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_prepare_PM_ManagedCare]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <03/29/2010>
-- Description:	Backup and Truncate PM_ManagedCare to recreate
-- =============================================
CREATE PROCEDURE [dbo].[sppm_prepare_PM_ManagedCare]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table


   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'PM_ManagedCare_bkp')
          DROP TABLE PM_ManagedCare_bkp
  
   SELECT * into  PM_ManagedCare_bkp from PM_ManagedCare

--   TRUNCATE TABLE PM_ManagedCare
END








GO
