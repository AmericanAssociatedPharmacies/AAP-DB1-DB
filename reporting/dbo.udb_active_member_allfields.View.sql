USE [reporting]
GO
/****** Object:  View [dbo].[udb_active_member_allfields]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[udb_active_member_allfields] as
select * from openquery(UNITEDDB,'select * from united.store_member where quitdate is null and effective is not null')









GO
