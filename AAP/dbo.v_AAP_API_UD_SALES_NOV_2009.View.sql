USE [AAP]
GO
/****** Object:  View [dbo].[v_AAP_API_UD_SALES_NOV_2009]    Script Date: 12/22/2020 9:04:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create VIEW [dbo].[v_AAP_API_UD_SALES_NOV_2009]
AS

  select  am.accountname as Name,am.city as City,am.state as State,am.territory as [Terr.],
am.aapaccountno as [AAP AccountNo],am.aapparentno as [AAP ParentNo],am.apiaccountno as [API AccountNo]
,am.udaccountno as [UD AccountNo],am.udparentno as [UD ParentNo],
api.november as API_WH_NOV_2009, apic.november as API_CH_NOV_2009,ch.november as UD_CH_NOV_2009
from AccountMasterActive_Distinct am 
left outer join (select whaccountid,november from api.dbo.API_Sum_Totamt_Mnthly where year = 2009) api on
am.apiaccountno = api.whaccountid
left outer join (select [api#],november from api.dbo.APICardVolume  ) apic
on am.apiaccountno = apic.[api#]
left outer join (select store,november from reporting.dbo.chph_sum_ext_cost_mnthly where year = 2009) ch
on am.udaccountno = ch.store 
where (api.november is not null or apic.november is not null 
or ch.november is not null)
GO
