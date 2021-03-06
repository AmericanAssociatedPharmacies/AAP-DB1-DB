USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[Audit_Rollback]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------

CREATE Procedure [dbo].[Audit_Rollback] ( @AuditID bigint)
as
set nocount on

declare @sqlstring nvarchar(4000),
		@tablename nvarchar(50),
        @parsedtablename nvarchar(50),
		@primarykey nvarchar(50),
		@primarykey2 nvarchar(50),
		@primarykey3 nvarchar(50),
		@Column nvarchar(50),
		@IsDateType int,
		@NewValue nvarchar(50)

select @tablename = tablename,
		@primarykey = primarykey,
		@primarykey2 = primarykey2,
		@primarykey3 = primarykey3,
		@column = [columnname],
		@newvalue = isnull(oldvalue,'')

from dbo.audit where auditid = @auditid

---strip tablename schemas
set @parsedtablename = replace(@tablename,'dbo.','')

---grab primary key names 
declare @PKColumnName sysname,
	    @PKColumnName2 sysname,
	    @PKColumnName3 sysname

-- get PK Column (1)  
select @PKColumnName = c.name, @ISDATETYPE = c.system_type_id
  from sys.tables t
    join sys.schemas s
      on s.schema_id = t.schema_id
    join sys.indexes i
      on t.object_id = i.object_id
    join sys.index_columns ic
  	  on i.object_id = ic.object_id
      and i.index_id = ic.index_id
    join sys.columns c
      on ic.object_id = c.object_id
      and ic.column_id = c.column_id
  where is_primary_key = 1 AND t.name = @ParsedTableName AND s.name = 'dbo' AND ic.index_column_id = 1

-- get PK Column (2)  
select @PKColumnName2 = c.name, @ISDATETYPE = c.system_type_id
  from sys.tables t
    join sys.schemas s
      on s.schema_id = t.schema_id
    join sys.indexes i
      on t.object_id = i.object_id
    join sys.index_columns ic
  	  on i.object_id = ic.object_id
      and i.index_id = ic.index_id
    join sys.columns c
      on ic.object_id = c.object_id
      and ic.column_id = c.column_id
  where is_primary_key = 1 AND t.name = @ParsedTableName AND s.name = 'dbo' AND ic.index_column_id = 2

-- get PK Column (3)  
select @PKColumnName3 = c.name, @ISDATETYPE = c.system_type_id
  from sys.tables t
    join sys.schemas s
      on s.schema_id = t.schema_id
    join sys.indexes i
      on t.object_id = i.object_id
    join sys.index_columns ic
  	  on i.object_id = ic.object_id
      and i.index_id = ic.index_id
    join sys.columns c
      on ic.object_id = c.object_id
      and ic.column_id = c.column_id
  where is_primary_key = 1 AND t.name = @ParsedTableName AND s.name = 'dbo' AND ic.index_column_id = 3
	  


if @primarykey is not null and @primarykey2 is null and @primarykey3 is null
begin
	-- check if the datatype is a datetime and force 
	if @isdatetype = 167 and @newvalue = ''
    begin
		set @sqlstring = 'update ' + @tablename + ' set ' + @column + ' = NULL'
		+ ' where ' + @PKColumnName + ' = ''' + @primarykey + ''''
    end 
    else
		set @sqlstring = 'update ' + @tablename + ' set ' + @column + ' = ''' + @newvalue + ''''
		+ ' where ' + @PKColumnName + ' = ''' + @primarykey + ''''
end

if @primarykey is not null and @primarykey2 is not null and @primarykey3 is null
begin
	-- check if the datatype is a datetime and force 
	if @isdatetype = 167 and @newvalue = ''
    begin
		set @sqlstring = 'update ' + @tablename + ' set ' + @column + ' = NULL'
		+ ' where ' + @PKColumnName + ' = ''' + @primarykey + ''' and ' + @PKColumnName2 + ' = ''' + @primarykey2 + ''''
    end 
    else
		set @sqlstring = 'update ' + @tablename + ' set ' + @column + ' = ''' + @newvalue + ''''
		+ ' where ' + @PKColumnName + ' = ''' + @primarykey + ''' and ' + @PKColumnName2 + ' = ''' + @primarykey2 + ''''
end

if @primarykey is not null and @primarykey2 is not null and @primarykey3 is not null
begin
	-- check if the datatype is a datetime and force 
	if @isdatetype = 167 and @newvalue = ''
    begin
		set @sqlstring = 'update ' + @tablename + ' set ' + @column + ' = NULL'
		+ ' where ' + @PKColumnName + ' = ''' + @primarykey + ''' and ' + @PKColumnName2 + ' = ''' + @primarykey2 + ''' and ' + @PKColumnName3 + ' = ''' + @primarykey3 + ''''
    end 
    else
		set @sqlstring = 'update ' + @tablename + ' set ' + @column + ' = ''' + @newvalue + ''''
		+ ' where ' + @PKColumnName + ' = ''' + @primarykey + ''' and ' + @PKColumnName2 + ' = ''' + @primarykey2 + ''' and ' + @PKColumnName3 + ' = ''' + @primarykey3 + ''''

end

print '@sqlstring = ' + @sqlstring

exec sp_executesql @sqlstring

GO
