USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vAPIPVA_WH_RebatesAdminFee2010_Deleted]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vAPIPVA_WH_RebatesAdminFee2010_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[Timeframe] ' THEN LastValue ELSE '' END) AS [Timeframe], 
 Max(Case ColumnName WHEN '[PMID] ' THEN LastValue ELSE '' END) AS [PMID], 
 Max(Case ColumnName WHEN '[API Acct#] ' THEN LastValue ELSE '' END) AS [API Acct#], 
 Max(Case ColumnName WHEN '[Pharmacy Name] ' THEN LastValue ELSE '' END) AS [Pharmacy Name], 
 Max(Case ColumnName WHEN '[Business Class] ' THEN LastValue ELSE '' END) AS [Business Class], 
 Max(Case ColumnName WHEN '[Rebate Administrator] ' THEN LastValue ELSE '' END) AS [Rebate Administrator], 
 Max(Case ColumnName WHEN '[Net Rebate to Pay Acct/Admin] ' THEN LastValue ELSE '' END) AS [Net Rebate to Pay Acct/Admin], 
 Max(Case ColumnName WHEN '[Less Group Admin] ' THEN LastValue ELSE '' END) AS [Less Group Admin], 
 Max(Case ColumnName WHEN '[Net Rebate to Store] ' THEN LastValue ELSE '' END) AS [Net Rebate to Store], 
 Max(Case ColumnName WHEN '[Cardinal Program Rebate] ' THEN LastValue ELSE '' END) AS [Cardinal Program Rebate], 
 Max(Case ColumnName WHEN '[API Program Rebate] ' THEN LastValue ELSE '' END) AS [API Program Rebate]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.APIPVA_WH_RebatesAdminFee2010') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.APIPVA_WH_RebatesAdminFee2010') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.APIPVA_WH_RebatesAdminFee2010') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
