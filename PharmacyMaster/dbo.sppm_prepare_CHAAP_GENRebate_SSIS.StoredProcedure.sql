USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_prepare_CHAAP_GENRebate_SSIS]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 4/26/2010
-- Description:	load Cardinal CHPH file for AAP
-- =============================================
CREATE PROCEDURE [dbo].[sppm_prepare_CHAAP_GENRebate_SSIS] 
 
AS

BEGIN
    IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'CHAAP_GENRebate_BKP')
          DROP TABLE CHAAP_GENRebate_BKP
 

	SELECT * into CHAAP_GENRebate_BKP from CHAAP_GENRebate

END

GO
