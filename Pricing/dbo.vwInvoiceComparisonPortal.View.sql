USE [Pricing]
GO
/****** Object:  View [dbo].[vwInvoiceComparisonPortal]    Script Date: 12/22/2020 9:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwInvoiceComparisonPortal]
AS
SELECT        EntryID, CAST(CAST(CIN AS int) AS varchar(10)) AS CIN, [NDC/UPC], DESCRIPTION, SIZE, [AAP Price], Type AS Contract, Date
FROM            dbo.CardinalPricing_forCompare

GO
