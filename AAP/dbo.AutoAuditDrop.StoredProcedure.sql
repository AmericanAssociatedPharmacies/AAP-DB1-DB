USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[AutoAuditDrop]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
CREATE PROC [dbo].[AutoAuditDrop] (
   @SchemaName VARCHAR(50),
   @TableName VARCHAR(50)
) 
AS 
SET NoCount ON

DECLARE 
   @SQL NVARCHAR(max)

-- drop existing insert trigger
SET @SQL = 'If EXISTS (Select * from sys.objects where name = '
       + '''' + @TableName + '_Audit_Insert' + ''' )'
       + ' DROP TRIGGER ' + @SchemaName + '.' + @TableName + '_Audit_Insert'
EXEC (@SQL)

-- drop existing update trigger
SET @SQL = 'If EXISTS (Select * from sys.objects where name = '
       + '''' + @TableName + '_Audit_Update' + ''' )'
       + ' DROP TRIGGER ' + @SchemaName + '.' + @TableName + '_Audit_Update'
EXEC (@SQL)

-- drop existing modified trigger
SET @SQL = 'If EXISTS (Select * from sys.objects where name = '
       + '''' + @TableName + '_Modified' + ''' )'
       + ' DROP TRIGGER ' + @SchemaName + '.' + @TableName + '_Modified'
EXEC (@SQL)

-- drop existing delete trigger
SET @SQL = 'If EXISTS (Select * from sys.objects where name = '
       + '''' + @TableName + '_Audit_Delete' + ''' )'
       + ' DROP TRIGGER ' + @SchemaName + '.' + @TableName + '_Audit_Delete'
EXEC (@SQL)


-- drop created column ?
-- drop modified column ?
-- drop RowVersion column ?

GO
