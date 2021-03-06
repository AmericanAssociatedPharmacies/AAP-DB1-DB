USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vPM_VendorAccts_bkp_Deleted]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vPM_VendorAccts_bkp_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[PMID] ' THEN LastValue ELSE '' END) AS [PMID], 
 Max(Case ColumnName WHEN '[VendorID] ' THEN LastValue ELSE '' END) AS [VendorID], 
 Max(Case ColumnName WHEN '[isPrimary] ' THEN LastValue ELSE '' END) AS [isPrimary], 
 Max(Case ColumnName WHEN '[VendAcctNum] ' THEN LastValue ELSE '' END) AS [VendAcctNum], 
 Max(Case ColumnName WHEN '[PVA] ' THEN LastValue ELSE '' END) AS [PVA], 
 Max(Case ColumnName WHEN '[PaymentTerms] ' THEN LastValue ELSE '' END) AS [PaymentTerms], 
 Max(Case ColumnName WHEN '[Source] ' THEN LastValue ELSE '' END) AS [Source]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.PM_VendorAccts_bkp') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.PM_VendorAccts_bkp') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.PM_VendorAccts_bkp') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
