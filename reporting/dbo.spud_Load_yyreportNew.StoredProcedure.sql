USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_Load_yyreportNew]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Joshila Narayanan
-- Create date: 08/26/2008
-- Description:	Year to year comparison Report ALL VENDORS
-- =============================================
CREATE PROCEDURE [dbo].[spud_Load_yyreportNew]
	
AS
BEGIN TRAN YYREP
	
	SET NOCOUNT ON;

		DECLARE @vendorname nvarchar(65)
		DECLARE @oldvendorid int
		DECLARE @fy_end varchar(4)
		
		

		-------UPDATE VENDOR MASTER TABLE--------------------------------------------------
	/*	exec spud_vendormasterupd	
		If @@error <> 0 
							Begin												
								Print 'Failed to update vendormaster table'
								Rollback Tran YYREP
								Return
							End	 
 
  */
		-----CREATE AND UPDATE table tmp_yyreport_new---------------------------------------------------
	IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='tmp_yyreport_stepA') DROP TABLE tmp_yyreport_stepA		
		If @@error <> 0 
							Begin												
								Print 'Failed to drop tmp_yyreport_new'
								Rollback Tran YYREP
								Return
							End	 
		select * INTO tmp_yyreport_stepA from v_vendorvolume
		If @@error <> 0 
							Begin												
								Print 'Failed to create tmp_yyreport_new'
								Rollback Tran YYREP
								Return
							End	 
  
	-- NOTE: v_vendorvolume only has data for FY_End > 2007, Change if need to calculate older data
		
				

		DECLARE  cu_yearend CURSOR
		FOR SELECT DISTINCT FY_END FROM udVolume WHERE(FY_END > 2007) --Get all years
		
		OPEN cu_yearend
		FETCH NEXT FROM cu_yearend INTO	-------------LOOP THROUGH FY_End----------------------		
			@fy_end			
		
		WHILE  (@@FETCH_STATUS = 0) 
		
		BEGIN			
					
					Delete FROM tmp_yyreport_new WHERE Year = @fy_end
					If @@error <> 0 
							Begin												
								Print 'Delete All rows '
								Rollback Tran YYREP
								Return
							End									
				
					INSERT INTO tmp_yyreport_new (Year, vendorid, vendor) SELECT @fy_end, oldvendorid, vendorname FROM vendormaster WHERE status=1
					If @@error <> 0 
							Begin												
								Print 'Failed to Insert vendor details'
								Rollback Tran YYREP
								Return
							End	 					
					
					UPDATE tmp_yyreport_new
					SET 
						Rq1 = (SELECT isnull(SUM(JUNE),0) + isnull(SUM(JULY),0) + isnull(SUM(AUGUST),0) + isnull(SUM(JUNE1),0) + isnull(SUM(JULY1),0) + isnull(SUM(AUGUST1),0) as Rq1 from tmp_yyreport_stepA where reports='R' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end),			
						Rq2 = (SELECT isnull(SUM(SEPTEMBER),0) + isnull(SUM(OCTOBER),0) + isnull(SUM(NOVEMBER),0) + isnull(SUM(SEPTEMBER1),0) + isnull(SUM(OCTOBER1),0) + isnull(SUM(NOVEMBER1),0) as Rq2 from tmp_yyreport_stepA where reports='R' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end),				
						Rq3 = (SELECT isnull(SUM(DECEMBER),0) + isnull(SUM(JANUARY),0) + isnull(SUM(FEBRUARY),0) + isnull(SUM(DECEMBER1),0) + isnull(SUM(JANUARY1),0) + isnull(SUM(FEBRUARY1),0)  as Rq3 from tmp_yyreport_stepA where reports='R' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end),		
						Rq4 = (SELECT isnull(SUM(MARCH),0) + isnull(SUM(APRIL),0) + isnull(SUM(MAY),0) + isnull(SUM(MARCH1),0) + isnull(SUM(APRIL1),0) + isnull(SUM(MAY1),0)  as Rq4 from tmp_yyreport_stepA where reports='R' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end),								
						Vq1 = (SELECT isnull(SUM(JUNE),0)  + isnull(SUM(JULY),0)  + isnull(SUM(AUGUST),0) + isnull(SUM(JUNE1),0) + isnull(SUM(JULY1),0) + isnull(SUM(AUGUST1),0)  as Vq1 from tmp_yyreport_stepA where reports='V' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end),			
						Vq2 = (SELECT isnull(SUM(SEPTEMBER),0) + isnull(SUM(OCTOBER),0) + isnull(SUM(NOVEMBER),0) + isnull(SUM(SEPTEMBER1),0) + isnull(SUM(OCTOBER1),0) + isnull(SUM(NOVEMBER1),0)  as Vq2 from tmp_yyreport_stepA where reports='V' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end),
						Vq3 = (SELECT isnull(SUM(DECEMBER),0) + isnull(SUM(JANUARY),0) + isnull(SUM(FEBRUARY),0) + isnull(SUM(DECEMBER1),0) + isnull(SUM(JANUARY1),0) + isnull(SUM(FEBRUARY1),0)  as Vq3 from tmp_yyreport_stepA where reports='V' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end),
						Vq4 = (SELECT isnull(SUM(MARCH),0) + isnull(SUM(APRIL),0) + isnull(SUM(MAY),0) + isnull(SUM(MARCH1),0) + isnull(SUM(APRIL1),0) + isnull(SUM(MAY1),0)  as Vq4 from tmp_yyreport_stepA where reports='V' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end),										
						Sq1 = ((SELECT  COUNT(JUNE) from tmp_yyreport_stepA where reports='V' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end and JUNE <> '0.00' AND JUNE IS NOT NULL) + (SELECT COUNT(JUNE1) from tmp_yyreport_stepA where reports1='V' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end and JUNE1 <> '0.00' AND JUNE1 IS NOT NULL) + (SELECT  COUNT(JULY) from tmp_yyreport_stepA where reports='V' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end and JULY <> '0.00' AND JULY IS NOT NULL)+ (SELECT  COUNT(JULY1) from tmp_yyreport_stepA where reports1='V' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end and JULY1 <> '0.00' AND JULY1 IS NOT NULL) + (SELECT  COUNT(AUGUST) from tmp_yyreport_stepA where reports='V' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end and AUGUST <> '0.00' AND AUGUST IS NOT NULL) + (SELECT  COUNT(AUGUST1) from tmp_yyreport_stepA where reports1='V' and vendorname = @vendorname AND FY_END = @fy_end and AUGUST1 <> '0.00' AND AUGUST1 IS NOT NULL)),
						Sq2 = ((SELECT  COUNT(SEPTEMBER) from tmp_yyreport_stepA where reports='V' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end and SEPTEMBER <> '0.00' AND SEPTEMBER IS NOT NULL) +	(SELECT  COUNT(SEPTEMBER1) from tmp_yyreport_stepA where reports1='V' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end and SEPTEMBER1 <> '0.00' AND SEPTEMBER1 IS NOT NULL) + (SELECT  COUNT(OCTOBER) from tmp_yyreport_stepA where reports='V' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end and OCTOBER <> '0.00' AND OCTOBER IS NOT NULL) + (SELECT  COUNT(OCTOBER1) from tmp_yyreport_stepA where reports='V' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end and OCTOBER1 <> '0.00' AND OCTOBER1 IS NOT NULL) + (SELECT  COUNT(NOVEMBER) from tmp_yyreport_stepA where reports='V' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end and NOVEMBER <> '0.00' AND NOVEMBER IS NOT NULL) + (SELECT  COUNT(NOVEMBER1) from tmp_yyreport_stepA where reports1='V' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end and NOVEMBER1 <> '0.00' AND NOVEMBER1 IS NOT NULL)),
						Sq3 = ((SELECT COUNT(DECEMBER) from tmp_yyreport_stepA where reports='V' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end and DECEMBER <> '0.00' AND DECEMBER IS NOT NULL) + (SELECT  COUNT(DECEMBER1) from tmp_yyreport_stepA where reports1='V' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end and DECEMBER1 <> '0.00' AND DECEMBER1 IS NOT NULL) + (SELECT  COUNT(JANUARY) from tmp_yyreport_stepA where reports='V' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end and JANUARY <> '0.00' AND JANUARY IS NOT NULL) + (SELECT COUNT(JANUARY1) from tmp_yyreport_stepA where reports1='V' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end and JANUARY1 <> '0.00' AND JANUARY1 IS NOT NULL) + (SELECT  COUNT(FEBRUARY) from tmp_yyreport_stepA where reports='V' and vendorname = @vendorname AND FY_END = @fy_end and FEBRUARY <> '0.00' AND FEBRUARY IS NOT NULL) + (SELECT  COUNT(FEBRUARY1) from tmp_yyreport_stepA where reports1='V' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end and FEBRUARY1 <> '0.00' AND FEBRUARY1 IS NOT NULL)),
						SQ4 = ((SELECT  COUNT(MARCH) from tmp_yyreport_stepA where reports='V' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end and MARCH <> '0.00' AND MARCH IS NOT NULL) + (SELECT  COUNT(MARCH1) from tmp_yyreport_stepA where reports1='V' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end and MARCH1 <> '0.00' AND MARCH1 IS NOT NULL) + (SELECT  COUNT(APRIL) from tmp_yyreport_stepA where reports='V' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end and APRIL <> '0.00' AND APRIL IS NOT NULL) + (SELECT  COUNT(APRIL1) from tmp_yyreport_stepA where reports1='V' and vendorname = tmp_yyreport_new.vendor AND (FY_END = @fy_end) and APRIL1 <> '0.00' AND APRIL1 IS NOT NULL) + (SELECT  COUNT(MAY) from tmp_yyreport_stepA where reports='V' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end and MAY <> '0.00' AND MAY IS NOT NULL) + (SELECT  COUNT(MAY1) from tmp_yyreport_stepA where reports1='V' and vendorname = tmp_yyreport_new.vendor AND FY_END = @fy_end and MAY1 <> '0.00' AND MAY1 IS NOT NULL))
					WHERE Year = @fy_end	
					If @@error <> 0 
							Begin												
								Print 'Failed to Update Calculated figures.'
								Rollback Tran YYREP
								Return
							End	 
					
					
		FETCH NEXT FROM cu_yearend INTO --------------LOOP THROUGH YEARS--------------------
					@fy_end		

		END

	CLOSE cu_yearend
	DEALLOCATE cu_yearend
	
		UPDATE tmp_yyreport_new Set Ryeartot = (Rq1 + Rq2 + Rq3 + Rq4),
						Vyeartot = (Vq1 + Vq2 + Vq3 + Vq4),	
						SYeartot = (Sq1 + Sq2 + Sq3 + Sq4)
				If @@error <> 0 
						Begin												
							Print 'Failed Update Totals'
							Rollback Tran YYREP
							Return
						End	 


COMMIT TRAN YYREP









GO
