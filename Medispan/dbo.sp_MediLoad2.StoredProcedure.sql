USE [Medispan]
GO
/****** Object:  StoredProcedure [dbo].[sp_MediLoad2]    Script Date: 12/22/2020 4:38:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 04/19/2012
--Medispan Load Data
-- =============================================
CREATE PROCEDURE [dbo].[sp_MediLoad2] 

AS
BEGIN
	ALTER TABLE M25_A
	ADD CONSTRAINT [PK_NDC]
	PRIMARY KEY CLUSTERED
	(
	[NDC_UPC_HRI] ASC
	) 

END
GO
