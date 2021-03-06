USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_Qtrly_FYTD_Details_ALL]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: March 30, 2009
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spud_Qtrly_FYTD_Details_ALL]
	 (@last_qtr varchar(1) ,@fy_year varchar(4) )
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    DECLARE @SQL   varchar(1000);
	DECLARE @prev_fy_year varchar(4);
	SET @prev_fy_year = @fy_year -1;

    EXECUTE  dbo.spud_create_tbl_fytd_qrtrly_Sales_Rpt @last_qtr , @fy_year;
END

BEGIN

    SET @SQL =  'select store_name,acct_no,chain_code,type,vendor,vendor_id,CONVERT(VARCHAR(10), Effective, 101)  As Effective,CONVERT(VARCHAR(10), quitdate, 101)  As QuitDate, ' +
			   'Q1_FY_' + @fy_year + ' as ''Q1_CUR_YR'' , ' + 
               'Q2_FY_' + @fy_year + ' as ''Q2_CUR_YR'' , ' + 
               'Q3_FY_' + @fy_year + ' as ''Q3_CUR_YR'' , ' + 
               'Q4_FY_' + @fy_year + ' as ''Q4_CUR_YR'' , ' + 
               'Q1_FY_' + @prev_fy_year + ' as ''Q1_PREV_YR'' , ' + 
               'Q2_FY_' + @prev_fy_year + ' as ''Q2_PREV_YR'' , ' + 
               'Q3_FY_' + @prev_fy_year + ' as ''Q3_PREV_YR'' , ' + 
               'Q4_FY_' + @prev_fy_year + ' as ''Q4_PREV_YR'' , ' + 
               'Q1_FY_' + @fy_year + '_AP as ''Q1_CUR_YR_AP'' , ' + 
               'Q2_FY_' + @fy_year + '_AP as ''Q2_CUR_YR_AP'' , ' + 
               'Q3_FY_' + @fy_year + '_AP as ''Q3_CUR_YR_AP'' , ' + 
               'Q4_FY_' + @fy_year + '_AP as ''Q4_CUR_YR_AP'',  ' + 
               'Q1_FY_' + @prev_fy_year + '_AP as ''Q1_PREV_YR_AP'' , ' + 
               'Q2_FY_' + @prev_fy_year + '_AP as ''Q2_PREV_YR_AP'' , ' + 
               'Q3_FY_' + @prev_fy_year + '_AP as ''Q3_PREV_YR_AP'' , ' + 
               'Q4_FY_' + @prev_fy_year + '_AP as ''Q4_PREV_YR_AP''  ' + 
               ' from tmp_fytd_qtr_all  ; ';
	EXEC (@SQL);
END
GO
