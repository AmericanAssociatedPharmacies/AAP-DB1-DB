USE [reporting]
GO
/****** Object:  UserDefinedFunction [dbo].[vmaxf]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[vmaxf] (
@f1 float,
@f2 float)
returns float
as
begin
declare @ret float
set @ret = @f1
if @f2 > @f1 set @ret = @f2
return @ret
end
GO
