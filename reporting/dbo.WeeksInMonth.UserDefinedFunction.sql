USE [reporting]
GO
/****** Object:  UserDefinedFunction [dbo].[WeeksInMonth]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Joni Wilson>
-- Create date: <January 5, 2009>
-- Description:	<Given Month and Year returns how many days in first week in the Month>
-- =============================================
CREATE FUNCTION [dbo].[WeeksInMonth]
 
	(@in_month varchar(2),@in_year varchar(4))
 
RETURNS varchar(2)
AS
BEGIN
		--Find Last day of Month
	DECLARE @dt DateTime;
	DECLARE @last_day_of_month varchar(2);
	DECLARE @weeks_in_month varchar(2);
	SET @dt = '' + @in_year + '-' + @in_month  + '-01'
    SET @dt = @dt - DAY(@dt) + 1

    SET @last_day_of_month =  DATEDIFF(DD, @dt, DATEADD(MM, 1, @dt))
    
    
    --Using Last Day of Month Find Number of Weeks in Month (includes partial weeks)
    DECLARE @wdt DateTime;
	SET @wdt =  '' + @in_year + '-' + @in_month  + '-' + @last_day_of_month + ''
	SET @weeks_in_month =   DATEDIFF(week, CONVERT(varchar(6), @wdt, 112) + '01', @wdt) + 1
	RETURN @weeks_in_month

END
GO
