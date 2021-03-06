USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmDocumentTypeFieldInsert]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmDocumentTypeFieldInsert]
		@DocTypeKey [char](36),
		@FieldDesc [varchar](256),
		@FieldType [char](1),
		@Required [bit],
		@EditMask [varchar](256),
		@ListType [char](1),
		@FieldKey [int]
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRAN;
			SET NOCOUNT ON;

			INSERT INTO dmDocumentTypeField
				(DocTypeKey,FieldKey, FieldDesc, FieldType, Required, EditMask, ListType)
				VALUES (@DocTypeKey,@FieldKey, @FieldDesc, @FieldType, @Required, @EditMask, @ListType);

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmDocumentTypeFieldInsert : Cannot insert record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
