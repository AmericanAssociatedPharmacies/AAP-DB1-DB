USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spRCare_report_pharmacies]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spRCare_report_pharmacies]
as
select * from dbo.RxCareParticipation
order by date_registered desc
GO
