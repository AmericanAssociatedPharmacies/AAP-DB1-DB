USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_prepare_PM_CHAccounts]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <03/29/2010>
-- Description:	Backup and Truncate AddressMaster to recreate
-- =============================================
CREATE PROCEDURE [dbo].[sppm_prepare_PM_CHAccounts]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table


--   IF EXISTS(SELECT name FROM sys.tables
--        WHERE name = 'PM_CHAccounts_bkp')
--          DROP TABLE PM_CHAccounts_bkp
--  
--   SELECT * into  PM_CHAccounts_bkp from PM_CHAccounts
--
--   TRUNCATE TABLE PM_CHAccounts
END








GO
