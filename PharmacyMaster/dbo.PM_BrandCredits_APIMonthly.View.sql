USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[PM_BrandCredits_APIMonthly]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PM_BrandCredits_APIMonthly]

AS

SELECT Date, PMID, APIAccountNo, AccountName, BrandCredits, Territory, BrandSales, ACH, PayTerms
FROM [dbo].[PM_BrandCredits_APIMonthly_New]
GO
