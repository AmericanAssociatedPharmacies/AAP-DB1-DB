USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_PM_APIAccounts]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create VIEW [dbo].[v_PM_APIAccounts]
AS
SELECT apiaccountno,pmid from pm_Pharmacy


UNION

SELECT pa.apiaccountno, pa.pmid from pm_apiaccounts pa 

	join pm_pharmacy p on pa.pmid = p.pmid

	WHERE( pa.date is not null)  
GO
