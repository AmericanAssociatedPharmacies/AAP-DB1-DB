USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[spud_PPLoadVolumeOld]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[spud_PPLoadVolumeOld]

	(
		@filename nvarchar(100),
		@vendorid int,
		@startdate smalldatetime,
		@enddate smalldatetime,
		@Loadedby nvarchar(50)
		--@filetype int
		
	)

	
AS
BEGIN

	Begin Tran ppLoad
			

			DECLARE @SQL varchar(2000)
			DECLARE @count int
			DECLARE @tran int

			SET NOCOUNT ON;

			
			
			--Validate the file getting loaded
			Select @count=count(*) from v_VendorLoad Where VendorID=@vendorid and FileName=@filename and PaidDt IS NULL

			If @count = 0

			BEGIN

				CREATE TABLE [dbo].[tmp_PPVolume](
				[UDNo] [varchar](50) NULL,
				[Volume] [varchar](50) NULL,
				[Rebate] [varchar](50) NULL,
				[StoreName] [varchar](200) NULL
				) ON [PRIMARY]

				If @@error <> 0 
						Begin												
							Print 'Error on Delete Update tmp_WSAPIPrice'
							Rollback Tran ppLoad
							Return
						End	

				set @SQL = 'bulk insert tmp_ppvolume from ''C:\Data\PP\' + @filename ; --@filename;
				set @SQL = @SQL + ''' with (fieldterminator=''\t'',firstrow=2 )';

					
				exec(@SQL);
				If @@error <> 0 
						Begin												
							Print 'Error on bulk insert'
							Rollback Tran ppLoad
							Return
						End	

				Update tmp_ppvolume set Volume =  LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(Volume, '$', ''),'"',''),',',''),'(','-'),')',''))),
				Rebate =  LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(Rebate, '$', ''),'"',''),',',''),'(','-'),')',''))),
				StoreName = LTRIM(RTRIM(REPLACE(StoreName, '"', '')))
				--Update tmp_ppvolume set Volume =  LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(Volume, '$', ''),'"',''),',',''))),
				--Rebate =  LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(Rebate, '$', ''),'"',''),',','')))
			
				If @@error <> 0 
							Begin												
								Print 'Error on bulk insert'
								Rollback Tran ppLoad
								Return
							End	

				ALTER Table tmp_ppvolume	ALTER COLUMN Volume  numeric(28,4)	
				ALTER Table tmp_ppvolume	ALTER COLUMN Rebate  numeric(28,4)
				If @@error <> 0 
							Begin												
								Print 'Error on bulk insert'
								Rollback Tran ppLoad
								Return
							End	

				
				--Select @tran=count(TransactionID) from VendorTransaction WHERE VendorID=@vendorid AND PaidDt IS NULL

				--if @tran = 0 --GENERATE NEW Transaction
				--BEGIN

					INSERT INTO VendorTransaction(VendorID) 
					VALUES (@VendorID) 
					If @@error <> 0 
								Begin												
									Print 'Error on VendorTransaction'
									Rollback Tran ppLoad
									Return
								End						
					

					 SELECT @tran= Max(TransactionID) FROM VendorTransaction
				--END

				--if @tran <> 0
				--BEGIN
				--	Select @tran=TransactionID from VendorTransaction WHERE VendorID=@vendorid AND PaidDt IS NULL
				--END

				--Save File Details
				INSERT INTO VendorLoad(TransactionID,FileName,LoadDate,LoadedBy) 
				VALUES (@tran,@filename, getdate(),@Loadedby) 

				If @@error <> 0 
							Begin												
								Print 'Error on VendorLoad'
								Rollback Tran ppLoad
								Return
							End	

				--Get File ID
				DECLARE @fileid int
				SELECT @fileid = Max(FileID) FROM VendorLoad

				INSERT INTO VendorVolumeRebate(VendorID,UDNo,VolumeAmt,RebateAmt,StoreName,FileID,AccruedStartdt,AccruedEnddt,TransactionID) 
				SELECT @VendorID,UDNo,Volume,Rebate,StoreName,@fileid, @startdate,@enddate,@tran FROM tmp_PPVolume

				If @@error <> 0 
							Begin												
								Print 'Error on VendorVolumeRebate'
								Rollback Tran ppLoad
								Return
							End	

				--Set default Eligibility if Store is retired
				update VendorVolumeRebate set VendorVolumeRebate.Eligibility = 0 FROM VendorVolumeRebate JOIN v_VendorVolumeEligibility ON VendorVolumeRebate.PMID =  v_VendorVolumeEligibility.PMID
				WHERE VendorVolumeRebate.FileID = @fileid AND v_VendorVolumeEligibility.AAPQuitDate IS NOT NULL AND v_VendorVolumeEligibility.PaidDt IS NULL

				--Set default Affiliate from Pharmacy Master
				update VendorVolumeRebate set VendorVolumeRebate.Affiliate = v_PM_AllWithAffiliates.Affiliate FROM VendorVolumeRebate JOIN v_PM_AllWithAffiliates ON VendorVolumeRebate.PMID =  v_PM_AllWithAffiliates.PMID
				WHERE VendorVolumeRebate.FileID = @fileid 


				Delete from VendorVolumeRebate WHERE VolumeAmt IS NULL and RebateAmt IS NULL
				
				DELETE FROM VendorVolumeRebate WHERE (VolumeAmt = 0.00) AND (RebateAmt = 0.00)

				
				/*if @filetype = 1 --CARDINAL FILE

					BEGIN			


						--PM_CHAccounts_BAS
						update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_CHAccounts_BAS.PMID FROM VendorVolumeRebate JOIN PM_CHAccounts_BAS ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_CHAccounts_BAS.CHAccountNoPrimary), 8)
						WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid

						update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_CHAccounts_BAS.PMID FROM VendorVolumeRebate JOIN PM_CHAccounts_BAS ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_CHAccounts_BAS.CHAccountNo2), 8)
						WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid

						update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_CHAccounts_BAS.PMID FROM VendorVolumeRebate JOIN PM_CHAccounts_BAS ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_CHAccounts_BAS.CHAccountNo3), 8)
						WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid

						update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_CHAccounts_BAS.PMID FROM VendorVolumeRebate JOIN PM_CHAccounts_BAS ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_CHAccounts_BAS.POSAcct), 8)
						WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid

						update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_CHAccounts_BAS.PMID FROM VendorVolumeRebate JOIN PM_CHAccounts_BAS ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_CHAccounts_BAS.ScanTossAcct), 8)
						WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid
				
						update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_CHAccounts_BAS.PMID FROM VendorVolumeRebate JOIN PM_CHAccounts_BAS ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_CHAccounts_BAS.CSOSAcct), 8)
						WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid

						--PM_CHAccounts_ADJ
						update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_CHAccounts_ADJ.PMID FROM VendorVolumeRebate JOIN PM_CHAccounts_ADJ ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_CHAccounts_ADJ.CHAccountNoPrimary), 8)
						WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid

						update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_CHAccounts_ADJ.PMID FROM VendorVolumeRebate JOIN PM_CHAccounts_ADJ ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_CHAccounts_ADJ.CHAccountNo2), 8)
						WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid

						update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_CHAccounts_ADJ.PMID FROM VendorVolumeRebate JOIN PM_CHAccounts_ADJ ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_CHAccounts_ADJ.CHAccountNo3), 8)
						WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid

						update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_CHAccounts_ADJ.PMID FROM VendorVolumeRebate JOIN PM_CHAccounts_ADJ ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_CHAccounts_ADJ.POSAcct), 8)
						WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid

						update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_CHAccounts_ADJ.PMID FROM VendorVolumeRebate JOIN PM_CHAccounts_ADJ ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_CHAccounts_ADJ.ScanTossAcct), 8)
						WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid
				
						update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_CHAccounts_ADJ.PMID FROM VendorVolumeRebate JOIN PM_CHAccounts_ADJ ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_CHAccounts_ADJ.CSOSAcct), 8)
						WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid

						update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_CHAccounts_ADJ.PMID FROM VendorVolumeRebate JOIN PM_CHAccounts_ADJ ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_CHAccounts_ADJ.SecondPrimaryNumber), 8)
						WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid

						update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_CHAccounts_ADJ.PMID FROM VendorVolumeRebate JOIN PM_CHAccounts_ADJ ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_CHAccounts_ADJ.Second2nd), 8)
						WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid

						update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_CHAccounts_ADJ.PMID FROM VendorVolumeRebate JOIN PM_CHAccounts_ADJ ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_CHAccounts_ADJ.Second3rd), 8)
						WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid

						update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_CHAccounts_ADJ.PMID FROM VendorVolumeRebate JOIN PM_CHAccounts_ADJ ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_CHAccounts_ADJ.SecondPOS), 8)
						WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid

						update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_CHAccounts_ADJ.PMID FROM VendorVolumeRebate JOIN PM_CHAccounts_ADJ ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_CHAccounts_ADJ.SecondCSOS), 8)
						WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid

						update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_CHAccounts_ADJ.PMID FROM VendorVolumeRebate JOIN PM_CHAccounts_ADJ ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_CHAccounts_ADJ.SecondCST), 8)
						WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid

						update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_CHAccounts_ADJ.PMID FROM VendorVolumeRebate JOIN PM_CHAccounts_ADJ ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_CHAccounts_ADJ.ThirdDivision), 8)
						WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid

						update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_CHAccounts_ADJ.PMID FROM VendorVolumeRebate JOIN PM_CHAccounts_ADJ ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_CHAccounts_ADJ.ThirdPrimaryNumber), 8)
						WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid

						update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_CHAccounts_ADJ.PMID FROM VendorVolumeRebate JOIN PM_CHAccounts_ADJ ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_CHAccounts_ADJ.Third2nd), 8)
						WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid

						update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_CHAccounts_ADJ.PMID FROM VendorVolumeRebate JOIN PM_CHAccounts_ADJ ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_CHAccounts_ADJ.ThirdPOS), 8)
						WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid

						update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_CHAccounts_ADJ.PMID FROM VendorVolumeRebate JOIN PM_CHAccounts_ADJ ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_CHAccounts_ADJ.ThirdCSOS), 8)
						WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid

						update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_CHAccounts_ADJ.PMID FROM VendorVolumeRebate JOIN PM_CHAccounts_ADJ ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_CHAccounts_ADJ.ThirdCST), 8)
						WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid


						--CHACCT_PMID
						update VendorVolumeRebate set VendorVolumeRebate.PMID=CHACCT_PMID.PMID FROM VendorVolumeRebate JOIN CHACCT_PMID ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), CHACCT_PMID.CHAccount), 8) 
						WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid

					END

					*/
					update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_Pharmacy.PMID FROM VendorVolumeRebate JOIN PM_Pharmacy ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_Pharmacy.UDAccountNo), 8)
					WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid

					update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_Pharmacy.PMID FROM VendorVolumeRebate JOIN PM_Pharmacy ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_Pharmacy.AAPAccountNo), 8)
					WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid

					
					update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_Deleted.PMID FROM VendorVolumeRebate JOIN PM_Deleted ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_Deleted.UDAccountNo), 8)
					WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid					
					
					/*if @filetype = 2 --OTHER FILE

					BEGIN*/
					update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_Pharmacy.PMID FROM VendorVolumeRebate JOIN PM_Pharmacy ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_Pharmacy.PMID), 8)
					WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid

					update VendorVolumeRebate set VendorVolumeRebate.PMID=PM_Deleted.PMID FROM VendorVolumeRebate JOIN PM_Deleted ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), PM_Deleted.PMID), 8)
					WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid

					update VendorVolumeRebate set VendorVolumeRebate.PMID=UD_PMID.PMID FROM VendorVolumeRebate JOIN UD_PMID ON RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), VendorVolumeRebate.UDNo), 8) = RIGHT(REPLICATE('0', 8) + CONVERT(varchar(8), UD_PMID.WSAccount), 8) 
					WHERE VendorVolumeRebate.PMID IS NULL AND VendorVolumeRebate.FileID =@fileid
					--END
					
			

				DROP TABLE tmp_PPVolume
				If @@error <> 0 
							Begin												
								Print 'Error on bulk insert'
								Rollback Tran ppLoad
								Return
							End	
			END

			Select @count as rcount, @tran as tranid
			
		SET NOCOUNT OFF;

	COMMIT Tran
END





















GO
