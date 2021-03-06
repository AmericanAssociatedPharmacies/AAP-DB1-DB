USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vNCPDPPaymentCenter_Deleted]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vNCPDPPaymentCenter_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[Payment Center ID] ' THEN LastValue ELSE '' END) AS [Payment Center ID], 
 Max(Case ColumnName WHEN '[Payment Center Name] ' THEN LastValue ELSE '' END) AS [Payment Center Name], 
 Max(Case ColumnName WHEN '[Remittance Address 1] ' THEN LastValue ELSE '' END) AS [Remittance Address 1], 
 Max(Case ColumnName WHEN '[Remittance Address 2] ' THEN LastValue ELSE '' END) AS [Remittance Address 2], 
 Max(Case ColumnName WHEN '[Remittance City] ' THEN LastValue ELSE '' END) AS [Remittance City], 
 Max(Case ColumnName WHEN '[Remittance State Code] ' THEN LastValue ELSE '' END) AS [Remittance State Code], 
 Max(Case ColumnName WHEN '[Remittance Zip Code] ' THEN LastValue ELSE '' END) AS [Remittance Zip Code], 
 Max(Case ColumnName WHEN '[Remittance Phone Number] ' THEN LastValue ELSE '' END) AS [Remittance Phone Number], 
 Max(Case ColumnName WHEN '[Remittance Extension] ' THEN LastValue ELSE '' END) AS [Remittance Extension], 
 Max(Case ColumnName WHEN '[Remittance FAX Number] ' THEN LastValue ELSE '' END) AS [Remittance FAX Number], 
 Max(Case ColumnName WHEN '[Remittance Contact Name] ' THEN LastValue ELSE '' END) AS [Remittance Contact Name], 
 Max(Case ColumnName WHEN '[Remittance Contact Title] ' THEN LastValue ELSE '' END) AS [Remittance Contact Title], 
 Max(Case ColumnName WHEN '[Remittance E-Mail Address] ' THEN LastValue ELSE '' END) AS [Remittance E-Mail Address], 
 Max(Case ColumnName WHEN '[Delete Date] ' THEN LastValue ELSE '' END) AS [Delete Date]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.NCPDPPaymentCenter') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.NCPDPPaymentCenter') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.NCPDPPaymentCenter') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
