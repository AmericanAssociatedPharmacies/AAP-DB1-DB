USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[spRebate_PriceProt_Diff]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spRebate_PriceProt_Diff]
(
	@detailDate varchar(10)	
	, @totalDate varchar(10) 
	, @affiliate_substring varchar(50)
	, @tableName varchar(75)
	, @tableNameDetail varchar(75)

)

AS

SET NOCOUNT ON;

BEGIN
DECLARE @affiliate varchar(50)
DECLARE @SQL   varchar(max)
--
--EXEC dbo.spRebate_PriceProt_Detail @detailDate,@affiliate_substring 
--EXEC dbo.spRebate_PriceProt_Total  @totalDate,@affiliate_substring 



	SET @SQL = 'IF EXISTS(SELECT name FROM sys.tables ' +
			' WHERE name =  ''' + @tableName + ''' ) ' +
		 'BEGIN ' +
          ' DROP TABLE  ' + @tableName +  
         ' END ';
	EXEC (@SQL);

	SET @SQL = 'IF EXISTS(SELECT name FROM sys.tables ' +
			' WHERE name =  ''' + @tableNameDetail + ''' ) ' +
		 'BEGIN ' +
          ' DROP TABLE  ' + @tableNameDetail +  
         ' END ';
	EXEC (@SQL);

----Get those that don't match amounts from Rebate table to Cardinal detail table
	SET @SQL = ' SELECT * into ' + @tableName + ' from ' +
	' ( ' +
		' SELECT t.*,d.detailRebate as [Due To Date from CA]  from tmp_PriceProt_Total t ' +
		' join ' +
		' ( ' +
		' 	SELECT distinct pmid,sum([Due To Date]) as detailRebate from tmp_PriceProt_Detail group by pmid ' +
		' ) d ' +
		' on t.pmid = d.pmid where round([Price Protection Rebate] ,2)  != round(detailRebate ,2)' +

	' )ch  ' ;
    EXEC (@SQL);

---- Get Detail from Cardinal table for those that didn't match 

     SET @SQL = ' SELECT * into ' + @tableNameDetail + ' from ' +
	 ' ( ' +
          ' SELECT * from tmp_PriceProt_Detail where pmid in ' +
		  ' ( ' +
	      ' SELECT distinct t.pmid from tmp_PriceProt_Total t ' +
	         ' join ' +
	         ' ( ' +
		         ' SELECT distinct pmid,sum([Due To Date]) as detailRebate from tmp_PriceProt_Detail group by pmid ' +
              ' ) d' +
	          ' on t.pmid = d.pmid where round([Price Protection Rebate] ,2)  != round(detailRebate ,2)' +
          ' ) ' +
      ' )ch ';

     EXEC (@SQL);
END

GO
