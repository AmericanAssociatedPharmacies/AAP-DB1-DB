USE [Purchases]
GO
/****** Object:  View [dbo].[v_last3mosByNDC]    Script Date: 12/22/2020 9:26:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_last3mosByNDC]
as
select ndc, 
max(brand) as ch_brand,
max(type) as ch_type,
count(distinct pmid) as storecount,
sum(ship_qty) as ship_qty, 
sum(ext_cost) as ext_cost
from purchases..chph_aap
where inv_date between '5/1/11' and '8/1/11'
group by ndc

GO
