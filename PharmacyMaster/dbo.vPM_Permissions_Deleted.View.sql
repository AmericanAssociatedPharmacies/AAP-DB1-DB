USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vPM_Permissions_Deleted]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vPM_Permissions_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[sysUser] ' THEN LastValue ELSE '' END) AS [sysUser], 
 Max(Case ColumnName WHEN '[Administration] ' THEN LastValue ELSE '' END) AS [Administration], 
 Max(Case ColumnName WHEN '[AllowDelete] ' THEN LastValue ELSE '' END) AS [AllowDelete], 
 Max(Case ColumnName WHEN '[ReadOnly] ' THEN LastValue ELSE '' END) AS [ReadOnly], 
 Max(Case ColumnName WHEN '[TestDatabase] ' THEN LastValue ELSE '' END) AS [TestDatabase], 
 Max(Case ColumnName WHEN '[WholeSaler_RW] ' THEN LastValue ELSE '' END) AS [WholeSaler_RW], 
 Max(Case ColumnName WHEN '[WebPermissions] ' THEN LastValue ELSE '' END) AS [WebPermissions]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.PM_Permissions') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.PM_Permissions') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.PM_Permissions') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
