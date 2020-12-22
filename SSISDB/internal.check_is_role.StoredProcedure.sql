USE [SSISDB]
GO
/****** Object:  StoredProcedure [internal].[check_is_role]    Script Date: 12/22/2020 5:17:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [internal].[check_is_role]
    @principal_id INTEGER,
    @is_role BIT OUTPUT
AS
BEGIN
    DECLARE @principal_type CHAR(1)
        
    SELECT @principal_type = [type] 
    FROM [sys].[database_principals] 
    WHERE [principal_id] = @principal_id

    IF @principal_type IS NULL
        RETURN 1
    
    IF @principal_type = 'R'
        SET @is_role = 1
    ELSE
        SET @is_role = 0
  
    RETURN 0
END
GO
