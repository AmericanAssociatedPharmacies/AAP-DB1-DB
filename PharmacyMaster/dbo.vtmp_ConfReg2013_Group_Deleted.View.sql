USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vtmp_ConfReg2013_Group_Deleted]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vtmp_ConfReg2013_Group_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[PMID] ' THEN LastValue ELSE '' END) AS [PMID], 
 Max(Case ColumnName WHEN '[Date Rec] ' THEN LastValue ELSE '' END) AS [Date Rec], 
 Max(Case ColumnName WHEN '[Rec via] ' THEN LastValue ELSE '' END) AS [Rec via], 
 Max(Case ColumnName WHEN '[Registrant type] ' THEN LastValue ELSE '' END) AS [Registrant type], 
 Max(Case ColumnName WHEN '[Pharmacy or Company Name] ' THEN LastValue ELSE '' END) AS [Pharmacy or Company Name], 
 Max(Case ColumnName WHEN '[Primary Contact Name] ' THEN LastValue ELSE '' END) AS [Primary Contact Name], 
 Max(Case ColumnName WHEN '[AAP  Acct #] ' THEN LastValue ELSE '' END) AS [AAP  Acct #], 
 Max(Case ColumnName WHEN '[AAP Parent or Group#] ' THEN LastValue ELSE '' END) AS [AAP Parent or Group#], 
 Max(Case ColumnName WHEN '[API   Acct #] ' THEN LastValue ELSE '' END) AS [API   Acct #], 
 Max(Case ColumnName WHEN '[Address] ' THEN LastValue ELSE '' END) AS [Address], 
 Max(Case ColumnName WHEN '[City] ' THEN LastValue ELSE '' END) AS [City], 
 Max(Case ColumnName WHEN '[St] ' THEN LastValue ELSE '' END) AS [St], 
 Max(Case ColumnName WHEN '[Zip] ' THEN LastValue ELSE '' END) AS [Zip], 
 Max(Case ColumnName WHEN '[Phone] ' THEN LastValue ELSE '' END) AS [Phone], 
 Max(Case ColumnName WHEN '[Ext] ' THEN LastValue ELSE '' END) AS [Ext], 
 Max(Case ColumnName WHEN '[Fax] ' THEN LastValue ELSE '' END) AS [Fax], 
 Max(Case ColumnName WHEN '[Email] ' THEN LastValue ELSE '' END) AS [Email], 
 Max(Case ColumnName WHEN '[# Phcy Rep] ' THEN LastValue ELSE '' END) AS [# Phcy Rep], 
 Max(Case ColumnName WHEN '[# Attd] ' THEN LastValue ELSE '' END) AS [# Attd], 
 Max(Case ColumnName WHEN '[TM] ' THEN LastValue ELSE '' END) AS [TM], 
 Max(Case ColumnName WHEN '[TM#] ' THEN LastValue ELSE '' END) AS [TM#], 
 Max(Case ColumnName WHEN '[GroupNo] ' THEN LastValue ELSE '' END) AS [GroupNo]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.tmp_ConfReg2013_Group') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.tmp_ConfReg2013_Group') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.tmp_ConfReg2013_Group') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
