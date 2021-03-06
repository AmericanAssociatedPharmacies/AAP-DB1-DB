USE [reporting]
GO
/****** Object:  UserDefinedFunction [dbo].[AvgNoLeading0s]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[AvgNoLeading0s](@m1 numeric(38,2),
@m2 numeric(38,2),
@m3 numeric(38,2),
@m4 numeric(38,2),
@m5 numeric(38,2),
@m6 numeric(38,2)) 
returns numeric(38,2)
as
begin
declare @icount int
declare @ret numeric(38,2)
set @icount=6
if @m1 = 0 begin
set @icount=5
if @m2 = 0 begin
set @icount=4
if @m3 = 0 begin
set @icount =3
if @m4 = 0 begin
set @icount = 2
if @m5 = 0 begin
set @icount = 1
if @m6 = 0 begin
set @icount = 0
end
end
end
end
end
end

if @icount = 0
set @ret = 0.0
else
set @ret = (@m1 + @m2 + @m3 + @m4 + @m5 + @m6) / cast(@icount as numeric(38,2))

return @ret
end

GO
