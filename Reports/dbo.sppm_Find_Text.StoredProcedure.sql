USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_Find_Text]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Call Report Card Volume and return table
-- =============================================
CREATE PROCEDURE [dbo].[sppm_Find_Text]
 (@textToFind varchar(max),@DBName varchar(max))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	DECLARE @SQL varchar(max);
	   --- Drop the previous runs table

	SET @SQL = ' SELECT DISTINCT     s.name+''.''+o.name AS Object_Name,o.type_desc  '+
		       '  FROM '+ @DBName + '.sys.sql_modules   m   '+   
			   '      INNER JOIN '+ @DBName + '.sys.objects  o '+
		       '  ON m.object_id=o.object_id   '+
               ' INNER JOIN '+ @DBName + '.sys.schemas  s '+
		       ' ON o.schema_id=s.schema_id '+
               ' WHERE m.definition Like ''%' + @textToFind + '%''';

	EXEC (@SQL); 

--SELECT DISTINCT     s.name+'.'+o.name AS Object_Name,o.type_desc  
--   FROM sys.sql_modules   m      
--   INNER JOIN sys.objects  o
-- ON m.object_id=o.object_id   
--  INNER JOIN sys.schemas  s
-- ON o.schema_id=s.schema_id 
--    WHERE m.definition Like '%VOLUMECALYY%' 

END










GO
