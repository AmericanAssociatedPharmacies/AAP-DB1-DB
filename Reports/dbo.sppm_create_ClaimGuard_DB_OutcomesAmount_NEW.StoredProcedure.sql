USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_ClaimGuard_DB_OutcomesAmount_NEW]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Compliance Report for Chriss S.
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_ClaimGuard_DB_OutcomesAmount_NEW]
 (@in_qtr varchar(2), @in_year varchar(4),@in_QorY varchar(1))

AS
BEGIN
 
	-- SET NOCount ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCount ON;
  
	   --- Drop the previous runs table
	DECLARE @tmpTable varchar(50);

	IF(@in_QorY = 'Q')
		BEGIN 
			SET @tmpTable = 'UPCOutcomeAmount'
		END 

	IF(@in_QorY = 'Y')
		BEGIN 
			SET @tmpTable = 'UPCOutcomeAmountYTD'
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

--	SET @manualTable = 'claims..v_UPWebStatus_Web';
--	SET @autoTable =   'claims..v_UPAutoStatus2014';
--    SET @autoTable_PrevYear =   'claims..v_UPAutoStatus2013';

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
				--	SET @autoTable_PrevYear =   'claims..v_UPAutoStatus2012';
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
			' [$ Volume] [varchar](255) NULL, '+
			' ['+@col_curr+' Total Claim $] [float]  NULL, '+
			' ['+@col_curr+' % of Total] [float]  NULL , '+
			' ['+@col_prev+' Total Claim $] [float]  NULL, '+
			' ['+@col_prev+' % of Total] [float]  NULL  '+

		' ) ON [PRIMARY] ';
		EXEC (@SQL);
		SET ANSI_PADDING OFF



--Total		
		DECLARE @TCAC   float;
		DECLARE @TCAP   float;
		DECLARE @TotalClaimAmountCurr    float ;
		DECLARE @TotalClaimAmountPrev   float;
		SET @TCAC =0;
		SET @TCAP =0;
		SET @TotalClaimAmountCurr =0;
		SET @TotalClaimAmountPrev =0;


-- Positive Outcomes

		DECLARE @TPC   float;
		DECLARE @TPP   float;
		DECLARE @TotalPositiveCurr   float;
		DECLARE @TotalPositivePrev   float;
		SET @TotalPositiveCurr =0;
		SET @TotalPositivePrev =0;

-- Negative Outcomes
		DECLARE @TNC   float;
		DECLARE @TNP   float;
		DECLARE @TotalNegativeCurr   float;
		DECLARE @TotalNegativePrev   float;
		SET @TotalNegativeCurr =0;
		SET @TotalNegativePrev =0;


-- Exclusions
		DECLARE @TEC   float;
		DECLARE @TEP   float;
		DECLARE @TotalExcCurr   float;
		DECLARE @TotalExcPrev   float;
		SET @TotalExcCurr =0;
		SET @TotalExcPrev =0;

-- No Response
        DECLARE @TNOC   float;
        DECLARE @TNOP   float;
		DECLARE @TotalNOCurr   float;
		DECLARE @TotalNOPrev   float;
		SET @TotalNOCurr =0;
		SET @TotalNOPrev =0;

-- Pending
		DECLARE @TPEC   float;
		DECLARE @TPEP   float;
		DECLARE @TotalPendCurr   float;
		DECLARE @TotalPendPrev   float;
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
		SET @HeaderTotal = 'Total Claim Amount';
		SET @HeaderPOS = 'Positive Outcomes';
	 	SET @HeaderNEG = 'Negative Outcomes';
		SET @HeaderNO = 'No Response';
		SET @HeaderEXC = 'Exclusions';
		SET @HeaderPEND = 'Pending';
 
        SET @SQL = 'Insert into Reports..' + @tmpTable + ' ([$ Volume]) Values (''' +@HeaderTotal + ''');';
		EXEC(@SQL);
		SET @SQL = 'Insert into Reports..' + @tmpTable + ' ([$ Volume]) Values (''' +@HeaderPOS + ''');';
		EXEC(@SQL);
		SET @SQL = 'Insert into Reports..' + @tmpTable + ' ([$ Volume]) Values (''' +@HeaderNEG + ''');';
		EXEC(@SQL);
		SET @SQL = 'Insert into Reports..' + @tmpTable + ' ([$ Volume]) Values (''' +@HeaderEXC + ''');';
		EXEC(@SQL);
		SET @SQL = 'Insert into Reports..' + @tmpTable + ' ([$ Volume]) Values (''' +@HeaderNO + ''');';
		EXEC(@SQL);
		SET @SQL = 'Insert into Reports..' + @tmpTable + ' ([$ Volume]) Values (''' +@HeaderPEND + ''');';
		EXEC(@SQL);

----Current Quarter
---- Total

	SET @SQL = '	SET @TCAC =  '+
			' (SELECT SUM(TotalPaid) as TotalPaid from '+
				' ( '+
				    'SELECT   SUM(TotalPaid) as TotalPaid  from '+ @autoTable +
				' WHERE (Month(CreatedOn)   in '+  @months + ') AND Year(CreatedOn)=   ' + @in_year + 
					' and PlanName is not null and PlanName != ''''' +
		            ' UNION ALL '+
					 ' SELECT   SUM(TotalPaid) as TotalPaid  from ' + @manualTable +
				  ' WHERE (Month(CreatedOn)   in'+  @months + ') AND Year(CreatedOn)=   ' + @in_year + 
                   '  and PlanName is not null and PlanName != ''''' +
				' ) ch ' +
			' );' ;

	EXEC sp_executesql @SQL, N'@TCAC float out', @TotalClaimAmountCurr out
    DECLARE @TotalClaimAmountCurrOut varchar(100)	;
	SET  @TotalClaimAmountCurrOut = cast(@TotalClaimAmountCurr as decimal(18,2));
	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_curr+' Total Claim $]  =  ' +  @TotalClaimAmountCurrOut + '   WHERE [$ Volume] = ''' +@HeaderTotal+ '''';
	EXEC(@SQL);




----------- Positive



	SET @SQL = '	SET @TPC =  '+
			' (SELECT SUM(TotalPaid) as TotalPaid from '+
				' ( '+
				    'SELECT   SUM(TotalPaid) as TotalPaid from '+ @autoTable + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Positive Outcome'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				' WHERE (Month(CreatedOn)   in '+  @months + ') AND Year(CreatedOn)=   ' + @in_year + 
					' and PlanName is not null and PlanName != ''''' +
		            ' UNION ALL '+
					 ' SELECT   SUM(TotalPaid) as TotalPaid  from ' + @manualTable + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Positive Outcome'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				  ' WHERE (Month(CreatedOn)   in'+  @months + ') AND Year(CreatedOn)=   ' + @in_year + 
                   '  and PlanName is not null and PlanName != ''''' +
				' ) ch ' +
			' );' ;

	EXEC sp_executesql @SQL, N'@TPC float out', @TotalPositiveCurr out
    DECLARE @TotalPositiveCurrOut varchar(100)	;
	SET  @TotalPositiveCurrOut = cast(@TotalPositiveCurr  as decimal(18,2));
	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_curr+' Total Claim $]  =  ' +  @TotalPositiveCurrOut + '   WHERE [$ Volume] = ''' +@HeaderPOS+ '''';
	EXEC(@SQL);

--------- Negative

	SET @SQL = '	SET @TNC =  '+
			' (SELECT SUM(TotalPaid) as TotalPaid from '+
				' ( '+
				    'SELECT   SUM(TotalPaid) as TotalPaid from '+ @autoTable + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Negative Outcome'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				' WHERE (Month(CreatedOn)   in '+  @months + ') AND Year(CreatedOn)=   ' + @in_year + 
					' and PlanName is not null and PlanName != ''''' +
		            ' UNION ALL '+
					 ' SELECT   SUM(TotalPaid) as TotalPaid  from ' + @manualTable + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Negative Outcome'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				  ' WHERE (Month(CreatedOn)   in'+  @months + ') AND Year(CreatedOn)=   ' + @in_year + 
                   '  and PlanName is not null and PlanName != ''''' +
				' ) ch ' +
			' );' ;

	EXEC sp_executesql @SQL, N'@TNC float out', @TotalNegativeCurr out
    DECLARE @TotalNegativeCurrOut varchar(100)	;
	SET  @TotalNegativeCurrOut = cast(@TotalNegativeCurr as decimal(18,2));
	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_curr+' Total Claim $]  =  ' +  @TotalNegativeCurrOut + '   WHERE [$ Volume] = ''' +@HeaderNEG+ '''';
	EXEC(@SQL);


--------- Exclusions

	SET @SQL = '	SET @TEC =  '+
			' (SELECT SUM(TotalPaid) as TotalPaid from '+
				' ( '+
				    'SELECT   SUM(TotalPaid) as TotalPaid from '+ @autoTable + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Exclusion'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				' WHERE (Month(CreatedOn)   in '+  @months + ') AND Year(CreatedOn)=   ' + @in_year + 
					' and PlanName is not null and PlanName != ''''' +
		            ' UNION ALL '+
					 ' SELECT   SUM(TotalPaid) as TotalPaid  from ' + @manualTable + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Exclusion'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				  ' WHERE (Month(CreatedOn)   in'+  @months + ') AND Year(CreatedOn)=   ' + @in_year + 
                   '  and PlanName is not null and PlanName != ''''' +
				' ) ch ' +
			' );' ;

	EXEC sp_executesql @SQL, N'@TEC float out', @TotalExcCurr out
    DECLARE @TotalExcCurrOut varchar(100)	;
	SET  @TotalExcCurrOut = cast(@TotalExcCurr as decimal(18,2));
	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_curr+' Total Claim $]  =  ' +  @TotalExcCurrOut + '   WHERE [$ Volume] = ''' +@HeaderEXC+ '''';
	EXEC(@SQL);



---------- No Response

	SET @SQL = '	SET @TNOC =  '+
			' (SELECT SUM(TotalPaid) as TotalPaid  from '+
				' ( '+
				    'SELECT   SUM(TotalPaid) as TotalPaid  from '+ @autoTable +  
					' WHERE (Month(CreatedOn)   in '+  @months + ') AND Year(CreatedOn)=   ' + @in_year + ' and '+ 
					' (((ResultID is null or ResultID = '''')  and DATEDIFF(day,CreatedOn,cast('''+@EndDateVARCHAR+''' as datetime))  > 60) OR '+
                    '  ResultID in ( '+
					' SELECT ResultID from UPResult where DashBoardCategory = ''No Response'') ) ' +
					' and PlanName is not null and PlanName != ''''' +
		            ' UNION ALL '+
					 ' SELECT    SUM(TotalPaid) as TotalPaid  from ' + @manualTable +  
				  ' WHERE (Month(CreatedOn)   in'+  @months + ') AND Year(CreatedOn)=   ' + @in_year + ' and '+ 
					' (((ResultID is null or ResultID = '''')  and DATEDIFF(day,CreatedOn,cast('''+@EndDateVARCHAR+''' as datetime))  > 60) OR '+
                    '  ResultID in ( '+
					' SELECT ResultID from UPResult where DashBoardCategory = ''No Response'') ) ' +
                   '  and PlanName is not null and PlanName != ''''' +
				' ) ch ' +
			' );' ;

	EXEC sp_executesql @SQL, N'@TNOC float out', @TotalNOCurr out
    DECLARE @TotalNOCurrOut varchar(100)	;
	SET  @TotalNOCurrOut = cast(@TotalNOCurr  as decimal(18,2));
	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_curr+' Total Claim $]  =  ' +  @TotalNOCurrOut + '   WHERE [$ Volume] = ''' +@HeaderNO+ '''';
	EXEC(@SQL);



----------- Pending


	SET @SQL = '	SET @TPEC =  '+
			' (SELECT  SUM(TotalPaid) as TotalPaid  from '+
				' ( '+
				    'SELECT     SUM(TotalPaid) as TotalPaid   from '+ @autoTable + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Pending'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				' WHERE (Month(CreatedOn)   in '+  @months + ') AND Year(CreatedOn)=   ' + @in_year + 
					' and PlanName is not null and PlanName != ''''' +
		            ' UNION ALL '+
					 ' SELECT    SUM(TotalPaid) as TotalPaid   from ' + @manualTable + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Pending'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				  ' WHERE (Month(CreatedOn)   in'+  @months + ') AND Year(CreatedOn)=   ' + @in_year + 
                   '  and PlanName is not null and PlanName != ''''' +
				' ) ch ' +
			' );' ;

	EXEC sp_executesql @SQL, N'@TPEC float out', @TotalPendCurr out
    DECLARE @TotalPendCurrOut varchar(100)	;
	SET  @TotalPendCurrOut = cast(@TotalPendCurr  as decimal(18,2));
	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_curr+' Total Claim $]  =  ' +  @TotalPendCurrOut + '   WHERE [$ Volume] = ''' +@HeaderPEND+ '''';
	EXEC(@SQL);



---------

	 	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_curr+' % of Total] = cast( '+ @TotalPositiveCurrOut + ' as float)/cast( '+ @TotalClaimAmountCurrOut + ' as float)  WHERE [$ Volume]  = ''' + @HeaderPOS+ '''';
		EXEC(@SQL);
        SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_curr+' % of Total] = cast('+ @TotalNegativeCurrOut + ' as float)/cast('+ @TotalClaimAmountCurrOut + ' as float)  WHERE [$ Volume]  = ''' +@HeaderNEG+ '''';
		EXEC(@SQL);
        SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_curr+' % of Total] = cast('+ @TotalExcCurrOut + ' as float)/cast('+ @TotalClaimAmountCurrOut + ' as float)  WHERE [$ Volume]    = ''' +@HeaderEXC+ '''';
		EXEC(@SQL);
        SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_curr+' % of Total] = cast('+@TotalNOCurrOut + ' as float)/cast('+@TotalClaimAmountCurrOut + ' as float)    WHERE [$ Volume]  = ''' +@HeaderNO+ '''';
		EXEC(@SQL);
        SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_curr+' % of Total] = cast('+@TotalPendCurrOut + ' as float)/cast('+@TotalClaimAmountCurrOut + ' as float)    WHERE [$ Volume]  = ''' +@HeaderPEND+ '''';
		EXEC(@SQL);



--------Previous Quarter

	SET @SQL = '	SET @TCAP =  '+
			' (SELECT SUM(TotalPaid) as TotalPaid from '+
				' ( '+
				    'SELECT   SUM(TotalPaid) as TotalPaid  from '+ @autoTable_PrevYear +
				' WHERE (Month(CreatedOn)   in '+  @prev_months + ') AND Year(CreatedOn)=   ' + @prev_year + 
					' and PlanName is not null and PlanName != ''''' +
		            ' UNION ALL '+
					 ' SELECT   SUM(TotalPaid) as TotalPaid  from ' + @manualTable +
				  ' WHERE (Month(CreatedOn)   in'+  @prev_months + ') AND Year(CreatedOn)=   ' + @prev_year + 
                   '  and PlanName is not null and PlanName != ''''' +
				' ) ch ' +
			' );' ;

	EXEC sp_executesql @SQL, N'@TCAP float out', @TotalClaimAmountPrev out
    DECLARE @TotalClaimAmountPrevOut varchar(100)	;
	SET  @TotalClaimAmountPrevOut = cast(@TotalClaimAmountPrev as decimal(18,2));
	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_prev+' Total Claim $]  =  ' +  @TotalClaimAmountPrevOut + '   WHERE [$ Volume] = ''' +@HeaderTotal+ '''';
	EXEC(@SQL);

 
----------- Positive

	SET @SQL = '	SET @TPP =  '+
			' (SELECT SUM(TotalPaid) as TotalPaid from '+
				' ( '+
				    'SELECT   SUM(TotalPaid) as TotalPaid from '+ @autoTable_PrevYear + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Positive Outcome'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				' WHERE (Month(CreatedOn)   in '+  @prev_months + ') AND Year(CreatedOn)=   ' + @prev_year + 
					' and PlanName is not null and PlanName != ''''' +
		            ' UNION ALL '+
					 ' SELECT   SUM(TotalPaid) as TotalPaid  from ' + @manualTable + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Positive Outcome'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				  ' WHERE (Month(CreatedOn)   in'+  @prev_months + ') AND Year(CreatedOn)=   ' + @prev_year + 
                   '  and PlanName is not null and PlanName != ''''' +
				' ) ch ' +
			' );' ;

	EXEC sp_executesql @SQL, N'@TPP float out', @TotalPositivePrev out
    DECLARE @TotalPositivePrevOut varchar(100)	;
	SET  @TotalPositivePrevOut = cast(@TotalPositivePrev as decimal(18,2));
	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_prev+' Total Claim $]  =  ' +  @TotalPositivePrevOut + '   WHERE [$ Volume] = ''' +@HeaderPOS+ '''';
	EXEC(@SQL);

 

--------- Negative

	SET @SQL = '	SET @TNP =  '+
			' (SELECT SUM(TotalPaid) as TotalPaid from '+
				' ( '+
				    'SELECT   SUM(TotalPaid) as TotalPaid from '+ @autoTable_PrevYear + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Negative Outcome'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				' WHERE (Month(CreatedOn)   in '+  @prev_months + ') AND Year(CreatedOn)=   ' + @prev_year + 
					' and PlanName is not null and PlanName != ''''' +
		            ' UNION ALL '+
					 ' SELECT   SUM(TotalPaid) as TotalPaid  from ' + @manualTable + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Negative Outcome'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				  ' WHERE (Month(CreatedOn)   in'+  @prev_months + ') AND Year(CreatedOn)=   ' + @prev_year + 
                   '  and PlanName is not null and PlanName != ''''' +
				' ) ch ' +
			' );' ;

	EXEC sp_executesql @SQL, N'@TNP float out', @TotalNegativePrev out
    DECLARE @TotalNegativePrevOut varchar(100)	;
	SET  @TotalNegativePrevOut = cast(@TotalNegativePrev as decimal(18,2));
	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_prev+' Total Claim $]  =  ' +  @TotalNegativePrevOut + '   WHERE [$ Volume] = ''' +@HeaderNEG+ '''';
	EXEC(@SQL);



--------- Exclusions

	SET @SQL = '	SET @TEP =  '+
			' (SELECT SUM(TotalPaid) as TotalPaid from '+
				' ( '+
				    'SELECT   SUM(TotalPaid) as TotalPaid from '+ @autoTable_PrevYear + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Exclusion'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				' WHERE (Month(CreatedOn)   in '+  @prev_months + ') AND Year(CreatedOn)=   ' + @prev_year + 
					' and PlanName is not null and PlanName != ''''' +
		            ' UNION ALL '+
					 ' SELECT   SUM(TotalPaid) as TotalPaid  from ' + @manualTable + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Exclusion'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				  ' WHERE (Month(CreatedOn)   in'+  @prev_months + ') AND Year(CreatedOn)=   ' + @prev_year + 
                   '  and PlanName is not null and PlanName != ''''' +
				' ) ch ' +
			' );' ;

	EXEC sp_executesql @SQL, N'@TEP float out', @TotalExcPrev out
    DECLARE @TotalExcPrevOut varchar(100)	;
	SET  @TotalExcPrevOut = cast(@TotalExcPrev as decimal(18,2));
	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_prev+' Total Claim $]  =  ' +  @TotalExcPrevOut + '   WHERE [$ Volume] = ''' +@HeaderEXC+ '''';
	EXEC(@SQL);



---------- No Response


	SET @SQL = '	SET @TNOP =  '+
			' (SELECT SUM(TotalPaid) as TotalPaid  from '+
				' ( '+
				    'SELECT   SUM(TotalPaid) as TotalPaid  from '+ @autoTable_PrevYear +  
					' WHERE (Month(CreatedOn)   in '+  @prev_months + ') AND Year(CreatedOn)=   ' + @prev_year + ' and '+ 
					' (((ResultID is null or ResultID = '''')  and DATEDIFF(day,CreatedOn,cast('''+@EndDateVARCHAR+''' as datetime))  > 60) OR '+
                    '  ResultID in ( '+
					' SELECT ResultID from UPResult where DashBoardCategory = ''No Response'') ) ' +
					' and PlanName is not null and PlanName != ''''' +
		            ' UNION ALL '+
					 ' SELECT    SUM(TotalPaid) as TotalPaid  from ' + @manualTable +  
				  ' WHERE (Month(CreatedOn)   in'+  @prev_months + ') AND Year(CreatedOn)=   ' + @prev_year + ' and '+ 
					' (((ResultID is null or ResultID = '''')  and DATEDIFF(day,CreatedOn,cast('''+@EndDateVARCHAR+''' as datetime))  > 60) OR '+
                    '  ResultID in ( '+
					' SELECT ResultID from UPResult where DashBoardCategory = ''No Response'') ) ' +
                   '  and PlanName is not null and PlanName != ''''' +
				' ) ch ' +
			' );' ;

	EXEC sp_executesql @SQL, N'@TNOP float out', @TotalNOPrev out
    DECLARE @TotalNOPrevOut varchar(100)	;
	SET  @TotalNOPrevOut = cast(@TotalNOPrev  as decimal(18,2));
	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_prev+' Total Claim $]  =  ' +  @TotalNOPrevOut + '   WHERE [$ Volume] = ''' +@HeaderNO+ '''';
	EXEC(@SQL);


----------- Pending

	SET @SQL = '	SET @TPEP =  '+
			' (SELECT  SUM(TotalPaid) as TotalPaid  from '+
				' ( '+
				    'SELECT     SUM(TotalPaid) as TotalPaid   from '+ @autoTable_PrevYear + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Pending'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				' WHERE (Month(CreatedOn)   in '+  @prev_months + ') AND Year(CreatedOn)=   ' + @prev_year + 
					' and PlanName is not null and PlanName != ''''' +
		            ' UNION ALL '+
					 ' SELECT    SUM(TotalPaid) as TotalPaid   from ' + @manualTable + ' v' +
					' JOIN '+
					' ( '+
						' SELECT * from claims..upresult where category = ''Pending'''+
					' ) c '+
					' on c.resultid = v.resultid '+
				  ' WHERE (Month(CreatedOn)   in'+  @prev_months + ') AND Year(CreatedOn)=   ' + @prev_year + 
                   '  and PlanName is not null and PlanName != ''''' +
				' ) ch ' +
			' );' ;

	EXEC sp_executesql @SQL, N'@TPEP float out', @TotalPendPrev out
    DECLARE @TotalPendPrevOut varchar(100)	;
	SET  @TotalPendPrevOut = cast(@TotalPendPrev  as decimal(18,2));

	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_prev+' Total Claim $]  =  ' +  @TotalPendPrevOut + '   WHERE [$ Volume] = ''' +@HeaderPEND+ '''';
	EXEC(@SQL);



-----------------

	 	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_prev+' % of Total] = cast( '+ @TotalPositivePrevOut + ' as float)/cast( '+ @TotalClaimAmountPrevOut + ' as float)  WHERE [$ Volume]  = ''' + @HeaderPOS+ '''';
		EXEC(@SQL);
        SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_prev+' % of Total] = cast('+ @TotalNegativePrevOut + ' as float)/cast('+ @TotalClaimAmountPrevOut + ' as float)  WHERE [$ Volume]  = ''' +@HeaderNEG+ '''';
		EXEC(@SQL);
        SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_prev+' % of Total] = cast('+ @TotalExcPrevOut + ' as float)/cast('+ @TotalClaimAmountPrevOut + ' as float)  WHERE [$ Volume]    = ''' +@HeaderEXC+ '''';
		EXEC(@SQL);
        SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_prev+' % of Total] = cast('+@TotalNOPrevOut + ' as float)/cast('+@TotalClaimAmountPrevOut + ' as float)    WHERE [$ Volume]  = ''' +@HeaderNO+ '''';
		EXEC(@SQL);
        SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_prev+' % of Total] = cast('+@TotalPendPrevOut + ' as float)/cast('+@TotalClaimAmountPrevOut + ' as float)    WHERE [$ Volume]  = ''' +@HeaderPEND+ '''';
		EXEC(@SQL);
 

--Set null to zero

	 	SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_prev+' % of Total]    = 0 where  ['+@col_prev+' % of Total] is null and    [$ Volume] != ''' +@HeaderTotal+ ''''; 
		EXEC(@SQL);

		SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_curr+' % of Total]    = 0 where  ['+@col_curr+' % of Total] is null  and   [$ Volume] != ''' +@HeaderTotal+ ''''; 
		EXEC(@SQL);
 
		SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_prev+' Total Claim $]   = 0 where ['+@col_prev+' Total Claim $] is null';
		EXEC(@SQL);

		SET @SQL = ' UPDATE Reports..' + @tmpTable + ' set ['+@col_curr+' Total Claim $]   = 0 where ['+@col_curr+' Total Claim $] is null';
		EXEC(@SQL);
END








GO
