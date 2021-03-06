USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmClientUpdate]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmClientUpdate]
		@Id [varchar](60),
		@Secret [varchar](1024),
		@Name [varchar](100),
		@EmailAddress [varchar](256),
		@Description [varchar](1024),
		@Phone [varchar](25),
		@ApplicationType bit,
		@Active bit,
		@RefreshTokenLifeTime integer,
		@AllowedOrigin [varchar](100)

	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRAN;
			SET NOCOUNT ON;

			UPDATE dmClient
				SET [Secret] = @Secret,name = @name,EmailAddress = @EmailAddress, [Description] = @Description, Phone = @Phone,ApplicationType=@ApplicationType,Active = @Active,RefreshTokenLifeTime=@RefreshTokenLifeTime,AllowedOrigin=@AllowedOrigin
				WHERE Id= @Id;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmClientUpdate : Cannot update record. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;

		COMMIT TRAN;

		RETURN(0);
	END;
GO
