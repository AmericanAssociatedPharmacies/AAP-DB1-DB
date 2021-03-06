USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_Load_yyreport]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Joshila Narayanan
-- Create date: 08/26/2008
-- Description:	Year to year comparison Report
-- =============================================
CREATE PROCEDURE [dbo].[spud_Load_yyreport]
	
AS
BEGIN TRAN YYREP
	
	SET NOCOUNT ON;

		DECLARE @vendorname nvarchar(65)
		DECLARE @oldvendorid int
		DECLARE @vendorpair int
		DECLARE @fy_end varchar(4)
		DECLARE @Rq1 numeric(38,2) 
		DECLARE @Rq2 numeric(38,2)  
		DECLARE @Rq3 numeric(38,2)  
		DECLARE @Rq4 numeric(38,2)   
		DECLARE @Ryeartot numeric(38,2)   
		DECLARE @Vq1 numeric(38,2)   
		DECLARE @Vq2 numeric(38,2)   
		DECLARE @Vq3 numeric(38,2)   
		DECLARE @Vq4 numeric(38,2)  
		DECLARE @Vyeartot numeric(38,2)  			
		DECLARE @Sq1 int   
		DECLARE @Sq2 int   
		DECLARE @Sq3 int   
		DECLARE @Sq4 int   
		DECLARE @Syeartot int
		DECLARE @Sjune int		
		DECLARE @Sjuly int		
		DECLARE @Saugust int		
		DECLARE	@Sseptember int		
		DECLARE @Soctober int		
		DECLARE @Snovember int		
		DECLARE	@Sdecember int		
		DECLARE @Sjanuary int		
		DECLARE @Sfebruary int		
		DECLARE	@Smarch int		
		DECLARE @Sapril int		
		DECLARE @Smay int
		

		-------UPDATE VENDOR MASTER TABLE--------------------------------------------------
	/*	exec spud_vendormasterupd	
		If @@error <> 0 
							Begin												
								Print 'Failed to update vendormaster table'
								Rollback Tran YYREP
								Return
							End	 
 */
 
		  
	-- NOTE: v_vendorvolume only has data for FY_End > 2007, Change if need to calculate older data
		--Select @vendorname = 'PHARMACY SUPPLY'

	DECLARE  cu_yearend CURSOR
		FOR SELECT DISTINCT FY_END FROM udVolume WHERE(FY_END > 2007) --Get all years
		
		OPEN cu_yearend
		FETCH NEXT FROM cu_yearend INTO	-------------LOOP THROUGH FY_End----------------------		
			@fy_end			
		
		WHILE  (@@FETCH_STATUS = 0) 
		
		BEGIN			

				Delete FROM tmp_yyreport Where Year = @fy_end
				If @@error <> 0 
							Begin												
								Print 'Delete rows for the year which needs to be refreshed'
								Rollback Tran YYREP
								Return
							End	 


				DECLARE  cu_allvendors CURSOR
				FOR SELECT oldvendorid,vendorpair, vendorname FROM vendormaster where status=1 order by vendorname --Get all active vendors 
				
				OPEN cu_allvendors
				FETCH NEXT FROM cu_allvendors INTO	-------------LOOP THROUGH ALL EXISTING VENDORS----------------------		
					@oldvendorid,
					@vendorpair,
					@vendorname
					
				
				WHILE  (@@FETCH_STATUS = 0) 
				
				BEGIN			
					
					Select @Sjune = 0					
					Select @Sjuly  = 0					
					Select @Saugust  = 0					
					Select @Sseptember  = 0					
					Select @Soctober  = 0					
					Select @Snovember  = 0					
					Select @Sdecember  = 0					
					Select @Sjanuary  = 0					
					Select @Sfebruary  = 0					
					Select @Smarch  = 0					
					Select @Sapril  = 0					
					Select @Smay  = 0						
					Select @Rq1 = 0.00
					Select @Rq2 = 0.00 
					Select @Rq3 = 0.00
					Select @Rq4 = 0.00   
					Select @Ryeartot = 0.00  
					Select @Vq1 = 0.00   
					Select @Vq2 = 0.00   
					Select @Vq3 = 0.00   
					Select @Vq4 = 0.00 
					Select @Vyeartot = 0.00		
					Select @Sq1 = 0.00   
					Select @Sq2 = 0.00   
					Select @Sq3 = 0.00   
					Select @Sq4 = 0.00  
					Select @Syeartot = 0.00 		
										
					--Select distinct(fy_end) from tmp_yyreport_stepA where vendorname='RX SYSTEMS' order by fy_end

		------------------------VOLUME QUARTERLY-------------------------------------------------------------------------------------------------------
					SELECT @Vq1 = isnull(SUM(JUNE),0)  + isnull(SUM(JULY),0)  + isnull(SUM(AUGUST),0) from v_udVolume07 where reports='V' and (vendor_id = @vendorpair or vendor_id = @oldvendorid) AND (FY_END = @fy_end)			
					
					SELECT @Vq2 = isnull(SUM(SEPTEMBER),0) + isnull(SUM(OCTOBER),0) + isnull(SUM(NOVEMBER),0) from v_udVolume07 where reports='V' and (vendor_id = @vendorpair or vendor_id = @oldvendorid) AND (FY_END = @fy_end)			

					SELECT @Vq3 = isnull(SUM(DECEMBER),0) + isnull(SUM(JANUARY),0) + isnull(SUM(FEBRUARY),0) from v_udVolume07 where reports='V' and (vendor_id = @vendorpair or vendor_id = @oldvendorid) AND (FY_END = @fy_end)			

					SELECT @Vq4 = isnull(SUM(MARCH),0) + isnull(SUM(APRIL),0) + isnull(SUM(MAY),0) from v_udVolume07 where reports='V' and (vendor_id = @vendorpair or vendor_id = @oldvendorid) AND (FY_END = @fy_end)			
					
					Select @VYeartot = (@Vq1 + @Vq2 + @Vq3 + @Vq4)

		-------------------------REBATE QUARTERLY-----------------------------------------------------------------------------------------------------
					SELECT @Rq1 = isnull(SUM(JUNE),0) + isnull(SUM(JULY),0) + isnull(SUM(AUGUST),0) from v_udVolume07 where reports='R' and (vendor_id = @vendorpair or vendor_id = @oldvendorid) AND (FY_END = @fy_end)			

					SELECT @Rq2 = isnull(SUM(SEPTEMBER),0) + isnull(SUM(OCTOBER),0) + isnull(SUM(NOVEMBER),0) from v_udVolume07 where reports='R' and (vendor_id = @vendorpair or vendor_id = @oldvendorid) AND (FY_END = @fy_end)		

					SELECT @Rq3 = isnull(SUM(DECEMBER),0) + isnull(SUM(JANUARY),0) + isnull(SUM(FEBRUARY),0) from v_udVolume07 where reports='R' and (vendor_id = @vendorpair or vendor_id = @oldvendorid) AND (FY_END = @fy_end)			

					SELECT @Rq4 = isnull(SUM(MARCH),0) + isnull(SUM(APRIL),0) + isnull(SUM(MAY),0) from v_udVolume07 where reports='R' and (vendor_id = @vendorpair or vendor_id = @oldvendorid) AND (FY_END = @fy_end)			
					
					Select @RYeartot = (@Rq1 + @Rq2 + @Rq3 + @Rq4)

		-------------------------STORE COUNT FOR VOLUME --------------------------------------------------------------------------------------------------------
					
					SELECT  @Sjune = COUNT(JUNE) from v_udVolume07 where reports='V' and (vendor_id = @vendorpair or vendor_id = @oldvendorid) AND (FY_END = @fy_end) and (JUNE <> '0.00' AND JUNE IS NOT NULL)
					
					SELECT  @Sjuly = COUNT(JULY) from v_udVolume07 where reports='V' and (vendor_id = @vendorpair or vendor_id = @oldvendorid) AND (FY_END = @fy_end) and (JULY <> '0.00' AND JULY IS NOT NULL)

					SELECT  @Saugust = COUNT(AUGUST) from v_udVolume07 where reports='V' and (vendor_id = @vendorpair or vendor_id = @oldvendorid) AND (FY_END = @fy_end) and (AUGUST <> '0.00' AND AUGUST IS NOT NULL)

					SELECT  @Sseptember = COUNT(SEPTEMBER) from v_udVolume07 where reports='V' and (vendor_id = @vendorpair or vendor_id = @oldvendorid) AND (FY_END = @fy_end) and (SEPTEMBER <> '0.00' AND SEPTEMBER IS NOT NULL)

					SELECT  @Soctober = COUNT(OCTOBER) from v_udVolume07 where reports='V' and (vendor_id = @vendorpair or vendor_id = @oldvendorid) AND (FY_END = @fy_end) and (OCTOBER <> '0.00' AND OCTOBER IS NOT NULL)

					SELECT  @Snovember = COUNT(NOVEMBER) from v_udVolume07 where reports='V' and (vendor_id = @vendorpair or vendor_id = @oldvendorid) AND (FY_END = @fy_end) and (NOVEMBER <> '0.00' AND NOVEMBER IS NOT NULL)

					SELECT  @Sdecember = COUNT(DECEMBER) from v_udVolume07 where reports='V' and (vendor_id = @vendorpair or vendor_id = @oldvendorid) AND (FY_END = @fy_end) and (DECEMBER <> '0.00' AND DECEMBER IS NOT NULL)

					SELECT  @Sjanuary = COUNT(JANUARY) from v_udVolume07 where reports='V' and (vendor_id = @vendorpair or vendor_id = @oldvendorid) AND (FY_END = @fy_end) and (JANUARY <> '0.00' AND JANUARY IS NOT NULL)

					SELECT  @Sfebruary = COUNT(FEBRUARY) from v_udVolume07 where reports='V' and (vendor_id = @vendorpair or vendor_id = @oldvendorid) AND (FY_END = @fy_end) and (FEBRUARY <> '0.00' AND FEBRUARY IS NOT NULL)

					SELECT  @Smarch = COUNT(MARCH) from v_udVolume07 where reports='V' and (vendor_id = @vendorpair or vendor_id = @oldvendorid) AND (FY_END = @fy_end) and (MARCH <> '0.00' AND MARCH IS NOT NULL)

					SELECT  @Sapril = COUNT(APRIL) from v_udVolume07 where reports='V' and (vendor_id = @vendorpair or vendor_id = @oldvendorid) AND (FY_END = @fy_end) and (APRIL <> '0.00' AND APRIL IS NOT NULL)

					SELECT  @Smay = COUNT(MAY) from v_udVolume07 where reports='V' and (vendor_id = @vendorpair or vendor_id = @oldvendorid) AND (FY_END = @fy_end) and (MAY <> '0.00' AND MAY IS NOT NULL)

					Select @Sq1 = @Sjune + @Sjuly + @Saugust 
					Select @Sq2 = @Sseptember +  @Soctober + @Snovember 
					Select @Sq3 = @Sdecember +  @Sjanuary + @Sfebruary 
					Select @Sq4 = @Smarch + @Sapril + @Smay 

					Select @Syeartot = (@Sq1 + @Sq2 + @Sq3 + @Sq4)
									
				
					INSERT INTO tmp_yyreport VALUES(@fy_end, @oldvendorid, @vendorname, @Rq1, @Rq2, @Rq3, @Rq4, @Ryeartot, @Vq1, @Vq2, @Vq3, @Vq4, @Vyeartot,
						@Sq1, @Sq2, @Sq3, @Sq4, @Syeartot )
						If @@error <> 0 
									Begin															
										CLOSE cu_allvendors
										DEALLOCATE cu_allvendors
										CLOSE cu_yearend
										DEALLOCATE cu_yearend
										Rollback Tran YYREP					
										Print 'Failed to insert to tmp_yyreport_new'
										Return
									End	 				
			
				FETCH NEXT FROM cu_allvendors INTO --------------LOOP THROUGH ALL EXISTING VENDORS--------------------
					@oldvendorid,
					@vendorpair,
					@vendorname		

			END
			CLOSE cu_allvendors
			DEALLOCATE cu_allvendors 


FETCH NEXT FROM cu_yearend INTO --------------LOOP THROUGH YEARS--------------------
					@fy_end		

END

CLOSE cu_yearend
DEALLOCATE cu_yearend



COMMIT TRAN YYREP










GO
