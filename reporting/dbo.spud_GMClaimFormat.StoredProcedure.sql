USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_GMClaimFormat]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spud_GMClaimFormat]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRAN ClaimLoad2
		

		  --Change format of fields --------------------------------------------------------------------------------------------
		Update tmp_MagmaClaims set [Total  AWP] =  LTRIM(RTRIM(REPLACE(REPLACE([Total  AWP], '$', ''),',',''))),
		[Patient Paid Amount] =  LTRIM(RTRIM(REPLACE(REPLACE([Patient Paid Amount], '$', ''),',',''))),
		[Total Paid Amount] =  LTRIM(RTRIM(REPLACE(REPLACE([Total Paid Amount], '$', ''),',',''))),
		[Dispensing Fee Amount] =  LTRIM(RTRIM(REPLACE(REPLACE([Dispensing Fee Amount], '$', ''),',',''))),
		[Total Ingredient Cost] =  LTRIM(RTRIM(REPLACE(REPLACE([Total Ingredient Cost], '$', ''),',',''))),
		[Usual Customary Amount] =  LTRIM(RTRIM(REPLACE(REPLACE([Usual Customary Amount], '$', ''),',',''))), 
		[TRx Quantity Dispensed] =  LTRIM(RTRIM(REPLACE(REPLACE([TRx Quantity Dispensed], '$', ''),',',''))),
		[TRx Count] = LTRIM(RTRIM(REPLACE(REPLACE([TRx Count], '$', ''),',','')))
		If @@error <> 0 
				Begin												
					Print 'Failure on Alter Table'
					Rollback Tran ClaimLoad2
					Return
				End	

		Update tmp_MagmaClaims set [Total Paid Amount] =  LTRIM(RTRIM(REPLACE(REPLACE([Total Paid Amount], '(', ''),')','')))
		If @@error <> 0 
				Begin												
					Print 'Failure on Alter Table'
					Rollback Tran ClaimLoad2
					Return
				End	
	
	   --DELETE from tmp_MagmaClaims WHERE [Total Paid Amount] < '0.00'
		
		--Alter table to change datatype for calculations -----------------------------------------------------------------------
		ALTER Table tmp_MagmaClaims	ALTER COLUMN [Total  AWP]  numeric(28,4)
		ALTER Table tmp_MagmaClaims	ALTER COLUMN [TRx count]  int
		ALTER Table tmp_MagmaClaims	ALTER COLUMN [TRx Quantity Dispensed]  int 
		ALTER Table tmp_MagmaClaims	ALTER COLUMN [Total Paid Amount]  numeric(28,4)
		ALTER Table tmp_MagmaClaims	ALTER COLUMN [Patient Paid Amount]  numeric(28,4)
		ALTER Table tmp_MagmaClaims	ALTER COLUMN [Dispensing Fee Amount]  numeric(28,4)	
		ALTER Table tmp_MagmaClaims	ALTER COLUMN [Total Ingredient Cost]  numeric(28,4)	
		ALTER Table tmp_MagmaClaims	ALTER COLUMN [Usual Customary Amount]  numeric(28,4)		
		ALTER Table tmp_MagmaClaims   ADD  TotalWAC numeric(28,4)	
		ALTER Table tmp_MagmaClaims   ADD  UDS numeric(28,4)		
		ALTER Table tmp_MagmaClaims   ADD  GCN varchar(50)		

		If @@error <> 0 
				Begin												
					Print 'Failure on Alter Table'
					Rollback Tran ClaimLoad2
					Return
				End	
	

	/*	DROP INDEX IDX_ndcgcn2 on tmp_MagmaClaims
		CREATE INDEX IDX_ndcgcn2
			on tmp_MagmaClaims (NDC11,GCN) 
			If @@error <> 0 
				Begin				
					Rollback Tran ClaimLoad2
					Return
				End */

	
	COMMIT TRAN ClaimLoad2
END

GO
