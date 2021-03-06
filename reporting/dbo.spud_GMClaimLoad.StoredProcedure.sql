USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_GMClaimLoad]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[spud_GMClaimLoad]


(
	@filename nvarchar(100),
	@filecount int
)

	
AS
BEGIN 

	Begin Tran ClaimLoad
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	DECLARE @SQL varchar(2000)

	SET NOCOUNT ON;	

	if @filecount = 0
	Begin

		--Delete the tmpMagmaClaims
		DROP TABLE [tmp_MagmaClaims]

		 CREATE TABLE [dbo].[tmp_MagmaClaims](		
		[NDC11] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Drug Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Strength] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Brand Type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[DAW] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Column 5] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Dot Nbr] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Metrics] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[TRx Count] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[TRx Quantity Dispensed] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Total  AWP] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Patient Paid Amount] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Total Paid Amount] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Dispensing Fee Amount] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Total Ingredient Cost] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Usual Customary Amount] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	
		
		) ON [PRIMARY]

		If @@error <> 0 
				Begin												
					Print 'Error on Create Claim'
					Rollback Tran ClaimLoad
					Return
				End	
	End

	--set @SQL = 'bulk insert tmp_MagmaClaims from ''C:\Data\MAGMA\CaremarkOpen_JAN_1Q09_ALL.txt' ; --@filename;
	set @SQL = 'bulk insert tmp_MagmaClaims from ''C:\Data\MAGMA\' + @filename;
	set @SQL = @SQL + ''' with (fieldterminator='';'', firstrow=2 )';	
	exec(@SQL);

	If @@error <> 0 
			Begin												
				Print 'Failure on bulk insert'
				Rollback Tran ClaimLoad
				Return
			End	

	
	
	SET NOCOUNT OFF;

	Commit Tran
END






















GO
