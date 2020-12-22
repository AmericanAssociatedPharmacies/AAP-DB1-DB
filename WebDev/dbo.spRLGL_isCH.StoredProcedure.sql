USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spRLGL_isCH]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spRLGL_isCH]
(
@pmid int
)
as
select case when @pmid in
(select pmid from pharmacymaster..pm_rebates_chaap where pmid=@pmid and [date] > dateadd(m,-4,getdate()))
then 1 else 0 end as ret
GO
