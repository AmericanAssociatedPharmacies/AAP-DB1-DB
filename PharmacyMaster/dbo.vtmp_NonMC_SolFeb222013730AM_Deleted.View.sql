USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vtmp_NonMC_SolFeb222013730AM_Deleted]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vtmp_NonMC_SolFeb222013730AM_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[PMID] ' THEN LastValue ELSE '' END) AS [PMID], 
 Max(Case ColumnName WHEN '[AAPAccountno] ' THEN LastValue ELSE '' END) AS [AAPAccountno], 
 Max(Case ColumnName WHEN '[AccountName] ' THEN LastValue ELSE '' END) AS [AccountName], 
 Max(Case ColumnName WHEN '[AAPEffectiveDate] ' THEN LastValue ELSE '' END) AS [AAPEffectiveDate], 
 Max(Case ColumnName WHEN '[AAPQuitDate] ' THEN LastValue ELSE '' END) AS [AAPQuitDate], 
 Max(Case ColumnName WHEN '[Address] ' THEN LastValue ELSE '' END) AS [Address], 
 Max(Case ColumnName WHEN '[Address2] ' THEN LastValue ELSE '' END) AS [Address2], 
 Max(Case ColumnName WHEN '[City] ' THEN LastValue ELSE '' END) AS [City], 
 Max(Case ColumnName WHEN '[State] ' THEN LastValue ELSE '' END) AS [State], 
 Max(Case ColumnName WHEN '[Zip] ' THEN LastValue ELSE '' END) AS [Zip], 
 Max(Case ColumnName WHEN '[ContactFullName] ' THEN LastValue ELSE '' END) AS [ContactFullName], 
 Max(Case ColumnName WHEN '[NCPDP] ' THEN LastValue ELSE '' END) AS [NCPDP], 
 Max(Case ColumnName WHEN '[FedID] ' THEN LastValue ELSE '' END) AS [FedID], 
 Max(Case ColumnName WHEN '[CorporateName] ' THEN LastValue ELSE '' END) AS [CorporateName]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.tmp_NonMC_SolFeb222013730AM') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.tmp_NonMC_SolFeb222013730AM') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.tmp_NonMC_SolFeb222013730AM') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
