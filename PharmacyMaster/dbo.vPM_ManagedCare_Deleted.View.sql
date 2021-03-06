USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vPM_ManagedCare_Deleted]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vPM_ManagedCare_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[PK_ManagedCare] ' THEN LastValue ELSE '' END) AS [PK_ManagedCare], 
 Max(Case ColumnName WHEN '[PMID] ' THEN LastValue ELSE '' END) AS [PMID], 
 Max(Case ColumnName WHEN '[MCEffectiveDate] ' THEN LastValue ELSE '' END) AS [MCEffectiveDate], 
 Max(Case ColumnName WHEN '[MCQuitDate] ' THEN LastValue ELSE '' END) AS [MCQuitDate], 
 Max(Case ColumnName WHEN '[ChainCode] ' THEN LastValue ELSE '' END) AS [ChainCode], 
 Max(Case ColumnName WHEN '[ArgusAgree] ' THEN LastValue ELSE '' END) AS [ArgusAgree], 
 Max(Case ColumnName WHEN '[MCNews_EmailAddress] ' THEN LastValue ELSE '' END) AS [MCNews_EmailAddress], 
 Max(Case ColumnName WHEN '[emailMCNews] ' THEN LastValue ELSE '' END) AS [emailMCNews], 
 Max(Case ColumnName WHEN '[McQuitReasonInternal] ' THEN LastValue ELSE '' END) AS [McQuitReasonInternal], 
 Max(Case ColumnName WHEN '[ESI] ' THEN LastValue ELSE '' END) AS [ESI]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.PM_ManagedCare') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.PM_ManagedCare') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.PM_ManagedCare') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
