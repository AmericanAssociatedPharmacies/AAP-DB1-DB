USE [WebTest]
GO
/****** Object:  View [dbo].[v_web_pm_services]    Script Date: 12/22/2020 9:42:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_web_pm_services]
as
select * from
ex_user_pm_services
GO
