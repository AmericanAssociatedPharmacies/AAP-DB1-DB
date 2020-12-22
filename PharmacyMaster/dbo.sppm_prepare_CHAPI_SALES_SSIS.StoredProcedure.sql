USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_prepare_CHAPI_SALES_SSIS]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 4/26/2010
-- Description:	load Cardinal CHPH file for AAP
-- =============================================
CREATE PROCEDURE [dbo].[sppm_prepare_CHAPI_SALES_SSIS] 
 
AS

BEGIN
    IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'CHAPI_SALES_BKP')
          DROP TABLE CHAPI_SALES_BKP
 

	SELECT * into CHAPI_SALES_BKP from CHAPI_SALES

END

GO
