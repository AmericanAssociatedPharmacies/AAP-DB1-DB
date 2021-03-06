USE [reporting]
GO
/****** Object:  UserDefinedFunction [dbo].[DaysInFirstWeekOfMonth]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Joni Wilson>
-- Create date: <January 5, 2009>
-- Description:	<Given Month and Year returns how many days in first week in the Month>
-- =============================================
CREATE FUNCTION [dbo].[DaysInFirstWeekOfMonth]
 
	(@in_month varchar(2),@in_year varchar(4))
 
RETURNS varchar(2)
AS
BEGIN
	--Start Day - we need to subtract return number from 7 and add 1 to get number of days in the week
		DECLARE @Startdate datetime
		DECLARE @startday varchar(2)
		DECLARE @NumToSubtract varchar(2)
		DECLARE @daysInFirstWeek varchar(2)
		SET @startday = '01'
		SET @Startdate = '' + @in_year + '-' + @in_month  + '-' + @startday + ''
		SET @NumToSubtract = (Select   datepart(dw,@Startdate) )
		SET @daysInFirstWeek =  7 - @NumToSubtract + 1

	-- Return the result of the function
	RETURN @daysInFirstWeek

END
GO
