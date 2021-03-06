USE [API]
GO
/****** Object:  StoredProcedure [dbo].[usp_APIInvoice_Load]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROC [dbo].[usp_APIInvoice_Load]

AS

SET NOCOUNT ON;

BEGIN

	MERGE [dbo].[APISalesInvoice] AS T
	USING (SELECT DISTINCT InvNbr, OrderNbr, InvDate, WHAccountID, CustomerName, CarrierCode, CarrierDesc, [CustomerRef], WHNbr AS Whsnum, OrderType AS [OrdType]
			FROM Staging.APISalesDetail
		   ) AS S
		   ([InvNbr], [OrderNbr], [InvDate], [WHAccountID], [CustomerName], [CarrierCode], [CarrierDesc], [CustomerRef], [Whsnum], [OrdType])
		   ON T.[InvNbr] = S.[InvNbr]
		    AND T.[InvDate] = S.[InvDate]
			AND T.[WHAccountID] = S.[WHAccountID]
			

WHEN MATCHED THEN

UPDATE SET [OrderNbr] = S.[OrderNbr]
		 , [CustomerName] = S.[CustomerName]
		 , [CarrierCode] = S.[CarrierCode]
		 , [CarrierDesc] = S.[CarrierDesc]
		 , [CustomerRef] = S.[CustomerRef]
		 , [Whsnum] = S.[Whsnum]
		 , [OrdType] = S.[OrdType]
			

WHEN NOT MATCHED THEN
		INSERT ([InvNbr], [OrderNbr], [InvDate], [WHAccountID], [CustomerName], [CarrierCode], [CarrierDesc], [CustomerRef], [Whsnum], [OrdType])
		VALUES (S.[InvNbr], S.[OrderNbr], S.[InvDate], S.[WHAccountID], S.[CustomerName], S.[CarrierCode], S.[CarrierDesc], S.[CustomerRef], S.[Whsnum], S.[OrdType]);


END


GO
