USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spMCenter_temp_Credentialling042915]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spMCenter_temp_Credentialling042915]
(
@PMID int
)
as
declare @ret int
select @ret=PMID
from tmp_MCenter_Credentialing043015 t
where t.PMID=@PMID
and t.status='Not started'
select case when @ret is null then 0 else 1 end as result
GO
