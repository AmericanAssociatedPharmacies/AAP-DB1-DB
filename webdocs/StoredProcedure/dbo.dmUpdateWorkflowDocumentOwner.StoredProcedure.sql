USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmUpdateWorkflowDocumentOwner]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmUpdateWorkflowDocumentOwner]
		@DocumentKey [char](36),
		@RouteKey [char](36),
		@StepKey [char](36),
		@UserKey [char](36)
	WITH EXECUTE AS CALLER
	AS
	BEGIN

		SET NOCOUNT ON;

			UPDATE
			dmWorkflowDocument
			SET
			OwnerKey = @UserKey
			where
			DocumentKey = @DocumentKey
			AND
			FlowKey = @RouteKey
			AND
			StepKey = @StepKey;

		IF @@ERROR <> 0
			BEGIN
				RAISERROR ('dmUpdateWorkflowDocumentOwner : Error encountered. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		RETURN(0);
	END;
GO
