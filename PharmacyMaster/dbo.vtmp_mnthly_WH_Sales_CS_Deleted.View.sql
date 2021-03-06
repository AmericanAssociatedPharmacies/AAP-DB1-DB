USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vtmp_mnthly_WH_Sales_CS_Deleted]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vtmp_mnthly_WH_Sales_CS_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[PMID] ' THEN LastValue ELSE '' END) AS [PMID], 
 Max(Case ColumnName WHEN '[AAP#] ' THEN LastValue ELSE '' END) AS [AAP#], 
 Max(Case ColumnName WHEN '[AAPParent#] ' THEN LastValue ELSE '' END) AS [AAPParent#], 
 Max(Case ColumnName WHEN '[Territory] ' THEN LastValue ELSE '' END) AS [Territory], 
 Max(Case ColumnName WHEN '[Acct#] ' THEN LastValue ELSE '' END) AS [Acct#], 
 Max(Case ColumnName WHEN '[Status] ' THEN LastValue ELSE '' END) AS [Status], 
 Max(Case ColumnName WHEN '[Name] ' THEN LastValue ELSE '' END) AS [Name], 
 Max(Case ColumnName WHEN '[ST] ' THEN LastValue ELSE '' END) AS [ST], 
 Max(Case ColumnName WHEN '[Date Opened] ' THEN LastValue ELSE '' END) AS [Date Opened], 
 Max(Case ColumnName WHEN '[October BR] ' THEN LastValue ELSE '' END) AS [October BR], 
 Max(Case ColumnName WHEN '[October GEN] ' THEN LastValue ELSE '' END) AS [October GEN], 
 Max(Case ColumnName WHEN '[October OTC] ' THEN LastValue ELSE '' END) AS [October OTC], 
 Max(Case ColumnName WHEN '[Grand Total] ' THEN LastValue ELSE '' END) AS [Grand Total]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.tmp_mnthly_WH_Sales_CS') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.tmp_mnthly_WH_Sales_CS') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.tmp_mnthly_WH_Sales_CS') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
