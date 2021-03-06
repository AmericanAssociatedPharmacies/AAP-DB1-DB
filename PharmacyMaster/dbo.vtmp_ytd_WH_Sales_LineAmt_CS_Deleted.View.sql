USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vtmp_ytd_WH_Sales_LineAmt_CS_Deleted]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vtmp_ytd_WH_Sales_LineAmt_CS_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[Acct#] ' THEN LastValue ELSE '' END) AS [Acct#], 
 Max(Case ColumnName WHEN '[SlsMn] ' THEN LastValue ELSE '' END) AS [SlsMn], 
 Max(Case ColumnName WHEN '[Name] ' THEN LastValue ELSE '' END) AS [Name], 
 Max(Case ColumnName WHEN '[City] ' THEN LastValue ELSE '' END) AS [City], 
 Max(Case ColumnName WHEN '[ST] ' THEN LastValue ELSE '' END) AS [ST], 
 Max(Case ColumnName WHEN '[Status] ' THEN LastValue ELSE '' END) AS [Status], 
 Max(Case ColumnName WHEN '[Date Opened] ' THEN LastValue ELSE '' END) AS [Date Opened], 
 Max(Case ColumnName WHEN '[Apr 09 Brand] ' THEN LastValue ELSE '' END) AS [Apr 09 Brand], 
 Max(Case ColumnName WHEN '[May 09 Brand] ' THEN LastValue ELSE '' END) AS [May 09 Brand], 
 Max(Case ColumnName WHEN '[June 09 Brand] ' THEN LastValue ELSE '' END) AS [June 09 Brand], 
 Max(Case ColumnName WHEN '[July 09 Brand] ' THEN LastValue ELSE '' END) AS [July 09 Brand], 
 Max(Case ColumnName WHEN '[Aug 09 Brand] ' THEN LastValue ELSE '' END) AS [Aug 09 Brand], 
 Max(Case ColumnName WHEN '[Sept 09 Brand] ' THEN LastValue ELSE '' END) AS [Sept 09 Brand], 
 Max(Case ColumnName WHEN '[Oct 09 Brand] ' THEN LastValue ELSE '' END) AS [Oct 09 Brand], 
 Max(Case ColumnName WHEN '[Nov 09 Brand] ' THEN LastValue ELSE '' END) AS [Nov 09 Brand], 
 Max(Case ColumnName WHEN '[Dec 09 Brand] ' THEN LastValue ELSE '' END) AS [Dec 09 Brand], 
 Max(Case ColumnName WHEN '[Jan 10 Brand] ' THEN LastValue ELSE '' END) AS [Jan 10 Brand], 
 Max(Case ColumnName WHEN '[Feb 10 Brand] ' THEN LastValue ELSE '' END) AS [Feb 10 Brand], 
 Max(Case ColumnName WHEN '[Mar 10 Brand] ' THEN LastValue ELSE '' END) AS [Mar 10 Brand], 
 Max(Case ColumnName WHEN '[Apr 10 Brand] ' THEN LastValue ELSE '' END) AS [Apr 10 Brand], 
 Max(Case ColumnName WHEN '[May 10 Brand] ' THEN LastValue ELSE '' END) AS [May 10 Brand], 
 Max(Case ColumnName WHEN '[Apr 09 Generic] ' THEN LastValue ELSE '' END) AS [Apr 09 Generic], 
 Max(Case ColumnName WHEN '[May 09 Generic] ' THEN LastValue ELSE '' END) AS [May 09 Generic], 
 Max(Case ColumnName WHEN '[June 09 Generic] ' THEN LastValue ELSE '' END) AS [June 09 Generic], 
 Max(Case ColumnName WHEN '[July 09 Generic] ' THEN LastValue ELSE '' END) AS [July 09 Generic], 
 Max(Case ColumnName WHEN '[Aug 09 Generic] ' THEN LastValue ELSE '' END) AS [Aug 09 Generic], 
 Max(Case ColumnName WHEN '[Sept 09 Generic] ' THEN LastValue ELSE '' END) AS [Sept 09 Generic], 
 Max(Case ColumnName WHEN '[Oct 09 Generic] ' THEN LastValue ELSE '' END) AS [Oct 09 Generic], 
 Max(Case ColumnName WHEN '[Nov 09 Generic] ' THEN LastValue ELSE '' END) AS [Nov 09 Generic], 
 Max(Case ColumnName WHEN '[Dec 09 Generic] ' THEN LastValue ELSE '' END) AS [Dec 09 Generic], 
 Max(Case ColumnName WHEN '[Jan 10 Generic] ' THEN LastValue ELSE '' END) AS [Jan 10 Generic], 
 Max(Case ColumnName WHEN '[Feb 10 Generic] ' THEN LastValue ELSE '' END) AS [Feb 10 Generic], 
 Max(Case ColumnName WHEN '[Mar 10 Generic] ' THEN LastValue ELSE '' END) AS [Mar 10 Generic], 
 Max(Case ColumnName WHEN '[Apr 10 Generic] ' THEN LastValue ELSE '' END) AS [Apr 10 Generic], 
 Max(Case ColumnName WHEN '[May 10 Generic] ' THEN LastValue ELSE '' END) AS [May 10 Generic], 
 Max(Case ColumnName WHEN '[Apr 09 OTC] ' THEN LastValue ELSE '' END) AS [Apr 09 OTC], 
 Max(Case ColumnName WHEN '[MAY 09 OTC] ' THEN LastValue ELSE '' END) AS [MAY 09 OTC], 
 Max(Case ColumnName WHEN '[June 09 OTC] ' THEN LastValue ELSE '' END) AS [June 09 OTC], 
 Max(Case ColumnName WHEN '[July 09 OTC] ' THEN LastValue ELSE '' END) AS [July 09 OTC], 
 Max(Case ColumnName WHEN '[Aug 09 OTC] ' THEN LastValue ELSE '' END) AS [Aug 09 OTC], 
 Max(Case ColumnName WHEN '[Sept 09 OTC] ' THEN LastValue ELSE '' END) AS [Sept 09 OTC], 
 Max(Case ColumnName WHEN '[Oct 09 OTC] ' THEN LastValue ELSE '' END) AS [Oct 09 OTC], 
 Max(Case ColumnName WHEN '[Nov 09 OTC] ' THEN LastValue ELSE '' END) AS [Nov 09 OTC], 
 Max(Case ColumnName WHEN '[Dec 09 OTC] ' THEN LastValue ELSE '' END) AS [Dec 09 OTC], 
 Max(Case ColumnName WHEN '[Jan 10 OTC] ' THEN LastValue ELSE '' END) AS [Jan 10 OTC], 
 Max(Case ColumnName WHEN '[Feb 10 OTC] ' THEN LastValue ELSE '' END) AS [Feb 10 OTC], 
 Max(Case ColumnName WHEN '[Mar 10 OTC] ' THEN LastValue ELSE '' END) AS [Mar 10 OTC], 
 Max(Case ColumnName WHEN '[Apr 10 OTC] ' THEN LastValue ELSE '' END) AS [Apr 10 OTC], 
 Max(Case ColumnName WHEN '[May 10 OTC] ' THEN LastValue ELSE '' END) AS [May 10 OTC], 
 Max(Case ColumnName WHEN '[Brand Totals] ' THEN LastValue ELSE '' END) AS [Brand Totals], 
 Max(Case ColumnName WHEN '[Generic Totals] ' THEN LastValue ELSE '' END) AS [Generic Totals], 
 Max(Case ColumnName WHEN '[OTC Totals] ' THEN LastValue ELSE '' END) AS [OTC Totals], 
 Max(Case ColumnName WHEN '[Grand Totals] ' THEN LastValue ELSE '' END) AS [Grand Totals]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.tmp_ytd_WH_Sales_LineAmt_CS') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.tmp_ytd_WH_Sales_LineAmt_CS') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.tmp_ytd_WH_Sales_LineAmt_CS') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
