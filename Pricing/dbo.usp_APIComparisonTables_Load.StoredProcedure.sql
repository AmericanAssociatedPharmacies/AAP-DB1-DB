USE [Pricing]
GO
/****** Object:  StoredProcedure [dbo].[usp_APIComparisonTables_Load]    Script Date: 12/22/2020 4:51:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_APIComparisonTables_Load]


AS

SET NOCOUNT ON;

BEGIN
BEGIN TRY

	BEGIN TRAN

	--Truncate tables
	TRUNCATE TABLE [Archive].[AAPComparisons]
	TRUNCATE TABLE [Archive].[ElectronicComparisons]
	TRUNCATE TABLE [Archive].[Evaluations]


	--Switch from Staging tables to dbo to load
	ALTER TABLE [Staging].[AAPComparisons]
	SWITCH TO [dbo].[AAPComparisons]

	ALTER TABLE [Staging].[ElectronicComparisons]
	SWITCH TO [dbo].[ElectronicComparisons]

	ALTER TABLE [Staging].[Evaluations]
	SWITCH TO [dbo].[Evaluations]

	COMMIT TRAN


END TRY
BEGIN CATCH

	    SELECT   
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage;  
  
     IF (XACT_STATE()) = -1  
     BEGIN  
	 
		ROLLBACK TRANSACTION; 
			  
     END;  


END CATCH



END
GO
