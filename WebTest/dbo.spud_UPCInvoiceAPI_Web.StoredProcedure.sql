USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spud_UPCInvoiceAPI_Web]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spud_UPCInvoiceAPI_Web]
(@InvoiceNumber varchar(25))

AS
BEGIN



SELECT * FROM dbo.v_UPCAPIInv_Web ap WHERE ap.Invoice = +@InvoiceNumber




END
GO
