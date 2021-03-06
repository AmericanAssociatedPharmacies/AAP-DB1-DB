USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spLog_TSR3]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spLog_TSR3]
(
@login varchar(50),
@pmid int,
@report varchar(50),
@dt1 datetime,
@dt2 datetime,
@message_notes varchar(255),
@isdemo varchar(5),
@params varchar(255),
@source varchar(50)
)
as
insert into Log_TSR3 (login,pmid,dt_run,report,dt_start,dt_end,notes,isdemo,[parameters],[source])
values(@login,@pmid,getdate(),@report,@dt1,@dt2,@message_notes,@isdemo,@params,@source)

GO
