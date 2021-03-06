USE [Reports]
GO
/****** Object:  UserDefinedFunction [dbo].[MaxDate]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Joni Wilson>
-- Create date: <01/12/2009>
-- Description:	<Get Max of two dates>
-- =============================================
CREATE FUNCTION [dbo].[MaxDate]
(@startDate1 datetime, @startDate2 datetime)
 RETURNS datetime AS

 BEGIN 
DECLARE @Result datetime;
IF (@startDate1 is not null and ((@startDate1 >= @startDate2) or   @startDate2 is null))
 BEGIN     
	SET @Result = @startDate1
 END 
ELSE
IF (@startDate2 is not null and ((@startDate2 > @startDate1) or   @startDate1 is null))
 BEGIN
     SET @Result = @startDate2 
 END
RETURN @Result;

 END  
GO
