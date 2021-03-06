USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_LoadDirectDeposit]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 1/12/2008
-- =============================================
CREATE PROCEDURE [dbo].[spud_LoadDirectDeposit] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	Begin Tran lDD

		IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='CP_DirectDeposit') DROP TABLE CP_DirectDeposit
		If @@error <> 0 
			Begin												
				Print 'Error on Drop Table'
				Rollback Tran lDD
				Return
			End	

		Select DISTINCT r.* INTO CP_DirectDeposit FROM         
		OPENQUERY(UNITEDDB, 'select * from accounting.CP_Direct_Deposit') r
		If @@error <> 0 
			Begin												
				Print 'Error on Copy Table '
				Rollback Tran lDD
				Return
			End
		
			
	
	Commit Tran lDD
END
GO
