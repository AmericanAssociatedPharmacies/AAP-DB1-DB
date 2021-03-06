USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_LoadIndexGenRebate_ORIGINAL]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 12/16/2008
-- =============================================
CREATE PROCEDURE [dbo].[spud_LoadIndexGenRebate_ORIGINAL] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	Begin Tran lSTore

		IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='IndexingGenRebate') DROP TABLE IndexingGenRebate
		If @@error <> 0 
			Begin												
				Print 'Error on Drop Table'
				Rollback Tran lStore
				Return
			End	

		Select DISTINCT r.* INTO IndexingGenRebate FROM         
		OPENQUERY(UNITEDDB, 'select * from united.INDEXING_GEN_REBATE') r
		If @@error <> 0 
			Begin												
				Print 'Error on Copy Table '
				Rollback Tran lStore
				Return
			End
		
 

		CREATE INDEX IDX_GRID
		on IndexingGenRebate (GRID) 
		If @@error <> 0 
			Begin				
				Rollback Tran lStore
				Return
			End 
		
	
	Commit Tran lStore
END


GO
