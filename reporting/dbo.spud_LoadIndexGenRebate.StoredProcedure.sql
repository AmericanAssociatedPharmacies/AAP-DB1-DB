USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_LoadIndexGenRebate]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 12/16/2008
-- Modified: REH on 1-25-2010 to accomodate source records from sql server
-- =============================================
CREATE PROCEDURE [dbo].[spud_LoadIndexGenRebate] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	Begin Tran lSTore

		IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='IndexingGenRebate') 
			--DROP TABLE IndexingGenRebate
			DELETE dbo.IndexingGenRebate 
		If @@error <> 0 
			Begin												
				Print 'Error on Delete Table'
				Rollback Tran lStore
				Return
			End	
	
	COMMIT TRAN lstore
	BEGIN TRAN lstore2
	
		INSERT INTO IndexingGenRebate select DISTINCT * FROM migration_united.dbo.Indexing_gen_rebate
		--OPENQUERY(UNITEDDB, 'select * from united.INDEXING_GEN_REBATE') r
		If @@error <> 0 
			Begin												
				Print 'Error on Copy Table '
				Rollback Tran lStore2
				Return
		End
		
 
/*
		CREATE INDEX IDX_GRID
		on IndexingGenRebate (GRID) 
		If @@error <> 0 
			Begin				
				Rollback Tran lStore
				Return
			End 
*/		
	
	Commit Tran lStore2
END



GO
