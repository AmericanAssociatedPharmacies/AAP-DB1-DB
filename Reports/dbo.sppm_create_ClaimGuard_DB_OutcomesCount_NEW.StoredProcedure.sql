USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_ClaimGuard_DB_OutcomesCount_NEW]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Compliance Report for Chriss S.
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_ClaimGuard_DB_OutcomesCount_NEW]
 (@in_qtr varchar(2), @in_year varchar(4),@in_QorY varchar(1))
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

 	DECLARE @tmpTable varchar(50);

	IF(@in_QorY = 'Q')
		BEGIN 
			SET @tmpTable = 'UPCOutcomeCount'
		END 

	IF(@in_QorY = 'Y')
		BEGIN 
			SET @tmpTable = 'UPCOutcomeCountYTD'
		END

	 DECLARE @SQL nvarchar(max);
 
 
 	SET @SQL = 'IF EXISTS(SELECT name FROM sys.tables ' +
			' WHERE name =  ''' + @tmpTable + ''' ) ' +
		 'BEGIN ' +
          ' DROP TABLE  ' + @tmpTable +  
         ' END ';
	EXEC (@SQL);

	DECLARE @SQL2  varchar(max);
	DECLARE @months varchar(50);

	DECLARE @prev_months varchar(50);
	DECLARE @prev_qtr varchar(2);
	DECLARE @prev_year varchar(4);

	DECLARE @col_curr varchar(50);
	DECLARE @col_prev varchar(50);
 
	DECLARE @manualTable varchar(50);
	DECLARE @autoTable varchar(50);
	DECLARE @autoTable_PrevYear varchar(50);

	SET @manualTable = 'tmp_UPWebStatus_Web';
	SET @autoTable =   'tmp_UPAutoStatusCurr';
    SET @autoTable_PrevYear =   'tmp_UPAutoStatusPrev';



IF(@in_qtr = 'Q1')
		BEGIN
			IF( @in_QorY = 'Q')
				BEGIN
					SET @months = '(01,02,03)';
					SET @prev_year = @in_year - 1;
					SET @prev_months = '(10,11,12)';
					SET @prev_qtr = 'Q4';
					--SET @autoTable_PrevYear =   'claims..v_UPAutoStatus2012';
				END
			IF(@in_QorY = 'Y')
				BEGIN
					SET @months = '(01,02,03)';
				END
		END


	IF(@in_qtr = 'Q2'  )
		
		BEGIN
			IF(@in_QorY = 'Q')
				BEGIN
					SET @months = '(04,05,06)';
					SET @prev_year = @in_year;
					SET @prev_months = '(01,02,03)';
					SET @prev_qtr = 'Q1';
					SET @autoTable_PrevYear =   @autoTable;
				END
			IF(@in_QorY = 'Y')
				BEGIN
					SET @months = '(01,02,03,04,05,06)';					
				END
		END



	IF(@in_qtr = 'Q3')
		BEGIN
			IF(@in_QorY = 'Q')
				BEGIN
					SET @months = '(07,08,09)';
					SET @prev_year = @in_year;
					SET @prev_months = '(04,05,06)';
					SET @prev_qtr = 'Q2';
     				SET @autoTable_PrevYear =   @autoTable;
				END
			IF(@in_QorY = 'Y')
				BEGIN
					SET @months = '(01,02,03,04,05,06,07,08,09)';					
				END
		END



	IF(@in_qtr = 'Q4')
		BEGIN
			IF(@in_QorY = 'Q')
				BEGIN
					SET @months = '(10,11,12)';
					SET @prev_year = @in_year;
					SET @prev_months = '(07,08,09)';
					SET @prev_qtr = 'Q3';
					SET @autoTable_PrevYear =   @autoTable;
				END
			IF(@in_QorY = 'Y')
				BEGIN
					SET @months = '(01,02,03,04,05,06,07,08,09,10,11,12)';					
				END

		END

		IF( @in_QorY = 'Q')
			BEGIN
				SET @col_curr = @in_qtr + ' ' + @in_year;
				SET @col_prev = @prev_qtr + ' ' + @prev_year;
			END

		IF( @in_QorY = 'Y')
			BEGIN
				SET @prev_year = @in_year - 1;
				SET @prev_months = @months;
				SET @prev_qtr = @in_qtr;
				SET @col_curr = 'YTD ' + @in_qtr + ' ' + @in_year;
				SET @col_prev = 'YTD ' +@prev_qtr + ' ' + @prev_year;
			END


		SET ANSI_NULLS ON
		SET QUOTED_IDENTIFIER ON
 
		SET ANSI_PADDING ON
		SET @SQL = 'CREATE TABLE [dbo].[' + @tmpTable + ']( '+
			' [Claim Volume] [varchar](255) NULL, '+
			' ['+@col_curr+' Quantity] [int]  NULL, '+
			' ['+@col_curr+' % of Total] [float]  NULL , '+
			' ['+@col_prev+' Quantity] [int]  NULL, '+
			' ['+@col_prev+' % of Total] [float]  NULL  '+

		' ) ON [PRIMARY] ';
		EXEC (@SQL);
		SET ANSI_PADDING OFF



--Total		
		DECLARE @TCCC   int;
		DECLARE @TCCP   int;
		DECLARE @TotalClaimCountCurr   int;
		DECLARE @TotalClaimCountPrev   int;
		SET @TCCC =0;
		SET @TCCP =0;
		SET @TotalClaimCountCurr =0;
		SET @TotalClaimCountPrev =0;


-- Positive Outcomes
		DECLARE @TPC   int;
		DECLARE @TPP   int;
		DECLARE @TotalPositiveCurr   int;
		DECLARE @TotalPositivePrev   int;
		SET @TotalPositiveCurr =0;
		SET @TotalPositivePrev =0;
-- Negative Outcomes
		DECLARE @TNC   int;
		DECLARE @TNP   int;
		DECLARE @TotalNegativeCurr   int;
		DECLARE @TotalNegativePrev   int;
		SET @TotalNegativeCurr =0;
		SET @TotalNegativePrev =0;


-- Exclusions
		DECLARE @TEC   int;
		DECLARE @TEP   int;
		DECLARE @TotalExcCurr   int;
		DECLARE @TotalExcPrev   int;
		SET @TotalExcCurr =0;
		SET @TotalExcPrev =0;

-- No Response
        DECLARE @TNOC   int;
        DECLARE @TNOP   int;
		DECLARE @TotalNOCurr   int;
		DECLARE @TotalNOPrev   int;
		SET @TotalNOCurr =0;
		SET @TotalNOPrev =0;
-- Pending
		DECLARE @TPEC   int;
		DECLARE @TPEP   int;
		DECLARE @TotalPendCurr   int;
		DECLARE @TotalPendPrev   int;
		SET @TotalPendCurr =0;
		SET @TotalPendPrev =0;

		DECLARE @EndDate datetime;
		DECLARE @EndDateVARCHAR varchar(50);
		SET @EndDate = GETDate();
		SET @EndDateVARCHAR = @EndDate;
		DECLARE @HeaderTotal varchar(255);
		DECLARE @HeaderPOS varchar(255);
		DECLARE @HeaderNEG varchar(255);
		DECLARE @HeaderNO varchar(255);
		DECLARE @HeaderEXC varchar(255);
		DECLARE @HeaderPEND varchar(255);
		SET @HeaderTotal = 'Total Claim Submissions';
		SET @HeaderPOS = 'Positive Outcomes';
		SET @HeaderNEG = 'Negative Outcomes';
		SET @HeaderNO = 'No Response';
		SET @HeaderEXC = 'Exclusions';
		SET @HeaderPEND = 'Pending';

 
        SET @SQL = 'Insert into Reports..' + @tmpTable + ' ([Claim Volume]) Values (''' +@HeaderTotal + ''');';
		EXEC(@SQL);
		SET @SQL = 'Insert into Reports..' + @tmpTable + ' ([Claim Volume]) Values (''' +@HeaderPOS + ''');';
		EXEC(@SQL);
		SET @SQL = 'Insert into Reports..' + @tmpTable + ' ([Claim Volume]) Values (''' +@HeaderNEG + ''');';
		EXEC(@SQL);
		SET @SQL = 'Insert into Reports..' + @tmpTable + ' ([Claim Volume]) Values (''' +@HeaderEXC + ''');';
		EXEC(@SQL);
		SET @SQL = 'Insert into Reports..' + @tmpTable + ' ([Claim Volume]) Values (''' +@HeaderNO + ''');';
		EXEC(@SQL);
		SET @SQL = 'Insert into Reports..' + @tmpTable + ' ([Claim Volume]) Values (''' +@HeaderPEND + ''');';
		EXEC(@SQL);

----Current Quarter

	SET @SQL = '	SET @TCCC =  '+
			' (SELECT SUM(countV) as CountTotal from '+
				' ( '+
				    'SELECT    count(*)  as countV  from '+ @autoTable +
				' WHERE (Month(CreatedOn)   in '+  @months + ') AND Year(CreatedOn)=   ' + @in_year + 
					' and PlanName is not null and PlanName != ''''' +
		            ' UNION ALL '+
					 ' SELECT    count(*)  as countV  from ' + @manualTable +
				  ' WHERE (Month(CreatedOn)   in'+  @months + ') AND Year(CreatedOn)=   ' + @in_year + 
                   '  and PlanName is not null and PlanName != ''''' +
				' ) ch ' +
			' );' ;

	EXEC sp_executesql @SQL, N'@TCCC int out', @TotalClaimCountCurr out
    DECLARE @TotalClaimCountCurrOut varchar(50)	;
	SET  @TotalClaimCountCurrOut = @TotalClaimCountCurr;
	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_curr+' Quantity]  =  ' +  @TotalClaimCountCurrOut + '   WHERE [Claim Volume] = ''' +@HeaderTotal+ '''';
	EXEC(@SQL);
----------- Positive

	SET @SQL = '	SET @TPC =  '+
			' (SELECT SUM(countV) as CountTotal from '+
				' ( '+
				    'SELECT    count(*)  as countV  from '+ @autoTable + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Positive Outcome'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				' WHERE (Month(CreatedOn)   in '+  @months + ') AND Year(CreatedOn)=   ' + @in_year + 
					' and PlanName is not null and PlanName != ''''' +
		            ' UNION ALL '+
					 ' SELECT    count(*)  as countV  from ' + @manualTable + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Positive Outcome'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				  ' WHERE (Month(CreatedOn)   in'+  @months + ') AND Year(CreatedOn)=   ' + @in_year + 
                   '  and PlanName is not null and PlanName != ''''' +
				' ) ch ' +
			' );' ;

	EXEC sp_executesql @SQL, N'@TPC int out', @TotalPositiveCurr out
    DECLARE @TotalPositiveCurrOut varchar(50)	;
	SET  @TotalPositiveCurrOut = @TotalPositiveCurr;
	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_curr+' Quantity]  =  ' +  @TotalPositiveCurrOut + '   WHERE [Claim Volume] = ''' +@HeaderPOS+ '''';
	EXEC(@SQL);
---


--------- Negative


	SET @SQL = '	SET @TNC =  '+
			' (SELECT SUM(countV) as CountTotal from '+
				' ( '+
				    'SELECT    count(*)  as countV  from '+ @autoTable + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Negative Outcome'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				' WHERE (Month(CreatedOn)   in '+  @months + ') AND Year(CreatedOn)=   ' + @in_year + 
					' and PlanName is not null and PlanName != ''''' +
		            ' UNION ALL '+
					 ' SELECT    count(*)  as countV  from ' + @manualTable + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Negative Outcome'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				  ' WHERE (Month(CreatedOn)   in'+  @months + ') AND Year(CreatedOn)=   ' + @in_year + 
                   '  and PlanName is not null and PlanName != ''''' +
				' ) ch ' +
			' );' ;

	EXEC sp_executesql @SQL, N'@TNC int out', @TotalNegativeCurr out
    DECLARE @TotalNegativeCurrOut varchar(50)	;
	SET  @TotalNegativeCurrOut = @TotalNegativeCurr;
	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_curr+' Quantity]  =  ' +  @TotalNegativeCurrOut + '   WHERE [Claim Volume] = ''' +@HeaderNEG+ '''';
	EXEC(@SQL);
 
--------- Exclusions


	SET @SQL = '	SET @TEC =  '+
			' (SELECT SUM(countV) as CountTotal from '+
				' ( '+
				    'SELECT    count(*)  as countV  from '+ @autoTable + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Exclusion'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				' WHERE (Month(CreatedOn)   in '+  @months + ') AND Year(CreatedOn)=   ' + @in_year + 
					' and PlanName is not null and PlanName != ''''' +
		            ' UNION ALL '+
					 ' SELECT    count(*)  as countV  from ' + @manualTable + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Exclusion'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				  ' WHERE (Month(CreatedOn)   in'+  @months + ') AND Year(CreatedOn)=   ' + @in_year + 
                   '  and PlanName is not null and PlanName != ''''' +
				' ) ch ' +
			' );' ;

	EXEC sp_executesql @SQL, N'@TEC int out', @TotalExcCurr out
    DECLARE @TotalExcCurrOut varchar(50)	;
	SET  @TotalExcCurrOut = @TotalExcCurr;
	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_curr+' Quantity]  =  ' +  @TotalExcCurrOut + '   WHERE [Claim Volume] = ''' +@HeaderEXC+ '''';
	EXEC(@SQL);
-------
---------- No Response

	SET @SQL = '	SET @TNOC =  '+
			' (SELECT SUM(countV) as CountTotal from '+
				' ( '+
				    'SELECT    count(*)  as countV  from '+ @autoTable +  
					' WHERE (Month(CreatedOn)   in '+  @months + ') AND Year(CreatedOn)=   ' + @in_year + ' and '+ 
					' (((ResultID is null or ResultID = '''')  and DATEDIFF(day,CreatedOn,cast('''+@EndDateVARCHAR+''' as datetime))  > 60) OR '+
                    '  ResultID in ( '+
					' SELECT ResultID from UPResult where DashBoardCategory = ''No Response'') ) ' +
					' and PlanName is not null and PlanName != ''''' +
		            ' UNION ALL '+
					 ' SELECT    count(*)  as countV  from ' + @manualTable +  
				  ' WHERE (Month(CreatedOn)   in'+  @months + ') AND Year(CreatedOn)=   ' + @in_year + ' and '+ 
					' (((ResultID is null or ResultID = '''')  and DATEDIFF(day,CreatedOn,cast('''+@EndDateVARCHAR+''' as datetime))  > 60) OR '+
                    '  ResultID in ( '+
					' SELECT ResultID from UPResult where DashBoardCategory = ''No Response'') ) ' +
                   '  and PlanName is not null and PlanName != ''''' +
				' ) ch ' +
			' );' ;

	EXEC sp_executesql @SQL, N'@TNOC int out', @TotalNOCurr out
    DECLARE @TotalNOCurrOut varchar(50)	;
	SET  @TotalNOCurrOut = @TotalNOCurr;
	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_curr+' Quantity]  =  ' +  @TotalNOCurrOut + '   WHERE [Claim Volume] = ''' +@HeaderNO+ '''';
	EXEC(@SQL);


----------- Pending


	SET @SQL = '	SET @TPEC =  '+
			' (SELECT SUM(countV) as CountTotal from '+
				' ( '+
				    'SELECT    count(*)  as countV  from '+ @autoTable + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Pending'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				' WHERE (Month(CreatedOn)   in '+  @months + ') AND Year(CreatedOn)=   ' + @in_year + 
					' and PlanName is not null and PlanName != ''''' +
		            ' UNION ALL '+
					 ' SELECT    count(*)  as countV  from ' + @manualTable + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Pending'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				  ' WHERE (Month(CreatedOn)   in'+  @months + ') AND Year(CreatedOn)=   ' + @in_year + 
                   '  and PlanName is not null and PlanName != ''''' +
				' ) ch ' +
			' );' ;

	EXEC sp_executesql @SQL, N'@TPEC int out', @TotalPendCurr out
    DECLARE @TotalPendCurrOut varchar(50)	;
	SET  @TotalPendCurrOut = @TotalPendCurr;
	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_curr+' Quantity]  =  ' +  @TotalPendCurrOut + '   WHERE [Claim Volume] = ''' +@HeaderPEND+ '''';
	EXEC(@SQL);


--------------

	 	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_curr+' % of Total] = cast( '+ @TotalPositiveCurrOut + ' as float)/cast( '+ @TotalClaimCountCurrOut + ' as float)  WHERE [Claim Volume]  = ''' + @HeaderPOS+ '''';
		EXEC(@SQL);
        SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_curr+' % of Total] = cast('+ @TotalNegativeCurrOut + ' as float)/cast('+ @TotalClaimCountCurrOut + ' as float)  WHERE [Claim Volume]  = ''' +@HeaderNEG+ '''';
		EXEC(@SQL);
        SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_curr+' % of Total] = cast('+ @TotalExcCurrOut + ' as float)/cast('+ @TotalClaimCountCurrOut + ' as float)  WHERE [Claim Volume]    = ''' +@HeaderEXC+ '''';
		EXEC(@SQL);
        SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_curr+' % of Total] = cast('+@TotalNOCurrOut + ' as float)/cast('+@TotalClaimCountCurrOut + ' as float)    WHERE [Claim Volume]  = ''' +@HeaderNO+ '''';
		EXEC(@SQL);
        SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_curr+' % of Total] = cast('+@TotalPendCurrOut + ' as float)/cast('+@TotalClaimCountCurrOut + ' as float)    WHERE [Claim Volume]  = ''' +@HeaderPEND+ '''';
		EXEC(@SQL);



--------Previous Quarter



	SET @SQL = '	SET @TCCP =  '+
			' (SELECT SUM(countV) as CountTotal from '+
				' ( '+
				    'SELECT    count(*)  as countV  from '+ @autoTable_PrevYear +
				' WHERE (Month(CreatedOn)   in '+  @prev_months + ') AND Year(CreatedOn)=   ' + @prev_year + 
					' and PlanName is not null and PlanName != ''''' +
		            ' UNION ALL '+
					 ' SELECT    count(*)  as countV  from ' + @manualTable +
				  ' WHERE (Month(CreatedOn)   in'+  @prev_months + ') AND Year(CreatedOn)=   ' + @prev_year + 
                   '  and PlanName is not null and PlanName != ''''' +
				' ) ch ' +
			' );' ;

	EXEC sp_executesql @SQL, N'@TCCP int out', @TotalClaimCountPrev out
    DECLARE @TotalClaimCountPrevOut varchar(50)	;
	SET  @TotalClaimCountPrevOut = @TotalClaimCountPrev;
	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_prev+' Quantity]  =  ' +  @TotalClaimCountPrevOut + '   WHERE [Claim Volume] = ''' +@HeaderTotal+ '''';
	EXEC(@SQL);
 
----------- Positive



	SET @SQL = '	SET @TPP =  '+
			' (SELECT SUM(countV) as CountTotal from '+
				' ( '+
				    'SELECT    count(*)  as countV  from '+ @autoTable_PrevYear + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Positive Outcome'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				' WHERE (Month(CreatedOn)   in '+  @prev_months + ') AND Year(CreatedOn)=   ' + @prev_year + 
					' and PlanName is not null and PlanName != ''''' +
		            ' UNION ALL '+
					 ' SELECT    count(*)  as countV  from ' + @manualTable + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Positive Outcome'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				  ' WHERE (Month(CreatedOn)   in'+  @prev_months + ') AND Year(CreatedOn)=   ' + @prev_year + 
                   '  and PlanName is not null and PlanName != ''''' +
				' ) ch ' +
			' );' ;

	EXEC sp_executesql @SQL, N'@TPP int out', @TotalPositivePrev out
    DECLARE @TotalPositivePrevOut varchar(50)	;
	SET  @TotalPositivePrevOut = @TotalPositivePrev;
	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_prev+' Quantity]  =  ' +  @TotalPositivePrevOut + '   WHERE [Claim Volume] = ''' +@HeaderPOS+ '''';
	EXEC(@SQL);

 
--------- Negative

	SET @SQL = '	SET @TNP =  '+
			' (SELECT SUM(countV) as CountTotal from '+
				' ( '+
				    'SELECT    count(*)  as countV  from '+ @autoTable_PrevYear + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Negative Outcome'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				' WHERE (Month(CreatedOn)   in '+  @prev_months + ') AND Year(CreatedOn)=   ' + @prev_year + 
					' and PlanName is not null and PlanName != ''''' +
		            ' UNION ALL '+
					 ' SELECT    count(*)  as countV  from ' + @manualTable + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Negative Outcome'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				  ' WHERE (Month(CreatedOn)   in'+  @prev_months + ') AND Year(CreatedOn)=   ' + @prev_year + 
                   '  and PlanName is not null and PlanName != ''''' +
				' ) ch ' +
			' );' ;

	EXEC sp_executesql @SQL, N'@TNP int out', @TotalNegativePrev out
    DECLARE @TotalNegativePrevOut varchar(50)	;
	SET  @TotalNegativePrevOut = @TotalNegativePrev;
	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_prev+' Quantity]  =  ' +  @TotalNegativePrevOut + '   WHERE [Claim Volume] = ''' +@HeaderNEG+ '''';
	EXEC(@SQL);


--------- Exclusions

	SET @SQL = '	SET @TEP =  '+
			' (SELECT SUM(countV) as CountTotal from '+
				' ( '+
				    'SELECT    count(*)  as countV  from '+ @autoTable_PrevYear + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Exclusion'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				' WHERE (Month(CreatedOn)   in '+  @prev_months + ') AND Year(CreatedOn)=   ' + @prev_year + 
					' and PlanName is not null and PlanName != ''''' +
		            ' UNION ALL '+
					 ' SELECT    count(*)  as countV  from ' + @manualTable + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Exclusion'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				  ' WHERE (Month(CreatedOn)   in'+  @prev_months + ') AND Year(CreatedOn)=   ' + @prev_year + 
                   '  and PlanName is not null and PlanName != ''''' +
				' ) ch ' +
			' );' ;

	EXEC sp_executesql @SQL, N'@TEP int out', @TotalExcPrev out
    DECLARE @TotalExcPrevOut varchar(50)	;
	SET  @TotalExcPrevOut = @TotalExcPrev;
	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_prev+' Quantity]  =  ' +  @TotalExcPrevOut + '   WHERE [Claim Volume] = ''' +@HeaderEXC+ '''';
	EXEC(@SQL);



---------- No Response


	SET @SQL = '	SET @TNOP =  '+
			' (SELECT SUM(countV) as CountTotal from '+
				' ( '+
				    'SELECT    count(*)  as countV  from '+ @autoTable_PrevYear +  
					' WHERE (Month(CreatedOn)   in '+  @prev_months + ') AND Year(CreatedOn)=   ' + @prev_year + ' and '+ 
					' (((ResultID is null or ResultID = '''')  and DATEDIFF(day,CreatedOn,cast('''+@EndDateVARCHAR+''' as datetime))  > 60) OR '+
                    '  ResultID in ( '+
					' SELECT ResultID from UPResult where DashBoardCategory = ''No Response'') ) ' +
					' and PlanName is not null and PlanName != ''''' +
		            ' UNION ALL '+
					 ' SELECT    count(*)  as countV  from ' + @manualTable +  
				  ' WHERE (Month(CreatedOn)   in'+  @prev_months + ') AND Year(CreatedOn)=   ' + @prev_year + ' and '+ 
					' (((ResultID is null or ResultID = '''')  and DATEDIFF(day,CreatedOn,cast('''+@EndDateVARCHAR+''' as datetime))  > 60) OR '+
                    '  ResultID in ( '+
					' SELECT ResultID from UPResult where DashBoardCategory = ''No Response'') ) ' +
                   '  and PlanName is not null and PlanName != ''''' +
				' ) ch ' +
			' );' ;

	EXEC sp_executesql @SQL, N'@TNOP int out', @TotalNOPrev out
    DECLARE @TotalNOPrevOut varchar(50)	;
	SET  @TotalNOPrevOut = @TotalNOPrev;
	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_prev+' Quantity]  =  ' +  @TotalNOPrevOut + '   WHERE [Claim Volume] = ''' +@HeaderNO+ '''';
	EXEC(@SQL);





----------- Pending

	SET @SQL = '	SET @TPEP =  '+
			' (SELECT SUM(countV) as CountTotal from '+
				' ( '+
				    'SELECT    count(*)  as countV  from '+ @autoTable_PrevYear + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Pending'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				' WHERE (Month(CreatedOn)   in '+  @prev_months + ') AND Year(CreatedOn)=   ' + @prev_year + 
					' and PlanName is not null and PlanName != ''''' +
		            ' UNION ALL '+
					 ' SELECT    count(*)  as countV  from ' + @manualTable + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Pending'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				  ' WHERE (Month(CreatedOn)   in'+  @prev_months + ') AND Year(CreatedOn)=   ' + @prev_year + 
                   '  and PlanName is not null and PlanName != ''''' +
				' ) ch ' +
			' );' ;

	EXEC sp_executesql @SQL, N'@TPEP int out', @TotalPendPrev out
    DECLARE @TotalPendPrevOut varchar(50)	;
	SET  @TotalPendPrevOut = @TotalPendPrev;
	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_prev+' Quantity]  =  ' +  @TotalPendPrevOut + '   WHERE [Claim Volume] = ''' +@HeaderPEND+ '''';
	EXEC(@SQL);


-------------

	 	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_Prev+' % of Total] = cast( '+ @TotalPositivePrevOut + ' as float)/cast( '+ @TotalClaimCountPrevOut + ' as float)  WHERE [Claim Volume]  = ''' + @HeaderPOS+ '''';
		EXEC(@SQL);
        SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_Prev+' % of Total] = cast('+ @TotalNegativePrevOut + ' as float)/cast('+ @TotalClaimCountPrevOut + ' as float)  WHERE [Claim Volume]  = ''' +@HeaderNEG+ '''';
		EXEC(@SQL);
        SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_Prev+' % of Total] = cast('+ @TotalExcPrevOut + ' as float)/cast('+ @TotalClaimCountPrevOut + ' as float)  WHERE [Claim Volume]    = ''' +@HeaderEXC+ '''';
		EXEC(@SQL);
        SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_Prev+' % of Total] = cast('+@TotalNOPrevOut + ' as float)/cast('+@TotalClaimCountPrevOut + ' as float)    WHERE [Claim Volume]  = ''' +@HeaderNO+ '''';
		EXEC(@SQL);
        SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_Prev+' % of Total] = cast('+@TotalPendPrevOut + ' as float)/cast('+@TotalClaimCountPrevOut + ' as float)    WHERE [Claim Volume]  = ''' +@HeaderPEND+ '''';
		EXEC(@SQL);


END








GO
