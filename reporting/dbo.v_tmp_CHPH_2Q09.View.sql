USE [reporting]
GO
/****** Object:  View [dbo].[v_tmp_CHPH_2Q09]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_tmp_CHPH_2Q09]
as
select ndc,sum(q2) as CHpurchase_2Q09,sum(q2_st_cnt) as CHpurchase_2Q09_storecount
from reporting..chph_sum_ext_cost_ndc_Quarterly 
where year=2009
group by ndc
GO
