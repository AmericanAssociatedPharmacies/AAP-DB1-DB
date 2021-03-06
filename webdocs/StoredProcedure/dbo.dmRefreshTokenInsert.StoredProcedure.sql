USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmRefreshTokenInsert]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmRefreshTokenInsert]
		@Id [varchar](256),
		@Subject [varchar](60),
		@ClientId [varchar](60),
		@Browser [varchar](1024),
		@IssuedUtc [datetime],
		@ExpiresUtc [datetime],
		@ProtectedTicket [varchar](1024)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;
			INSERT INTO dmRefreshToken
				(Id, [Subject],ClientId,Browser,IssuedUtc,[ExpiresUtc],ProtectedTicket)
				VALUES (@Id, @Subject,@ClientId,@Browser,@IssuedUtc,@ExpiresUtc,@ProtectedTicket);

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmRefreshTokenInsert : Cannot insert record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRANSACTION;

		RETURN(0);
	END;
GO
