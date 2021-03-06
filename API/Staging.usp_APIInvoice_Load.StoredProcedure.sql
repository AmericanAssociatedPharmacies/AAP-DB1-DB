USE [API]
GO
/****** Object:  StoredProcedure [Staging].[usp_APIInvoice_Load]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROC [Staging].[usp_APIInvoice_Load]

AS

SET NOCOUNT ON;

BEGIN

	INSERT [Staging].[APISalesInvoice] ([InvNbr], [OrderNbr], [InvDate], [WHAccountID], [CustomerName], [CarrierCode], [CarrierDesc]
		 , [CustomerRef], [Whsnum], [OrdType])
	SELECT [InvNbr], [OrderNbr], [InvDate], [WHAccountID], [CustomerName], [CarrierCode], [CarrierDesc], [CustomerRef], [Whsnum]
		 , [OrdType]
	FROM [Staging].[vw_APISalesInvoice]
END

GO
