USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spweb_log_APIgateway]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spweb_log_APIgateway]
(
@login varchar(50),
@nslogin varchar(50),
@PMID int,
@userrole varchar(50)
)
as
begin	
insert into login_history_API (login,nslogin,PMID,userrole) values(@login,@nslogin,@PMID,@userrole)
end
GO
