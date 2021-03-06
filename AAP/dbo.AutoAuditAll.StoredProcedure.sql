USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[AutoAuditAll]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
CREATE PROC [dbo].[AutoAuditAll] 
AS 
SET NoCount ON 
DECLARE 
   @TableName VARCHAR(50), 
   @SchemaName VARCHAR(50), 
   @SQL NVARCHAR(max)
-- for each table
-- 1
DECLARE cTables CURSOR FAST_FORWARD READ_ONLY
  FOR  SELECT s.name, t.name 
			  from sys.tables t
				join sys.schemas s
				  on t.schema_id = s.schema_id
			 where t.name <> 'audit'
--2 
OPEN cTables
--3 
FETCH cTables INTO @SchemaName, @TableName   -- prime the cursor
WHILE @@Fetch_Status = 0 
  BEGIN
		SET @SQL = 'EXEC AutoAudit ''' + @SchemaName + ''', ''' + @TableName + ''''
		EXEC (@SQL)
      FETCH cTables INTO @SchemaName, @TableName   -- fetch next
  END
-- 4  
CLOSE cTables
-- 5
DEALLOCATE cTables

GO
