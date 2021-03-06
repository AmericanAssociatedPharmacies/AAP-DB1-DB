USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spMCenter_OhioAAP]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spMCenter_OhioAAP]
(
	@PMID int
)
as
-- Message Center return 'result' field, value 1 to show message else 0
-- Ohio AAP 8/15 BG
BEGIN
declare @cnt int
select @cnt=count(PMID) from pharmacymaster..v_test p where state='OH' and isAAP=1 and p.PMID=@PMID
select case when @cnt=0 then 0 else 1 end as result
END
GO
