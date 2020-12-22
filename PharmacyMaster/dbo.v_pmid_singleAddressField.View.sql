USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_pmid_singleAddressField]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_pmid_singleAddressField]
as
select pmid, city + ', ' + state + ' ' + zip as address
from pharmacymaster..v_pm_allwithaffiliates
GO
