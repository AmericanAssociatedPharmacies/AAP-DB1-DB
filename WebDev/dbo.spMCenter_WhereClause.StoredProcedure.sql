USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spMCenter_WhereClause]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spMCenter_WhereClause]
(
	@PMID int,
	@where nvarchar(255)
)
as
-- Message Center return 'result' field, value 1 to show message else 0
-- Ohio AAP 8/15 BG
BEGIN
declare @sql nvarchar(max)
declare @cnt int
set @sql = 'select case when count(1) > 0 then 1 else 0 end as result from pharmacymaster..v_test p where p.PMID=' + convert(varchar,@pmid) + N' and ' + @where
exec sp_executesql @sql
END
GO
