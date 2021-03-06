USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmRouteDocumentTakeOwnership]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmRouteDocumentTakeOwnership]
		@TakeOwnership [bit],
		@DocumentKey [char](36),
		@RouteKey [char](36),
		@StepKey [char](36),
		@UserKey [char](36)
	AS
	BEGIN
		BEGIN TRANSACTION;
		SET NOCOUNT ON;

		DECLARE @CurrentOwnerKey [char](36);
		DECLARE @NewOwnerKey [char](36);
		DECLARE @RowCount [int];
		DECLARE @Error [int];

		IF (@TakeOwnership = 0)
			BEGIN
				-- Revoking ownership, look for record with current user key and clear the owner key
				SET @CurrentOwnerKey = @UserKey;
				SET @NewOwnerKey = ''
			END
		ELSE
			BEGIN
				-- Taking ownership, look for record with no owner key and set to current user key
				SET @CurrentOwnerKey = ''
				SET @NewOwnerKey = @UserKey
			END;

		UPDATE dmWorkflowDocument
		SET OwnerKey = @NewOwnerKey
		WHERE DocumentKey = @DocumentKey
		AND FlowKey = @RouteKey
		AND StepKey = @StepKey
		AND OwnerKey = @CurrentOwnerKey;

		SELECT @RowCount = @@ROWCOUNT, @Error = @@ERROR;

		IF (@Error != 0)
		BEGIN
			RAISERROR ('dmRouteDocumentTakeOwnership : Cannot update record. ',15,1);
			ROLLBACK TRAN;
			RETURN(1);
		END;

		IF (@RowCount != 1)
		BEGIN
			RAISERROR ('dmRouteDocumentTakeOwnership : Updating ownership failed or no records were updated. ',15,1);
			ROLLBACK TRAN;
			RETURN(1);
		END;

		COMMIT TRAN;
		RETURN(0);
	END;
GO
