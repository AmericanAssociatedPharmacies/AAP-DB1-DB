USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_PM_App_Reports_Address_Physical]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_PM_App_Reports_Address_Physical]
AS
SELECT     PMID, Address_Type_Id, Address, Address2, City, County, State, Zip
FROM         dbo.PM_AddressMaster
WHERE     (Address_Type_Id = 1)
GO
