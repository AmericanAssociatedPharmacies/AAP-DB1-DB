USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vw_import_CHRebate]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_import_CHRebate]

AS

SELECT CONVERT(DATETIME, DATEADD(DAY, 0, DATEDIFF(DAY, 0, GETDATE()))) AS Date
, CONVERT(NVARCHAR(255), CASE 
						   WHEN [Marker] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
						   ELSE LTRIM(RTRIM([Marker]))
						   END
		) AS [Marker]
, CONVERT(NVARCHAR(255), [PMID]) AS PMID
, CONVERT(NVARCHAR(255), CASE 
					   WHEN [Primary CA#] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
					   ELSE LTRIM(RTRIM([Primary CA#]))
					   END
	   ) AS [Primary CA#]
, CONVERT(NVARCHAR(255), CASE 
					   WHEN [Division] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
					   ELSE LTRIM(RTRIM([Division]))
					   END
	   ) AS [Division]
, CONVERT(NVARCHAR(255), CASE 
					   WHEN [API#] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
					   ELSE LTRIM(RTRIM([API#]))
					   END
	   ) AS [API#]
, CONVERT(NVARCHAR(255), CASE 
					   WHEN [Account Name] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
					   ELSE LTRIM(RTRIM([Account Name]))
					   END
	   ) AS [Account Name]
, CONVERT(NVARCHAR(255), CASE 
					   WHEN  [City] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
					   ELSE LTRIM(RTRIM([City]))
					   END
	   ) AS [City]
, CONVERT(NVARCHAR(255), CASE 
					   WHEN [ST] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
					   ELSE LTRIM(RTRIM([ST]))
					   END
	   ) AS [ST]
, CONVERT(MONEY, [SumOfExtended Sales]) AS [SumOfExtended Sales]
, CONVERT(MONEY, [Price Protection]) AS PriceProtection
, CONVERT(MONEY, [Adjusted Ext Sales]) AS AdjustedExtSales
, CONVERT(MONEY, [AAP Volume Admin Fee]) AS [AAP Volume Admin Fee]
, CONVERT(MONEY, [Vol Admin Fee Adjustment]) AS VolAdminFeeAdj
--, [RX Branded-RxPlus]
, CONVERT(MONEY, [RxPlus Admin Fee]) AS RxPlusAdminFee
, CONVERT(NVARCHAR(255), CASE 
					   WHEN [Bs Class] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
					   ELSE LTRIM(RTRIM([Bs Class]))
					   END
	   ) AS [Bs Class]
, CONVERT(NVARCHAR(255), CASE 
					   WHEN [Affiliation] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
					   ELSE LTRIM(RTRIM([Affiliation]))
					   END
	   ) AS [Affiliation]
, CONVERT(MONEY, [Affiliate Admin Fee]) AS [Affiliate Admin Fee]
, CONVERT(MONEY, [Affil Admin Fee Adjustment]) AS AffilAdminFeeAdj
, CONVERT(MONEY, [Total RX less Excluded items]) AS TotalRXlessExcludedItems
, CONVERT(MONEY, [SumOfCCA = AAP Generics 872, 25676, 25677]) AS [SumOfCCA = AAP Generics 872, 25676, 25677]
, CONVERT(MONEY, [SumOfCCA = 26776 AAP Excluded Generic Rx Prod]) AS [SumOfCCA = 26776 AAP Excluded Generic Rx Prod]
, CONVERT(MONEY, [SumOfTotal Generics]) AS [SumOfTotal Generics]
, CONVERT(MONEY, [Adjusted Generic Source]) AS AdjustedGenericSource
, CONVERT(MONEY, [Est Generic Admin Fee]) AS [Est Generic Admin Fee]
, CONVERT(MONEY, [Generic Admin Fee Adjustment]) AS GenericAdminFeeAdj
, CONVERT(MONEY, [Calculated generic rebate]) AS [Calculated generic rebate]
, CONVERT(MONEY, [Generic rebate adjustment]) AS [GenericRebateAdjustment]
, CONVERT(MONEY, [COG Rebate]) AS [COGRebate]
, CONVERT(FLOAT, [COG Rebate %]) AS [COGRebate%]
, CONVERT(MONEY, [COG Rebate Adjustment]) AS [COGRebateAdjustment] --per Betty's request (edited by Yodi)
, CONVERT(MONEY, [Florida Phcy Assoc Deduct]) AS FloridaPhcyAssocDeduct
, CONVERT(MONEY, [Leader Rebate]) AS [Leader Rebate]
, CONVERT(MONEY, [MSI Rebate]) AS [MSI Rebate]
, CONVERT(MONEY, [Price Protection Rebate]) AS PriceProtectionRebate
, CONVERT(MONEY, [Price Protection Adjustment]) AS PriceProtectionAdjustment
, CONVERT(MONEY, [Prescribed Wellness Fee]) AS PrescribedWellnessFee
, CONVERT(MONEY, [NCPA Membership Fee]) AS NCPAMembershipFee
, CONVERT(BIT, [Arete Eligible]) AS AreteEligible
, CONVERT(MONEY, [Arete Performance Rebate]) AS AretePerformanceRebate
, CONVERT(MONEY, [Check Fee]) AS [Check Fee]
, CONVERT(MONEY, [Pay to Store]) AS [Pay to Store]
, CONVERT(MONEY, [Pay to Affiliate Office]) AS [Pay to Affiliate Office]
, CONVERT(MONEY, [Total to Pay Out]) AS [Total to Pay Out]
, CONVERT(NVARCHAR(255), CASE 
					   WHEN [Territory Manager] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
					   ELSE LTRIM(RTRIM([Territory Manager]))
					   END
	   ) AS [Territory Manager]
, CONVERT(BIT, [Pay Account]) AS [Pay Account]
, CONVERT(FLOAT, [Effective Rebate%]) AS [Effective Rebate%]
, CONVERT(FLOAT, [HRTA]) AS [HRTA]
, CONVERT(NVARCHAR(255), CASE 
					   WHEN [Sort Code] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
					   ELSE LTRIM(RTRIM([Sort Code]))
					   END
	   ) AS [Sort Code]
, CONVERT(NVARCHAR(255), CASE 
					   WHEN [A/P Payment Mode] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
					   ELSE LTRIM(RTRIM([A/P Payment Mode]))
					   END
	   ) AS [A/P Payment Mode]
FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0'
				, 'Excel 12.0 Xml;Database=C:\data\Rebates\CHAAPRebates\AAP Monthly Cardinal Rebate.xlsx;HDR=YES'
				,'select * FROM [Load$]'				)


GO
