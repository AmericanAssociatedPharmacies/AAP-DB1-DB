USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_LoadPayee]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 12/16/2008
-- =============================================
CREATE PROCEDURE [dbo].[spud_LoadPayee] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	Begin Tran lPayee

		IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Payee') DROP TABLE Payee
		If @@error <> 0 
			Begin												
				Print 'Error on Drop Table'
				Rollback Tran lPayee
				Return
			End	

		Select DISTINCT r.* INTO Payee FROM         
		OPENQUERY(UNITEDDB, 'select * from united.Payee') r
		If @@error <> 0 
			Begin												
				Print 'Error on Copy Table '
				Rollback Tran lPayee
				Return
			End
	 

	/*	CREATE INDEX IDX_PayeeID
		on PlanDetails (Payee_ID) 
		If @@error <> 0 
			Begin				
				Rollback Tran lPayee
				Return
			End */
		
	
	Commit Tran lPayee
END



GO
