USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmDocumentTypeFieldUpdate]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmDocumentTypeFieldUpdate]
		@DocTypeKey [char](36),
		@FieldKey [int],
		@FieldDesc [varchar](256),
		@FieldType [char](1),
		@Required [bit],
		@EditMask [varchar](256),
		@ListType [char](1)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRAN;
			SET NOCOUNT ON;

			UPDATE dmDocumentTypeField
				SET FieldDesc = @FieldDesc,
				FieldType = @FieldType,
				Required = @Required,
				EditMask = @EditMask,
				ListType = @ListType
				WHERE DocTypeKey = @DocTypeKey AND FieldKey = @FieldKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmDocumentTypeFieldUpdate : Cannot update record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
