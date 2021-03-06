USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_AndaVolume2010]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_AndaVolume2010]
as
SELECT     p.PMID, v.dt AS date, sum(v.volume) as volume
FROM         reporting.dbo.VolumeNorm AS v LEFT OUTER JOIN
                      dbo.PM_Pharmacy AS p ON v.acct_no = p.UDAccountNo OR v.acct_no = p.AAPAccountNo
WHERE     (v.dt >= '1/1/2010') AND (v.vendor_id in (199,221)) AND (v.volume <> 0)
group by PMID, dt
--order by PMID,dt
GO
