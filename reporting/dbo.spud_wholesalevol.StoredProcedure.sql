USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_wholesalevol]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 09/11/2008
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[spud_wholesalevol]
	
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
	
	Delete from tmp_wsvolume
	
	--Insert All active members
	INSERT INTO tmp_wsvolume (ACCT_NO, type, EFFECTIVE, STORE, CITY, STATE, NSTERRITORY)  (Select ACCT_NO, type, EFFECTIVE, STORE, CITY, STATE, NSTERRITORY FROM v_ws_member)   
	If @@error <> 0 
			Begin												
				Print 'Error Populating tmp_wsvolume'
				Rollback Tran wsVolume								
				Return
			End	 
	
	
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

			declare @fy_end varchar(4)
			Select @fy_end = '2008'

			

			--Calculate Comparison Months
			SELECT @month1val = isnull(SUM(JULY),0) FROM tmp_volume Where (FY_END = 2008 AND acct_no = @acct_no)

			--SELECT SUM(JULY) FROM OPENQUERY( UNITEDDB, 'select * from VOLUME Where fy_end=  @fy_end  AND acct_no =  @acct_no')

			SELECT @month2val = isnull(SUM(JULY),0) FROM tmp_volume Where (FY_END = 2009 AND acct_no = @acct_no)



			--Calculate Comparison Quarters
			SELECT @q1val = isnull(SUM(APRIL),0) FROM tmp_volume Where (FY_END = 2007 AND acct_no = @acct_no)
			SELECT @q2val = isnull(SUM(MAY),0) FROM tmp_volume Where (FY_END = 2007 AND acct_no = @acct_no)
			SELECT @q3val = isnull(SUM(JUNE),0) FROM tmp_volume Where (FY_END = 2008 AND acct_no = @acct_no)
			
			Select @totQ1 = (@q1val + @q2val + @q3val)

			SELECT @q1vala = isnull(SUM(APRIL),0) FROM tmp_volume Where (FY_END = 2008 AND acct_no = @acct_no)
			SELECT @q2vala = isnull(SUM(MAY),0) FROM tmp_volume Where (FY_END = 2008 AND acct_no = @acct_no)
			SELECT @q3vala = isnull(SUM(JUNE),0) FROM tmp_volume Where (FY_END = 2009 AND acct_no = @acct_no)
	
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
