USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_yyreport_stepA]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spud_yyreport_stepA]
as
begin
set nocount on
drop table tmp_yyreport_stepA
select * INTO tmp_yyreport_stepA from v_vendorvolume
set nocount off 

end



GO
