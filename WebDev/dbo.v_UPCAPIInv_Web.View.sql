USE [WebDev]
GO
/****** Object:  View [dbo].[v_UPCAPIInv_Web]    Script Date: 12/22/2020 9:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create VIEW [dbo].[v_UPCAPIInv_Web]
AS
SELECT     API.dbo.APISalesDetail.CustomerName, PharmacyMaster.dbo.PPStores.Addr1, PharmacyMaster.dbo.PPStores.Addr2, PharmacyMaster.dbo.PPStores.City, 
                      PharmacyMaster.dbo.PPStores.State, PharmacyMaster.dbo.PPStores.Zip, API.dbo.APISalesDetail.InvNbr AS Invoice, CONVERT(varchar(10), 
                      API.dbo.APISalesDetail.InvDate, 110) AS [Order Date], CAST('' AS varchar(256)) AS [Ship Date], CAST('' AS varchar(256)) AS [Your order number], 
                      API.dbo.APISalesDetail.WHAccountID AS [Customer number], PharmacyMaster.dbo.PPStores.territory AS [Entered by], CAST('' AS varchar(256)) AS Salesman, 
                      PharmacyMaster.dbo.PPStores.OwnerName AS [Ordered By], PharmacyMaster.dbo.PPStores.DEA, REPLACE(CONVERT(VARCHAR(10), 
                      PharmacyMaster.dbo.PPStores.DEAEXP, 1), '/', '') AS DEAEXP, CAST('' AS varchar(256)) AS [Terms of pmt], 
                      API.dbo.APISalesInvoice.CarrierDesc AS [Manner Of Transport], CAST('' AS varchar(256)) AS [Terms of Delivery], 
                      PharmacyMaster.dbo.PPStores.StateLicNo AS [Customer ST Lic], API.dbo.APISalesDetail.ItemDescription, API.dbo.APISalesDetail.NDC, 
                      API.dbo.APISalesDetail.Qty AS [Qty Ord], CAST('' AS varchar(256)) AS [Qty Ship], CAST('' AS varchar(256)) AS [Qty B/O], CAST('' AS varchar(256)) AS [U/M], 
                      '$' + CONVERT(varchar, API.dbo.APISalesDetail.UnitAmount) AS Price, CAST('' AS varchar(256)) AS AWP, '$' + CONVERT(varchar, API.dbo.APISalesDetail.LineAmt) 
                      AS Ext
FROM         API.dbo.APISalesDetail LEFT OUTER JOIN
                      API.dbo.APISalesInvoice ON API.dbo.APISalesDetail.WHAccountID = API.dbo.APISalesInvoice.WHAccountID AND 
                      API.dbo.APISalesDetail.InvNbr = API.dbo.APISalesInvoice.InvNbr INNER JOIN
                      PharmacyMaster.dbo.PPStores ON API.dbo.APISalesDetail.WHAccountID = PharmacyMaster.dbo.PPStores.APIAccountNo

GO
