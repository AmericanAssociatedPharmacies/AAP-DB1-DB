USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_ALL_VolumeTotalsByTM]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_ALL_VolumeTotalsByTM]
AS
SELECT   distinct date as DATE,   rank() OVER (ORDER BY a.DATE,p.TM) as TID,   p.TM,
 sum(AAPNetSales) as AAPNetSales,
 sum(AAPBrand) as AAPBrand,
 sum(AAPGENTotal) as AAPGENTotal,
 sum(AAPGENTotalSrc) as AAPGENTotalSrc,
 sum(AAPGENExcl) as AAPGENExcl,
 sum(AAPOTC) as AAPOTC,
 sum(AAPOther) as AAPOther,
 sum(UDNetSales) as UDNetSales,
 sum(WHAPIBrand) as WHAPIBrand,
 sum(WHAPIBrandUnits) as WHAPIBrandUnits,
 sum(WHAPIGeneric) as WHAPIGeneric,
 sum(WHAPIGenericUnits) as WHAPIGenericUnits,
 sum(WHAPIOTC) as WHAPIOTC,
 sum(WHAPIOTCUnits) as WHAPIOTCUnits,
 sum(WHAPITotal) as WHAPITotal,
 sum(MLTotal) as MLTotal
from all_volume a 
left outer join(
select tm,pmid from v_pm_allwithaffiliatesForSSAS
) p
on a.pmid = p.pmid group by  tm,date

GO
