USE [Medispan]
GO
/****** Object:  StoredProcedure [dbo].[sp_MediLoad1]    Script Date: 12/22/2020 4:38:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 04/19/2012
--Medispan Load Data
-- =============================================
CREATE PROCEDURE [dbo].[sp_MediLoad1] 

AS
BEGIN

	ALTER TABLE M25_A 
	ALTER COLUMN [NDC_UPC_HRI] Varchar(11) NOT NULL 

END
GO
