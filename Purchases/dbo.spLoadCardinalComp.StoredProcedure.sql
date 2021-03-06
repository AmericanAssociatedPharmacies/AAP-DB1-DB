USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[spLoadCardinalComp]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[spLoadCardinalComp]


	
AS
BEGIN 

	Begin Tran CAHLoad
	
	SET NOCOUNT ON;	
	
	Begin

	DECLARE @SQL varchar(2000)

		--Delete the tmpMagmaClaims
		DROP TABLE [CardinalComplete]

		 CREATE TABLE [dbo].[CardinalComplete](
		[UNITPRODUCT] [nvarchar](50) NULL,
		[SCANNEDUNITPRODUCTCODE] [nvarchar](50) NULL,
		[NDC] [nvarchar](50) NULL,
		[CARDINALITEMNUMBER] [nvarchar](50) NULL,
		[RXOTCFLAG] [nvarchar](50) NULL,
		[BRANDNAME] [nvarchar](50) NULL,
		[GENERICPRODUCTDESCRIPTION] [nvarchar](50) NULL,
		[AWP] [nvarchar](50) NULL,
		[CONTRACTPRICE] [nvarchar](50) NULL,
		[INVOICEPRICE] [nvarchar](50) NULL,
		[BASEPRICE] [nvarchar](50) NULL,
		[RETAILPRICE] [nvarchar](50) NULL,
		[FORM] [nvarchar](50) NULL,
		[STRENGTH] [nvarchar](50) NULL,
		[SIZE] [nvarchar](50) NULL,
		[UNITOFMEASURE] [nvarchar](50) NULL,
		[VENDORNAME] [nvarchar](50) NULL,
		[ACCUNETSIZE] [nvarchar](50) NULL,
		[CASEQUANTITY] [nvarchar](50) NULL,
		[PACKQUANTITY] [nvarchar](50) NULL,
		[UNITSIZE] [nvarchar](50) NULL,
		[DISPENSEQUANTITY] [nvarchar](50) NULL,
		[THERAPEUTICCLASSCODE] [nvarchar](50) NULL,
		[CONTRACTNUMBER] [nvarchar](50) NULL,
		[CONTRACTNAME] [nvarchar](50) NULL,
		[CONTRACTSTARTDATE] [nvarchar](50) NULL,
		[CONTRACTENDDATE] [nvarchar](50) NULL,
		[INVOICEPRICECHANGEDATE] [nvarchar](50) NULL,
		[BASEPRICECHANGEDATE] [nvarchar](50) NULL,
		[FINELINECODE] [nvarchar](50) NULL,
		[PREVIOUSINVOICEPRICE] [nvarchar](50) NULL,
		[CCAHEADER] [nvarchar](50) NULL,
		[GENERICCODE] [nvarchar](50) NULL,
		[GPPCCODE] [nvarchar](50) NULL,
		[GPI] [nvarchar](50) NULL,
		[API_Size] [nvarchar](50) NULL,
		[API ITEM] [nvarchar](50) NULL,
		[API PRICE] [nvarchar](50) NULL,
		[Adj Rebate] [nvarchar](50) NULL
		
		
	) ON [PRIMARY]

		If @@error <> 0 
				Begin												
					Print 'Error on Create Table'
					Rollback Tran CAHLoad
					Return
				End	
	End

	set @SQL = 'bulk insert dbo.CardinalComplete from ''C:\Data\Magma\Cardinal Complete.txt';
	set @SQL = @SQL + ''' with (fieldterminator=''\t'', firstrow=2 )';	
	exec(@SQL);

	If @@error <> 0 
			Begin												
				Print 'Failure on bulk insert'
				Rollback Tran CAHLoad
				Return
			End	

	Update dbo.CardinalComplete 
	set [API PRICE] =  LTRIM(RTRIM(REPLACE([API PRICE], '$', '')))
	,	[Adj Rebate] =  LTRIM(RTRIM(REPLACE([Adj Rebate], '$', '')))

	If @@error <> 0 
			Begin												
				Print 'Failure on Update Table'
				Rollback Tran CAHLoad
				Return
			End	

	UPDATE dbo.CardinalComplete	
	SET [API PRICE] = REPLACE([API PRICE], '', NULL)
	WHERE [API PRICE] = ''

	ALTER Table dbo.CardinalComplete	ALTER COLUMN [API PRICE]  numeric(28,4)

	If @@error <> 0 
			Begin												
				Print 'Failure on Alter Table'
				Rollback Tran CAHLoad
				Return
			End	


	INSERT INTO dbo.CardinalCompleteHistory Select *,getdate() FROM CardinalComplete
	If @@error <> 0 
			Begin												
				Print 'Insert into CardinalCompleteHistory'
				Rollback Tran CAHLoad
				Return
			End	


	insert into dbo.CAHBrand(CIN,Description,NDC,Size,Strength,CAHPrice,contract,UnitOfIssue,Manufacturer,dateloaded)
	select CARDINALITEMNUMBER,GENERICPRODUCTDESCRIPTION,c.NDC,convert(numeric(18,4),CAST(size AS numeric(18,4)))
	,c.Strength,convert(numeric(18,4)
	,CAST(substring(invoiceprice,2,len(invoiceprice)) AS numeric(18,4))),ContractName,c.Form,VendorName,getdate()
	from dbo.CardinalComplete c 
	left outer join Medispan..DrugMaster m on c.ndc=m.ndc where m.drugtype<>'MULTI-SOURCE GENERIC'


	--Per meeting with Joshila on 4/27/2017, this logic should not be in this sproc
	--Delete from dbo.CardinalComplete Where [Adj Rebate] < '0'
	--If @@error <> 0 
	--		Begin												
	--			Print 'Delete negatives'
	--			Rollback Tran CAHLoad
	--			Return
	--		End	

	CREATE INDEX IDX_APIITEM
		on dbo.CardinalComplete ([API ITEM]) 

	Commit Tran
END

























GO
