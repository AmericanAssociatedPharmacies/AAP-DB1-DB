USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vtmp_FYTD_WHSales_CS_DYN_Deleted]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vtmp_FYTD_WHSales_CS_DYN_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[WHAcct#] ' THEN LastValue ELSE '' END) AS [WHAcct#], 
 Max(Case ColumnName WHEN '[AAP#] ' THEN LastValue ELSE '' END) AS [AAP#], 
 Max(Case ColumnName WHEN '[SlsMn] ' THEN LastValue ELSE '' END) AS [SlsMn], 
 Max(Case ColumnName WHEN '[Name] ' THEN LastValue ELSE '' END) AS [Name], 
 Max(Case ColumnName WHEN '[City] ' THEN LastValue ELSE '' END) AS [City], 
 Max(Case ColumnName WHEN '[ST] ' THEN LastValue ELSE '' END) AS [ST], 
 Max(Case ColumnName WHEN '[Status] ' THEN LastValue ELSE '' END) AS [Status], 
 Max(Case ColumnName WHEN '[Date Opened] ' THEN LastValue ELSE '' END) AS [Date Opened], 
 Max(Case ColumnName WHEN '[9/09 Brand] ' THEN LastValue ELSE '' END) AS [9/09 Brand], 
 Max(Case ColumnName WHEN '[10/09 Brand] ' THEN LastValue ELSE '' END) AS [10/09 Brand], 
 Max(Case ColumnName WHEN '[11/09 Brand] ' THEN LastValue ELSE '' END) AS [11/09 Brand], 
 Max(Case ColumnName WHEN '[12/09 Brand] ' THEN LastValue ELSE '' END) AS [12/09 Brand], 
 Max(Case ColumnName WHEN '[1/10 Brand] ' THEN LastValue ELSE '' END) AS [1/10 Brand], 
 Max(Case ColumnName WHEN '[2/10 Brand] ' THEN LastValue ELSE '' END) AS [2/10 Brand], 
 Max(Case ColumnName WHEN '[3/10 Brand] ' THEN LastValue ELSE '' END) AS [3/10 Brand], 
 Max(Case ColumnName WHEN '[4/10 Brand] ' THEN LastValue ELSE '' END) AS [4/10 Brand], 
 Max(Case ColumnName WHEN '[5/10 Brand] ' THEN LastValue ELSE '' END) AS [5/10 Brand], 
 Max(Case ColumnName WHEN '[6/10 Brand] ' THEN LastValue ELSE '' END) AS [6/10 Brand], 
 Max(Case ColumnName WHEN '[7/10 Brand] ' THEN LastValue ELSE '' END) AS [7/10 Brand], 
 Max(Case ColumnName WHEN '[8/10 Brand] ' THEN LastValue ELSE '' END) AS [8/10 Brand], 
 Max(Case ColumnName WHEN '[9/10 Brand] ' THEN LastValue ELSE '' END) AS [9/10 Brand], 
 Max(Case ColumnName WHEN '[9/09 Generic] ' THEN LastValue ELSE '' END) AS [9/09 Generic], 
 Max(Case ColumnName WHEN '[10/09 Generic] ' THEN LastValue ELSE '' END) AS [10/09 Generic], 
 Max(Case ColumnName WHEN '[11/09 Generic] ' THEN LastValue ELSE '' END) AS [11/09 Generic], 
 Max(Case ColumnName WHEN '[12/09 Generic] ' THEN LastValue ELSE '' END) AS [12/09 Generic], 
 Max(Case ColumnName WHEN '[1/10 Generic] ' THEN LastValue ELSE '' END) AS [1/10 Generic], 
 Max(Case ColumnName WHEN '[2/10 Generic] ' THEN LastValue ELSE '' END) AS [2/10 Generic], 
 Max(Case ColumnName WHEN '[3/10 Generic] ' THEN LastValue ELSE '' END) AS [3/10 Generic], 
 Max(Case ColumnName WHEN '[4/10 Generic] ' THEN LastValue ELSE '' END) AS [4/10 Generic], 
 Max(Case ColumnName WHEN '[5/10 Generic] ' THEN LastValue ELSE '' END) AS [5/10 Generic], 
 Max(Case ColumnName WHEN '[6/10 Generic] ' THEN LastValue ELSE '' END) AS [6/10 Generic], 
 Max(Case ColumnName WHEN '[7/10 Generic] ' THEN LastValue ELSE '' END) AS [7/10 Generic], 
 Max(Case ColumnName WHEN '[8/10 Generic] ' THEN LastValue ELSE '' END) AS [8/10 Generic], 
 Max(Case ColumnName WHEN '[9/10 Generic] ' THEN LastValue ELSE '' END) AS [9/10 Generic], 
 Max(Case ColumnName WHEN '[9/09 OTC] ' THEN LastValue ELSE '' END) AS [9/09 OTC], 
 Max(Case ColumnName WHEN '[10/09 OTC] ' THEN LastValue ELSE '' END) AS [10/09 OTC], 
 Max(Case ColumnName WHEN '[11/09 OTC] ' THEN LastValue ELSE '' END) AS [11/09 OTC], 
 Max(Case ColumnName WHEN '[12/09 OTC] ' THEN LastValue ELSE '' END) AS [12/09 OTC], 
 Max(Case ColumnName WHEN '[1/10 OTC] ' THEN LastValue ELSE '' END) AS [1/10 OTC], 
 Max(Case ColumnName WHEN '[2/10 OTC] ' THEN LastValue ELSE '' END) AS [2/10 OTC], 
 Max(Case ColumnName WHEN '[3/10 OTC] ' THEN LastValue ELSE '' END) AS [3/10 OTC], 
 Max(Case ColumnName WHEN '[4/10 OTC] ' THEN LastValue ELSE '' END) AS [4/10 OTC], 
 Max(Case ColumnName WHEN '[5/10 OTC] ' THEN LastValue ELSE '' END) AS [5/10 OTC], 
 Max(Case ColumnName WHEN '[6/10 OTC] ' THEN LastValue ELSE '' END) AS [6/10 OTC], 
 Max(Case ColumnName WHEN '[7/10 OTC] ' THEN LastValue ELSE '' END) AS [7/10 OTC], 
 Max(Case ColumnName WHEN '[8/10 OTC] ' THEN LastValue ELSE '' END) AS [8/10 OTC], 
 Max(Case ColumnName WHEN '[9/10 OTC] ' THEN LastValue ELSE '' END) AS [9/10 OTC], 
 Max(Case ColumnName WHEN '[Brand Totals] ' THEN LastValue ELSE '' END) AS [Brand Totals], 
 Max(Case ColumnName WHEN '[Generic Totals] ' THEN LastValue ELSE '' END) AS [Generic Totals], 
 Max(Case ColumnName WHEN '[OTC Totals] ' THEN LastValue ELSE '' END) AS [OTC Totals], 
 Max(Case ColumnName WHEN '[Grand Totals] ' THEN LastValue ELSE '' END) AS [Grand Totals], 
 Max(Case ColumnName WHEN '[9/09 Totals] ' THEN LastValue ELSE '' END) AS [9/09 Totals], 
 Max(Case ColumnName WHEN '[10/09 Totals] ' THEN LastValue ELSE '' END) AS [10/09 Totals], 
 Max(Case ColumnName WHEN '[11/09 Totals] ' THEN LastValue ELSE '' END) AS [11/09 Totals], 
 Max(Case ColumnName WHEN '[12/09 Totals] ' THEN LastValue ELSE '' END) AS [12/09 Totals], 
 Max(Case ColumnName WHEN '[1/10 Totals] ' THEN LastValue ELSE '' END) AS [1/10 Totals], 
 Max(Case ColumnName WHEN '[2/10 Totals] ' THEN LastValue ELSE '' END) AS [2/10 Totals], 
 Max(Case ColumnName WHEN '[3/10 Totals] ' THEN LastValue ELSE '' END) AS [3/10 Totals], 
 Max(Case ColumnName WHEN '[4/10 Totals] ' THEN LastValue ELSE '' END) AS [4/10 Totals], 
 Max(Case ColumnName WHEN '[5/10 Totals] ' THEN LastValue ELSE '' END) AS [5/10 Totals], 
 Max(Case ColumnName WHEN '[6/10 Totals] ' THEN LastValue ELSE '' END) AS [6/10 Totals], 
 Max(Case ColumnName WHEN '[7/10 Totals] ' THEN LastValue ELSE '' END) AS [7/10 Totals], 
 Max(Case ColumnName WHEN '[8/10 Totals] ' THEN LastValue ELSE '' END) AS [8/10 Totals], 
 Max(Case ColumnName WHEN '[9/10 Totals] ' THEN LastValue ELSE '' END) AS [9/10 Totals]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.tmp_FYTD_WHSales_CS_DYN') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.tmp_FYTD_WHSales_CS_DYN') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.tmp_FYTD_WHSales_CS_DYN') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
