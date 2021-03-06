USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_LoadFeeds]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 1/12/2008
-- =============================================
CREATE PROCEDURE [dbo].[spud_LoadFeeds] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	Begin Tran lfeed

		IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Feed') DROP TABLE Feed
		If @@error <> 0 
			Begin												
				Print 'Error on Drop Table'
				Rollback Tran lfeed
				Return
			End	

		Select Feed_id, data_src_id,data_src_type,  plan_cycle_dt as plan_cycle_dt, layout_id, Load_Start_TM as Load_Start_TM, Load_End_TM as Load_End_TM, feed_stat,error_code,feed_stat_desc,Feed_Stat_TM as Feed_Stat_TM,filename,record_count,total_amt,total_misc_amt,uploaded_to_access  INTO Feed FROM         
		OPENQUERY(UNITEDDB, 'select * from truescript.Feed') AS Rowset_1 WHERE len(year(plan_cycle_dt)) = 4 AND len(year(Load_Start_TM)) = 4 AND len(year(Load_End_TM)) = 4 AND len(year(Feed_Stat_TM)) = 4
		If @@error <> 0 
			Begin												
				Print 'Error on Copy Table '
				Rollback Tran lfeed
				Return
			End 
		
	
		
		

		
	
	Commit Tran lfeed
END



GO
