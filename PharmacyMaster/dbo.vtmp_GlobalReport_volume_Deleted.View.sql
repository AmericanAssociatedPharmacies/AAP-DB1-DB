USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vtmp_GlobalReport_volume_Deleted]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vtmp_GlobalReport_volume_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[pmid] ' THEN LastValue ELSE '' END) AS [pmid], 
 Max(Case ColumnName WHEN '[date] ' THEN LastValue ELSE '' END) AS [date], 
 Max(Case ColumnName WHEN '[month] ' THEN LastValue ELSE '' END) AS [month], 
 Max(Case ColumnName WHEN '[Gen Src] ' THEN LastValue ELSE '' END) AS [Gen Src], 
 Max(Case ColumnName WHEN '[Gen Exc] ' THEN LastValue ELSE '' END) AS [Gen Exc], 
 Max(Case ColumnName WHEN '[Gen Total] ' THEN LastValue ELSE '' END) AS [Gen Total], 
 Max(Case ColumnName WHEN '[CH Br] ' THEN LastValue ELSE '' END) AS [CH Br], 
 Max(Case ColumnName WHEN '[CH Oth] ' THEN LastValue ELSE '' END) AS [CH Oth], 
 Max(Case ColumnName WHEN '[UD Adm] ' THEN LastValue ELSE '' END) AS [UD Adm], 
 Max(Case ColumnName WHEN '[CH Total] ' THEN LastValue ELSE '' END) AS [CH Total], 
 Max(Case ColumnName WHEN '[API_BR] ' THEN LastValue ELSE '' END) AS [API_BR], 
 Max(Case ColumnName WHEN '[API_GEN] ' THEN LastValue ELSE '' END) AS [API_GEN], 
 Max(Case ColumnName WHEN '[API_OTC] ' THEN LastValue ELSE '' END) AS [API_OTC], 
 Max(Case ColumnName WHEN '[API_Total] ' THEN LastValue ELSE '' END) AS [API_Total], 
 Max(Case ColumnName WHEN '[ML_Total] ' THEN LastValue ELSE '' END) AS [ML_Total], 
 Max(Case ColumnName WHEN '[Anda_Total] ' THEN LastValue ELSE '' END) AS [Anda_Total], 
 Max(Case ColumnName WHEN '[All_Total] ' THEN LastValue ELSE '' END) AS [All_Total]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.tmp_GlobalReport_volume') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.tmp_GlobalReport_volume') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.tmp_GlobalReport_volume') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
