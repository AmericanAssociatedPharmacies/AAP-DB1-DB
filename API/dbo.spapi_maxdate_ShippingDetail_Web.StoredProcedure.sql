USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spapi_maxdate_ShippingDetail_Web]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spapi_maxdate_ShippingDetail_Web]
  
AS
SET NOCOUNT ON

 

BEGIN
	select max(invdate) from webdev..apisalesdetail_web


END

SET NOCOUNT OFF
GO
