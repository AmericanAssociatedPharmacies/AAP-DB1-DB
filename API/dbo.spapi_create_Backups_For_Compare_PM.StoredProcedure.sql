USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spapi_create_Backups_For_Compare_PM]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <08/29/2008>
-- Description:	Remove duplicates from StoreMember for the AccountMaster table
-- =============================================
CREATE PROCEDURE [dbo].[spapi_create_Backups_For_Compare_PM]

AS
	BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table
 
   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'APIAccountMaster_Orig_bkp')
          DROP TABLE APIAccountMaster_Orig_bkp

	SELECT * into api..APIAccountMaster_Orig_bkp from api..APIAccountMaster_Orig
 
  
END








GO
