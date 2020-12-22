USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spweb_copy_pm_to_webdev]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spweb_copy_pm_to_webdev]
as
begin
drop table ex_user_data
select * into ex_user_data from v_web_userdata_FromSource
drop table ex_user_pm_services
select * into ex_user_pm_services from v_web_pm_services_FromSource
drop table ex_user_programinfo
select * into ex_user_programinfo from v_web_programinfo_FromSource
end

GO
