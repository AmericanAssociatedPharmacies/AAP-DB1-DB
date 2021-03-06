USE [WebDev]
GO
/****** Object:  UserDefinedFunction [dbo].[fnRLGL_Pricedate]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BG
-- Create date: 5/14/14
-- Description:	RLGL price lookup: return 6 mo prior to fill date
-- example 4/2014 => 10/2013: fn(4,2014,0) = 10 fn(4,2014,1)=2013
-- example 7/2014 => 1/2014:  fn(7,2014,0) = 1 fn(7,2014,1) = 2014
-- select dbo.fnRLGL_Pricedate(4,2014,1)
-- =============================================
CREATE FUNCTION [dbo].[fnRLGL_Pricedate]
(
	@inM int,
	@inY int,
	@M0Y1 int
)
RETURNS int
AS
BEGIN
	declare @ret int
	select @ret = case when @M0Y1=0 then
		case when @inM > 6 then @inM - 6 else @inM + 6 end		
	else
		case when @inM > 6 then @inY else @inY -1 end
	end
	return(@ret)
END
GO
