USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_QA_GlobalRpt_Active]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	QA Monthly Global Report
-- =============================================
CREATE PROCEDURE [dbo].[sppm_QA_GlobalRpt_Active]
(@in_month varchar(50), @in_year varchar(4))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table
    DECLARE @SQL varchar(1000);
    DECLARE @MonthActive    varchar(50);
    SET @MonthActive = substring(@in_month,len(@in_month) -1,2);
 
	 SET @SQL =' SELECT sum(AAPGENTotalSrc)as ChGenSrc, '+
			' sum(AAPGENExcl) as ChGenExc, '+
			' sum(AAPGENTotal) as CHGenTotal, '+
			' sum(AAPBrand) as CHBrand, '+
			' sum(AAPOTC) +  sum(AAPOther) as CHOther , '+
			' sum(udnetsales) as CHUDOther, '+
			' sum(AAPNetSales) as CHTotal , '+
			' sum(whapigeneric) as APIGeneric, '+
			' sum(whapibrand) as APIBrand, '+
			' sum(whapiotc) as APIOTC, '+
			' sum(whapitotal) as APITotal, '+
			' sum(mltotal) as MLTotal, '+
			' sum(AAPNetSales) + sum(whapitotal) + sum(mltotal)   as AllTotal  '+

		' FROM pharmacymaster..ALL_Volume v ' +
          	 
		' join pharmacymaster..pm_pharmacy p ' +
        ' on v.pmid = p.pmid ' +
        ' where month(date) in( ' + @in_month + ' ) and year(date) = ' + @in_year ;

		SET @SQL = @SQL + '  and  p.aapaccountno  is not null and ' +
			   ' ( p.aapquitdate is null or p.aapquitdate > ''' + @MonthActive + '/' + dbo.DaysInMonth(@MonthActive,@in_year) + '/' + @in_year + ''') and ' +
	           ' p.aapeffectivedate <= ''' + @MonthActive + '/' + dbo.DaysInMonth(@MonthActive,@in_year) + '/' + @in_year + '''';

	EXEC (@SQL);
 
END










GO
