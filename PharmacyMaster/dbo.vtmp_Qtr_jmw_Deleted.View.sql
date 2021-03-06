USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vtmp_Qtr_jmw_Deleted]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vtmp_Qtr_jmw_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[TM] ' THEN LastValue ELSE '' END) AS [TM], 
 Max(Case ColumnName WHEN '[PMID] ' THEN LastValue ELSE '' END) AS [PMID], 
 Max(Case ColumnName WHEN '[AAP#] ' THEN LastValue ELSE '' END) AS [AAP#], 
 Max(Case ColumnName WHEN '[Parent#] ' THEN LastValue ELSE '' END) AS [Parent#], 
 Max(Case ColumnName WHEN '[API Warehouse#] ' THEN LastValue ELSE '' END) AS [API Warehouse#], 
 Max(Case ColumnName WHEN '[AAP Eff] ' THEN LastValue ELSE '' END) AS [AAP Eff], 
 Max(Case ColumnName WHEN '[AAP Quit] ' THEN LastValue ELSE '' END) AS [AAP Quit], 
 Max(Case ColumnName WHEN '[Description] ' THEN LastValue ELSE '' END) AS [Description], 
 Max(Case ColumnName WHEN '[Affiliate] ' THEN LastValue ELSE '' END) AS [Affiliate], 
 Max(Case ColumnName WHEN '[Account DBA Name] ' THEN LastValue ELSE '' END) AS [Account DBA Name], 
 Max(Case ColumnName WHEN '[City] ' THEN LastValue ELSE '' END) AS [City], 
 Max(Case ColumnName WHEN '[ST] ' THEN LastValue ELSE '' END) AS [ST], 
 Max(Case ColumnName WHEN '[Whse Acct Date Opened] ' THEN LastValue ELSE '' END) AS [Whse Acct Date Opened], 
 Max(Case ColumnName WHEN '[Status] ' THEN LastValue ELSE '' END) AS [Status], 
 Max(Case ColumnName WHEN '[Wholesaler] ' THEN LastValue ELSE '' END) AS [Wholesaler], 
 Max(Case ColumnName WHEN '[API Q3 Generic Sales] ' THEN LastValue ELSE '' END) AS [API Q3 Generic Sales], 
 Max(Case ColumnName WHEN '[API Q3 Brand Sales] ' THEN LastValue ELSE '' END) AS [API Q3 Brand Sales], 
 Max(Case ColumnName WHEN '[API Q3 OTC Sales] ' THEN LastValue ELSE '' END) AS [API Q3 OTC Sales], 
 Max(Case ColumnName WHEN '[API Q3 Total Sales] ' THEN LastValue ELSE '' END) AS [API Q3 Total Sales], 
 Max(Case ColumnName WHEN '[CAH Q3 Total Sales] ' THEN LastValue ELSE '' END) AS [CAH Q3 Total Sales], 
 Max(Case ColumnName WHEN '[ML Q3 Total Sales] ' THEN LastValue ELSE '' END) AS [ML Q3 Total Sales]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.tmp_Qtr_jmw') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.tmp_Qtr_jmw') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.tmp_Qtr_jmw') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
