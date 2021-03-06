USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vtmp_CompareNonMC_orig_Deleted]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vtmp_CompareNonMC_orig_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[TableName] ' THEN LastValue ELSE '' END) AS [TableName], 
 Max(Case ColumnName WHEN '[NDUPS] ' THEN LastValue ELSE '' END) AS [NDUPS], 
 Max(Case ColumnName WHEN '[pmid] ' THEN LastValue ELSE '' END) AS [pmid], 
 Max(Case ColumnName WHEN '[aapaccountno] ' THEN LastValue ELSE '' END) AS [aapaccountno], 
 Max(Case ColumnName WHEN '[accountname] ' THEN LastValue ELSE '' END) AS [accountname], 
 Max(Case ColumnName WHEN '[aapeffectivedate] ' THEN LastValue ELSE '' END) AS [aapeffectivedate], 
 Max(Case ColumnName WHEN '[aapquitdate] ' THEN LastValue ELSE '' END) AS [aapquitdate], 
 Max(Case ColumnName WHEN '[address] ' THEN LastValue ELSE '' END) AS [address], 
 Max(Case ColumnName WHEN '[address2] ' THEN LastValue ELSE '' END) AS [address2], 
 Max(Case ColumnName WHEN '[city] ' THEN LastValue ELSE '' END) AS [city], 
 Max(Case ColumnName WHEN '[state] ' THEN LastValue ELSE '' END) AS [state], 
 Max(Case ColumnName WHEN '[zip] ' THEN LastValue ELSE '' END) AS [zip], 
 Max(Case ColumnName WHEN '[contactfullname] ' THEN LastValue ELSE '' END) AS [contactfullname], 
 Max(Case ColumnName WHEN '[ncpdp] ' THEN LastValue ELSE '' END) AS [ncpdp], 
 Max(Case ColumnName WHEN '[fedid] ' THEN LastValue ELSE '' END) AS [fedid]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.tmp_CompareNonMC_orig') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.tmp_CompareNonMC_orig') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.tmp_CompareNonMC_orig') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
