USE [ShipmentInfo]
GO
/****** Object:  StoredProcedure [Staging].[usp_TruncateTable_ShipmentDataTable]    Script Date: 12/22/2020 5:14:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Staging].[usp_TruncateTable_ShipmentDataTable]

AS

BEGIN

	  TRUNCATE TABLE [Staging].[ShipmentDataTable]

END

GO
