USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[usp_LastUpdateTables]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_LastUpdateTables]
AS

SELECT OBJECT_NAME(OBJECT_ID) AS TableName, db_name() as DBName, last_user_update,  *
FROM sys.dm_db_index_usage_stats as s 
order by TableName desc
GO
