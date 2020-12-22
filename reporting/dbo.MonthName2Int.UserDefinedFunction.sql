USE [reporting]
GO
/****** Object:  UserDefinedFunction [dbo].[MonthName2Int]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[MonthName2Int]
( @MonthName varchar(9))
RETURNS int
AS
BEGIN
RETURN datepart(m, convert(datetime, @MonthName+' 1, 0'))

END
GO
