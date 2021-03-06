USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PriceProtection_BU_Final]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <12/10/2014>
-- Description:	Price Protection QA backup temp tables
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PriceProtection_BU_Final]
(@in_month varchar(02) , @in_year varchar(04))
 

AS
BEGIN

DECLARE @SQL varchar(800);
 
 
 SET @SQL = ' IF EXISTS(SELECT name FROM sys.tables ' +
	' WHERE name = ''tmp_PPCompareAll_'  + @in_month + '_' +  @in_year + ''')' +
 ' BEGIN '+
  ' DROP TABLE tmp_PPCompareAll_' +  @in_month + '_' +  @in_year +
 ' END ';

EXEC (@SQL);



SET @SQL = 'SELECT * into tmp_PPCompareAll_' + @in_month + '_' +  @in_year + ' from tmp_PPCompareAll';
EXEC (@SQL);

 
 SET @SQL = ' IF EXISTS(SELECT name FROM sys.tables ' +
	' WHERE name = ''tmp_PPCompare_'  + @in_month + '_' +  @in_year + ''')' +
 ' BEGIN '+
  ' DROP TABLE tmp_PPCompare_' +  @in_month + '_' +  @in_year +
 ' END ';

EXEC (@SQL);



SET @SQL = 'SELECT * into tmp_PPCompare_' + @in_month + '_' +  @in_year + ' from tmp_PPCompare';
EXEC (@SQL);



END










GO
