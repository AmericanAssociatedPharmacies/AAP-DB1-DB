USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_Address_Mailing_API_delete]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_Address_Mailing_API_delete]
AS

	SELECT * FROM ( 
	SELECT * , Rank() OVER (Partition BY pmid order by address_type_id desc) as Rank
	FROM (SELECT     *
				FROM         PharmacyMaster.dbo.PM_AddressMaster
				WHERE       address_type_id in (4,5)     ) pm 
		) tmp where   Rank = 1 
GO
