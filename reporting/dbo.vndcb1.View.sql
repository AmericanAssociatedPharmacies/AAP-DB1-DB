USE [reporting]
GO
/****** Object:  View [dbo].[vndcb1]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vndcb1]
as
select r.ndc, r.gcn_seqno, gx.gcn, FDB.dbo.fud_fdb2type(r.gpi,r.ndcgi1) as type, r.LN60 as name, s.STR60 as strength, 
r.ps as psize, r.DEA, FDB.dbo.fud_fdbHCFA(r.hcfa_desi1) as HCFA,
us.CIN, us.UnitPrice as USUnit,us.SellPrice as USPkg
from ((FDB.dbo.RNDC14 r left join FDB.dbo.RGCN0 gx on r.gcn_seqno = gx. gcn_seqno) 
left join FDB.dbo.RGCNSEQ4 s on r.gcn_seqno = s.gcn_seqno) left join CHUSource0508 us on r.ndc=us.ndc
--order by NDC

GO
