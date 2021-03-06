USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vtmp_AAPAdmin_Deleted]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vtmp_AAPAdmin_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[month] ' THEN LastValue ELSE '' END) AS [month], 
 Max(Case ColumnName WHEN '[pmid] ' THEN LastValue ELSE '' END) AS [pmid], 
 Max(Case ColumnName WHEN '[aapaccountno] ' THEN LastValue ELSE '' END) AS [aapaccountno], 
 Max(Case ColumnName WHEN '[apiaccountno] ' THEN LastValue ELSE '' END) AS [apiaccountno], 
 Max(Case ColumnName WHEN '[ca#] ' THEN LastValue ELSE '' END) AS [ca#], 
 Max(Case ColumnName WHEN '[name] ' THEN LastValue ELSE '' END) AS [name], 
 Max(Case ColumnName WHEN '[dc] ' THEN LastValue ELSE '' END) AS [dc], 
 Max(Case ColumnName WHEN '[division] ' THEN LastValue ELSE '' END) AS [division], 
 Max(Case ColumnName WHEN '[store] ' THEN LastValue ELSE '' END) AS [store], 
 Max(Case ColumnName WHEN '[metrics] ' THEN LastValue ELSE '' END) AS [metrics], 
 Max(Case ColumnName WHEN '[Gen_Qualified] ' THEN LastValue ELSE '' END) AS [Gen_Qualified], 
 Max(Case ColumnName WHEN '[Gen_Excluded] ' THEN LastValue ELSE '' END) AS [Gen_Excluded], 
 Max(Case ColumnName WHEN '[Gen_Total] ' THEN LastValue ELSE '' END) AS [Gen_Total], 
 Max(Case ColumnName WHEN '[Brand] ' THEN LastValue ELSE '' END) AS [Brand], 
 Max(Case ColumnName WHEN '[Extended] ' THEN LastValue ELSE '' END) AS [Extended], 
 Max(Case ColumnName WHEN '[AdminFee] ' THEN LastValue ELSE '' END) AS [AdminFee]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.tmp_AAPAdmin') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.tmp_AAPAdmin') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.tmp_AAPAdmin') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
