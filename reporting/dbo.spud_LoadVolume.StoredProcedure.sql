USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_LoadVolume]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 09/01/2008
-- Description:	CREATE AN UP-TO DATE VOLUME TABLE FOR UDDB3
-- UPDATE: 10/30/2017 - Per email from Joshila, this is exclusiveky for UnitedDrugs and not AAP
-- =============================================
CREATE PROCEDURE [dbo].[spud_LoadVolume] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	Begin Tran lVolume

		IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='NewVolume') DROP TABLE NewVolume
		If @@error <> 0 
			Begin												
				Print 'Error on Drop Table'
				Rollback Tran lVolume
				Return
			End	
		
		--Commented out by RSE to note sproc on 10/30/2017
		--Select * INTO NewVolume FROM         
		--OPENQUERY(UNITEDDB, 'select * from united.volume') AS Rowset_1
		If @@error <> 0 
			Begin												
				Print 'Error on Copy Table '
				Rollback Tran lVolume
				Return
			End
		
	--	ALTER TABLE NewVolume ADD PRIMARY KEY (Vendor_ID,Acct_no, FY_End); 

		CREATE INDEX IDX_VidActNoFY
		on NewVolume (Vendor_ID,Acct_no, FY_End) 
		If @@error <> 0 
			Begin				
				Rollback Tran lVolume
				Return
			End 
		
	
	Commit Tran lVolume
END







GO
