USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_fillpriorblankrows]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Joshila Narayanan
-- Create date: 08/20/2008
-- Description:	For Filling in missing Volume or Rebate records for prior years
-- =============================================
CREATE PROCEDURE [dbo].[spud_fillpriorblankrows]
	
AS
BEGIN

	SET NOCOUNT ON;
	
	DECLARE @oldvendorid int
	DECLARE	@vendorname varchar(64)			
	DECLARE	@vendorpair int
	DECLARE	@FY_END varchar(4)
	DECLARE	@ACCT_NO varchar(4)		
	DECLARE @vendorid int			
	DECLARE	@factor numeric(16,15) 
	DECLARE	@reports varchar(1)	
	DECLARE	@fy_end1 varchar(4)	
	DECLARE @count int
	DECLARE @countpair int 

	Select @count=0
	Select @countpair=0

	DECLARE  cu_allvendor CURSOR
	FOR SELECT oldvendorid, vendorname, vendorpair FROM vendormaster where vendorname='SPENCO' and status=1 order by vendorname --Get all active vendors
	
	OPEN cu_allvendor
	FETCH NEXT FROM cu_allvendor INTO	-------------LOOP THROUGH ALL EXISTING VENDORS----------------------		
		@oldvendorid,
		@vendorname,			
		@vendorpair
	
	WHILE  (@@FETCH_STATUS = 0)
	
	BEGIN	
				DECLARE @newreports varchar(1)
				SELECT @count= count(*) from udvolume WHERE vendor_id = @oldvendorid  AND VENDOR = @vendorname AND FY_END = 2007
				SELECT @countpair= count(*) from udvolume WHERE vendor_id = @vendorpair  AND VENDOR = @vendorname AND FY_END = 2007


				--if @count = 0 --do nothing
				--if @count = 1 --already calculated for prrior years

				if @count = 0 and @countpair > 0	-- Loops though all accounts in vendor pair and add blank records					 
						
					Begin	
				
						DECLARE cu_vendor CURSOR ---------SELECT VENDORS WITH BLANK VENDOR PAIR DATA-----------------------
						FOR Select FY_END, ACCT_NO, Reports FROM udVolume WHERE(FY_END = 2007) AND (VENDOR = @vendorname) AND (VENDOR_ID = @vendorpair)
						
						OPEN cu_vendor
						FETCH NEXT FROM cu_vendor INTO
							@FY_END,
							@ACCT_NO,							
							@reports						
						
						WHILE  (@@FETCH_STATUS = 0)				
						BEGIN

							if @reports = 'R'
								Begin
									Select @newreports = 'V'
								End
							if @reports = 'V'
								Begin
									Select @newreports = 'R'
								End
							INSERT INTO ud_volume Values
							(@FY_END, @ACCT_No, @oldvendorid, @vendorname, @factor, @newreports,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.000','0.00' )
														
							
							--UPDATE CALCULATED DATA



							FETCH NEXT FROM cu_vendor INTO
							@FY_END,
							@ACCT_NO,							
							@reports							

						END
						CLOSE cu_vendor
						DEALLOCATE cu_vendor
					End

				   if (@countpair=0 and @count > 0)		--Loops though all accounts in vendor pair and add blank records

					Begin					
						DECLARE cu_vendor CURSOR ---------SELECT VENDORS WITH BLANK VENDOR PAIR DATA-----------------------
						FOR Select FY_END, ACCT_NO, Reports FROM udVolume WHERE FY_END = 2007 AND VENDOR = @vendorname AND VENDOR_ID = @oldvendorid
						
						OPEN cu_vendor
						FETCH NEXT FROM cu_vendor INTO
							@FY_END,
							@ACCT_NO,							
							@reports					
						
						
						WHILE  (@@FETCH_STATUS = 0)				
						BEGIN

							if @reports = 'R'
								Begin
									Select @newreports = 'V'
								End
							if @reports = 'V'
								Begin
									Select @newreports = 'R'
								End
							INSERT INTO ud_volume Values
							(@FY_END, @ACCT_No, @vendorpair, @vendorname, @factor, @newreports,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',	'0.000','0.00' )
												
				
							FETCH NEXT FROM cu_vendor INTO
							@FY_END,
							@ACCT_NO,							
							@reports							

						END
						CLOSE cu_vendor
						DEALLOCATE cu_vendor
					End
				

	
		FETCH NEXT FROM cu_allvendor INTO --------------LOOP THROUGH ALL EXISTING VENDORS--------------------
			@oldvendorid,
			@vendorname,			
			@vendorpair			

	END
	CLOSE cu_allvendor
	DEALLOCATE cu_allvendor
   
END






GO
