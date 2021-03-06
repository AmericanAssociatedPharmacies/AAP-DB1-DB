USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmRoleInsert]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmRoleInsert]
		@RequestorId [char](36),
		@Role int
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			INSERT INTO [dmRole]
				([RequestorId], [Role])
				VALUES (@RequestorId, @Role);

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmRoleInsert : Cannot insert record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRANSACTION;

		RETURN(0);
	END;
GO
