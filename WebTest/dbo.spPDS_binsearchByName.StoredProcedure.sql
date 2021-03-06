USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spPDS_binsearchByName]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPDS_binsearchByName]
(
@search varchar(255)
)
as
begin
--declare @search varchar(255)
--set @search='BCBS'
declare @buf varchar(255)
set @buf = 'select distinct * from openquery(uniteddb,''select '
--+ 'distinct plan_name,ansi_bin as bin'
+ ' distinct CONTRACT_ID,PLAN_NAME,ANSI_BIN as BIN,PCN,GROUP_NUM as GROUP_,SERVICE_AREA'
+ ' from united.plan_contract '
+ ' where active<>0 '
+ ' and plan_name like ''''%' + @search + '%'''''')'
+ ' order by PLAN_NAME,BIN'
exec(@buf)
end
GO
