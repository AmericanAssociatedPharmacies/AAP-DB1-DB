USE [AAP]
GO
/****** Object:  View [dbo].[v_tmp_UDCH4Q09]    Script Date: 12/22/2020 9:04:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_tmp_UDCH4Q09]
as
select u.acct_no, sum(u.october+u.november+u.december) as UDCH4Q09
from reporting..volumecalyy u
where u.year='2009' and u.vendor_id in (65,86)
group by u.acct_no
--order by u.acct_no
GO
