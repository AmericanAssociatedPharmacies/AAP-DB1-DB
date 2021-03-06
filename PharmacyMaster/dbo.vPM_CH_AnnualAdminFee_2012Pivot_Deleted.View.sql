USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vPM_CH_AnnualAdminFee_2012Pivot_Deleted]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vPM_CH_AnnualAdminFee_2012Pivot_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[PMID] ' THEN LastValue ELSE '' END) AS [PMID], 
 Max(Case ColumnName WHEN '[CA#] ' THEN LastValue ELSE '' END) AS [CA#], 
 Max(Case ColumnName WHEN '[Cust Name] ' THEN LastValue ELSE '' END) AS [Cust Name], 
 Max(Case ColumnName WHEN '[JAN 2012] ' THEN LastValue ELSE '' END) AS [JAN 2012], 
 Max(Case ColumnName WHEN '[FEB 2012] ' THEN LastValue ELSE '' END) AS [FEB 2012], 
 Max(Case ColumnName WHEN '[MAR 2012] ' THEN LastValue ELSE '' END) AS [MAR 2012], 
 Max(Case ColumnName WHEN '[APR 2012] ' THEN LastValue ELSE '' END) AS [APR 2012], 
 Max(Case ColumnName WHEN '[MAY 2012] ' THEN LastValue ELSE '' END) AS [MAY 2012], 
 Max(Case ColumnName WHEN '[JUN 2012] ' THEN LastValue ELSE '' END) AS [JUN 2012], 
 Max(Case ColumnName WHEN '[JUL 2012] ' THEN LastValue ELSE '' END) AS [JUL 2012], 
 Max(Case ColumnName WHEN '[AUG 2012] ' THEN LastValue ELSE '' END) AS [AUG 2012], 
 Max(Case ColumnName WHEN '[SEP 2012] ' THEN LastValue ELSE '' END) AS [SEP 2012], 
 Max(Case ColumnName WHEN '[OCT 2012] ' THEN LastValue ELSE '' END) AS [OCT 2012], 
 Max(Case ColumnName WHEN '[NOV 2012] ' THEN LastValue ELSE '' END) AS [NOV 2012], 
 Max(Case ColumnName WHEN '[DEC 2012] ' THEN LastValue ELSE '' END) AS [DEC 2012], 
 Max(Case ColumnName WHEN '[Sum Extended Sales] ' THEN LastValue ELSE '' END) AS [Sum Extended Sales], 
 Max(Case ColumnName WHEN '[Addl Admin Fee] ' THEN LastValue ELSE '' END) AS [Addl Admin Fee], 
 Max(Case ColumnName WHEN '[Adj Admin Fee for negs] ' THEN LastValue ELSE '' END) AS [Adj Admin Fee for negs]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.PM_CH_AnnualAdminFee_2012Pivot') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.PM_CH_AnnualAdminFee_2012Pivot') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.PM_CH_AnnualAdminFee_2012Pivot') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
