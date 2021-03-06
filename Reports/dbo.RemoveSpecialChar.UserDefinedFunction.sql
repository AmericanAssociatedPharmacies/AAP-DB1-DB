USE [Reports]
GO
/****** Object:  UserDefinedFunction [dbo].[RemoveSpecialChar]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Joni Wilson>
-- Create date: <01/12/2009>
-- Description:	<Get Number of days in a given month in a given year>
-- =============================================
CREATE FUNCTION [dbo].[RemoveSpecialChar]
(@FieldVal varchar(500))
 RETURNS varchar(500) AS

 BEGIN 
	DECLARE @Result varchar(500);
	IF (@FieldVal is null)
	BEGIN
		SET @Result = '';
	END
	ELSE
	BEGIN 
		SET @Result = REPLACE(@FieldVal,',',' ');
	END
	RETURN @Result;

 END  
GO
