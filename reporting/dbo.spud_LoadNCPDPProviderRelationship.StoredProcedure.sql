USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_LoadNCPDPProviderRelationship]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Chris Stone
-- Create date: 12/09/2011
-- =============================================
CREATE PROCEDURE [dbo].[spud_LoadNCPDPProviderRelationship] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	Begin Tran ldea

		IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='NCPDP_ProviderRelationship') DROP TABLE NCPDP_ProviderRelationship
		If @@error <> 0 
			Begin												
				Print 'Error on Drop Table'
				Rollback Tran ldea
				Return
			End	

		Select DISTINCT r.* INTO NCPDP_ProviderRelationship FROM         
		OPENQUERY(UNITEDDB, 'select * from united.ncpdp_provider_relationship') r
		If @@error <> 0 
			Begin												
				Print 'Error on Copy Table '
				Rollback Tran ldea
				Return
			End
	 

	/*	CREATE INDEX IDX_PayeeID
		on PlanDetails (Payee_ID) 
		If @@error <> 0 
			Begin				
				Rollback Tran lPayee
				Return
			End */
		
	
	Commit Tran ldea
END



GO
