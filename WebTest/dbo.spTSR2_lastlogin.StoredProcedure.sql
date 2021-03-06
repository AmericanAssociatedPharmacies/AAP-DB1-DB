USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spTSR2_lastlogin]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spTSR2_lastlogin]
(
@username varchar(50)
)
as
select top 1 convert(varchar,dt,1) as lastdate
from login_history 
where username=@username
and dt < DATEADD(d,0,DATEDIFF(d,0,GETDATE()))
order by dt desc
GO
