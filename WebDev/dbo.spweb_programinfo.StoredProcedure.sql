USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spweb_programinfo]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spweb_programinfo]
(
	@PMID int
)
as
select i.description,i.isinprogram,k.link
from v_web_programinfo i 
left join profile_links_programinfo k on i.programid=k.programid
where pmid=@PMID and i.programid not in (192, 182, 197, 207, 194, 204, 208, 183, 188) --<> 188 --rxally hack 8/13 bg
return 0
GO
