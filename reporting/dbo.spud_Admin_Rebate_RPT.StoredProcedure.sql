USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_Admin_Rebate_RPT]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: APRIL 30, 2009
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spud_Admin_Rebate_RPT]
	  (@in_month varchar(2), @in_year varchar(4),@in_month_1 varchar(20), @in_month_2 varchar(20),@in_month_3 varchar(20),
	 @in_month_4 varchar(20),@in_month_5 varchar(20),@in_month_6_cur varchar(20))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    DECLARE @SQL   varchar(1000);

--   	--TEST DATA
--	SET @in_month = '03'
--	SET @in_year = '2009'
--	SET @in_month_1 = 'October'
--	SET @in_month_2 = 'November'	
--	SET @in_month_3 = 'December'
--	SET @in_month_4 = 'January'
--	SET @in_month_5 = 'February'
--	SET @in_month_6_cur = 'March'
	

	--END TEST DATA

    EXECUTE  dbo.spud_create_admin_rebate_table @in_month , @in_year,@in_month_1,@in_month_2,@in_month_3,@in_month_4,@in_month_5,@in_month_6_cur;
END

BEGIN

    SET @SQL =  'select nsterritory as ''Territory'',acct_no ,type,store as ''Store'', '+
                ' VolAvg6mo , '+
			    @in_month_1 + '_r as Month1 , ' +
                @in_month_2 + '_r as Month2 , ' +
                @in_month_3 + '_r as Month3 , ' +
                @in_month_4 + '_r as Month4 ,' +
                @in_month_5 + '_r as Month5 ,' +
                @in_month_6_cur + '_r as Month6Cur,' +
			   'RebAvg6mo '+
               ' from tmp_admin_rebate_rpt  ; ';
	EXEC (@SQL);
END
GO
