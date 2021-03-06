USE [SSISDB]
GO
/****** Object:  UserDefinedFunction [internal].[get_database_principals]    Script Date: 12/22/2020 5:17:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [internal].[get_database_principals]()
RETURNS @ret TABLE
(
    [name] sysname NOT NULL,
    [principal_id] int NOT NULL,
    [type] char(1) NOT NULL,
    [type_desc] nvarchar(60) NULL,
    [default_schema_name] sysname NULL,
    [create_date] datetime NOT NULL,
    [modify_date] datetime NOT NULL,
    [owning_principal_id] int NULL,
    [sid] varbinary(85) NULL,
    [is_fixed_role] bit NOT NULL
)
AS
BEGIN
    INSERT INTO @ret
    SELECT
        [name],
        [principal_id],
        [type],
        [type_desc],
        [default_schema_name],
        [create_date],
        [modify_date],
        [owning_principal_id],
        [sid],
        [is_fixed_role]
     FROM [sys].[database_principals]
     RETURN
END
GO
