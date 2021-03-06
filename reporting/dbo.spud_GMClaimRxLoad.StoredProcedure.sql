USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_GMClaimRxLoad]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[spud_GMClaimRxLoad]


(
	@fromdt datetime,
	@todt datetime,
	@daytype int,
	@days int
	
)

	
AS
BEGIN 

	Begin Tran ClaimLoad
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

	SET NOCOUNT ON;	
	
	Begin

	/*  CASE 			 
			WHEN NDCGI1 = 1 AND GNI=1 THEN 'MULTI-SOURCE GENERIC'
			WHEN NDCGI1 = 2 AND GNI=1 THEN 'MULTI-SOURCE GENERIC'   
			WHEN NDCGI1 = 2 AND GNI=2 THEN 'SINGLE-SOURCE BRAND'
			WHEN NDCGI1 = 1 AND GNI=2 THEN 'MULTI-SOURCE BRAND' 
			WHEN GMI = 0 AND GNI=0 AND GTI = 0 THEN 'NON-DRUG ITEM' 
		END	

			WHEN NDCGI1 = 1 AND (GMI=1 OR GMI=3) THEN 'MULTI-SOURCE GENERIC' 
			WHEN NDCGI1 = 2 AND GMI=2 THEN 'SINGLE-SOURCE BRAND'
			ELSE 'MULTI-SOURCE BRAND' 	
	*/

		--Delete the tmpMagmaClaims
		DROP TABLE [tmp_MagmaClaims]

		CREATE TABLE [dbo].[tmp_MagmaClaims](
	[NABP] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BIN] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PCN] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Group] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NDC11] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Drug Name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Strength] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Brand Type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DAW] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Column 5] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Dot Nbr] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Metrics] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TRx Count] [int] NULL,
	[TRx Quantity Dispensed] [int] NULL,
	[Total  AWP] [numeric](28, 4) NULL,
	[Patient Paid Amount] [numeric](28, 4) NULL,
	[Total Paid Amount] [numeric](28, 4) NULL,
	[Dispensing Fee Amount] [numeric](28, 4) NULL,
	[Total Ingredient Cost] [numeric](28, 4) NULL,
	[Usual Customary Amount] [numeric](28, 4) NULL,
	[TotalWAC] [numeric](28, 4) NULL,
	[UDS] [numeric](28, 4) NULL,
	[GCN] [varchar](50) NULL	
	) ON [PRIMARY]

		If @@error <> 0 
				Begin												
					Print 'Error on Create Claim'
					Rollback Tran ClaimLoad
					Return
				End	
	End

	if @daytype = 1
	Begin 

		INSERT INTO tmp_MagmaClaims 
		Select [Pharm ID],[Bin Nbr], PCN, [Group Nbr], NDC,DrugName,'',
		CASE 
			WHEN NDCGI1 = 1 AND GNI=1 THEN 'MULTI-SOURCE GENERIC' 
			WHEN NDCGI1 = 2 AND GNI=1 THEN 'MULTI-SOURCE GENERIC'  
			WHEN NDCGI1 = 2 AND GNI=2 THEN 'SINGLE-SOURCE BRAND'
			WHEN NDCGI1 = 1 AND GNI=2 THEN 'MULTI-SOURCE BRAND' 
			WHEN GMI = 0 AND GNI=0 AND GTI = 0 THEN 'NON-DRUG ITEM' 
		END
		as BrandType,
		DAW,'',[Day Supply],'',1,[Qty Dispensed],BB * [Qty Dispensed],[Patient Paid],[Plan Amount],[Fee Paid],0,[U and C],0,0,''
	  from v_Rx30MasterClaims Where  [Tx Response] <> 'R' AND [BIN Nbr] <> '' AND [Bin Nbr] <> '000000' AND GNI <> 0 AND [Rx Date] >= @fromdt and [Rx Date] <= @todt AND [Day Supply] > @days 

		If @@error <> 0 
				Begin												
					Print 'Failure on bulk insert'
					Rollback Tran ClaimLoad
					Return
				End			
	End

	if @daytype = 2
	Begin 

		INSERT INTO tmp_MagmaClaims 
		Select [Pharm ID],[Bin Nbr], PCN, [Group Nbr], NDC,DrugName,'',
		CASE 			 
			WHEN NDCGI1 = 1 AND GNI=1 THEN 'MULTI-SOURCE GENERIC'
			WHEN NDCGI1 = 2 AND GNI=1 THEN 'MULTI-SOURCE GENERIC'   
			WHEN NDCGI1 = 2 AND GNI=2 THEN 'SINGLE-SOURCE BRAND'
			WHEN NDCGI1 = 1 AND GNI=2 THEN 'MULTI-SOURCE BRAND' 
			WHEN GMI = 0 AND GNI=0 AND GTI = 0 THEN 'NON-DRUG ITEM' 
		END		
		as BrandType,
		DAW,'',[Day Supply],'',1,[Qty Dispensed],BB * [Qty Dispensed],[Patient Paid],[Plan Amount],[Fee Paid],0,[U and C],0,0,''
	  from v_Rx30MasterClaims Where  [Tx Response] <> 'R' AND [BIN Nbr] <> '' AND [Bin Nbr] <> '000000' AND GNI <> 0 AND [Rx Date] >= @fromdt and [Rx Date] <= @todt AND [Day Supply] < @days 

		If @@error <> 0 
				Begin												
					Print 'Failure on bulk insert'
					Rollback Tran ClaimLoad
					Return
				End			
	End
	
	if @daytype = 0
	Begin
		INSERT INTO tmp_MagmaClaims 
		Select [Pharm ID],[Bin Nbr], PCN, [Group Nbr],NDC,DrugName,'',
		CASE 
			WHEN NDCGI1 = 1 AND GNI=1 THEN 'MULTI-SOURCE GENERIC' 
			WHEN NDCGI1 = 2 AND GNI=1 THEN 'MULTI-SOURCE GENERIC'  
			WHEN NDCGI1 = 2 AND GNI=2 THEN 'SINGLE-SOURCE BRAND'
			WHEN NDCGI1 = 1 AND GNI=2 THEN 'MULTI-SOURCE BRAND' 
			WHEN GMI = 0 AND GNI=0 AND GTI = 0 THEN 'NON-DRUG ITEM' 
		END
		as BrandType,
		DAW,'',[Day Supply],'',1,[Qty Dispensed],BB * [Qty Dispensed],[Patient Paid],[Plan Amount],[Fee Paid],0,[U and C],0,0,''
	  from v_Rx30Master Where  [BIN Nbr] <> '' AND [Bin Nbr] <> '000000' AND GNI <> 0 AND [Rx Date] >= @fromdt and [Rx Date] <= @todt  --GNI = 0  non drug items

		If @@error <> 0 
				Begin												
					Print 'Failure on bulk insert'
					Rollback Tran ClaimLoad
					Return
				End			
	End
	
	SET NOCOUNT OFF;

	Commit Tran
END







































GO
