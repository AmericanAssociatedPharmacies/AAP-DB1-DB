USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spweb_weather_alert_banner_get]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spweb_weather_alert_banner_get]
as
select isnull(dateExpires,convert(datetime,'1/1/2000')) as dateExpires from content_banners_homepage
where id=40
GO
