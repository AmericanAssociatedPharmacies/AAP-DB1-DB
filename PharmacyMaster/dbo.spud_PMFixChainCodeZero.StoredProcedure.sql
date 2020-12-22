USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[spud_PMFixChainCodeZero]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spud_PMFixChainCodeZero]
	
AS

SET NOCOUNT ON;

BEGIN

	
	UPDATE pharmacymaster.dbo.pm_managedcare 
	SET chaincode = NULL 
	WHERE chaincode = 0


	
END



GO
