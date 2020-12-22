USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_prepare_BASHAS_SSIS]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 4/26/2010
-- Description:	load Cardinal CHPH file for AAP
-- =============================================
CREATE PROCEDURE [dbo].[sppm_prepare_BASHAS_SSIS] 
 
AS

BEGIN
    IF EXISTS(SELECT name FROM purchases.sys.tables
        WHERE name = 'CH_BASHAS_BKP')
          DROP TABLE Purchases..CH_BASHAS_BKP
 

	SELECT * into Purchases..CH_BASHAS_BKP from Purchases..CH_BASHAS

END

GO
