USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_LoadPlan]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 12/16/2008
-- =============================================
CREATE PROCEDURE [dbo].[spud_LoadPlan] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	Begin Tran lPlan

		IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='PlanDetails') DROP TABLE PlanDetails
		If @@error <> 0 
			Begin												
				Print 'Error on Drop Table'
				Rollback Tran lPlan
				Return
			End	

		Select DISTINCT r.* INTO PlanDetails FROM         
		OPENQUERY(UNITEDDB, 'select * from united.Plan') r
		If @@error <> 0 
			Begin												
				Print 'Error on Copy Table '
				Rollback Tran lPlan
				Return
			End
		 

		CREATE INDEX IDX_GRID
		on PlanDetails (Plan_ID) 
		If @@error <> 0 
			Begin				
				Rollback Tran lPlan
				Return
			End 
		
	
	Commit Tran lPlan
END


GO
