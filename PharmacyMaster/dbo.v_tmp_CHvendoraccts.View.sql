USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_tmp_CHvendoraccts]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_tmp_CHvendoraccts]
as
select distinct pmid,vendacctnum from pm_vendoraccts where vendorid=37
GO
