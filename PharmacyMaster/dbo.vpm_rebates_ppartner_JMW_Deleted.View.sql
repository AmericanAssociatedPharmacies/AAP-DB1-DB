USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vpm_rebates_ppartner_JMW_Deleted]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vpm_rebates_ppartner_JMW_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[Period] ' THEN LastValue ELSE '' END) AS [Period], 
 Max(Case ColumnName WHEN '[PMID] ' THEN LastValue ELSE '' END) AS [PMID], 
 Max(Case ColumnName WHEN '[VolumeAmt] ' THEN LastValue ELSE '' END) AS [VolumeAmt], 
 Max(Case ColumnName WHEN '[RebateAmt] ' THEN LastValue ELSE '' END) AS [RebateAmt], 
 Max(Case ColumnName WHEN '[PaymentAmt] ' THEN LastValue ELSE '' END) AS [PaymentAmt], 
 Max(Case ColumnName WHEN '[Eligible] ' THEN LastValue ELSE '' END) AS [Eligible], 
 Max(Case ColumnName WHEN '[Affiliate] ' THEN LastValue ELSE '' END) AS [Affiliate], 
 Max(Case ColumnName WHEN '[LastPayment] ' THEN LastValue ELSE '' END) AS [LastPayment], 
 Max(Case ColumnName WHEN '[Paid To Store] ' THEN LastValue ELSE '' END) AS [Paid To Store], 
 Max(Case ColumnName WHEN '[Paid To Affiliate] ' THEN LastValue ELSE '' END) AS [Paid To Affiliate]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.pm_rebates_ppartner_JMW') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.pm_rebates_ppartner_JMW') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.pm_rebates_ppartner_JMW') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
