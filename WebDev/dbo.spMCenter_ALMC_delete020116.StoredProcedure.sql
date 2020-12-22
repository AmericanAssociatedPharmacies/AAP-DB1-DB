USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spMCenter_ALMC_delete020116]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spMCenter_ALMC_delete020116]
(
	@PMID int
)
as
declare @cnt int
select @cnt=count(PMID) from pharmacymaster..v_test p where state='AL' and isMCorNPP=1 and p.PMID=@PMID
select case when @cnt=0 then 0 else 1 end as result
GO
