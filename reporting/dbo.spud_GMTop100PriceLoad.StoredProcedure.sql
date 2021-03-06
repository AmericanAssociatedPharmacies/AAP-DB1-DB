USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_GMTop100PriceLoad]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[spud_GMTop100PriceLoad]

	(
		@dateloaded smalldatetime
	)

	
AS
BEGIN

	Begin Tran WSLoad
			

			DECLARE @SQL varchar(2000)

			SET NOCOUNT ON;

			Delete from tmp_Top100PriceNew	
			If @@error <> 0 
					Begin												
						Print 'Error on Delete Update tmp_Top100PriceNew'
						Rollback Tran WSLoad
						Return
					End	

			set @SQL = 'bulk insert tmp_Top100PriceNew	 from ''C:\Data\MAGMA\CardTop100.txt' ; --@filename;
			set @SQL = @SQL + ''' with (fieldterminator=''\t'',firstrow=2 )';

				
			exec(@SQL);
			If @@error <> 0 
					Begin												
						Print 'Error on bulk insert'
						Rollback Tran WSLoad
						Return
					End	

			Delete from tmp_Top100PriceNew Where [NDC] is null
			If @@error <> 0 
					Begin												
						Print 'Error on Delete Update tmp_Top100PriceNew'
						Rollback Tran WSLoad
						Return
					End	
			
			
			--Delete the Same month pricing if already loaded
/*			Delete from CHTop100 Where Month(Filedate) = Month(@dateloaded) AND Year(Filedate) = Year(@dateloaded)
			If @@error <> 0 
					Begin												
						Print 'Error on Delete EXisting Price file'
						Rollback Tran WSLoad
						Return
					End	

			INSERT INTO CHTop100 Select Description,Size, Supplier, '' as  [ AWP ],0, 0,[Price Per Unit],[Brand Name],Form,Color, right('00000000000'+ltrim(rtrim(convert(char(11),NDC))),11), CIN,DP#,GPI,GCN,GCNSEQ, cast(@dateloaded as smalldatetime)  as DateLoaded from tmp_Top100PriceNew
			If @@error <> 0 
					Begin												
						Print 'Error on Insert to PriceAll'
						Rollback Tran WSLoad
						Return
					End	
*/
			--Load in Purchases Database
			Delete from Purchases.dbo.CHTop100 Where Month(Filedate) = Month(@dateloaded) AND Year(Filedate) = Year(@dateloaded)
			If @@error <> 0 
					Begin												
						Print 'Error on Delete EXisting Price file'
						Rollback Tran WSLoad
						Return
					End	

			INSERT INTO Purchases.dbo.CHTop100 Select Description,Size, Supplier, '' as [ AWP ],0, 0,[Price Per Unit],[Brand Name],Form,Color, right('00000000000'+ltrim(rtrim(convert(char(11),NDC))),11), CIN,DP#,GPI,GCN,GCNSEQ, cast(@dateloaded as smalldatetime)  as DateLoaded from tmp_Top100PriceNew
			If @@error <> 0 
					Begin												
						Print 'Error on Insert to PriceAll'
						Rollback Tran WSLoad
						Return
					End	

			INSERT INTO Purchases.dbo.CHTop100All Select Description,Size, Supplier, '' as [ AWP ],0, 0,[Price Per Unit],[Brand Name],Form,Color, right('00000000000'+ltrim(rtrim(convert(char(11),NDC))),11), CIN,DP#,GPI,GCN,GCNSEQ, cast(getdate() as smalldatetime)  as DateLoaded from tmp_Top100PriceNew
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
