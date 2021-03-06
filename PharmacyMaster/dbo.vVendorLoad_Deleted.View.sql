USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vVendorLoad_Deleted]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vVendorLoad_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[FileID] ' THEN LastValue ELSE '' END) AS [FileID], 
 Max(Case ColumnName WHEN '[TransactionID] ' THEN LastValue ELSE '' END) AS [TransactionID], 
 Max(Case ColumnName WHEN '[FileName] ' THEN LastValue ELSE '' END) AS [FileName], 
 Max(Case ColumnName WHEN '[LoadDate] ' THEN LastValue ELSE '' END) AS [LoadDate], 
 Max(Case ColumnName WHEN '[LoadedBy] ' THEN LastValue ELSE '' END) AS [LoadedBy]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.VendorLoad') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.VendorLoad') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.VendorLoad') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
