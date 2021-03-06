USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spweb_weather_alert_set]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spweb_weather_alert_set]
(
	@date varchar(255),
	@message varchar(255),
	@user varchar(50)
)
as
begin
update content_strings
set value=@date,
	modified_date=GETDATE(),modified_by=@user 
	where category='api_weather_alert' and item='date'
update content_strings
set value=@message,
	modified_date=GETDATE(),modified_by=@user 
	where category='api_weather_alert' and item='message'
end
GO
