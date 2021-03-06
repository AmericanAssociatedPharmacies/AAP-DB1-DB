USE [Reports]
GO
/****** Object:  UserDefinedFunction [dbo].[ColumnExists]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Joni Wilson>
-- Create date: <01/12/2009>
-- Description:	<Get Number of days in a given month in a given year>
-- =============================================
CREATE FUNCTION [dbo].[ColumnExists]
(@TableName varchar(100), @ColumnName varchar(100))
 RETURNS varchar(1) AS

 BEGIN 
DECLARE @Result varchar(1);
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.Columns WHERE TABLE_NAME = @TableName AND COLUMN_NAME = @ColumnName)
 BEGIN     
	SET @Result = 'T' 
 END 
ELSE
 BEGIN
     SET @Result = 'F' 
 END
RETURN @Result;

 END  
GO
