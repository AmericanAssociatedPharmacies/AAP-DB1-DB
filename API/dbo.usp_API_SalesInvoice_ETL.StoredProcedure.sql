USE [API]
GO
/****** Object:  StoredProcedure [dbo].[usp_API_SalesInvoice_ETL]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[usp_API_SalesInvoice_ETL]

	@ID INT

AS

SET NOCOUNT ON;

BEGIN

	--Go back 2 years only in source table. We do not need any data further back than 2013, which has already been loaded.
	--SET @InvDate = ISNULL(ISNULL(@InvDate, ''), DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) -1, 0))

	SELECT ID, InvNbr, OrderNbr, InvDate, WHAccountID, CustomerName, CarrierCode
	, CarrierDesc, CustomerRef, Whsnum, OrdType, DateLoaded
	FROM [dbo].[APISalesInvoice] AS A
	WHERE A.ID > @ID



END


GO
