USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_PM_CommunicationPreferences]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create VIEW [dbo].[v_PM_CommunicationPreferences]
AS
SELECT commPreference, Description FROM PM_CommunicationPreferences union all select '' as 'commpreference', '' as 'Description'
GO
