USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[spaap_truncate_PMUpdate_All_staging]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <08/29/2008>
-- Description:	Truncate PMUpdate_Active_staging table
-- =============================================
CREATE PROCEDURE [dbo].[spaap_truncate_PMUpdate_All_staging]

AS
	BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table
   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'PMUpdate_All_staging_bkp')
          DROP TABLE PMUpdate_All_staging_bkp

	SELECT * INTO PMUpdate_All_staging_bkp from  PMUpdate_All_staging

	TRUNCATE TABLE PMUpdate_All_staging

    END









GO
