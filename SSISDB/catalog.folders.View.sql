USE [SSISDB]
GO
/****** Object:  View [catalog].[folders]    Script Date: 12/22/2020 9:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [catalog].[folders]
AS
SELECT     [folder_id], 
           [name], 
           [description], 
           [created_by_sid], 
           [created_by_name], 
           [created_time]
FROM       [internal].[folders]
WHERE      [folder_id] in (SELECT [id] FROM [internal].[current_user_readable_folders])
           OR (IS_MEMBER('ssis_admin') = 1)
           OR (IS_SRVROLEMEMBER('sysadmin') = 1)
GO
