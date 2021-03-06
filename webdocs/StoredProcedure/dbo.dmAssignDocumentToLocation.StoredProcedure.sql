USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmAssignDocumentToLocation]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmAssignDocumentToLocation]
	@DocumentKey [char](36),
	@LocationKey [char](36)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRAN;
			SET NOCOUNT ON;

			UPDATE dmDocument
			SET LocationKey = @LocationKey
			WHERE DocumentKey = @DocumentKey;


			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmAssignDocumentToLocation : Cannot update record. ',100,1);
				ROLLBACK TRAN;
				select 1;
			END;
		COMMIT TRAN;

		select 0;
	END;
GO
