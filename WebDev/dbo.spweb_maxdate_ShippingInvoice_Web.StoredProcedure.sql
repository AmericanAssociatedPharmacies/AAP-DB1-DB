USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spweb_maxdate_ShippingInvoice_Web]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spweb_maxdate_ShippingInvoice_Web]
  
AS
SET NOCOUNT ON

 

BEGIN
	SELECT max(invdate) from webdev..apisalesinvoice_web


END

SET NOCOUNT OFF
GO
