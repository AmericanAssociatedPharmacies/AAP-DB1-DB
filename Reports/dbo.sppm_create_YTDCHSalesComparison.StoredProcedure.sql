USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_YTDCHSalesComparison]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Report Card for Wayne
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_YTDCHSalesComparison]
@returnMonth int OUTPUT

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @SQL varchar(max);
	DECLARE @Month varchar(2);
	DECLARE @Year varchar(4);
	DECLARE @prevYear varchar(4);

	
	SET @SQL = 'SELECT * from ( ';

	SET @Year =  (SELECT max(year(date))  from pharmacymaster..all_volume where aapnetsales <> 0);
	SET @Month = (SELECT max(month(date)) from pharmacymaster..all_volume where year(date) = @Year and aapnetsales <> 0);
	SET @returnMonth = @Month;
	SET @prevYear = @Year - 1;

   
    -- Build the API WH Sales fields for YTD sum
 

		SET @SQL = @SQL + ' SELECT ' + @Year + ' as Year, ''CA Brand'' as ColumName,  round(sum(isnull(AAPBrand,0)),2) as Total from pharmacymaster..ALL_Volume ' +
						  ' where year(date) = ' + @Year + ' and month(date) between 1 and ' + @Month;
		SET @SQL = @SQL + ' union';

		SET @SQL = @SQL + ' SELECT ' + @Year + ' as Year, ''CA Generic'' as ColumName,  round(sum(isnull(AAPGenTotal,0)),2) as Total from pharmacymaster..ALL_Volume ' +
						  ' where year(date) = ' + @Year + ' and month(date) between 1 and ' + @Month;
		SET @SQL = @SQL + ' union';

		SET @SQL = @SQL + ' SELECT ' + @Year + ' as Year, ''CA OTC'' as ColumName,  round(sum(isnull(AAPOTC,0)) + sum(isnull(AAPOther,0)) ,2 ) as Total from pharmacymaster..ALL_Volume ' +
						  ' where year(date) = ' + @Year + ' and month(date) between 1 and ' + @Month;
	 	SET @SQL = @SQL + ' union';

		SET @SQL = @SQL + ' SELECT ' + @Year + ' as Year, ''CA Total'' as ColumName, round(sum(isnull(AAPNetSales,0)),2) as Total from pharmacymaster..ALL_Volume ' +
						  ' where year(date) = ' + @Year + ' and month(date) between 1 and ' + @Month;
	 	SET @SQL = @SQL + ' union';


		SET @SQL = @SQL + ' SELECT ' + @prevYear + ' as Year, ''CA Brand'' as ColumName,  round(sum(isnull(AAPBrand,0)),2) as Total from pharmacymaster..ALL_Volume ' +
						  ' where year(date) = ' + @prevYear + ' and month(date) between 1 and ' + @Month;
		SET @SQL = @SQL + ' union';

		SET @SQL = @SQL + ' SELECT ' + @prevYear + ' as Year, ''CA Generic'' as ColumName,  round(sum(isnull(AAPGenTotal,0)),2) as Total from pharmacymaster..ALL_Volume ' +
						  ' where year(date) = ' + @prevYear + ' and month(date) between 1 and ' + @Month;
		SET @SQL = @SQL + ' union';

		SET @SQL = @SQL + ' SELECT ' + @prevYear + ' as Year, ''CA OTC'' as ColumName,  round(sum(isnull(AAPOTC,0)) + sum(isnull(AAPOther,0)) ,2 ) as Total from pharmacymaster..ALL_Volume ' +
						  ' where year(date) = ' + @prevYear + ' and month(date) between 1 and ' + @Month;
	 	SET @SQL = @SQL + ' union';


		SET @SQL = @SQL + ' SELECT ' + @prevYear + ' as Year, ''CA Total'' as ColumName, round(sum(isnull(AAPNetSales,0)),2) as Total from pharmacymaster..ALL_Volume ' +
						  ' where year(date) = ' + @prevYear + ' and month(date) between 1 and ' + @Month;

        SET @SQL = @SQL + '  )ch ';

 
	EXEC (@SQL);


	 
END








GO
