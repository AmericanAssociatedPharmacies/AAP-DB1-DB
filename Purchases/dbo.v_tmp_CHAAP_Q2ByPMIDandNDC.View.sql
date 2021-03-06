USE [Purchases]
GO
/****** Object:  View [dbo].[v_tmp_CHAAP_Q2ByPMIDandNDC]    Script Date: 12/22/2020 9:26:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_tmp_CHAAP_Q2ByPMIDandNDC]
as
select pmid,ndc, 
count(ndc) as orders, 
sum(ship_qty) as ship_qty,
sum(ext_cost) as ext_cost,
max(item_descr) as descr
from CHPH_AAP
where inv_date >='6/1/2010' and inv_date <'9/1/2010'
and pmid=102697
and ship_qty <> 0
and ext_cost <> 0
group by pmid,ndc
GO
