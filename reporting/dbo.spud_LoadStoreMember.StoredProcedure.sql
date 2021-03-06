USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_LoadStoreMember]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 09/01/2008
-- Description:	CREATE AN UP-TO DATE VOLUME TABLE FOR UDDB3
-- =============================================
CREATE PROCEDURE [dbo].[spud_LoadStoreMember] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	Begin Tran lStore

		IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='StoreMember') DROP TABLE StoreMember
		If @@error <> 0 
			Begin												
				Print 'Error on Drop Table'
				Rollback Tran lStore
				Return
			End	

		Select DISTINCT r.* INTO StoreMember FROM         
		OPENQUERY(UNITEDDB, 'select * from united.Store_Member') r
		If @@error <> 0 
			Begin												
				Print 'Error on Copy Table '
				Rollback Tran lStore
				Return
			End
 

		/*CREATE INDEX IDX_VidActNoFY
		on StoreMember (Vendor_ID,Acct_no, FY_End) 
		If @@error <> 0 
			Begin				
				Rollback Tran lStore
				Return
			End */
		
	
	Commit Tran lStore
END
GO
