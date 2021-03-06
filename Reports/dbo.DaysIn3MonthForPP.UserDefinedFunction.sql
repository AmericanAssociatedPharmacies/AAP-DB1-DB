USE [Reports]
GO
/****** Object:  UserDefinedFunction [dbo].[DaysIn3MonthForPP]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Joni Wilson>
-- Create date: <01/12/2009>
-- Description:	<Get Number of days in a given month in a given year>
-- =============================================
CREATE FUNCTION [dbo].[DaysIn3MonthForPP]

	(@in_date datetime,@shipQty int )
RETURNS int
AS
BEGIN
 
     DECLARE @days int;
	DECLARE @avg int;
	DECLARE @month varchar(2);
	DECLARE @year varchar(2);
    DECLARE @daysFirstMonth varchar(2);
    DECLARE @daysSecondMonth varchar(2);
    DECLARE @daysThirdMonth varchar(2);
    DECLARE @div float;
	
    --SET @month = month(@in_date);
	--SET @year = year(@in_date);
	SET @daysFirstMonth = (SELECT(dbo.DaysInMonthForPP( month((select DATEADD (month ,-3 ,  @in_date ))),year(@in_date))));
    SET  @daysSecondMonth = (SELECT(dbo.DaysInMonthForPP( month((select DATEADD (month ,-2 , @in_date ))),year(@in_date)))); 
    SET @daysThirdMonth = (SELECT (dbo.DaysInMonthForPP( month((select DATEADD (month ,-1 , @in_date ))),year(@in_date))));
	SET @days = cast(@daysFirstMonth as int) + cast(@daysSecondMonth as int) + cast(@daysThirdMonth as int);
	SET @div = cast(@shipQty as float)/cast(@days as float);
    SET @avg =  ceiling((cast(@shipQty as float)/cast(@days as float)) * 30);

 return @avg;
END
GO
