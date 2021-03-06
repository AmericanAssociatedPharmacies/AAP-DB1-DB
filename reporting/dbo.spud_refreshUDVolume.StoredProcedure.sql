USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_refreshUDVolume]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 09/10/2008
-- Description:	REFRESH DATA IN VOLUME TABLE FOR YY REPORT
-- =============================================
CREATE PROCEDURE [dbo].[spud_refreshUDVolume] 
	
AS

BEGIN TRAN Refreshdata
	
	SET NOCOUNT ON;

	--DROP all Temp Tables
		IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='udVolumebak') DROP TABLE udVolumebak		
		If @@error <> 0 
			Begin												
				Print 'Drop Temp Table udVolumebak '
				Rollback Tran Refreshdata
				Return
			End	

		IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='tmp_udVolume') DROP TABLE tmp_udVolume 
		If @@error <> 0 
			Begin												
				Print 'Drop Temp Table tmp_udVolume '
				Rollback Tran Refreshdata
				Return
			End	
		
		IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='tmp_udVolume_changes') DROP TABLE tmp_udVolume_changes		
		If @@error <> 0 
			Begin												
				Print 'Drop Temp Table tmp_udVolume_changes '
				Rollback Tran Refreshdata
				Return
			End

		IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='udVolumeold') DROP TABLE udVolumeold
		If @@error <> 0 
			Begin												
				Print 'Drop Temp Table udVolumeold '
				Rollback Tran Refreshdata
				Return
			End	 

	--Back Up udVolume.     
		Select * INTO udVolumebak FROM udVolume
		If @@error <> 0 
			Begin												
				Print 'Create udVolumebak'
				Rollback Tran Refreshdata
				Return
			End	 
	--Create a Copy of udVolume called tmp_udVolume.		
		Select * INTO tmp_udVolume FROM udVolume
		If @@error <> 0 
			Begin												
				Print 'Create tmp_udVolume'
				Rollback Tran Refreshdata
				Return
			End	
 
	--Delete from udVolume Where (udVolume.FY_END > 2007). Insert only Data from 2008 as prior data calculations needs to be saved.
		Delete FROM tmp_udVolume Where tmp_udVolume.FY_END > 2007
		If @@error <> 0 
			Begin												
				Print 'Delete Data > 2007'
				Rollback Tran Refreshdata
				Return
			End	 
	--Copy rows which needs to be updated:
		/*SELECT     *
		INTO  tmp_udVolume_changes
		FROM  OPENQUERY(UNITEDDB, 'select * from Volume Where FY_End > 2007') AS Rowset_1 */

		SELECT     *
		INTO  tmp_udVolume_changes
		FROM  NewVolume Where FY_End > 2007

		If @@error <> 0 
			Begin												
				Print 'Copy new data from Volume'
				Rollback Tran Refreshdata
				Return
			End	 
	

	--Add field "filled" with default value=0 and allow null = NO to udVolume_changes
		ALTER TABLE tmp_udVolume_changes ADD filled bit NOT NULL DEFAULT (0)
		If @@error <> 0 
			Begin												
				Print 'Alter Temp Tables'
				Rollback Tran Refreshdata
				Return
			End	 

	--Move changes to udVolumenew: 
		INSERT INTO tmp_udVolume Select * From tmp_udVolume_Changes
		If @@error <> 0 
			Begin												
				Print 'Insert Temp Tables'
				Rollback Tran Refreshdata
				Return
			End					
		

			EXEC sp_rename 'udVolume', 'udVolumeold'
			EXEC sp_rename 'tmp_udVolume', 'udVolume'
			
			CREATE INDEX IDX_VidActNoFY
			on udVolume (Vendor_ID,Acct_no, FY_End) 


			If @@error <> 0 
			Begin												
				Print 'execute filldata'
				Rollback Tran Refreshdata
				Return
			End	

		

COMMIT TRAN Refreshdata










GO
