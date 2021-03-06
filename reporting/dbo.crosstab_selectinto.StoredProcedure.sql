USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[crosstab_selectinto]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[crosstab_selectinto]
@select varchar(8000),
@sumfunc varchar(100), 
@pivot2 varchar(100), 
@table varchar(100),
@outtable varchar(100) --optional output added bg
AS

DECLARE @sql varchar(8000), @delim varchar(1)
DECLARE @strouttable varchar(100) --bg
SET NOCOUNT ON
SET ANSI_WARNINGS OFF

EXEC ('SELECT ' + @pivot2 + ' AS pivot2 INTO ##pivot2 FROM ' + @table + ' WHERE 1=2')
EXEC ('INSERT INTO ##pivot2 SELECT DISTINCT ' + @pivot2 + ' FROM ' + @table + ' WHERE ' 
+ @pivot2 + ' Is Not Null order by ' + @pivot2)
--added the order by bg

SELECT @sql='',  @sumfunc=stuff(@sumfunc, len(@sumfunc), 1, ' END)' )

SELECT @delim=CASE Sign( CharIndex('char', data_type)+CharIndex('date', data_type) ) 
WHEN 0 THEN '' ELSE '''' END 
FROM tempdb.information_schema.columns 
WHERE table_name='##pivot2' AND column_name='pivot2'

SELECT @sql=@sql + '''' + convert(varchar(100), pivot2) + ''' = ' + 
stuff(@sumfunc,charindex( '(', @sumfunc )+1, 0, ' CASE ' + @pivot2 + ' WHEN ' 
+ @delim + convert(varchar(100), pivot2) + @delim + ' THEN ' ) + ', ' FROM ##pivot2

DROP TABLE ##pivot2

SELECT @sql=left(@sql, len(@sql)-1)
SELECT @strouttable=CASE @outtable WHEN '' THEN ' ' ELSE ' into ' + @outtable + ' ' END
SELECT @select=stuff(@select, charindex(' FROM ', @select)+1, 0, ', ' + @sql + @strouttable)

EXEC (@select)
--print @select
SET ANSI_WARNINGS ON
GO
