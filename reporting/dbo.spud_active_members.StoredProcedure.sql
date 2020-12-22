USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_active_members]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spud_active_members]
as
set nocount on
begin
select m.*, t.type from dbo.udb_active_members m left join membertype t on m.acct_no=t.acct_no
end
set nocount off


GO
