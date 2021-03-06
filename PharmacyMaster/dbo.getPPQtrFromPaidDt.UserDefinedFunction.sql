USE [PharmacyMaster]
GO
/****** Object:  UserDefinedFunction [dbo].[getPPQtrFromPaidDt]    Script Date: 12/22/2020 4:45:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[getPPQtrFromPaidDt]( @dt datetime )
returns varchar(255)
AS		
begin
	/*declare @result as varchar(8);
	declare @iQtr as int;
	declare @sYr as varchar(4);
	if (@pd is null )
		set @result = null;
	else (
		--set @iQtr = DATENAME(Quarter, CAST(CONVERT(VARCHAR(8), @pd - 90) AS DATETIME));	
		-- @result = ltrim((str(year($pd-90))));
		set @result = '1q2013';
	)

	return @result;*/
return left(datename(Quarter,@dt-90)+'Q'+ltrim((str(year(@dt-90)))),6)
end

GO
