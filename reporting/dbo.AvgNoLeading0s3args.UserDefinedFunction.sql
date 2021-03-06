USE [reporting]
GO
/****** Object:  UserDefinedFunction [dbo].[AvgNoLeading0s3args]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[AvgNoLeading0s3args](
@m1 float,
@m2 float,
@m3 float)
returns float
as
begin
declare @icount int
declare @ret float
set @icount=3
if @m1 = 0 begin
set @icount=2
if @m2 = 0 begin
set @icount=1
if @m3 = 0 begin
set @icount =0
end
end
end

if @icount = 0
set @ret = 0.0
else
set @ret = (@m1 + @m2 + @m3) / cast(@icount as float)

return @ret
end
GO
