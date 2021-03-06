USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spud_api_sales_ndc_qrtrly]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: October 14, 2009
-- Description:	Sums by Quarter  
-- =============================================
CREATE PROCEDURE  [dbo].[spud_api_sales_ndc_qrtrly]
(@in_qtr varchar(2), @in_year varchar(4))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
    SET NOCOUNT ON;

	DECLARE @qtr_start varchar(100);
    DECLARE @qtr_str_count varchar(10);
    DECLARE @sql VARCHAR(1000);
    DECLARE @sql1 VARCHAR(1000);
    DECLARE @mnth_qtr_str_count varchar(100);

 
    IF @in_qtr = 'Q1'
        BEGIN
		SET @qtr_start = 'JANUARY + FEBRUARY + MARCH';
        SET @qtr_str_count = 'Q1_st_cnt';
        SET @mnth_qtr_str_count = 'in(01,02,03)';
		END
    ELSE IF @in_qtr = 'Q2'
        BEGIN
        SET @qtr_start = 'APRIL + MAY + JUNE';
        SET @qtr_str_count = 'Q2_st_cnt';
        SET @mnth_qtr_str_count = 'in(04,05,06)';
        END
    ELSE IF @in_qtr = 'Q3'
        BEGIN
        SET @qtr_start = 'JULY + AUGUST + SEPTEMBER';
        SET @qtr_str_count = 'Q3_st_cnt';
        SET @mnth_qtr_str_count = 'in(07,08,09)';
        END
    ELSE IF @in_qtr = 'Q4'
        BEGIN
        SET @qtr_start = 'OCTOBER + NOVEMBER + DECEMBER';
        SET @qtr_str_count = 'Q4_st_cnt';
        SET @mnth_qtr_str_count = 'in(10,11,12)';
        END


   SET @sql = 'UPDATE  apq ' +
			  ' SET ' + @in_qtr +' = api.' + @in_qtr +',' + @qtr_str_count +' = api.' + @qtr_str_count + 
			  ' FROM APISalesNDC_QTR apq ' +
			  ' inner join (Select  year,ndc ,(' + @qtr_start +') as '+@in_qtr  + ',( select count(distinct whaccountid) from v_APISalesDetail where ndc = api.ndc   ' +
			  ' and  month(invdate)'  +  @mnth_qtr_str_count + '   and year(invdate)= '+ @in_year +   ') as '+  @qtr_str_count  + '  from '+
			  '      APISalesNDC_MO api  where year = '+ @in_year + ' ) api '+
			  ' on apq.ndc = api.ndc   and apq.year = api.year ';
 print (@sql) 
   EXEC (@sql)
    
   SET @sql1 =  'INSERT into APISalesNDC_QTR (year,ndc,type,' + @in_qtr +',' + @qtr_str_count +')' + 
               '(SELECT year,ndc, type,(' + @qtr_start +'),( select count(distinct whaccountid) from v_APISalesDetail where ndc = api.ndc   ' +
			   ' and  month(invdate)'  +  @mnth_qtr_str_count + ' and year(invdate)= '+ @in_year +   
               ' )  from '+
               '  APISalesNDC_MO api where year = '+ @in_year + ' and not exists (select * from APISalesNDC_QTR apq where year = ' + @in_year +
               ' and api.ndc = apq.ndc   ) ) ';
    print (@sql1)       
   EXEC (@sql1)
   
END
GO
