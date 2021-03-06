USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmGetWorkflowDocumentStatus]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmGetWorkflowDocumentStatus]
		@DocumentKey char(36),
		@FlowKey char(36),
		@StepKey char(36)
	AS
	BEGIN

		SET NOCOUNT ON;

		select
			[Status]
			from
			dmWorkflowDocument
			where
			DocumentKey = @DocumentKey
			AND
			FlowKey =@FlowKey
			AND
			StepKey =@StepKey;

		IF @@ERROR <> 0
			BEGIN
				RAISERROR ('dmGetWorkflowDocumentStatus : Error encountered. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		RETURN(0);
	END;
GO
