USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmContactInsert]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmContactInsert]
		@FirstName varchar(40),
		@LastName varchar(40),
		@EmailAddress varchar(128),
		@WebDocsOwnerKey char(36),
		@ContactKey char(36) OUTPUT
	AS
	BEGIN
		BEGIN TRAN
			SET NOCOUNT ON;

			-- Get a new unique key value
			SET @ContactKey = NEWID();

			INSERT INTO [dbo].[dmContact]
				([ContactKey]
				,[WebDocsOwnerKey]
				,[FirstName]
				,[LastName]
				,[EmailAddress])
				VALUES
					(@ContactKey
					,@WebDocsOwnerKey
					,@FirstName
					,@LastName
					,@EmailAddress)

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmContactInsert : Cannot insert record. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
