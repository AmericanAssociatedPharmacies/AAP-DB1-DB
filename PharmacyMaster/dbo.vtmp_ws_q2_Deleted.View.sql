USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vtmp_ws_q2_Deleted]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vtmp_ws_q2_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[PMID] ' THEN LastValue ELSE '' END) AS [PMID], 
 Max(Case ColumnName WHEN '[TM #] ' THEN LastValue ELSE '' END) AS [TM #], 
 Max(Case ColumnName WHEN '[AAP#] ' THEN LastValue ELSE '' END) AS [AAP#], 
 Max(Case ColumnName WHEN '[AAP Parent #] ' THEN LastValue ELSE '' END) AS [AAP Parent #], 
 Max(Case ColumnName WHEN '[API #] ' THEN LastValue ELSE '' END) AS [API #], 
 Max(Case ColumnName WHEN '[AccountName] ' THEN LastValue ELSE '' END) AS [AccountName], 
 Max(Case ColumnName WHEN '[City] ' THEN LastValue ELSE '' END) AS [City], 
 Max(Case ColumnName WHEN '[ST] ' THEN LastValue ELSE '' END) AS [ST], 
 Max(Case ColumnName WHEN '[Date Opened] ' THEN LastValue ELSE '' END) AS [Date Opened], 
 Max(Case ColumnName WHEN '[Apr Brand] ' THEN LastValue ELSE '' END) AS [Apr Brand], 
 Max(Case ColumnName WHEN '[Apr Generic] ' THEN LastValue ELSE '' END) AS [Apr Generic], 
 Max(Case ColumnName WHEN '[Apr OTC] ' THEN LastValue ELSE '' END) AS [Apr OTC], 
 Max(Case ColumnName WHEN '[Apr Total] ' THEN LastValue ELSE '' END) AS [Apr Total], 
 Max(Case ColumnName WHEN '[May Brand] ' THEN LastValue ELSE '' END) AS [May Brand], 
 Max(Case ColumnName WHEN '[May Generic] ' THEN LastValue ELSE '' END) AS [May Generic], 
 Max(Case ColumnName WHEN '[May OTC] ' THEN LastValue ELSE '' END) AS [May OTC], 
 Max(Case ColumnName WHEN '[May Total] ' THEN LastValue ELSE '' END) AS [May Total], 
 Max(Case ColumnName WHEN '[Jun Brand] ' THEN LastValue ELSE '' END) AS [Jun Brand], 
 Max(Case ColumnName WHEN '[Jun Generic] ' THEN LastValue ELSE '' END) AS [Jun Generic], 
 Max(Case ColumnName WHEN '[Jun OTC] ' THEN LastValue ELSE '' END) AS [Jun OTC], 
 Max(Case ColumnName WHEN '[Jun Total] ' THEN LastValue ELSE '' END) AS [Jun Total], 
 Max(Case ColumnName WHEN '[Grand Total Brand] ' THEN LastValue ELSE '' END) AS [Grand Total Brand], 
 Max(Case ColumnName WHEN '[Grand Total Generic] ' THEN LastValue ELSE '' END) AS [Grand Total Generic], 
 Max(Case ColumnName WHEN '[Grand Total OTC] ' THEN LastValue ELSE '' END) AS [Grand Total OTC], 
 Max(Case ColumnName WHEN '[Grand Total Sales] ' THEN LastValue ELSE '' END) AS [Grand Total Sales]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.tmp_ws_q2') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.tmp_ws_q2') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.tmp_ws_q2') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
