USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[uspCardinalCompleteLoadCAHBrand]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspCardinalCompleteLoadCAHBrand]

AS

SET NOCOUNT ON;

BEGIN

	insert into dbo.CAHBrand(CIN,Description,NDC,Size,Strength,CAHPrice,contract,UnitOfIssue,Manufacturer,dateloaded)
	select CARDINALITEMNUMBER,GENERICPRODUCTDESCRIPTION,c.NDC,convert(numeric(18,4),CAST(size AS numeric(18,4)))
	,c.Strength,convert(numeric(18,4)
	,CAST(substring(invoiceprice,2,len(invoiceprice)) AS numeric(18,4))),ContractName,c.Form,VendorName,getdate()
	from dbo.CardinalComplete c 
	left outer join Medispan..DrugMaster m on c.ndc=m.ndc where m.drugtype<>'MULTI-SOURCE GENERIC'

END
GO
