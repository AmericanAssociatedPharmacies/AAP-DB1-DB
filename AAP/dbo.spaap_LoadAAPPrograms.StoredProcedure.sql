USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[spaap_LoadAAPPrograms]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Joni Wilson
-- Create date: 01/12/2009
-- =============================================
Create PROCEDURE [dbo].[spaap_LoadAAPPrograms] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	Begin Tran lProgram

		IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='AAPPrograms') DROP TABLE AAPPrograms
		If @@error <> 0 
			Begin												
				Print 'Error on Drop Table'
				Rollback Tran lProgram
				Return
			End	

		Select DISTINCT r.* INTO AAPPrograms FROM         
		OPENQUERY(UNITEDDB, 'select * from united.Program') r
		If @@error <> 0 
			Begin												
				Print 'Error on Copy Table '
				Rollback Tran lProgram
				Return
			End
		
	
	
	Commit Tran lProgram
END



GO
