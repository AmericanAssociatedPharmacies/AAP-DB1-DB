USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_yyreport_step1]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spud_yyreport_step1]
as
begin
set nocount on
truncate table tmp_yyreport_step1
insert into tmp_yyreport_step1
select * from udb_volume
where fy_end in ('2006','2007','2008')
set nocount off
end

GO
