USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_tmp_COGScompare]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spud_tmp_COGScompare]
as
begin
set nocount on
drop table tmp_COGS_report
--go
select t2.[ship to number],
right('0000' + cast(t2.[store number] as varchar(4)),4) as UDacct,
(cast(replace(t1.[default buy plan % (cog's)],'%','') as float))/100 as COGS0608,
t2.[cog's %] as COGS1208
into tmp_COGS_report
from CH_COGSAR_1208 t2 join CH_COGSAR_0608 t1 on t2.[ship to number] = t1.[ship to number]
--go
select c.*,
t.avg6mo,
cast(0 as float) as generic_placeholder,
t.store,t.city,t.state,t.nsterritory as terr
from tmp_COGS_report c 
left join tmp_trendreport0708_final t on c.UDAcct=t.acct_no
where abs(c.COGS1208 - c.COGS0608) > 0.001
order by c.udacct,c.[ship to number]
--go
set nocount off
end
GO
