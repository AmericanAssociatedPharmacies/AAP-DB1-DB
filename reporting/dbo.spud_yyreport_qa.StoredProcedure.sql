USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_yyreport_qa]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spud_yyreport_qa]
as
select vv.vendor, t.*, vv.factor, vv.[total percent rebate] from 
vvcopy vv join tmp_yyreport_step2 t on vv.vendor_id=t.vendor_id
where (t.volume is not null or t.rebate is not null) and  vv.[active?]='TRUE'
order by vv.vendor, t.date

GO
