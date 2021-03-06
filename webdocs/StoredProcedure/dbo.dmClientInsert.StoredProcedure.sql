USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmClientInsert]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmClientInsert]
		@Id [varchar](60),
		@Secret[varchar](1024),
		@Name [varchar](100),
		@EmailAddress [varchar](256),
		@Description [varchar](500),
		@Phone [varchar](25),
		@ApplicationType [bit],
		@Active [bit],
		@RefreshTokenLifeTime [integer],
		@AllowedOrigin  [varchar](100)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			INSERT INTO dmClient
				(Id, EmailAddress,Phone,[Secret],Name,ApplicationType,Active,RefreshTokenLifeTime,[Description],AllowedOrigin)
				VALUES (@Id, @EmailAddress,@Phone,@Secret,@Name,@ApplicationType,@Active,@RefreshTokenLifeTime,@Description,@AllowedOrigin);

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmClientInsert : Cannot insert record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRANSACTION;

		RETURN(0);
	END;
GO
