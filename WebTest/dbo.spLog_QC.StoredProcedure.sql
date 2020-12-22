USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spLog_QC]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc
[dbo].[spLog_QC]
(
@tabname varchar(50)
,@login varchar(50)
,@pmid int
,@userrole varchar(15)
,@IP varchar(25)
)
as
begin
insert into Log_QC (
tabname
,login
,pmid
,date_accessed
,userrole
,IP
)
values(@tabname,@login,@pmid,getdate(),@userrole,@IP)
end
GO
