USE [Purchases]
GO
/****** Object:  View [dbo].[v_chrebateprice]    Script Date: 12/22/2020 9:26:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_chrebateprice] as
select NCPDP,Month,Year,CHRebatePerc as CardinalRebatePercent  from Purchases..CHRebates where datalength(ncpdp) >0
GO
