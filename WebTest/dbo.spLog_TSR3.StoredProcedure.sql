USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spLog_TSR3]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spLog_TSR3]
(
@login varchar(50),
@pmid int,
@report varchar(50),
@dt1 datetime,
@dt2 datetime,
@message varchar(255),
@isdemo varchar(5)
)
as
insert into Log_TSR3 (login,pmid,dt_run,report,dt_start,dt_end,notes,isdemo)
values(@login,@pmid,getdate(),@report,@dt1,@dt2,@message,@isdemo)
GO
