USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_GMPriceLoad]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spud_GMPriceLoad]

	(
		@dateloaded smalldatetime
	)

	
AS
BEGIN

	Begin Tran WSLoad

			--If already loaded then don't load 
	/*	Declare @count int
		Select @count = Count(*) from WSPriceALL Where DateLoaded = @dateloaded	
		if @count = 0 */


			DECLARE @SQL varchar(2000)

			SET NOCOUNT ON;

			Delete from tmp_WSPrice	
			If @@error <> 0 
					Begin												
						Print 'Error on Delete Update tmp_WSPrice'
						Rollback Tran WSLoad
						Return
					End	

			set @SQL = 'bulk insert tmp_WSPrice from ''C:\Data\MAGMA\cardmain.txt' ; --@filename;
			set @SQL = @SQL + ''' with (firstrow=2 )';	
			exec(@SQL);
			If @@error <> 0 
					Begin												
						Print 'Error on bulk insert'
						Rollback Tran WSLoad
						Return
					End	

			Delete from tmp_WSPrice Where [NDC UPC] is null
			If @@error <> 0 
					Begin												
						Print 'Error on Delete Update tmp_WSPrice'
						Rollback Tran WSLoad
						Return
					End	
			
		
			Delete from WSPriceAll Where DateLoaded = @dateloaded	
			If @@error <> 0 
					Begin												
						Print 'Error on Delete EXisting Price file'
						Rollback Tran WSLoad
						Return
					End	

			INSERT INTO WSPriceAll Select Description, Size, Supplier, [ AWP ], [ UDS Sell ], [Brand Name], Form, Color, right('00000000000'+ltrim(rtrim(convert(char(11),[NDC UPC]))),11), CIN, DP#, [Price Per Unit],cast(@dateloaded as smalldatetime)  as DateLoaded,cast(1 as int)  as Wholesaler from tmp_WSPrice
			If @@error <> 0 
					Begin												
						Print 'Error on Insert to PriceAll'
						Rollback Tran WSLoad
						Return
					End	

			
	SET NOCOUNT OFF;

	COMMIT Tran
END



















GO
