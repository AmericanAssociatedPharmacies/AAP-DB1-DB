USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_PharmacySystemsByVolume]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_PharmacySystemsByVolume]
as
select 
p.PMID,
s.software,
v.volume_last12mos
from pm_pharmacy p
left join software s on s.id=p.computersoftware
left join v_allvolume_last12mos v on v.pmid=p.pmid
GO
