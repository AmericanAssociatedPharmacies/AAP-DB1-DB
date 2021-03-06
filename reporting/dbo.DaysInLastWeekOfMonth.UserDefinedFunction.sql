USE [reporting]
GO
/****** Object:  UserDefinedFunction [dbo].[DaysInLastWeekOfMonth]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Joni Wilson>
-- Create date: <January 5, 2009>
-- Description:	<Given Month and Year returns how many days in first week in the Month>
-- =============================================
CREATE FUNCTION [dbo].[DaysInLastWeekOfMonth]
 
	(@in_month varchar(2),@in_year varchar(4))
 
RETURNS varchar(2)
AS
BEGIN
	DECLARE @Date datetime
		DECLARE @lastDay varchar(2)
		DECLARE @daysInLastWeek varchar(2)
		DECLARE @NewDate datetime
		SET @Date = '' + @in_year + '-' + @in_month  + '-' + '01'
		SET @lastDay = (SELECT DAY(DATEADD(d, -DAY(DATEADD(m,1,@Date)),DATEADD(m,1,@Date))))
		SET @NewDate = '' + @in_year + '-' + @in_month  + '-' + @lastDay + ''
		SET @daysInLastWeek  = datepart(dw,@NewDate) 
	RETURN @daysInLastWeek

END
GO
