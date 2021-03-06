USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_wholesalevolAuto]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 09/11/2008
-- Description:	WHOLESALE MONTHLY YY REPORT DATA POPULATED
-- =============================================
CREATE PROCEDURE [dbo].[spud_wholesalevolAuto]

	(
		--@date1 datetime,	@date2 datetime,
		
		@pyear int,
		@cyear int,
		@mnth int,
		@QNo int
		
	)
	
AS

BEGIN 
	
	SET NOCOUNT ON;	
		
	DECLARE @fy_end1 int
	DECLARE @fy_end2 int
	DECLARE @Qfy_end1 int
	DECLARE @Qfy_end2 int
	
	--Get fiscal Year
	Select  @fy_end1 = yfy  from M2QY where ycal = @pyear and mcal = @mnth
	Select  @fy_end2 = yfy  from M2QY where ycal = @cyear and mcal = @mnth
		
	Select @Qfy_end1 = min(yfy) from M2QY where ycal = @pyear and qcal = @QNo 
	Select @Qfy_end2 = min(yfy) from M2QY where ycal = @cyear and qcal = @QNo 
	
	
    Delete from tmp_wsvolume
	
	--Insert All active members
	INSERT INTO tmp_wsvolume (ACCT_NO, type, EFFECTIVE, STORE, CITY, STATE, NSTERRITORY)  (Select ACCT_NO, type, EFFECTIVE, STORE, CITY, STATE, NSTERRITORY FROM v_ws_member)   


	Select * INTO tmp_Volume05 FROM udVolume Where fy_end > 2004 and Reports='V'
				
				Update tmp_wsvolume SET month1 = (SELECT CASE @mnth 
							WHEN 1 THEN isnull(SUM(JANUARY),0) 
							WHEN 2 THEN isnull(SUM(FEBRUARY),0)
							WHEN 3 THEN isnull(SUM(MARCH),0)  				
							WHEN 4 THEN isnull(SUM(APRIL),0)
							WHEN 5 THEN isnull(SUM(MAY),0)
							WHEN 6 THEN isnull(SUM(JUNE),0)
							WHEN 7 THEN isnull(SUM(JULY),0)
							WHEN 8 THEN isnull(SUM(AUGUST),0) 
							WHEN 9 THEN isnull(SUM(SEPTEMBER),0)
							WHEN 10 THEN isnull(SUM(OCTOBER),0) 
							WHEN 11 THEN isnull(SUM(NOVEMBER),0)  
							WHEN 12 THEN isnull(SUM(DECEMBER),0)				
						END as month1 FROM tmp_Volume05 Where FY_END = @fy_end1 and acct_no = tmp_wsvolume.acct_no) ,
						month2 = (SELECT  CASE @mnth 
							WHEN 1 THEN isnull(SUM(JANUARY),0) 
							WHEN 2 THEN isnull(SUM(FEBRUARY),0) 
							WHEN 3 THEN isnull(SUM(MARCH),0)				
							WHEN 4 THEN isnull(SUM(APRIL),0) 
							WHEN 5 THEN isnull(SUM(MAY),0)
							WHEN 6 THEN isnull(SUM(JUNE),0) 
							WHEN 7 THEN isnull(SUM(JULY),0)
							WHEN 8 THEN isnull(SUM(AUGUST),0) 
							WHEN 9 THEN isnull(SUM(SEPTEMBER),0)
							WHEN 10 THEN isnull(SUM(OCTOBER),0) 
							WHEN 11 THEN isnull(SUM(NOVEMBER),0) 
							WHEN 12 THEN isnull(SUM(DECEMBER),0)				
						END as month2 FROM tmp_Volume05 Where FY_END = @fy_end2 and acct_no = tmp_wsvolume.acct_no) ,
						Q1 = (Select CASE @QNo 
								WHEN 1 THEN (SELECT isnull(SUM(JANUARY),0) + isnull(SUM(FEBRUARY),0)+ isnull(SUM(MARCH),0) FROM tmp_Volume05 Where FY_END = @Qfy_end1 and acct_no = tmp_wsvolume.acct_no) 
								WHEN 2 THEN (SELECT (isnull(SUM(APRIL),0) + isnull(SUM(MAY),0)) FROM tmp_Volume05 Where FY_END = @Qfy_end1 and acct_no = tmp_wsvolume.acct_no) + (SELECT isnull(SUM(JUNE),0) FROM tmp_Volume05 Where FY_END = (@Qfy_end1 + 1) and acct_no = tmp_wsvolume.acct_no)
								WHEN 3 THEN (SELECT (isnull(SUM(JULY),0) + isnull(SUM(AUGUST),0) + isnull(SUM(SEPTEMBER),0))  FROM tmp_Volume05 Where FY_END = @Qfy_end1 and acct_no = tmp_wsvolume.acct_no) 
								WHEN 4 THEN (SELECT (isnull(SUM(OCTOBER),0) + isnull(SUM(NOVEMBER),0) +  isnull(SUM(DECEMBER),0)) FROM tmp_Volume05 Where FY_END = @Qfy_end1 and acct_no = tmp_wsvolume.acct_no)
								END	as Q1						
							 ),
			
						Q2 = (Select CASE @QNo 
								WHEN 1 THEN (SELECT isnull(SUM(JANUARY),0) + isnull(SUM(FEBRUARY),0)+ isnull(SUM(MARCH),0) FROM tmp_Volume05 Where FY_END = @Qfy_end2 and acct_no = tmp_wsvolume.acct_no) 
								WHEN 2 THEN (SELECT (isnull(SUM(APRIL),0) + isnull(SUM(MAY),0)) FROM tmp_Volume05 Where FY_END = @Qfy_end2 and acct_no = tmp_wsvolume.acct_no) + (SELECT isnull(SUM(JUNE),0) FROM tmp_Volume05 Where FY_END = (@Qfy_end2 + 1) and acct_no = tmp_wsvolume.acct_no)
								WHEN 3 THEN (SELECT (isnull(SUM(JULY),0) + isnull(SUM(AUGUST),0) + isnull(SUM(SEPTEMBER),0))  FROM tmp_Volume05 Where FY_END = @Qfy_end2 and acct_no = tmp_wsvolume.acct_no) 
								WHEN 4 THEN (SELECT (isnull(SUM(OCTOBER),0) + isnull(SUM(NOVEMBER),0) +  isnull(SUM(DECEMBER),0)) FROM tmp_Volume05 Where FY_END = @Qfy_end2 and acct_no = tmp_wsvolume.acct_no)
								END	as Q2						
							 )
						
						
				
			UPDATE tmp_wsvolume SET
					mchange = CASE when month1 <> 0.00 then ((month2-month1)/month1) * 100 else 0.00 END,
					qchange = CASE when Q1 <> 0.00 then ((Q2-Q1)/Q1) * 100 else 0.00 END

		
		DROP TABLE tmp_Volume05

		Select * from tmp_wsvolume order by type
	
END



















GO
