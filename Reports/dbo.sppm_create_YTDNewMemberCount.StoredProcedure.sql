USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_YTDNewMemberCount]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Report Card for Wayne
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_YTDNewMemberCount]


AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @SQL varchar(max);
	DECLARE @Month varchar(2);
	DECLARE @Year varchar(4);
	DECLARE @StartMonth int;
	DECLARE @DateStr varchar(10);
	DECLARE @Date datetime;
	
	SET  @StartMonth = 1;
	SET @SQL = 'SELECT ';
	SET @Month = cast((SELECT month(max(aapquitdate)) from pharmacymaster..pm_pharmacy) as varchar(2));
	SET @Year = cast((SELECT year(max(aapquitdate)) from pharmacymaster..pm_pharmacy) as varchar(4));

    SET @DateStr =  '01/01/' + @Year;
	SET @Date =  '01/01/' + @Year;

   
    -- Build the API WH Sales fields for 13 Months
	WHILE @StartMonth <= @Month
	BEGIN
        SET @SQL = @SQL + ' (SELECT count(*) from pharmacymaster..pm_pharmacy where month(aapeffectivedate) = ' + cast(@StartMonth as varchar(2)) +
						  ' and year(aapeffectivedate) = ' +  cast(@Year as varchar(4)) + ') as '+  SUBSTRING(CONVERT(VARCHAR(9), @Date, 6), 4, 3) + ',';

		SET @Date =   DATEADD(m,@StartMonth,@DateStr);
    	SET @StartMonth = @StartMonth + 1;
	END

   -- Now take of trailing comma
    SET @SQL = substring(@SQL,0,len(@SQL) );
	EXEC (@SQL);


	 
END








GO
