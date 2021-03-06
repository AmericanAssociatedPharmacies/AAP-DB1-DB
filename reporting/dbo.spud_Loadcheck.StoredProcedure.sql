USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_Loadcheck]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 1/12/2008
-- =============================================
CREATE PROCEDURE [dbo].[spud_Loadcheck] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	Begin Tran lcheck

		IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='CP_check') DROP TABLE CP_check
		If @@error <> 0 
			Begin												
				Print 'Error on Drop Table'
				Rollback Tran lcheck
				Return
			End	

		Select DISTINCT r.* INTO CP_Check FROM         
		OPENQUERY(UNITEDDB, 'select * from accounting.CP_check') r
		If @@error <> 0 
			Begin												
				Print 'Error on Copy Table '
				Rollback Tran lcheck
				Return
			End
	 

	/*	CREATE INDEX IDX_checkID
		on PlanDetails (check_ID) 
		If @@error <> 0 
			Begin				
				Rollback Tran lcheck
				Return
			End */
		
	
	Commit Tran lcheck
END
GO
