USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spbg_test1]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spbg_test1]
as

declare @broken integer
set @broken = 1

if '1'='0'
begin
if exists (
	select  *
	from
		tempdb.dbo.sysobjects o
	where
		o.xtype in ('U')	and
		o.id = object_id( N'tempdb..#temptable' )
	)
	begin drop table #temptable end
end

if @broken = 1
begin
  select 'true condition' as foo into #temptable end


select * from #temptable

GO
