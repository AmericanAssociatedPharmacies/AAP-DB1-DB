USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vPM_Rebates_APIQuarterly_Deleted]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vPM_Rebates_APIQuarterly_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[Period] ' THEN LastValue ELSE '' END) AS [Period], 
 Max(Case ColumnName WHEN '[date_start] ' THEN LastValue ELSE '' END) AS [date_start], 
 Max(Case ColumnName WHEN '[date_end] ' THEN LastValue ELSE '' END) AS [date_end], 
 Max(Case ColumnName WHEN '[PMID] ' THEN LastValue ELSE '' END) AS [PMID], 
 Max(Case ColumnName WHEN '[API Acct#] ' THEN LastValue ELSE '' END) AS [API Acct#], 
 Max(Case ColumnName WHEN '[Pharmacy Name] ' THEN LastValue ELSE '' END) AS [Pharmacy Name], 
 Max(Case ColumnName WHEN '[Business Class] ' THEN LastValue ELSE '' END) AS [Business Class], 
 Max(Case ColumnName WHEN '[Rebate Administrator] ' THEN LastValue ELSE '' END) AS [Rebate Administrator], 
 Max(Case ColumnName WHEN '[API Generic Sales] ' THEN LastValue ELSE '' END) AS [API Generic Sales], 
 Max(Case ColumnName WHEN '[API Brand Sales] ' THEN LastValue ELSE '' END) AS [API Brand Sales], 
 Max(Case ColumnName WHEN '[API OTC Sales] ' THEN LastValue ELSE '' END) AS [API OTC Sales], 
 Max(Case ColumnName WHEN '[API Total Whse Sales] ' THEN LastValue ELSE '' END) AS [API Total Whse Sales], 
 Max(Case ColumnName WHEN '[API Whse Gross Rebate] ' THEN LastValue ELSE '' END) AS [API Whse Gross Rebate], 
 Max(Case ColumnName WHEN '[Generic Admin Fee] ' THEN LastValue ELSE '' END) AS [Generic Admin Fee], 
 Max(Case ColumnName WHEN '[API WHSE REBATE for Payout] ' THEN LastValue ELSE '' END) AS [API WHSE REBATE for Payout], 
 Max(Case ColumnName WHEN '[Less Negative Rebates] ' THEN LastValue ELSE '' END) AS [Less Negative Rebates], 
 Max(Case ColumnName WHEN '[Unpaid Finance Charges] ' THEN LastValue ELSE '' END) AS [Unpaid Finance Charges], 
 Max(Case ColumnName WHEN '[Donepezil Rebate on Sales out] ' THEN LastValue ELSE '' END) AS [Donepezil Rebate on Sales out], 
 Max(Case ColumnName WHEN '[Rebate to Pay Acct/Admin] ' THEN LastValue ELSE '' END) AS [Rebate to Pay Acct/Admin], 
 Max(Case ColumnName WHEN '[Less Group Admin] ' THEN LastValue ELSE '' END) AS [Less Group Admin], 
 Max(Case ColumnName WHEN '[Net Rebate to Store] ' THEN LastValue ELSE '' END) AS [Net Rebate to Store], 
 Max(Case ColumnName WHEN '[Pay Account] ' THEN LastValue ELSE '' END) AS [Pay Account], 
 Max(Case ColumnName WHEN '[Print Rebate Letter] ' THEN LastValue ELSE '' END) AS [Print Rebate Letter], 
 Max(Case ColumnName WHEN '[Brand Credits Disbursed] ' THEN LastValue ELSE '' END) AS [Brand Credits Disbursed], 
 Max(Case ColumnName WHEN '[Brand Credit Potential] ' THEN LastValue ELSE '' END) AS [Brand Credit Potential], 
 Max(Case ColumnName WHEN '[Accelerated Pay Discount] ' THEN LastValue ELSE '' END) AS [Accelerated Pay Discount], 
 Max(Case ColumnName WHEN '[Avg Rebate Percentage] ' THEN LastValue ELSE '' END) AS [Avg Rebate Percentage], 
 Max(Case ColumnName WHEN '[Adjust for Returns] ' THEN LastValue ELSE '' END) AS [Adjust for Returns], 
 Max(Case ColumnName WHEN '[Adjust for Promotions] ' THEN LastValue ELSE '' END) AS [Adjust for Promotions], 
 Max(Case ColumnName WHEN '[Adjust for Rebate Errors] ' THEN LastValue ELSE '' END) AS [Adjust for Rebate Errors]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.PM_Rebates_APIQuarterly') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.PM_Rebates_APIQuarterly') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.PM_Rebates_APIQuarterly') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
