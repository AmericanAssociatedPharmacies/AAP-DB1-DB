USE [Purchases]
GO
/****** Object:  View [dbo].[v_last3mosByNDC_diag]    Script Date: 12/22/2020 9:26:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_last3mosByNDC_diag]
as
select ndc, 
max(brand) as ch_brand_max,
min(brand) as ch_brand_min,
max(type) as ch_type_max,
min(type) as ch_type_min,
count(distinct pmid) as storecount,
sum(ship_qty) as ship_qty, 
sum(ext_cost) as ext_cost
from purchases..chph_aap
where inv_date between '5/1/11' and '8/1/11'
group by ndc

GO
