USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spMCenter_MCandRx30]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spMCenter_MCandRx30]
(
	@PMID int
)
as
declare @cnt int
select @cnt = count(1) from v_web_userdata where software='rx30' and isMC=1 and mcquitdate is null and pmid=@PMID 
select case when @cnt > 0 then 1 else 0 end as result
GO
