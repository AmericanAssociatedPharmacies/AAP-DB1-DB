USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spapi_compareByType]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <02/20/2014>
-- Description:	<Aggregate total amount for the month by whacccountid>
-- =============================================
CREATE PROCEDURE [dbo].[spapi_compareByType]
 (@in_month varchar(2), @in_year varchar(4),@in_type varchar(10),@detail_type varchar(10))
AS
	BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE @SQL varchar(5000);
SET @SQL = '';
 
   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_apiwhByType')
          DROP TABLE tmp_apiwhByType

SET @SQL = ' SELECT * into tmp_apiwhByType from ' +
' (SELECT whaccountid,sum(extsales) as Detail'+ @in_type +
' from api..v_apisalesdetail where month(invdate) = ' + @in_month + '  and year(invdate) =  ' + @in_year + ' and type = '''+ @detail_type + '''' +
' and AcctGrp <> ''I17''' +		--The summary sales numbers do not include I17
 ' group by whaccountid  )ch ';
 Exec(@SQL);

SET @SQL = ' SELECT t.whaccountid as DetailWHID,Detail'+ @in_type +' ,a.whaccountid as CompareWHID,a.' +@in_type +' as Compare'+@in_type +
	' from tmp_apiwhByType   t '+
' join( '+
 ' SELECT * from  API_MO_WHSales  where month(date) =  ' + @in_month + '  and year(date) =  ' + @in_year +
' )a on t.whaccountid = a.whaccountid '+
' where  Detail' +@in_type +' ! = '+ @in_type
 
Exec(@SQL);
END








GO
