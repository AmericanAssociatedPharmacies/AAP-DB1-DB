USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spPDS_binsearchByName_v1]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spPDS_binsearchByName_v1]
(
@search varchar(255)
)
as
begin
--declare @search varchar(255)
--set @search='BCBS'
declare @buf varchar(255)
set @buf = 'select distinct * from openquery(uniteddb,''select '
+ 'distinct plan_name,ansi_bin as bin'
+ ' from united.plan_contract '
+ ' where active<>0 '
+ ' and plan_name like ''''%' + @search + '%'''''')'
+ ' order by plan_name'
exec(@buf)
end
GO
