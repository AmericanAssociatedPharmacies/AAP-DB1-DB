USE [Purchases]
GO
/****** Object:  View [dbo].[v_CHBrand]    Script Date: 12/22/2020 9:26:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[v_CHBrand] as
select NDC,CAHPrice,CONVERT(VARCHAR(10),dateloaded,101)as DateLoaded from Purchases..CAHBrand
GO
