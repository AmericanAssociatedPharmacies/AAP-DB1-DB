USE [AAP]
GO
/****** Object:  View [dbo].[v_PharmacyMaster_API]    Script Date: 12/22/2020 9:04:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_PharmacyMaster_API]
AS

SELECT api.AccountNo as [API AccountNo], am.aapaccountno as [AAP Accountno],am.aapparentno as [AAP Parent Account No],am.udaccountno as [UD AccountNo],
am.udparentno as [UD Parent AccountNo],api.AccountName,api.Addr1,api.Addr2,api.City,
api.State,api.Zip,api.ContactFullName,api.Territory,api.QPS,api.APIMemberNo,api.BusinessClass,api.Phone,api.Fax,api.Email,api.DateOpened,
api.OrigStartDate,api.NumReactivated,api.Wholesaler,api.WholesalerAccountNo,api.DEA,api.DEAEXP,api.StateLicNo,api.StateLicExpDate,api.FedID,api.Status,
api.CAHStatus,api.CardinalDC,api.PrimaryCAAccountNo,api.ContractDate,api.Source,api.AllowDupDEA
FROM PharmacyMaster  am
join (SELECT * FROM api.dbo.apiaccountmaster_orig )api
ON am.apiaccountno = api.accountno
GO
