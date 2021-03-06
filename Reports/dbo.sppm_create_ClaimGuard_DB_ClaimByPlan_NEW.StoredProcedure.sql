USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_ClaimGuard_DB_ClaimByPlan_NEW]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Compliance Report for Chriss S.
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_ClaimGuard_DB_ClaimByPlan_NEW]
(@in_qtr varchar(2), @in_year varchar(4))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

 
		 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'UPCClaimByPlan')
		 BEGIN
          DROP TABLE UPCClaimByPlan
         END

 	DECLARE @SQL varchar(max);
	DECLARE @months varchar(50);
	DECLARE @manualTable varchar(50);
	DECLARE @autoTable varchar(50);
	DECLARE @autoTable_PrevYear varchar(50);
	DECLARE @col_curr varchar(50);
	DECLARE @col_prev varchar(50);

	--SET @manualTable = 'claims..v_UPRequests';
	--SET @autoTable =   'claims..v_UPPendingRx30_2014';
    --SET @autoTable_PrevYear =   'claims..v_UPPendingRx30_2013';

	SET @manualTable = 'tmp_UPRequests';
	SET @autoTable =   'tmp_UPPendingRx30_Curr';
    SET @autoTable_PrevYear =   'tmp_UPPendingRx30_Prev';

	
	DECLARE @prev_year varchar(4);
	SET @prev_year = @in_year - 1;

	IF(@in_qtr = 'Q1')
		BEGIN
			SET @months = '(01,02,03)';
			
		END
	IF(@in_qtr = 'Q2')
		BEGIN
			SET @months = '(01,02,03,04,05,06)';
		END
	IF(@in_qtr = 'Q3')
		BEGIN
			SET @months = '(01,02,03,04,05,06,07,08,09)';
		END
	IF(@in_qtr = 'Q4')
		BEGIN
			SET @months = '(01,02,03,04,05,06,07,08,09,10,11,12)';
		END	 
 
SET @col_curr = 'YTD ' + @in_qtr + ' ' + @in_year;
SET @col_prev = 'YTD ' + @in_qtr + ' ' + @prev_year;

SET @SQL = ' SELECT * INTO UPCClaimByPlan from ( '+
	' SELECT    '+
		' Planname , '+
		' SUM(['+@col_curr+' - TotalClaims])  as ['+@col_curr+' - TotalClaims],	   '+  
		' SUM(round(['+@col_curr+' - Total$],2))  as ['+@col_curr+' - Total$],	  '+
		' SUM(round(['+@col_curr+' - TotalLoss],2))  as ['+@col_curr+' - TotalLoss],		 '+ 
		' round(SUM(['+@col_curr+' - TotalLoss])/SUM(['+@col_curr+' - TotalClaims]),2) as ['+@col_curr+' - AvgLossPerClaim]  , '+
		' SUM(round(['+@col_prev+' - TotalClaims],2))  as ['+@col_prev+' - TotalClaims], '+	    
		' SUM(round(['+@col_prev+' - Total$],2))  as ['+@col_prev+' - Total$],	 '+ 
		' SUM(round(['+@col_prev+' - TotalLoss],2))  as ['+@col_prev+' - TotalLoss],	 '+	 
		' round(SUM(['+@col_prev+' - TotalLoss])/SUM(['+@col_prev+' - TotalClaims]),2)  as ['+@col_prev+' - AvgLossPerClaim] '+
 
 


	' FROM ( '+
 
			' Select Planname,  '+
				''''+@col_curr+' - TotalClaims'' as dateCurrTotalClaims,  '+
							' Count(*) as CurrYTDTotalClaims, '+
				''''+@col_curr+' - Total$'' as dateCurrTotal, '+
							   ' SUM(TotalPaid) as  CurrYTDCurrTotal,   '+
				''''+@col_curr+' - TotalLoss'' as dateCurrTotalLoss, '+
							  ' SUM(TotalCost-TotalPaid) as CurrYTDCurrTotalLoss '+  
				 ' FROM '+ @manualTable + 
							' WHERE (Month(CreatedOn)in   ' + @months + ') AND Year(CreatedOn)= ' + @in_year + ' and Planname is not null and Planname != ''''' +
			' GROUP BY PlanName  '+ 
			 
 		' UNION ALL '+ 
--		 v_UPPendingRx30
 		' Select Planname, '+ 
				''''+@col_curr+' - TotalClaims'' as dateCurrTotalClaims, '+ 
					' Count(*) as CurrYTDTotalClaims, '+ 
				''''+@col_curr+' - Total$'' as dateCurrTotal,  '+ 
				 ' SUM(TotalPaid) as CurrYTDCurrTotal, '+ 
				''''+@col_curr+' - TotalLoss'' as dateCurrTotalLoss, '+ 
				  ' SUM(([AAPPrice]  * [Qty Dispensed]  )-TotalPaid) as CurrYTDCurrTotalLoss   '+ 
				   ' FROM  ' + @autoTable  + 
 						' WHERE (Month(CreatedOn) in ' + @months + ' ) AND Year(CreatedOn)= ' + @in_year + ' and Planname is not null and [AAPPrice] is not null and Planname != ''''' +
			' GROUP BY PlanName '+ 
		' UNION ALL '+ 
			' Select Planname,  '+ 
				''''+@col_prev+' - TotalClaims'' as dateCurrTotalClaims, '+ 
							' Count(*) as CurrYTDTotalClaims, '+ 
				''''+@col_prev+' - Total$'' as dateCurrTotal, '+ 
							'   SUM(TotalPaid) as  CurrYTDCurrTotal,   '+ 
				''''+@col_prev+' - TotalLoss'' as dateCurrTotalLoss, '+ 
							  ' SUM(TotalCost-TotalPaid) as CurrYTDCurrTotalLoss   '+ 
				 ' FROM '+ @manualTable + 
				' WHERE (Month(CreatedOn)in ' + @months + ') AND Year(CreatedOn)= ' + @prev_year + ' and Planname is not null  and Planname != ''''' +
			' GROUP BY PlanName '+ 
		' UNION ALL '+ 
--			--v_UPPendingRx30_2012
 		' Select Planname, '+ 
				''''+@col_prev+' - TotalClaims'' as dateCurrTotalClaims, '+ 
					' Count(*) as CurrYTDTotalClaims, '+ 
				''''+@col_prev+' - Total$'' as dateCurrTotal, '+ 
				 ' SUM(TotalPaid) as CurrYTDCurrTotal, '+ 
				''''+@col_prev+' - TotalLoss'' as dateCurrTotalLoss, '+ 
				  ' SUM(([AAPPrice]  * [Qty Dispensed]  )-TotalPaid) as CurrYTDCurrTotalLoss  '+ 
			     ' FROM  ' +  @autoTable_PrevYear +
 						' WHERE (Month(CreatedOn)in ' + @months + ') AND Year(CreatedOn)= ' + @prev_year + ' and Planname is not null and [AAPPrice] is not null and Planname != ''''' +
			' GROUP BY PlanName '+ 
 
	' ) as TableDate '+ 


  ' PIVOT  '+ 
	' ( '+ 
	  ' SUM(CurrYTDTotalClaims) '+ 
	  ' FOR dateCurrTotalClaims IN  ( ['+@col_curr+' - TotalClaims],['+@col_prev+' - TotalClaims]) '+ 
	' )as P0 '+ 

	' PIVOT  '+ 
	' ( '+
	  ' SUM(CurrYTDCurrTotal) '+
	  ' FOR dateCurrTotal IN  ( ['+@col_curr+' - Total$],['+@col_prev+' - Total$]) '+
	' )as P1 '+

	' PIVOT  '+ 
	' ( '+
	  ' SUM(CurrYTDCurrTotalLoss) '+
	  ' FOR dateCurrTotalLoss IN  (['+@col_curr+' - TotalLoss],['+@col_prev+' - TotalLoss]  )  '+
	' )as P2 '+

 
 
' GROUP BY PlanName  '+
' )vol where Planname is not null ';

EXEC(@SQL);


		SET @SQL = ' UPDATE  UPCClaimByPlan set ['+@col_curr+' - TotalClaims] = 0 where ['+@col_curr+' - TotalClaims] is NULL';	 
        EXEC(@SQL);
		SET @SQL = '  UPDATE  UPCClaimByPlan set ['+@col_curr+' - Total$] = 0 where ['+@col_curr+' - Total$] is NULL';
        EXEC(@SQL);
		SET @SQL = '  UPDATE  UPCClaimByPlan set ['+@col_curr+' - TotalLoss] = 0 where ['+@col_curr+' - TotalLoss] is NULL';
        EXEC(@SQL);
		SET @SQL = '  UPDATE  UPCClaimByPlan set ['+@col_curr+' - AvgLossPerClaim] = 0 where ['+@col_curr+' - AvgLossPerClaim] is NULL';
        EXEC(@SQL);
		SET @SQL = '  UPDATE  UPCClaimByPlan set ['+@col_prev+' - TotalClaims] = 0 where ['+@col_prev+' - TotalClaims] is NULL';
        EXEC(@SQL);
		SET @SQL = '  UPDATE  UPCClaimByPlan set ['+@col_prev+' - Total$] = 0 where ['+@col_prev+' - Total$] is NULL';
        EXEC(@SQL);
		SET @SQL = '  UPDATE  UPCClaimByPlan set ['+@col_prev+' - TotalLoss] = 0 where ['+@col_prev+' - TotalLoss] is NULL';   
        EXEC(@SQL);
		SET @SQL = '  UPDATE  UPCClaimByPlan set ['+@col_prev+' - AvgLossPerClaim] = 0 where ['+@col_prev+' - AvgLossPerClaim] is NULL';  
        EXEC(@SQL);


END








GO
