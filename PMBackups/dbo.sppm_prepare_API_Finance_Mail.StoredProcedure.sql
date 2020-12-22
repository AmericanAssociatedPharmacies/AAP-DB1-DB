USE [PMBackups]
GO
/****** Object:  StoredProcedure [dbo].[sppm_prepare_API_Finance_Mail]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <03/29/2010>
-- Description:	Backup and Truncate AddressMaster to recreate
-- =============================================
CREATE PROCEDURE [dbo].[sppm_prepare_API_Finance_Mail]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table


   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_API_Finance_Mail_bkp')
          DROP TABLE tmp_API_Finance_Mail_bkp
  
   SELECT * into  tmp_API_Finance_Mail_bkp from tmp_API_Finance_Mail

   TRUNCATE TABLE tmp_API_Finance_Mail
END








GO
