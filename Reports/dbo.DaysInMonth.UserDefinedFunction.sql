USE [Reports]
GO
/****** Object:  UserDefinedFunction [dbo].[DaysInMonth]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Joni Wilson>
-- Create date: <01/12/2009>
-- Description:	<Get Number of days in a given month in a given year>
-- =============================================
CREATE FUNCTION [dbo].[DaysInMonth]

	(@in_month varchar(2),@in_year varchar(4))
RETURNS varchar(2) 
AS
BEGIN
    DECLARE @Date DATETIME;
    DECLARE @lastDay varchar(2);
    
	SET @Date = '' + @in_year + '-' + @in_month  + '-' + '01'
	SET @lastDay = (SELECT DAY(DATEADD(d, -DAY(DATEADD(m,1,@Date)),DATEADD(m,1,@Date))))
	return @lastDay
END
GO
