USE [WebTest]
GO
/****** Object:  View [dbo].[v_web_programinfo_links]    Script Date: 12/22/2020 9:42:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_web_programinfo_links]
as
select p.*,dt1.description from links_programinfo p
left join (select distinct programid,description from v_web_programinfo) dt1
on p.programid=dt1.programid
--order by p.programid
GO
