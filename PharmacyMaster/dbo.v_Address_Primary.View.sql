USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_Address_Primary]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_Address_Primary]
AS

 SELECT     *
	FROM         PharmacyMaster.dbo.PM_AddressMaster
	WHERE       address_type_id = 1  
 
GO
