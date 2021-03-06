USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_LoadStoreProgram]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Joni Wilson
-- Create date: 04/08/2010
-- Description:	CREATE AN UP-TO DATE StoreProgram table
-- =============================================
CREATE PROCEDURE [dbo].[spud_LoadStoreProgram] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	Begin Tran lStore

		IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='StoreProgram') DROP TABLE StoreProgram
		If @@error <> 0 
			Begin												
				Print 'Error on Drop Table'
				Rollback Tran lStore
				Return
			End	

		Select DISTINCT r.* INTO StoreProgram FROM         
		OPENQUERY(UNITEDDB, 'select * from united.Store_Program') r
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
