USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_calculatepriorrows]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joshila Narayanan
-- Create date: 08/20/2008
-- Description:	For Filling in missing Volume or Rebate records for prior years
-- =============================================
CREATE PROCEDURE [dbo].[spud_calculatepriorrows]
	
AS

Begin Transaction venupd

	SET NOCOUNT ON;
	
	DECLARE @oldvendorid int
	DECLARE	@vendorname varchar(64)			
	DECLARE	@vendorpair int
	DECLARE	@FY_END varchar(4)
	DECLARE	@ACCT_NO varchar(4)		
	DECLARE @vendorid int			
	DECLARE	@factor numeric(16,15) 
	DECLARE	@reports varchar(1)	
	DECLARE @count int
	DECLARE @countpair int 
	DECLARE @totalpercentrebate numeric(5, 5)
	Select @totalpercentrebate = 0

	DECLARE  cu_allvendors CURSOR
	FOR SELECT oldvendorid, vendorname, vendorpair, totalpercentrebate FROM v_vendorrebate where vendorname= 'RENAISSANCE CARDS' and status=1 order by vendorname --Get all active vendors
	
	OPEN cu_allvendors
	FETCH NEXT FROM cu_allvendors INTO	-------------LOOP THROUGH ALL EXISTING VENDORS----------------------		
		@oldvendorid,
		@vendorname,			
		@vendorpair,
		@totalpercentrebate
	
	WHILE  (@@FETCH_STATUS = 0)
	
	BEGIN	
				
				DECLARE @newreports varchar(1)
				DECLARE @JANUARY numeric(14,2) 
				DECLARE	@FEBRUARY numeric(14,2) 
				DECLARE	@MARCH numeric(14,2) 
				DECLARE	@APRIL numeric(14,2) 
				DECLARE	@MAY numeric(14,2) 
				DECLARE	@JUNE numeric(14,2)				
				DECLARE	@JULY numeric(14,2) 
				DECLARE	@AUGUST numeric(14,2) 
				DECLARE	@SEPTEMBER numeric(14,2) 
				DECLARE	@OCTOBER numeric(14,2) 
				DECLARE	@NOVEMBER numeric(14,2) 
				DECLARE	@DECEMBER numeric(14,2)
				DECLARE	@MONTOT numeric(14,2)				

				DECLARE @JANUARY1 numeric(14,2) 
				DECLARE	@FEBRUARY1 numeric(14,2) 
				DECLARE	@MARCH1 numeric(14,2) 
				DECLARE	@APRIL1 numeric(14,2) 
				DECLARE	@MAY1 numeric(14,2) 
				DECLARE	@JUNE1 numeric(14,2)				
				DECLARE	@JULY1 numeric(14,2) 
				DECLARE	@AUGUST1 numeric(14,2) 
				DECLARE	@SEPTEMBER1 numeric(14,2) 
				DECLARE	@OCTOBER1 numeric(14,2) 
				DECLARE	@NOVEMBER1 numeric(14,2) 
				DECLARE	@DECEMBER1 numeric(14,2)

				DECLARE @qryvendorid int
				DECLARE @newvendorid int

				Select @count=0
				Select @countpair=0
				Select @qryvendorid = 0
				Select @newvendorid = 0

				SELECT @count= count(*) from udvolume WHERE vendor_id = @oldvendorid  AND VENDOR = @vendorname AND FY_END = 2007
				SELECT @countpair= count(*) from udvolume WHERE vendor_id = @vendorpair  AND VENDOR = @vendorname AND FY_END = 2007

				if @count < 10 and @countpair > 10	-- Loops though all accounts in vendor pair and add blank records for vendor					 
				Begin
					Select @qryvendorid = @vendorpair
					Select @newvendorid = @oldvendorid
				End

				if @count > 10 and @countpair < 10
				Begin
					Select @qryvendorid = @oldvendorid
					Select @newvendorid = @vendorpair
				End 
				
				If @qryvendorid > 0
					Begin	
						Select @JANUARY = 0.00
						Select @FEBRUARY = 0.00
						Select @MARCH = 0.00
						Select @APRIL = 0.00
						Select @MAY = 0.00
						Select @JUNE = 0.00				
						Select @JULY = 0.00
						Select @AUGUST = 0.00
						Select @SEPTEMBER = 0.00 
						Select @OCTOBER = 0.00 
						Select @NOVEMBER = 0.00 
						Select @DECEMBER = 0.00

						DECLARE cu_vendor CURSOR ---------SELECT VENDORS WITH BLANK VENDOR PAIR DATA-----------------------
						FOR Select FY_END, ACCT_NO, VENDOR_ID, FACTOR, REPORTS, JANUARY, FEBRUARY, MARCH, APRIL, MAY, JUNE, JULY, AUGUST, SEPTEMBER, OCTOBER, NOVEMBER, DECEMBER 
						 FROM udVolume WHERE(FY_END = 2007) AND (VENDOR = @vendorname) AND (VENDOR_ID = @qryvendorid)
						
						OPEN cu_vendor
						FETCH NEXT FROM cu_vendor INTO
							@FY_END,
							@ACCT_NO,							
							@vendorid,										
							@factor,
							@reports,
							@JANUARY, 
							@FEBRUARY, 
							@MARCH, 
							@APRIL, 
							@MAY, 
							@JUNE, 
							@JULY, 
							@AUGUST, 
							@SEPTEMBER, 
							@OCTOBER, 
							@NOVEMBER, 
							@DECEMBER										
						
						WHILE  (@@FETCH_STATUS = 0)				
						BEGIN
							Select @JANUARY1 = 0.00
							Select @FEBRUARY1 = 0.00
							Select @MARCH1 = 0.00
							Select @APRIL1 = 0.00
							Select @MAY1 = 0.00
							Select @JUNE1 = 0.00				
							Select @JULY1 = 0.00
							Select @AUGUST1 = 0.00
							Select @SEPTEMBER1 = 0.00 
							Select @OCTOBER1 = 0.00 
							Select @NOVEMBER1 = 0.00 
							Select @DECEMBER1 = 0.00

							if @reports = 'R'
								Begin
									Select @newreports = 'V'
								End
							if @reports = 'V'
								Begin
									Select @newreports = 'R'
								End
							INSERT INTO udvolume Values
							(@FY_END, @ACCT_No, @newvendorid, @vendorname, @factor, @newreports,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.000','0.00',1 )
							If @@error <> 0 
							Begin
								Rollback Tran venupd
								CLOSE cu_vendor
								DEALLOCATE cu_vendor					
								Print 'Failed to insert vendor'
								Return
							End	 							
						
						--------------------------------------CALCULATE MONTHLY REBATE OR VOLUME-----------------------------------------------
								
							--Check if rebate or volume Calculation needs to be done
							--Rebate = volume * Total%Rebate
							--Volume = month/Total%Rebate
							--Check monthly field if populated or not, if not calculate corresponding value (Volume or Rebate)	
	
							If @reports = 'V' and @totalpercentrebate <> 0 
								BEGIN
									-- Calculate Rebate	from Volume
									If @JANUARY <> '0.00' 
										Begin																					
											Select @JANUARY1 = @JANUARY * @totalpercentrebate
										End
									If @FEBRUARY <> '0.00'
										Begin																						
											Select @FEBRUARY1 = @FEBRUARY * @totalpercentrebate
										End
									If @MARCH <> '0.00'	
										Begin																													
											Select @MARCH1 = @MARCH * @totalpercentrebate	
										End	
									If @APRIL <> '0.00'	
										Begin																													
											Select @APRIL1 = @APRIL * @totalpercentrebate	
										End	
									If @MAY <> '0.00'	
										Begin																													
											Select @MAY1 = @MAY * @totalpercentrebate	
										End	
									If @JUNE <> '0.00'	
										Begin																													
											Select @JUNE1 = @JUNE * @totalpercentrebate	
										End	
									If @JULY <> '0.00'	
										Begin																													
											Select @JULY1 = @JULY * @totalpercentrebate	
										End	
									If @AUGUST <> '0.00'	
										Begin																													
											Select @AUGUST1 = @AUGUST * @totalpercentrebate	
										End	
									If @SEPTEMBER <> '0.00'	
										Begin																													
											Select @SEPTEMBER1 = @SEPTEMBER * @totalpercentrebate	
										End	
									If @OCTOBER <> '0.00'	
										Begin																													
											Select @OCTOBER1 = @OCTOBER * @totalpercentrebate	
										End		
									If @NOVEMBER <> '0.00'	
										Begin																													
											Select @NOVEMBER1 = @NOVEMBER * @totalpercentrebate	
										End	
									If @DECEMBER <> '0.00'	
										Begin																													
											Select @DECEMBER1 = @DECEMBER * @totalpercentrebate	
										End	
								END 

							if @reports = 'R' and @totalpercentrebate <> 0
									-- Calculate Rebate	from Volume									
								BEGIN
									
									If @JANUARY <> '0.00' 
										Begin																					
											Select @JANUARY1 = @JANUARY/@totalpercentrebate
										End
									If @FEBRUARY <> '0.00'
										Begin																						
											Select @FEBRUARY1 = @FEBRUARY/@totalpercentrebate
										End
									If @MARCH <> '0.00'	
										Begin																													
											Select @MARCH1 = @MARCH/@totalpercentrebate	
										End	
									If @APRIL <> '0.00'	
										Begin																													
											Select @APRIL1 = @APRIL/@totalpercentrebate	
										End	
									If @MAY <> '0.00'	
										Begin																													
											Select @MAY1 = @MAY/@totalpercentrebate	
										End	
									If @JUNE <> '0.00'	
										Begin																													
											Select @JUNE1 = @JUNE/@totalpercentrebate	
										End	
									If @JULY <> '0.00'	
										Begin																													
											Select @JULY1 = @JULY/@totalpercentrebate	
										End	
									If @AUGUST <> '0.00'	
										Begin																													
											Select @AUGUST1 = @AUGUST/@totalpercentrebate	
										End	
									If @SEPTEMBER <> '0.00'	
										Begin																													
											Select @SEPTEMBER1 = @SEPTEMBER/@totalpercentrebate	
										End	
									If @OCTOBER <> '0.00'	
										Begin																													
											Select @OCTOBER1 = @OCTOBER/@totalpercentrebate	
										End		
									If @NOVEMBER <> '0.00'	
										Begin																													
											Select @NOVEMBER1 = @NOVEMBER/@totalpercentrebate	
										End	
									If @DECEMBER <> '0.00'	
										Begin																													
											Select @DECEMBER1 = @DECEMBER/@totalpercentrebate	
										End	
								END	
									
							if @totalpercentrebate = 0
							BEGIN
									--Value cannot be calculated
									Select @JANUARY1 = NULL
									Select @FEBRUARY1 = NULL
									Select @MARCH1 = NULL
									Select @APRIL1 = NULL
									Select @MAY1 = NULL
									Select @JUNE1 = NULL
									Select @JULY1 = NULL
									Select @AUGUST1 = NULL
									Select @SEPTEMBER1 = NULL
									Select @OCTOBER1 = NULL
									Select @NOVEMBER1 = NULL
									Select @DECEMBER1 = NULL
									Select @MONTOT = NULL								
							END				
							
							--CALCULATE MONTH TOTAL
							Select @MONTOT = @JANUARY1 + @FEBRUARY1 + @MARCH1 + @APRIL1 + @MAY1 + @JUNE1 + @JULY1 + @AUGUST1 + @SEPTEMBER1 + @OCTOBER1 + @NOVEMBER1 + @DECEMBER1
						------------------------------------UPDATE THE CALCULATED VALUES----------------------------------------------------------	
	 
							UPDATE udvolume SET 
								January = @JANUARY1,
								February = @FEBRUARY1,
								March = @MARCH1,
								April = @APRIL1,
								May = @MAY1,
								June = @JUNE1,
								July = @JULY1,
								August = @AUGUST1,
								September = @SEPTEMBER1,
								October = @OCTOBER1,
								November = @NOVEMBER1,
								December = @DECEMBER1,
								Montot = @Montot,
								filled = 1								
							Where vendor = @vendorname and FY_END = @FY_END and ACCT_No = @ACCT_No and reports = @newreports and vendor_id = @newvendorid
							If @@error <> 0 
							Begin
								Rollback Tran venupd
								CLOSE cu_vendor
								DEALLOCATE cu_vendor					
								Print 'Failed to Update vendor'
								Return
							End	 

							FETCH NEXT FROM cu_vendor INTO
							@FY_END,
							@ACCT_NO,							
							@vendorid,										
							@factor,
							@reports,
							@JANUARY, 
							@FEBRUARY, 
							@MARCH, 
							@APRIL, 
							@MAY, 
							@JUNE, 
							@JULY, 
							@AUGUST, 
							@SEPTEMBER, 
							@OCTOBER, 
							@NOVEMBER, 
							@DECEMBER							

						END
						CLOSE cu_vendor
						DEALLOCATE cu_vendor
				End


	
		FETCH NEXT FROM cu_allvendors INTO --------------LOOP THROUGH ALL EXISTING VENDORS--------------------
			@oldvendorid,
			@vendorname,			
			@vendorpair,
			@totalpercentrebate		

	END
	CLOSE cu_allvendors
	DEALLOCATE cu_allvendors

Commit tran venupd











GO
