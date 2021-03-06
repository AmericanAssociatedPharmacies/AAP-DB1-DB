USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vPM_Territory_Deleted]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vPM_Territory_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[Territory] ' THEN LastValue ELSE '' END) AS [Territory], 
 Max(Case ColumnName WHEN '[LastName] ' THEN LastValue ELSE '' END) AS [LastName], 
 Max(Case ColumnName WHEN '[FirstName] ' THEN LastValue ELSE '' END) AS [FirstName], 
 Max(Case ColumnName WHEN '[GeogArea] ' THEN LastValue ELSE '' END) AS [GeogArea], 
 Max(Case ColumnName WHEN '[Telephone] ' THEN LastValue ELSE '' END) AS [Telephone], 
 Max(Case ColumnName WHEN '[Cell] ' THEN LastValue ELSE '' END) AS [Cell], 
 Max(Case ColumnName WHEN '[Fax] ' THEN LastValue ELSE '' END) AS [Fax]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.PM_Territory') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.PM_Territory') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.PM_Territory') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
