USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[spCAHBrandPriceLoad]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spCAHBrandPriceLoad]

(
	@dateloaded smalldatetime
)

AS
BEGIN

			

		DECLARE @SQL varchar(2000)
		

		SET NOCOUNT ON;

		TRUNCATE TABLE tmp_CAHBrand


		set @SQL = 'bulk insert tmp_CAHBrand
		 from ''T:\Data\CAHPrice\CAHBrand.txt' ; --@filename;
		set @SQL = @SQL + ''' with (fieldterminator=''|'',firstrow=1 )';
		exec(@SQL);

		Delete from tmp_CAHBrand Where [NDC] is null

		--Clean Up Dups
		SET ROWCOUNT 1

		Delete tmp_CAHBrand
		FROM         tmp_CAHBrand a WHERE (Select Count(*) FROM tmp_CAHBrand b WHERE b.[CIN] = a.[CIN]) > 1

		WHILE @@rowcount > 0
		  DELETE tmp_CAHBrand
		  FROM tmp_CAHBrand a  WHERE (SELECT COUNT(*) FROM tmp_CAHBrand b WHERE b.[CIN] = a.[CIN]) > 1
		SET ROWCOUNT 0

		
		INSERT INTO CAHBrand Select *,@dateloaded as DateLoaded from tmp_CAHBrand
			
END



















GO
