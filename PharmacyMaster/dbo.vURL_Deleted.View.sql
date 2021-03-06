USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vURL_Deleted]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vURL_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[DEA # ] ' THEN LastValue ELSE '' END) AS [DEA # ], 
 Max(Case ColumnName WHEN '[PMID] ' THEN LastValue ELSE '' END) AS [PMID], 
 Max(Case ColumnName WHEN '[Rebate Sales] ' THEN LastValue ELSE '' END) AS [Rebate Sales], 
 Max(Case ColumnName WHEN '[Rebate] ' THEN LastValue ELSE '' END) AS [Rebate], 
 Max(Case ColumnName WHEN '[Storeid] ' THEN LastValue ELSE '' END) AS [Storeid], 
 Max(Case ColumnName WHEN '[Facility Address] ' THEN LastValue ELSE '' END) AS [Facility Address], 
 Max(Case ColumnName WHEN '[Facility City] ' THEN LastValue ELSE '' END) AS [Facility City], 
 Max(Case ColumnName WHEN '[FaSt] ' THEN LastValue ELSE '' END) AS [FaSt], 
 Max(Case ColumnName WHEN '[Facil Zip] ' THEN LastValue ELSE '' END) AS [Facil Zip]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.URL') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.URL') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.URL') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
