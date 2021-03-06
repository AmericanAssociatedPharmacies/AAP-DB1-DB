USE [PharmacyMaster]
GO
/****** Object:  View [Staging].[vwGenericIncentive]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Staging].[vwGenericIncentive]

AS

SELECT CONVERT(VARCHAR(255), CASE
							WHEN [Acct#] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
							ELSE [Acct#]
							END
			 ) AS [APIAccountNo]
, CONVERT(VARCHAR(255), CASE
						WHEN [BUSCLS] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
						ELSE [BUSCLS]
						END
			 ) AS [BUSCLS]
, CONVERT(VARCHAR(255), CASE
						WHEN [Affiliate] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
						ELSE [Affiliate]
						END
			 ) AS Affiliate
, CONVERT(VARCHAR(255), CASE
						WHEN [Cust NAME] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
						ELSE [Cust NAME]
						END
			 ) AS [AccountName]
, CONVERT(VARCHAR(255), CASE
						WHEN [City] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
						ELSE [City]
						END 
			 ) AS City
, CONVERT(VARCHAR(255), CASE
						WHEN [ST] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
						ELSE [ST]
						END 
			 ) AS [State]
, CONVERT(VARCHAR(255), CASE
						WHEN [Smn] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
						ELSE [Smn]
						END 
			 ) AS [Territory]
, CONVERT(MONEY, CASE
					WHEN [Total Generics Sales] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
					ELSE [Total Generics Sales]
					END 
			 ) AS [TotalGenericsSales]
, CONVERT(MONEY, CASE
				WHEN [Elig Generics for Rebate] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
				ELSE [Elig Generics for Rebate]
				END 
			 ) AS [EligGenericsforRebate]
, CONVERT(MONEY, CASE
				WHEN [Generic Loyalty Rebate] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
				ELSE [Generic Loyalty Rebate]
				END 
			 ) AS [GenericLoyaltyRebate]
, CONVERT(MONEY, CASE
					WHEN [First Payment Amt] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
					ELSE [First Payment Amt]
					END 
			 ) AS [FirstPaymentAmt]
, CONVERT(MONEY, CASE
					WHEN [Check Fee First Payment] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
					ELSE [Check Fee First Payment]
					END 
			 ) AS [CheckFeeFirstPayment]
, CONVERT(MONEY, CASE
					WHEN [Net Payment First Payment] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
					ELSE [Net Payment First Payment]
					END 
			 ) AS [NetPaymentFirstPayment]
, CONVERT(MONEY, CASE
					WHEN [Pay Account First Payment] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
					ELSE [Pay Account First Payment]
					END 
			 ) AS [PayAccountFirstPayment]
, CONVERT(VARCHAR(255), CASE
					WHEN [A/P Payment Mode First Payment] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
					ELSE [A/P Payment Mode First Payment]
					END 
			 ) AS [PaymentModeFirstPayment]
, CONVERT(MONEY, CASE
					WHEN [Second Payment Amt] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
					ELSE [Second Payment Amt]
					END 
			 ) AS [SecondPaymentAmt]
, CONVERT(MONEY, CASE
					WHEN [Check Fee Second Payment] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
					ELSE [Check Fee Second Payment]
					END 
			 ) AS [CheckFeeSecondPayment]
, CONVERT(MONEY, CASE
					WHEN [Net Payment Second Payment] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
					ELSE [Net Payment Second Payment]
					END 
			 ) AS [NetPaymentSecondPayment]
, CONVERT(BIT, CASE
					WHEN [Pay Account Second Payment] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
					ELSE [Pay Account Second Payment]
					END 
			 ) AS [PayAccountSecondPayment]

, CONVERT(VARCHAR(255), CASE
					WHEN [BUSCLS Second Payment] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
					ELSE [BUSCLS Second Payment]
					END 
			 ) AS [BusClsSecondPayment]

, CONVERT(VARCHAR(255), CASE
					WHEN [Affiliate Second Payment] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
					ELSE [Affiliate Second Payment]
					END 
			 ) AS [AffiliateSecondPayment]
, CONVERT(MONEY, CASE
					WHEN [2nd Payment Collect Negative Rebate] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
					ELSE [2nd Payment Collect Negative Rebate]
					END 
			 ) [NegativeRebatesCollectedSecondPayment]
, CONVERT(MONEY, CASE
					WHEN [2nd Payment Collect FC] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
					ELSE [2nd Payment Collect FC]
					END 
			 ) AS [SecondPaymentCollectFC]
, CONVERT(MONEY, CASE
					WHEN [2nd Payment Collect Negative Rebate] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
					ELSE [2nd Payment Collect Negative Rebate]
					END 
			 ) AS [SecondPaymentCollectNegativeRebate]
FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0'
				, 'Excel 12.0 Xml;Database=C:\data\Rebates\AnnualRebates\GenIncentive\GenericIncentive.xlsx;HDR=YES'
				,'select * FROM [Load$]'
				)
GO
