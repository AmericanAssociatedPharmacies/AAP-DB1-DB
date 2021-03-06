USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spapi_select_BR_Rx_Wkly_Std_PT_Jon]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: March 30, 2009
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spapi_select_BR_Rx_Wkly_Std_PT_Jon]
	  	(@in_month_1 varchar(20), @in_month_2 varchar(20),@in_month_3 varchar(20),
	 @in_month_4 varchar(20),@in_month_5 varchar(20),@in_month_6_cur varchar(20),
     @in_year_1 varchar(4),@in_year_2 varchar(4),@in_year_3 varchar(4),@in_year_4 varchar(4),
     @in_year_5 varchar(4),@in_year_6_cur varchar(4),@in_pay_terms varchar(4))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    DECLARE @SQL   varchar(1000);


     -- Used For Testing
	 SET @in_month_1 = 'September'
	 SET @in_month_2 = 'October' 
	 SET @in_month_3 = 'November'
	 SET @in_month_4 = 'December'
	 SET @in_month_5 = 'January'
	 SET @in_month_6_cur = 'February'
	 SET @in_year_1 = '2009'
	 SET @in_year_2 = '2009' 
	 SET @in_year_3 = '2009'
	 SET @in_year_4 = '2009'
	 SET @in_year_5 = '2010'
	 SET @in_year_6_cur = '2010'
     SET @in_pay_terms = 'STD'
     --- End testing


    EXECUTE  dbo.spapi_reports_BR_Rx_Wkly_Std_PT_Jon @in_month_1 , @in_month_2,@in_month_3,@in_month_4,@in_month_5,@in_month_6_cur,
           @in_year_1,@in_year_2,@in_year_3,@in_year_4,@in_year_5,@in_year_6_cur,@in_pay_terms
END

BEGIN

    SET @SQL =  'select apiaccountno,accountname,city,state,territory, ' +
			   @in_month_1 + '''_br''' + ' as ' +  @in_month_1 + '''_br_''' + @in_year_1 +',' +
               @in_month_1 + '''_br''' + ' as ' +  @in_month_1 + '''_br_''' + @in_year_1 +',' +
               @in_month_1 + '''_br''' + ' as ' +  @in_month_1 + '''_br_''' + @in_year_1 +',' + 
               @in_month_1 + '''_br''' + ' as ' +  @in_month_1 + '''_br_''' + @in_year_1 +',' +
               @in_month_1 + '''_br''' + ' as ' +  @in_month_1 + '''_br_''' + @in_year_1 +',' +
               @in_month_1 + '''_br''' + ' as ' +  @in_month_1 + '''_br_''' + @in_year_1 + 
               ' from tmp_MO_BR_STD_test  ; ';
	EXEC (@SQL);
END
GO
