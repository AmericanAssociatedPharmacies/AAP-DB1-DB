USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spMCenter_PVAAnnounce]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spMCenter_PVAAnnounce]
(
	@PMID int
)
as
-- 8/19/14 BG -- AAP excluding PIPCO and IPA
BEGIN
declare @cnt int
select @cnt = count(1) from v_web_userdata where pmid=@PMID 
and isAAP=1 and isnull(affiliate,'') not in ('IPA','PIPCO')
select case when @cnt > 0 then 1 else 0 end as result
END

--grant exec on [spMCenter_PVAAnnounce] to webdevuser

GO
