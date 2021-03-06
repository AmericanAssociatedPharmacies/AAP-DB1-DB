USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_ServicesSurveyResponses]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_ServicesSurveyResponses]
as
select 
p.pmid,
p.aapaccountno, p.accountname,p.city,p.state, p.tm,
case when ss.pmid is null then 'no' else 'yes' end as survey
from v_pm_allwithaffiliates p left join pm_servicessurvey ss on ss.pmid=p.pmid
where aapaccountno is not null
and aapquitdate is null
--and aapstatus='ACTIVE'
--order by survey,tm,accountname
GO
