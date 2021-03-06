USE [reporting]
GO
/****** Object:  UserDefinedFunction [dbo].[CHGenericRebate]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[CHGenericRebate](
@RxVol float,
@GenVol float)
--return the calculated CH rebate for a quarter's sales
returns float
as
begin
declare @gcr float
declare @factor float 
declare @ret float
set @gcr = @GenVol/@RxVol
set @factor = 0.0
if @gcr >= 0.05 set @factor = 0.0275
if @gcr >= 0.06 set @factor = 0.035
if @gcr >= 0.07 set @factor = 0.05
if @gcr >= 0.08 set @factor = 0.06
if @gcr >= 0.09 set @factor = 0.0675
if @gcr >= 0.10 set @factor = 0.075
if @gcr >= 0.11 set @factor = 0.085

set @ret = @GenVol * @factor

return @ret
end
GO
