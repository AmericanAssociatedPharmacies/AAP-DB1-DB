USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vCHAAP_SALES_Deleted]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vCHAAP_SALES_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[Date] ' THEN LastValue ELSE '' END) AS [Date], 
 Max(Case ColumnName WHEN '[PMID] ' THEN LastValue ELSE '' END) AS [PMID], 
 Max(Case ColumnName WHEN '[CHAccountNo] ' THEN LastValue ELSE '' END) AS [CHAccountNo], 
 Max(Case ColumnName WHEN '[DCNum] ' THEN LastValue ELSE '' END) AS [DCNum], 
 Max(Case ColumnName WHEN '[DCCity] ' THEN LastValue ELSE '' END) AS [DCCity], 
 Max(Case ColumnName WHEN '[AccountName] ' THEN LastValue ELSE '' END) AS [AccountName], 
 Max(Case ColumnName WHEN '[Address] ' THEN LastValue ELSE '' END) AS [Address], 
 Max(Case ColumnName WHEN '[City] ' THEN LastValue ELSE '' END) AS [City], 
 Max(Case ColumnName WHEN '[State] ' THEN LastValue ELSE '' END) AS [State], 
 Max(Case ColumnName WHEN '[ZIP] ' THEN LastValue ELSE '' END) AS [ZIP], 
 Max(Case ColumnName WHEN '[AAPAccountNo] ' THEN LastValue ELSE '' END) AS [AAPAccountNo], 
 Max(Case ColumnName WHEN '[DEA] ' THEN LastValue ELSE '' END) AS [DEA], 
 Max(Case ColumnName WHEN '[COGAppliedSales] ' THEN LastValue ELSE '' END) AS [COGAppliedSales], 
 Max(Case ColumnName WHEN '[NetSales] ' THEN LastValue ELSE '' END) AS [NetSales], 
 Max(Case ColumnName WHEN '[GENTotal] ' THEN LastValue ELSE '' END) AS [GENTotal], 
 Max(Case ColumnName WHEN '[GENExcl] ' THEN LastValue ELSE '' END) AS [GENExcl], 
 Max(Case ColumnName WHEN '[GENSrc] ' THEN LastValue ELSE '' END) AS [GENSrc], 
 Max(Case ColumnName WHEN '[GENSrcTop] ' THEN LastValue ELSE '' END) AS [GENSrcTop], 
 Max(Case ColumnName WHEN '[Brand] ' THEN LastValue ELSE '' END) AS [Brand], 
 Max(Case ColumnName WHEN '[GENCHPreSrcBU] ' THEN LastValue ELSE '' END) AS [GENCHPreSrcBU], 
 Max(Case ColumnName WHEN '[OTC] ' THEN LastValue ELSE '' END) AS [OTC], 
 Max(Case ColumnName WHEN '[Other] ' THEN LastValue ELSE '' END) AS [Other]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.CHAAP_SALES') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.CHAAP_SALES') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.CHAAP_SALES') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
