USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_Volume_Dashboard_Prev_CARD]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Volume for Dashboard
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_Volume_Dashboard_Prev_CARD]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
    DECLARE @SQL varchar(max);
    DECLARE @SQL2 varchar(max);
    DECLARE @SQL3 varchar(max);

	DECLARE @SQLWHCol varchar(max);
	DECLARE @SQLWHBrand varchar(max);
	DECLARE @SQLWHGen varchar(max);
	DECLARE @SQLWHOTC varchar(max);
	DECLARE @SQLWHTotal varchar(max);

	DECLARE @SQLWHColSelect varchar(max);

	DECLARE @startWHCount int;

	DECLARE @DateStr varchar(10);
	DECLARE @Date datetime;
	DECLARE @Year varchar(4);
	DECLARE @prevYear varchar(4);
    DECLARE @Month varchar(3);

	SET @startWHCount = 1; 

    SET @SQLWHCol = '';
	SET @SQLWHBrand = '';  
	SET @SQLWHGen = '';  
	SET @SQLWHOTC = '';
	SET @SQLWHTotal = '';
	SET @SQLWHColSelect = '';

	SET @Year = year(GetDate());
	SET @prevYear = @Year - 1;
    SET @DateStr =  '01/01/' + @Year;
	SET @Date =  '01/01/' + @Year;

	WHILE @startWHCount <= 12
	BEGIN
		SET  @Month = SUBSTRING(CONVERT(VARCHAR(9), @Date, 6), 4, 3);
		SET @SQLWHCol = @SQLWHCol +  ' MAX([CA ' + @Month +  ' Brand])  as [CA ' +@Month + ' Brand], ';
		SET @SQLWHCol = @SQLWHCol +  ' MAX([CA ' + @Month +  ' Generic])  as [CA ' + @Month + ' Generic], ';
		SET @SQLWHCol = @SQLWHCol +  ' MAX([CA ' + @Month +  ' OTC])  as [CA ' +@Month + ' OTC], ';
		SET @SQLWHCol = @SQLWHCol +  ' MAX([CA ' + @Month +  ' Total])  as [CA ' + @Month + ' Total], ';
        
       	SET @SQLWHBrand = @SQLWHBrand + ' [CA ' +@Month + ' Brand], '; 
		SET @SQLWHGen = @SQLWHGen + ' [CA ' + @Month + ' Generic], ';  
		SET @SQLWHOTC = @SQLWHOTC + ' [CA ' +@Month + ' OTC], ';
		SET @SQLWHTotal = @SQLWHTotal + ' [CA ' + @Month + ' Total], ';
		

		SET @Date =   DATEADD(m,@startWHCount,@DateStr);
    	SET @startWHCount = @startWHCount + 1;
	END
   -- Now take of trailing comma
       SET @SQLWHBrand = substring(@SQLWHBrand,0,len(@SQLWHBrand) );
       SET @SQLWHGen = substring(@SQLWHGen,0,len(@SQLWHGen) );
       SET @SQLWHOTC = substring(@SQLWHOTC,0,len(@SQLWHOTC) );
       SET @SQLWHTotal = substring(@SQLWHTotal,0,len(@SQLWHTotal) );
	   SET @SQLWHCol = substring(@SQLWHCol,0,len(@SQLWHCol) );
 

	   --- Drop the previous runs table
		 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_VolD_Prev_Card_jmw')
		 BEGIN
          DROP TABLE tmp_VolD_Prev_Card_jmw
         END
 
 SET @SQL = 'SELECT * INTO tmp_VolD_Prev_Card_jmw from ( ' +
	' SELECT   ' +
    '    Date, ' +
	 	@SQLWHCol  +


	' FROM ( ' +
	'  SELECT year(date) as Date, ' +
		  '''CA '' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 3) + '' Brand'' as dateWAB, ' +
		' round(sum(isnull(AAPBrand,0)),2)as AAPBrand  , ' +
		  '''CA '' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 3) + '' Generic'' as dateWAG, ' +
		' round(sum(isnull(AAPGenTotal,0)),2) as AAPGenTotal , ' +
		  '''CA '' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 3) + '' OTC'' as dateWAO, ' +
		' round(sum(isnull(AAPOTC,0)) + sum(isnull(AAPOther,0)) ,2 ) as AAPOTC  , ' +
		   '''CA '' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 3) + '' Total'' as dateWAT, ' +
		' round(sum(isnull(AAPNetSales,0)),2)as AAPNetSales  ' +


	  ' FROM pharmacymaster..all_volume  where  year(date) in ( ' +  @prevYear + ') '+					           
			 ' group by  year(date),date '+
	 ' ) as TableDate '+


	' PIVOT ' +
	' ( '+
	' SUM(AAPBrand) ' +
	' FOR dateWAB IN  ( ' + @SQLWHBrand + ')' + 
	' ) as P1 ' +
	' PIVOT ' +
	' ( '+
	' SUM(AAPGenTotal) ' +
	'  FOR dateWAG IN  ( ' + @SQLWHGen + ')' +  
	' ) as P2 ' +
	' PIVOT ' + 
	' ( '+
	'  SUM(AAPOTC) ' + 
	'  FOR dateWAO IN ( ' +  @SQLWHOTC + ')' +  
	' )as P3 '+
	' PIVOT ' +  
	' ( '+
	'  SUM(AAPNetSales)  ' + 
	'  FOR dateWAT IN ( ' +  @SQLWHTotal + ')' +
	' )as P4 '+
	
	' group by year(date),date '+

 ' )vol ';

EXEC (@SQL);

SELECT * from tmp_VolD_Prev_Card_jmw order by date desc
END








GO
