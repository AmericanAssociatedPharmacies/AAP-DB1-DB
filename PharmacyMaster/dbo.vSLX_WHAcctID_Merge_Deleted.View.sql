USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vSLX_WHAcctID_Merge_Deleted]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vSLX_WHAcctID_Merge_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[ID] ' THEN LastValue ELSE '' END) AS [ID], 
 Max(Case ColumnName WHEN '[WHAccountIDOld] ' THEN LastValue ELSE '' END) AS [WHAccountIDOld], 
 Max(Case ColumnName WHEN '[WHAccountIDNew] ' THEN LastValue ELSE '' END) AS [WHAccountIDNew], 
 Max(Case ColumnName WHEN '[DateAdded] ' THEN LastValue ELSE '' END) AS [DateAdded]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.SLX_WHAcctID_Merge') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.SLX_WHAcctID_Merge') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.SLX_WHAcctID_Merge') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
