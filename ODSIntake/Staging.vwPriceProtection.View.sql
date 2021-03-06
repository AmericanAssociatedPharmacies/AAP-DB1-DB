USE [ODSIntake]
GO
/****** Object:  View [Staging].[vwPriceProtection]    Script Date: 12/22/2020 9:21:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Staging].[vwPriceProtection]

AS

SELECT TRY_CONVERT(VARCHAR(255), LTRIM(RTRIM(CASE		
												WHEN [L01 Afltn Number] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
												ELSE [L01 Afltn Number]
												END
											  )
										)
					) AS [L01AfltnName]
, TRY_CONVERT(FLOAT, LTRIM(RTRIM(CASE		
								WHEN [Distribution Center Number] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
								ELSE [Distribution Center Number]
								END
								)
										)
					) AS [DCNumber]
, TRY_CONVERT(VARCHAR(50), LTRIM(RTRIM(CASE		
										WHEN [Customer Number] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
										ELSE [Customer Number]
										END
										)
										)
					) AS [CustomerNumber]
, TRY_CONVERT(VARCHAR(50), LTRIM(RTRIM(CASE		
										WHEN [Corporate Item Number] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
										ELSE [Corporate Item Number]
										END
										)
										)
					) AS [CorpItemNumber]
, TRY_CONVERT(VARCHAR(255), LTRIM(RTRIM(CASE		
										WHEN [Description] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
										ELSE [Description]
										END
										)
										)
					) AS [Description]
, TRY_CONVERT(VARCHAR(255), LTRIM(RTRIM(CASE		
										WHEN Size NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
										ELSE Size
										END
										)
										)
					) AS Size
, TRY_CONVERT(MONEY, LTRIM(RTRIM(CASE		
										WHEN [Old Sell]  NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
										ELSE [Old Sell] 
										END
										)
										)
					) AS [ProtectedSelPrice]
, TRY_CONVERT(MONEY, LTRIM(RTRIM(CASE		
										WHEN [New Sell]  NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
										ELSE [New Sell] 
										END
										)
										)
					) AS [NewSellPrice]
, TRY_CONVERT(DATETIME, LTRIM(RTRIM(CASE		
										WHEN [Protection Start Date]  NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
										ELSE [Protection Start Date]
										END
										)
										)
					) AS [ProtectionStartDate]
, TRY_CONVERT(DATETIME, LTRIM(RTRIM(CASE		
										WHEN [Protection End Date]  NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
										ELSE [Protection End Date]
										END
										)
										)
					) AS [ProtectionEndDate]
, TRY_CONVERT(FLOAT, LTRIM(RTRIM(CASE		
										WHEN [Average Monthly Usage]  NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
										ELSE [Average Monthly Usage]
										END
										)
										)
					) AS [AvgMonthlyUsage]
, TRY_CONVERT(FLOAT, LTRIM(RTRIM(CASE		
										WHEN [Total Usage]  NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
										ELSE [Total Usage]
										END
										)
										)
					) AS [ActualUsageToDate]
, TRY_CONVERT(MONEY, LTRIM(RTRIM(CASE		
										WHEN [ Price Protection Due ]  NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
										ELSE [ Price Protection Due ]
										END
										)
										)
					) AS [PriceProtectionDueToDate]
, TRY_CONVERT(FLOAT, LTRIM(RTRIM(CASE		
										WHEN [Available From Last Month]  NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
										ELSE [Available From Last Month]
										END
										)
										)
					) AS [Available]
, TRY_CONVERT(FLOAT, LTRIM(RTRIM(CASE		
										WHEN [Usage For Calculation]  NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
										ELSE [Usage For Calculation]
										END
										)
										)
					) AS [UsageForCalculation]
FROM [dbo].[PP_20201117]
GO
