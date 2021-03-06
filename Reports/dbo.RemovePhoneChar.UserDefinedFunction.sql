USE [Reports]
GO
/****** Object:  UserDefinedFunction [dbo].[RemovePhoneChar]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Joni Wilson>
-- Create date: <01/12/2009>
-- Description:	<Get Number of days in a given month in a given year>
-- =============================================
CREATE FUNCTION [dbo].[RemovePhoneChar]
(@FieldVal varchar(500))
 RETURNS varchar(256) AS

 BEGIN 
	DECLARE @Result varchar(500);
	SET @Result = REPLACE(@FieldVal,'(','');
    SET @Result = REPLACE(@Result,')','');
	SET @Result = REPLACE(@Result,'-','');
    SET @Result = REPLACE(@Result,' ','');
	RETURN @Result;

 END  
GO
