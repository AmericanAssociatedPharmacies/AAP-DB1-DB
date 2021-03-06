USE [Medispan]
GO
/****** Object:  UserDefinedFunction [dbo].[FindNDC9]    Script Date: 12/22/2020 4:38:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FindNDC9] 
(
	-- Add the parameters for the function here
	@sndc9 varchar(9)
)
RETURNS varchar(255)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result varchar(255)
	DECLARE @sNDC varchar(11)
	DECLARE @sLN varchar(60)
	select @Result = ''

	DECLARE db_cursor CURSOR FOR 
	SELECT NDC
	FROM v_DrugMaster
	WHERE ndc like '%' + @sndc9 + '%'

	OPEN db_cursor  
	FETCH NEXT FROM db_cursor INTO @sNDC

	WHILE @@FETCH_STATUS = 0  
	BEGIN  
		   SET @Result = @Result + @sNDC 
		   FETCH NEXT FROM db_cursor INTO @sNDC
	END  

	CLOSE db_cursor  
	DEALLOCATE db_cursor

	RETURN @Result

END
GO
