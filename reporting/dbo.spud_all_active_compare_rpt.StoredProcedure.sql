USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_all_active_compare_rpt]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: January 19, 2009
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spud_all_active_compare_rpt]
	(@in_month_1 varchar(20), @in_month_2 varchar(20),@in_month_3 varchar(20),
	 @in_month_4 varchar(20),@in_month_5 varchar(20),@in_month_6 varchar(20),
	 @in_month_1_yr varchar(4), @in_month_2_yr varchar(4),@in_month_3_yr varchar(4),
	 @in_month_4_yr varchar(4),@in_month_5_yr varchar(4),@in_month_6_yr varchar(4),
	 @in_mo_in_yr int ,@in_mo_in_fyr int )
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    EXECUTE  dbo.spud_chph_create_tbl_all_active_compare_rpt @in_month_1 , @in_month_2,@in_month_3 ,@in_month_4,@in_month_5,
       @in_month_6,@in_month_1_yr,@in_month_2_yr, @in_month_3_yr, @in_month_4_yr,@in_month_5_yr,@in_month_6_yr,
       @in_mo_in_yr,@in_mo_in_fyr;
END

BEGIN

    DECLARE @SQL   varchar(1000);
    IF EXISTS(SELECT name FROM sys.tables WHERE name = 'tmp_all_active_compare')

    SET @SQL = 'SELECT acct_no as  StoreNo ,store as  StoreName , city as City , ' +
		' state as State, nsterritory as Territory ,CONVERT(VARCHAR(10), effective, 101 ) as Effective,' +
		' CONVERT(VARCHAR(10), quitdate, 101 ) as  QuitDate , primaryws as PrimaryWS , type as Type,' +
		 @in_month_1 + '_'+ @in_month_1_yr + ' as Month1,'+
		 @in_month_2 + '_'+ @in_month_2_yr + ' as Month2,'+
		 @in_month_3 + '_'+ @in_month_3_yr + ' as  Month3,'+
		 @in_month_4 + '_'+ @in_month_4_yr + ' as Month4,'+
		 @in_month_5 + '_'+ @in_month_5_yr + ' as  Month5,'+
		 @in_month_6 + '_'+ @in_month_6_yr + ' as  Month6,'+
		' currentAvg6mo as PW_6mo_Avg ,AndaAvg6mo as Anda_6mo_Avg ,ParAvg6mo as Par_6mo_Avg, ' +
		' TotalAvg6mo as Total_6mo_Avg,TotalPrevAvg as Baseline_Total_Avg, Delta   as Pct_Change,' +
		' inCHPH as In_CHPH ' +
		' from tmp_all_active_compare';
		
		exec (@sql)

END
GO
