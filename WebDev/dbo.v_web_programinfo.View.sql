USE [WebDev]
GO
/****** Object:  View [dbo].[v_web_programinfo]    Script Date: 12/22/2020 9:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_web_programinfo]
as
select * from pharmacymaster..v_web_pm_userprograms
GO
