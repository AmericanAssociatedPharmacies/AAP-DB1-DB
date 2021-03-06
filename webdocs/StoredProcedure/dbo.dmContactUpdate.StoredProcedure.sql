USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmContactUpdate]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmContactUpdate]
		@ContactKey char(36),
		@FirstName varchar(40),
		@LastName varchar(40),
		@EmailAddress varchar(128),
		@WebDocsOwnerKey char(36)
	AS
	BEGIN
		BEGIN TRAN;
			SET NOCOUNT ON;

			UPDATE [dbo].[dmContact]
				SET [WebDocsOwnerKey] = @WebDocsOwnerKey
					,[FirstName] = @FirstName
					,[LastName] = @LastName
					,[EmailAddress] = @EmailAddress
				WHERE [ContactKey] = @ContactKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmContactUpdate : Cannot update record. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;

		COMMIT TRAN;
		RETURN(0);
	END;
GO
