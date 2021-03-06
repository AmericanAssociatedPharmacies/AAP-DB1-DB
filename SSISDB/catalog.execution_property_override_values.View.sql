USE [SSISDB]
GO
/****** Object:  View [catalog].[execution_property_override_values]    Script Date: 12/22/2020 9:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [catalog].[execution_property_override_values]
AS
SELECT     [property_id], 
           [execution_id],
           [property_path], 
           [property_value], 
           [sensitive]
FROM       [internal].[execution_property_override_values]
WHERE      [execution_id] in (SELECT [id] FROM [internal].[current_user_readable_operations])
           OR (IS_MEMBER('ssis_admin') = 1)
           OR (IS_SRVROLEMEMBER('sysadmin') = 1)
GO
