USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vtmp_ALLPVA_SLX_BD_Deleted]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vtmp_ALLPVA_SLX_BD_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[pmid] ' THEN LastValue ELSE '' END) AS [pmid], 
 Max(Case ColumnName WHEN '[accountname] ' THEN LastValue ELSE '' END) AS [accountname], 
 Max(Case ColumnName WHEN '[dea] ' THEN LastValue ELSE '' END) AS [dea], 
 Max(Case ColumnName WHEN '[apiaccountno] ' THEN LastValue ELSE '' END) AS [apiaccountno], 
 Max(Case ColumnName WHEN '[m1] ' THEN LastValue ELSE '' END) AS [m1], 
 Max(Case ColumnName WHEN '[m2] ' THEN LastValue ELSE '' END) AS [m2], 
 Max(Case ColumnName WHEN '[m3] ' THEN LastValue ELSE '' END) AS [m3], 
 Max(Case ColumnName WHEN '[mo3Avg] ' THEN LastValue ELSE '' END) AS [mo3Avg], 
 Max(Case ColumnName WHEN '[Anda1] ' THEN LastValue ELSE '' END) AS [Anda1], 
 Max(Case ColumnName WHEN '[Anda2] ' THEN LastValue ELSE '' END) AS [Anda2], 
 Max(Case ColumnName WHEN '[Anda3] ' THEN LastValue ELSE '' END) AS [Anda3], 
 Max(Case ColumnName WHEN '[AndaTotal] ' THEN LastValue ELSE '' END) AS [AndaTotal], 
 Max(Case ColumnName WHEN '[WHM1] ' THEN LastValue ELSE '' END) AS [WHM1], 
 Max(Case ColumnName WHEN '[WHM2] ' THEN LastValue ELSE '' END) AS [WHM2], 
 Max(Case ColumnName WHEN '[WHM3] ' THEN LastValue ELSE '' END) AS [WHM3], 
 Max(Case ColumnName WHEN '[whPVAAvg3mo] ' THEN LastValue ELSE '' END) AS [whPVAAvg3mo]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.tmp_ALLPVA_SLX_BD') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.tmp_ALLPVA_SLX_BD') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.tmp_ALLPVA_SLX_BD') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
