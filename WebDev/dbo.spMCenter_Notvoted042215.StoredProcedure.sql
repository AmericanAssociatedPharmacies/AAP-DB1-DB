USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spMCenter_Notvoted042215]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spMCenter_Notvoted042215]
(
@pmid int
)
as
select 
top 1
case when [Department] is null then 0 else 1 end as result
from tmp_MCenter_Notvoted042215
where [Department]=@PMID
GO
