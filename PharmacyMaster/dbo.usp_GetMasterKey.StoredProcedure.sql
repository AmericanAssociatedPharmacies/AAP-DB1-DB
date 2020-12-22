USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetMasterKey]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetMasterKey]


AS

SET NOCOUNT ON;


BEGIN


	 SELECT dt.PharmacyKey
	 FROM(SELECT CONVERT(VARBINARY(8), GETDATE()) AS PharmacyKey
	 ) AS dt


END
GO
