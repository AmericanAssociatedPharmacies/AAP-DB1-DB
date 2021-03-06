USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vPM_CorporateB4Delete_Deleted]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vPM_CorporateB4Delete_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[CorpID] ' THEN LastValue ELSE '' END) AS [CorpID], 
 Max(Case ColumnName WHEN '[AccountName] ' THEN LastValue ELSE '' END) AS [AccountName], 
 Max(Case ColumnName WHEN '[AAPAccountNo] ' THEN LastValue ELSE '' END) AS [AAPAccountNo], 
 Max(Case ColumnName WHEN '[AAPParentNo] ' THEN LastValue ELSE '' END) AS [AAPParentNo], 
 Max(Case ColumnName WHEN '[APIAccountNo] ' THEN LastValue ELSE '' END) AS [APIAccountNo], 
 Max(Case ColumnName WHEN '[UDAccountNo] ' THEN LastValue ELSE '' END) AS [UDAccountNo], 
 Max(Case ColumnName WHEN '[UDParentNo] ' THEN LastValue ELSE '' END) AS [UDParentNo], 
 Max(Case ColumnName WHEN '[Addr1] ' THEN LastValue ELSE '' END) AS [Addr1], 
 Max(Case ColumnName WHEN '[Addr2] ' THEN LastValue ELSE '' END) AS [Addr2], 
 Max(Case ColumnName WHEN '[City] ' THEN LastValue ELSE '' END) AS [City], 
 Max(Case ColumnName WHEN '[State] ' THEN LastValue ELSE '' END) AS [State], 
 Max(Case ColumnName WHEN '[Zip] ' THEN LastValue ELSE '' END) AS [Zip], 
 Max(Case ColumnName WHEN '[ContactFullName] ' THEN LastValue ELSE '' END) AS [ContactFullName], 
 Max(Case ColumnName WHEN '[Phone] ' THEN LastValue ELSE '' END) AS [Phone], 
 Max(Case ColumnName WHEN '[Fax] ' THEN LastValue ELSE '' END) AS [Fax], 
 Max(Case ColumnName WHEN '[Email] ' THEN LastValue ELSE '' END) AS [Email], 
 Max(Case ColumnName WHEN '[Source] ' THEN LastValue ELSE '' END) AS [Source], 
 Max(Case ColumnName WHEN '[BusinessClass] ' THEN LastValue ELSE '' END) AS [BusinessClass], 
 Max(Case ColumnName WHEN '[Status] ' THEN LastValue ELSE '' END) AS [Status], 
 Max(Case ColumnName WHEN '[Territory] ' THEN LastValue ELSE '' END) AS [Territory]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.PM_CorporateB4Delete') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.PM_CorporateB4Delete') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.PM_CorporateB4Delete') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
