USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_managedcare_bg]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_managedcare_bg]
as
select distinct p.pmid,m.*,mc.chaincode,mc.[mceffectivedate],mc.[mcquitdate] 
from claims..v_UDMember m
left join pharmacymaster..v_pm_allwithaffiliates p on m.nabp=p.ncpdp
left join pharmacymaster..pm_managedcare mc on p.pmid=mc.pmid
GO
