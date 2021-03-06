USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spMCenter_AAPBOD]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spMCenter_AAPBOD]
(
	@PMID int
)
as
-- Message Center return 'result' field, value 1 to show message else 0
-- AAP BOD 3/2015 BG
BEGIN
select case when b.PMID is null then 0 else 1 end as result
from pharmacymaster..AAPBOD b where b.PMID=@PMID
END

grant exec on spMCenter_AAPBOD to webdevuser
GO
