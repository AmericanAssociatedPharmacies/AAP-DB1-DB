USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[spgm_LoadAPIRebates]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chandni Lyla
-- Create date: 08/13/2015
-- Description:	Load table APIRebatePrice
-- =============================================
CREATE PROCEDURE [dbo].[spgm_LoadAPIRebates]
	
AS
BEGIN
 

--Populate Pricing Tables for GM Calculations


--API Pricing

truncate table APIRebatePrice
insert into APIRebatePrice(NDC,Month,Year,WeekNo,APINetPrice,PricePerUnit,DrugType) Select NDC,Mnth,Yr,WeekNo,NetPerUnit,PricePerUnit,DrugType from Purchases..v_APIRebatesWeekly


--CAH Pricing

truncate table CHPrice
insert into CHPrice Select * from v_CHAllWeek

--CAH Brand Pricing

insert into CAHBrandOnly
select  CARDINALITEMNUMBER, GENERICPRODUCTDESCRIPTION, c.NDC, CAST(substring(invoiceprice,2,len(invoiceprice)) AS numeric(18,4)), getdate(), MONTH(getdate()), YEAR(getdate())
from CardinalComplete c left outer join Medispan..DrugMaster m on c.ndc=m.ndc where m.drugtype<>'MULTI-SOURCE GENERIC'





END
GO
