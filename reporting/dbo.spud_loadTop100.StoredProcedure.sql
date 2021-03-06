USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_loadTop100]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spud_loadTop100] 
@filename varchar(1000)
-- import CH top 100 weekly formulary file BG 6/10/08
-- example: spud_loadTop100 'c:\tmp\top100.txt'
-- note fielddelimiter and rowdelimiter are defaults \t \n
AS
BEGIN
	DECLARE @SQL varchar(2000)
	set @SQL = 'bulk insert CHTop100 from ''' + @filename; 
	set @SQL = @SQL + ''' with (firstrow=2, errorfile=''' + @filename + '.err'')';
	exec @SQL

END

GO
