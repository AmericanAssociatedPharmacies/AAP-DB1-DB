USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spweb_weather_alert_banner_set]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[spweb_weather_alert_banner_set]
(
	@dtex varchar(20),
	@enabled int
)
as
begin
update content_banners_homepage
set dateExpires = (case when @dtex='' then null else @dtex end),
sortorder = (case when @enabled=1 then 1 else null end)
where id=40
end
GO
