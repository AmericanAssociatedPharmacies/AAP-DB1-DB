USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[spud_PPVolumeEntry]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spud_PPVolumeEntry]

	(
		
		@vendorid int,	
		@PMID int,
		@startdate smalldatetime,
		@enddate smalldatetime,
		@Volume numeric(18,2),
		@Rebate numeric(18,2),
		@tran int
		
	)

	
AS
BEGIN

	Begin Tran ppLoad
			

			
			DECLARE @count int
			DECLARE @venid int


			SET NOCOUNT ON;

			
			--Validate duplicate entries
			Select @count=count(*) from v_VendorVolPM Where StorePaidDt IS NULL and FileID IS NULL AND VendorID=@vendorid and pmid=@pmid
			and volumeamt=@volume and rebateamt=@rebate and AccruedStartdt=@startdate and AccruedEnddt=@enddate and TransactionID=@tran
			If @count = 0

			BEGIN			
				
				--Select @tran=count(TransactionID) from VendorTransaction WHERE VendorID=@vendorid AND PaidDt IS NULL 

				--if @tran = 0 --GENERATE NEW Transaction
				--BEGIN

				/*	INSERT INTO VendorTransaction(VendorID) 
					VALUES (@VendorID) 
					If @@error <> 0 
								Begin												
									Print 'Error on VendorTransaction'
									Rollback Tran ppLoad
									Return
								End						
					

					 SELECT @tran= Max(TransactionID) FROM VendorTransaction*/
				--END

				/*if @tran <> 0
				BEGIN
					Select @tran=TransactionID from VendorTransaction WHERE VendorID=@vendorid AND PaidDt IS NULL
				END */

				
				INSERT INTO VendorVolumeRebate(VendorID,PMID,VolumeAmt,RebateAmt,AccruedStartdt,AccruedEnddt,TransactionID) 
				VALUES (@VendorID,@PMID,@Volume,@Rebate,@startdate,@enddate,@tran) 

				If @@error <> 0 
							Begin												
								Print 'Error on VendorVolumeRebate'
								Rollback Tran ppLoad
								Return
							End	

				Select @venid = Max(ID) FROM VendorVolumeRebate

				--Set default Eligibility if Store is retired
				update VendorVolumeRebate set VendorVolumeRebate.Eligibility = 0 FROM VendorVolumeRebate JOIN v_VendorVolumeEligibility ON VendorVolumeRebate.PMID =  v_VendorVolumeEligibility.PMID
				WHERE VendorVolumeRebate.ID = @venid AND VendorVolumeRebate.TransactionID = @tran AND VendorVolumeRebate.FileID IS NULL AND VendorVolumeRebate.StorePaidDt IS NULL AND (v_VendorVolumeEligibility.AAPQuitDate IS NOT NULL OR v_VendorVolumeEligibility.AAPAccountNo IS NULL )

				--Set default Affiliate from Pharmacy Master
				--update VendorVolumeRebate set VendorVolumeRebate.Affiliate = v_PM_AllWithAffiliates.Affiliate FROM VendorVolumeRebate JOIN v_PM_AllWithAffiliates ON VendorVolumeRebate.PMID =  v_PM_AllWithAffiliates.PMID
				--WHERE VendorVolumeRebate.ID = @venid AND VendorVolumeRebate.TransactionID = @tran
				update VendorVolumeRebate set VendorVolumeRebate.Affiliate = dbo.fnAffiliateDirectPay(v_PM_AllWithAffiliates.Affiliate,v_PM_AllWithAffiliates.AAPParentNo,v_PM_AllWithAffiliates.UDParentNo) 
				FROM VendorVolumeRebate JOIN v_PM_AllWithAffiliates ON VendorVolumeRebate.PMID =  v_PM_AllWithAffiliates.PMID
				WHERE VendorVolumeRebate.ID = @venid AND VendorVolumeRebate.TransactionID = @tran


				
			END

			Select @count as rcount
			
		SET NOCOUNT OFF;

	COMMIT Tran
END



















GO
