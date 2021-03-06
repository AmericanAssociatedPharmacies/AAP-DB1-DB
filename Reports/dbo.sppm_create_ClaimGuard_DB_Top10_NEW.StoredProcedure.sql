USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_ClaimGuard_DB_Top10_NEW]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Compliance Report for Chriss S.
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_ClaimGuard_DB_Top10_NEW]
 (@in_qtr varchar(2), @in_year varchar(4))
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

 
		 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'UPCClaimTop10')
		 BEGIN
          DROP TABLE UPCClaimTop10
         END

 	DECLARE @SQL varchar(max);
	DECLARE @months varchar(50);

	DECLARE @manualTable varchar(50);
	DECLARE @autoTable varchar(50);
	DECLARE @autoTable_PrevYear varchar(50);
	DECLARE @prev_months varchar(50);
	DECLARE @prev_qtr varchar(2);
	DECLARE @prev_year varchar(4);
	DECLARE @col_curr varchar(50);
	DECLARE @col_prev varchar(50);

--	SET @manualTable = 'claims..v_UPRequests';
--	SET @autoTable =   'claims..v_UPPendingRx30_2014';
--    SET @autoTable_PrevYear =   'claims..v_UPPendingRx30_2013';

	SET @manualTable = 'tmp_UPRequests';
	SET @autoTable =   'tmp_UPPendingRx30_Curr';
    SET @autoTable_PrevYear =   'tmp_UPPendingRx30_Prev';


	IF(@in_qtr = 'Q1')
		BEGIN
			SET @months = '(01,02,03)';
			SET @prev_year = @in_year - 1;
			SET @prev_months = '(10,11,12)';
		--	SET @autoTable_PrevYear =   'claims..v_UPPendingRx30_2012';
			SET @prev_qtr = 'Q4';
		END
	IF(@in_qtr = 'Q2')
		BEGIN
			SET @months = '(04,05,06)';
			SET @prev_year = @in_year;
			SET @autoTable_PrevYear =   @autoTable;
			SET @prev_months = '(01,02,03)';
			SET @prev_qtr = 'Q1';
		END
	IF(@in_qtr = 'Q3')
		BEGIN
			SET @months = '(07,08,09)';
			SET @prev_year = @in_year;
			SET @autoTable_PrevYear =   @autoTable;
			SET @prev_months = '(04,05,06)';
			SET @prev_qtr = 'Q2';
			
		END
	IF(@in_qtr = 'Q4')
		BEGIN
			SET @months = '(10,11,12)';
			SET @prev_year = @in_year;
			SET @autoTable_PrevYear =   @autoTable;
			SET @prev_months = '(07,08,09)';
			SET @prev_qtr = 'Q3';
		END

	SET @col_curr =   @in_qtr + ' ' + @in_year;
	SET @col_prev =   @prev_qtr + ' ' + @prev_year;
 
SET @SQL = 'SELECT * INTO UPCClaimTop10 from ( '+
		' SELECT    '+
		' ROW_NUMBER() OVER (ORDER BY ['+@col_curr+' - TotalLoss] desc) AS r ,  '+
		' GPI  as ['+@col_curr+' - GPI], '+
		' GPIDesc  as ['+@col_curr+' - GPIDesc],	 '+  
		' SUM(['+@col_curr+' - TotalClaims])  as ['+@col_curr+' - TotalClaims],	  '+   
		' SUM(round(['+@col_curr+' - TotalLoss],2))  as ['+@col_curr+' - TotalLoss],	 '+	 
		' round(SUM(['+@col_curr+' - TotalLoss])/SUM(['+@col_curr+' - TotalClaims]),2)  as ['+@col_curr+' - AvgLossPerClaim]   '+
 
 
	    ' FROM ( '+
 
			' SELECT GPI,  GPIDesc, '+
			''''+@col_curr+' - TotalClaims'' as dateCurrTotalClaims, '+
						' Sum(TotalClaims) as '+@in_qtr+'TotalClaims, '+
			''''+@col_curr+' - TotalLoss'' as dateCurrTotalLoss, '+
						 ' SUM(TotalLoss) as '+@in_qtr+'CurrTotalLoss   '+
 
 
            ' FROM   ( '+
				' SELECT top 10  GPI,GPIDesc   ,Sum(TotalClaims)as TotalClaims,SUM(Total$) as Total$, '+
				   ' SUM(TotalLoss) as TotalLoss  '+
				' FROM ( '+
					' SELECT  GPI,GPIDesc , count(*) as TotalClaims,   '+
					  ' SUM(TotalPaid) as Total$,  '+
					  ' SUM(TotalCost-TotalPaid) as TotalLoss   '+
					  '  from '+ @manualTable + 
					' WHERE (Month(CreatedOn) in '+@months+' ) AND Year(CreatedOn)= '+@in_year+'  and GPI is not null'+
					' GROUP BY GPI,GPIDesc   '+
					 ' UNION ALL '+
					' SELECT  GPI,GPIDesc ,count(*) as TotalClaims, '+
					 ' SUM(TotalPaid) as Total$,   '+
					 ' SUM(([AAPPrice]  *  [Qty Dispensed]  )-TotalPaid) as TotalLoss   '+
					 '  from ' + @autoTable +
					' WHERE  (Month(CreatedOn) in'+@months+' ) AND Year(CreatedOn)= '+@in_year+'  and GPI is not null and [AAPPrice] is not null'+
					' GROUP BY GPI,GPIDesc   '+
				' ) ch GROUP BY GPI,GPIDesc order by TotalLoss desc '+
			 ' )curr GROUP BY GPI,GPIDesc   '+
	' ) as TableDate   '+
 

	' PIVOT '+
	' ('+
	 '  SUM('+@in_qtr+'TotalClaims) '+
	 '  FOR dateCurrTotalClaims IN  ( ['+@col_curr+' - TotalClaims] ) '+
	' )as P1 '+


	' PIVOT  '+
	' ( '+
	'   SUM('+@in_qtr+'CurrTotalLoss) '+
	'   FOR dateCurrTotalLoss IN  (['+@col_curr+' - TotalLoss]   )  '+
	' )as P2 Group by GPI,GPIDesc,['+@col_curr+' - TotalLoss] '+
' ) Curr ' +

----------------Removed getting previous quarter per Scott
' join '+
' ( '+
  	' SELECT   '+ 
		'  ROW_NUMBER() OVER (ORDER BY ['+@col_prev+' - TotalLoss] desc) AS r2 , '+
        ' GPI2  as ['+@col_prev+' - GPI], '+
		' GPIDesc2  as ['+@col_prev+' - GPIDesc], '+
		' SUM(round(['+@col_prev+' - TotalClaims],2))  as ['+@col_prev+' - TotalClaims], '+	    
		' SUM(round(['+@col_prev+' - TotalLoss],2))  as ['+@col_prev+' - TotalLoss] ,	 '+	 
		' round(SUM(['+@col_prev+' - TotalLoss])/SUM(['+@col_prev+' - TotalClaims]),2)  as ['+@col_prev+' - AvgLossPerClaim]   '+
	' FROM ( '+
 
			' SELECT  '+
            '  GPI2 ,  '+
            ' GPIDesc2, '+
			''''+@col_prev+' - TotalClaims'' as dateCurrTotalClaims2, '+
						' Sum(TotalClaims2) as '+@prev_qtr+'TotalClaims, '+
			''''+@col_prev+' - TotalLoss'' as dateCurrTotalLoss2, '+
						  ' SUM(TotalLoss2) as '+@prev_qtr+'CurrTotalLoss  '+
 
            ' FROM   ( '+
				' SELECT TOP 10 GPI  as GPI2,GPIDesc as GPIDesc2 ,Sum(TotalClaims)as TotalClaims2,SUM(Total$) as Total$2,SUM(TotalLoss) as TotalLoss2 '+
					 ' FROM ( '+
						' SELECT  GPI,GPIDesc, count(*) as TotalClaims,   '+
						 ' SUM(TotalPaid) as Total$,  '+
						  ' SUM(TotalCost-TotalPaid) as TotalLoss   '+
						  '  from  '+ @manualTable +
						' WHERE (Month(CreatedOn) in '+@prev_months+')  AND Year(CreatedOn)= '+@prev_year+'  and GPI is not null'+
						' GROUP BY GPI,GPIDesc  '+
						 ' UNION ALL '+
						' SELECT  GPI,GPIDesc, count(*) as TotalClaims, '+
						 ' SUM(TotalPaid) as Total$,   '+
						' SUM(([AAPPrice]  *  [Qty Dispensed]  )-TotalPaid) as TotalLoss  '+
						'  from  '+ @autoTable_PrevYear +
						' WHERE  (Month(CreatedOn) in '+@prev_months+' ) AND Year(CreatedOn)= '+@prev_year+'  and GPI is not null and [AAPPrice] is not null'+
						' GROUP BY GPI,GPIDesc  '+
						' ) ch GROUP BY GPI,GPIDesc order by TotalLoss2 desc '+
			' )curr2 GROUP BY  GPI2,GPIDesc2 '+
 
	' ) as TableDate   '+

 

	' PIVOT '+
	' ( '+
	 '  SUM('+@prev_qtr+'TotalClaims) '+
	 '  FOR dateCurrTotalClaims2 IN  (  ['+@col_prev+' - TotalClaims]) '+
	 ' )as P1 '+


	' PIVOT  '+
	' ( '+
	  ' SUM('+@prev_qtr+'CurrTotalLoss) '+
	  ' FOR dateCurrTotalLoss2 IN  ( ['+@col_prev+' - TotalLoss]  ) '+ 
	' )as P2  Group By  GPI2,GPIDesc2,['+@col_prev+' - TotalLoss] '+

 
 
' )Prev on  Curr.r= Prev.r2  ';


print @sql;
Exec (@SQL);

SET @SQL = ' Select  ['+@col_curr+' - GPI],['+@col_curr+' - GPIDesc],['+@col_curr+' - TotalClaims], ['+@col_curr+' - TotalLoss], ['+@col_curr+' - AvgLossPerClaim], '+
  ' ['+@col_prev+' - GPI],['+@col_prev+' - GPIDesc],['+@col_prev+' - TotalClaims], ['+@col_prev+' - TotalLoss], ['+@col_prev+' - AvgLossPerClaim] from UPCClaimTop10';
Exec (@SQL);


END








GO
