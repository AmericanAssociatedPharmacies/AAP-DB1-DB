USE [TempTables]
GO
/****** Object:  StoredProcedure [dbo].[sptt_LoadPartnerCategory]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Joni Wilson
-- Create date: 12/11/2011
-- Description:	CREATE AN UP-TO DATE Preferred partners category TABLE FOR 1uddw
-- =============================================
Create PROCEDURE [dbo].[sptt_LoadPartnerCategory] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	Begin Tran lStore

		IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Partner_Category') DROP TABLE Partner_Category
		If @@error <> 0 
			Begin												
				Print 'Error on Drop Table'
				Rollback Tran lStore
				Return
			End	

		Select DISTINCT r.* INTO Partner_Category FROM         
		OPENQUERY(UNITEDDB, 'select * from united.Partner_Category') r
		If @@error <> 0 
			Begin												
				Print 'Error on Copy Table '
				Rollback Tran lStore
				Return
			End
 
	
	
	Commit Tran lStore
END
GO
