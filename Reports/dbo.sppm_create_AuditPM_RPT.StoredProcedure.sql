USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_AuditPM_RPT]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Compliance Report for Chriss S.
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_AuditPM_RPT]
(@in_months varchar(100), @in_year varchar(04),@in_days varchar(100),@filterAPILoad varchar(1),@filterNull varchar(1),@columnName varchar(50) ,@in_pmid varchar(100) )
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

	DECLARE @SQL varchar(1000); 
	
--		SET @SQL = 'SELECT * FROM pharmacymaster..Audit ' +
SET @SQL = 'SELECT auditdate,sysuser,tablename,primarykey,primarykey2,primarykey3,ColumnName,OldValue,Newvalue FROM pharmacymaster..Audit ' +
			   '     WHERE MONTH(AuditDate) in( ' + @in_months + ' ) '+
			   '	 AND YEAR(AuditDate) = ' + @in_year ; 
              -- '     AND TableName <> ''dbo.pm_apiaccounts''';

               IF(@in_days is not null)
				BEGIN
                  SET @SQL = @SQL + ' AND day(auditdate) in (' + @in_days + ')';
				END 
               IF(@filterNull is not null)
				BEGIN
                  SET @SQL = @SQL + ' AND OldValue IS NOT NULL AND OldValue <> '''' AND (NewValue IS NULL OR NewValue = '''')';
				END 
                IF(@columnName is not null)
				BEGIN
                  SET @SQL = @SQL + ' AND ColumnName = ''[' + @columnName + ']''';
				END 
                IF(@filterAPILoad is not null)
                BEGIN
                  SET @SQL = @SQL + ' AND SysUser != ''jonimw''  ';
				END 
				IF(@in_pmid is not null)
                BEGIN
                  SET @SQL = @SQL + ' AND (PrimaryKey in (' + @in_pmid + ') or PrimaryKey2 in (' + @in_pmid + '))';
				END 
                SET @SQL = @SQL + ' order by auditdate';
        print @sql;
        EXEC(@SQL);
END








GO
