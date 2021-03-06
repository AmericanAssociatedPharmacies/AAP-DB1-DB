USE [reporting]
GO
/****** Object:  UserDefinedFunction [dbo].[CHGenericRebate_proposed]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[CHGenericRebate_proposed](
@GenVol float,
@ReturnEffPct int)
--return the calculated CH rebate for a quarter's sales
returns float
as
begin

declare @rebate float
declare @effectiveRate float
declare @ret float
declare @reduceby float

set @rebate = 0.0
set @reduceby = 0.025
--originally 0

if @GenVol >= 5000 set @rebate = @rebate + ((0.08-@reduceby) * dbo.vminf(5000,@GenVol-5000))
if @GenVol >= 10000 set @rebate = @rebate + ((0.14-@reduceby) * dbo.vminf(5000,@GenVol-10000))
if @GenVol >= 15000 set @rebate = @rebate + ((0.16-@reduceby) * dbo.vminf(10000,@GenVol-15000))
if @GenVol >= 25000 set @rebate = @rebate + ((0.18-@reduceby) * dbo.vminf(10000,@GenVol-25000))
if @GenVol >= 35000 set @rebate = @rebate + ((0.19-@reduceby) * dbo.vminf(15000,@GenVol-35000))
if @GenVol >= 50000 set @rebate = @rebate + ((0.20-@reduceby) * dbo.vminf(25000,@GenVol-50000))
if @GenVol >= 75000 set @rebate = @rebate + ((0.21-@reduceby) * dbo.vminf(25000,@GenVol-75000))
if @GenVol >= 100000 set @rebate = @rebate + ((0.23-@reduceby) * dbo.vminf(50000,@GenVol-100000))
if @GenVol >= 150000 set @rebate = @rebate + ((0.24-@reduceby) * (@GenVol-150000))

set @effectiveRate = @rebate/@GenVol
set @ret = @rebate
if @ReturnEffPct=1 set @ret = @effectiveRate

return @ret
end
GO
