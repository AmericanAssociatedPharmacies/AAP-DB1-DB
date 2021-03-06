USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[PM_Rebates_PPartner]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PM_Rebates_PPartner]

AS

SELECT Period, PMID, VolumeAmt, RebateAmt, PaymentAmt, Eligible, Affiliate, LastPayment, [Paid To Store], [Paid To Affiliate]
FROM [dbo].[PM_Rebates_PPartner_New]
GO
