USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vUDVendors_Deleted]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vUDVendors_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[VendorID] ' THEN LastValue ELSE '' END) AS [VendorID], 
 Max(Case ColumnName WHEN '[OldVendorID] ' THEN LastValue ELSE '' END) AS [OldVendorID], 
 Max(Case ColumnName WHEN '[OldVolumeName] ' THEN LastValue ELSE '' END) AS [OldVolumeName], 
 Max(Case ColumnName WHEN '[Reports] ' THEN LastValue ELSE '' END) AS [Reports], 
 Max(Case ColumnName WHEN '[Active] ' THEN LastValue ELSE '' END) AS [Active], 
 Max(Case ColumnName WHEN '[EffectDate] ' THEN LastValue ELSE '' END) AS [EffectDate], 
 Max(Case ColumnName WHEN '[Factor] ' THEN LastValue ELSE '' END) AS [Factor], 
 Max(Case ColumnName WHEN '[TotalPercentRebate] ' THEN LastValue ELSE '' END) AS [TotalPercentRebate], 
 Max(Case ColumnName WHEN '[Active2007] ' THEN LastValue ELSE '' END) AS [Active2007], 
 Max(Case ColumnName WHEN '[VendorPair] ' THEN LastValue ELSE '' END) AS [VendorPair], 
 Max(Case ColumnName WHEN '[PPVendorID] ' THEN LastValue ELSE '' END) AS [PPVendorID], 
 Max(Case ColumnName WHEN '[OldRebateName] ' THEN LastValue ELSE '' END) AS [OldRebateName], 
 Max(Case ColumnName WHEN '[RebateReportDisplayName] ' THEN LastValue ELSE '' END) AS [RebateReportDisplayName]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.UDVendors') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.UDVendors') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.UDVendors') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
