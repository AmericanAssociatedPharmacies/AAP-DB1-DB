USE [WebDev]
GO
/****** Object:  UserDefinedFunction [dbo].[fnRLGL_Pricedate2]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BG
-- Create date: 5/14/14 generalized 10/14 to any number of months prior
-- Description:	RLGL price lookup: return 6 mo prior to fill date
-- Comment: this is a bit of a hack to get dates from a table with only month and year columns, not a date column.
-- used by spRLGL_Calculate3
-- example 4/2014 => 10/2013: fn(4,2014,6,'m') = 10 fn(4,2014,6,'y')=2013
-- example 7/2014 => 1/2014:  fn(7,2014,6,'m') = 1 fn(7,2014,6,'y') = 2014
-- select dbo.fnRLGL_Pricedate(4,2014,1)
-- =============================================
CREATE FUNCTION [dbo].[fnRLGL_Pricedate2]
(
	@inM int,
	@inY int,
	@iMonthsbackArg int,
	@MonthOrYear char(1)
)
RETURNS int
AS
BEGIN
	declare @ret int
	declare @iYearsback int, @iMonthsback int
	set @iYearsback = floor(@iMonthsbackArg/12)
	set @iMonthsback = (@iMonthsbackArg - (@iYearsback * 12))
	select @ret = case when @MonthOrYear='m' then
		case when (@inM - @iMonthsback) > 0 then (@inM - @iMonthsback) else (12+(@inM - @iMonthsback)) end		
	else
		case when (@inM - @iMonthsback) > 0 then @inY-@iYearsback else @inY-@iYearsback -1 end
	end
	return(@ret)
END

GO
