USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_wholesalevolAutoold]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 09/11/2008
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[spud_wholesalevolAutoold]

	(
		@date1 datetime,
		@date2 datetime,
		@QNo int
		
	)
	
AS
BEGIN 
	
	SET NOCOUNT ON;
	
	DECLARE @acct_no varchar(4)		
	DECLARE @month1val numeric(14, 2)
	DECLARE @month2val numeric(14, 2)
	DECLARE @q1val numeric(14, 2)
	DECLARE @q2val numeric(14, 2)
	DECLARE @q3val numeric(14, 2)

	DECLARE @q1vala numeric(14, 2)
	DECLARE @q2vala numeric(14, 2)
	DECLARE @q3vala numeric(14, 2)
	DECLARE @totq1 numeric(14, 2)
	DECLARE @totq2 numeric(14, 2)
	DECLARE @changemonth numeric(14,2)
	DECLARE @changeq numeric(14,2)
	
	DECLARE @fy_end1 int
	DECLARE @m1 int

	DECLARE @year1 int
	DECLARE @year2 int

	DECLARE @fy_end2 int
	DECLARE @fy_end int
	DECLARE @m2 int
	
	Select @fy_end = 0

	--Get fiscal Year
	Select @year1 = ycal, @fy_end1 = yfy , @m1 = mcal from M2QY where date = @date1

	Select @year2 = ycal, @fy_end2 = yfy , @m2 = mcal from M2QY where date = @date2

	Select @fy_end  = (@fy_end1 - 1)	
	
	
	DECLARE  cu_member CURSOR
	FOR SELECT acct_no FROM tmp_wsvolume order by acct_no --Get all active members
	
	OPEN cu_member
	FETCH NEXT FROM cu_member INTO	-------------LOOP THROUGH ALL EXISTING VENDORS----------------------		
		@acct_no 
		
	
	WHILE  (@@FETCH_STATUS = 0)
	
	BEGIN
			SELECT @month1val = 0
			SELECT @month2val = 0
			SELECT @q1val = 0
			SELECT @q2val = 0
			SELECT @q3val = 0

			SELECT @q1vala = 0
			SELECT @q2vala = 0
			SELECT @q3vala = 0
			SELECT @totq1 = 0
			SELECT @totq2 = 0
			SELECT @changemonth = 0
			SELECT @changeq = 0

			
			--Calculate Comparison Months
			SELECT @month1val = CASE @m1 
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
						END						
			FROM NewVolume2006 Where (FY_END = @fy_end1 AND acct_no = @acct_no)

			SELECT @month2val = CASE @m1 
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
						END						
			FROM NewVolume2006 Where (FY_END = @fy_end2 AND acct_no = @acct_no)
		
			
		
	if @QNo = 1
		BEGIN
				SELECT @q1val = isnull(SUM(JANUARY),0), @q2val = isnull(SUM(FEBRUARY),0), @q3val = isnull(SUM(MARCH),0) FROM NewVolume2006 Where (FY_END = @fy_end AND acct_no = @acct_no)

				SELECT @q1vala = isnull(SUM(JANUARY),0), @q2vala = isnull(SUM(FEBRUARY),0), @q3vala = isnull(SUM(MARCH),0) FROM NewVolume2006 Where (FY_END = @fy_end AND acct_no = @acct_no)

		END

	if @QNo = 2
		BEGIN
				SELECT @q1val = isnull(SUM(APRIL),0),@q2val = isnull(SUM(MAY),0) FROM NewVolume2006 Where (FY_END = @fy_end AND acct_no = @acct_no)
				
				SELECT @q1vala = isnull(SUM(APRIL),0),@q2vala = isnull(SUM(MAY),0),@q3val = isnull(SUM(JUNE),0)  FROM NewVolume2006 Where (FY_END = @fy_end1 AND acct_no = @acct_no)
				
				SELECT @q3vala = isnull(SUM(JUNE),0) FROM NewVolume2006 Where (FY_END = @fy_end2 AND acct_no = @acct_no)
		
		END

	if @QNo = 3
		BEGIN
				SELECT @q1val = isnull(SUM(JULY),0), @q2val = isnull(SUM(AUGUST),0), @q3val = isnull(SUM(SEPTEMBER),0) FROM NewVolume2006 Where (FY_END = @fy_end1 AND acct_no = @acct_no)
				
				SELECT @q1vala = isnull(SUM(JULY),0),@q2vala = isnull(SUM(AUGUST),0),@q3vala = isnull(SUM(SEPTEMBER),0)  FROM NewVolume2006 Where (FY_END = @fy_end2 AND acct_no = @acct_no)
			
		END

	if @QNo = 4
		BEGIN
				SELECT @q1val = isnull(SUM(OCTOBER),0), @q2val = isnull(SUM(NOVEMBER),0),@q3val = isnull(SUM(DECEMBER),0)  FROM NewVolume2006 Where (FY_END = @fy_end1 AND acct_no = @acct_no)
			
				SELECT @q1vala = isnull(SUM(OCTOBER),0), @q2vala = isnull(SUM(NOVEMBER),0), @q3vala = isnull(SUM(DECEMBER),0)  FROM NewVolume2006 Where (FY_END = @fy_end2 AND acct_no = @acct_no)
		END
				
	
			Select @totQ1 = (@q1val + @q2val + @q3val)

			
			Select @totQ2 = (@q1vala + @q2vala + @q3vala) 
			
			if @month1val <> 0
			Begin
				Select @changemonth = ((@month2val - @month1val) / @month1val) * 100
			End
			
			if @totQ1 <> 0
			Begin
				Select @changeq = ((@totQ2 - @totQ1) / @totQ1) * 100
			End 
			
			Update tmp_wsvolume SET month1 = @month1val,
						month2 = @month2val,
						mchange = @changemonth,
						Q1 = @totQ1,
						Q2 = @totQ2,
						qchange = @changeq 
			Where acct_no = @acct_no			
			
			If @@error <> 0 
			Begin												
				Print 'Error Occurred '
				CLOSE cu_member
				DEALLOCATE cu_member
				--Rollback Tran wsVolume					
				Return
			End	 

			--Q2 - Q1 / Q1 * 100

		FETCH NEXT FROM cu_member INTO --------------LOOP THROUGH ALL EXISTING VENDORS--------------------
		@acct_no 
		
		
	END

	CLOSE cu_member
	DEALLOCATE cu_member
	
END









GO
