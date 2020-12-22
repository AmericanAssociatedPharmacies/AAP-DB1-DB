USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_PM_Groups]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_PM_Groups]
AS

	select gx.pmid, Group_Name,g.AffiliateID from pharmacymaster..PM_Groups g
join pharmacymaster..PM_Groups_xref gx on g.group_id = gx.group_id
GO
