USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spapi_maxdate_ShippingInvoice_Web]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spapi_maxdate_ShippingInvoice_Web]
  
AS
SET NOCOUNT ON

 

BEGIN
	SELECT max(invdate) from webdev..apisalesinvoice_web


END

SET NOCOUNT OFF
GO
