USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vrebate_PPartner2Q2010_Deleted]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vrebate_PPartner2Q2010_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[pmid] ' THEN LastValue ELSE '' END) AS [pmid], 
 Max(Case ColumnName WHEN '[ncpdp] ' THEN LastValue ELSE '' END) AS [ncpdp], 
 Max(Case ColumnName WHEN '[storename] ' THEN LastValue ELSE '' END) AS [storename], 
 Max(Case ColumnName WHEN '[udaccountno] ' THEN LastValue ELSE '' END) AS [udaccountno], 
 Max(Case ColumnName WHEN '[aapaccountno] ' THEN LastValue ELSE '' END) AS [aapaccountno], 
 Max(Case ColumnName WHEN '[volume] ' THEN LastValue ELSE '' END) AS [volume], 
 Max(Case ColumnName WHEN '[rebate] ' THEN LastValue ELSE '' END) AS [rebate], 
 Max(Case ColumnName WHEN '[payment] ' THEN LastValue ELSE '' END) AS [payment]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.rebate_PPartner2Q2010') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.rebate_PPartner2Q2010') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.rebate_PPartner2Q2010') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
