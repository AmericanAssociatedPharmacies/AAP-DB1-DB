USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmLdapAuthenticationServerInsert]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmLdapAuthenticationServerInsert]
		@Id [char](36) OUTPUT,
		@Address [varchar](128),
		@Description [varchar](128),
		@PortNumber [int] = 389,
		@ServerType [int] = 1,
		@ServerLogOnName [varchar](128) = '',
		@ServerLogOnPassword [varchar](MAX) = '',
		@Domain [varchar](256) = '',
		@BaseUserDn [varchar](128) = '',
		@UseSsl [bit] = 0,
		@SecurePortNumber [int] = 636,
		@VerifySslCertificate [bit] = 0,
		@UseServerCredential [bit] = 0,
		@ServerAuthType [int] = 0,
		@UserAuthType [int] = 1,
		@UseSAMAccountName [bit] = 1,
		@EnableSearchOptionControl [bit] = 1
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			INSERT INTO [dbo].[dmAuthenticationServer]
				([Id], [Address], [Description], [PortNumber], [ServerType])
			VALUES
				(@Id, @Address, @Description, @PortNumber, @ServerType);

			IF @ServerLogOnName <> '' AND @ServerLogOnPassword <> ''
				INSERT INTO [dmAuthenticationServerCredential]
					([AuthenticationServerId], [ServerLogOnName], [ServerLogOnPassword])
				VALUES
					(@Id, @ServerLogOnName, @ServerLogOnPassword);

			INSERT INTO [dmLdapAuthenticationServer]
				([AuthenticationServerId], [Domain], [BaseUserDn], [SecurePortNumber], [ServerAuthType], [UserAuthType], [UseServerCredential], [UseSsl], [VerifySslCertificate], [UseSAMAccountName], [EnableSearchOptionControl])
			VALUES
				(@Id, @Domain, @BaseUserDn, @SecurePortNumber, @ServerAuthType, @UserAuthType, @UseServerCredential, @UseSsl, @VerifySslCertificate, @UseSAMAccountName, @EnableSearchOptionControl)

			IF @@ERROR <> 0
			BEGIN
				RAISERROR('dmLdapAuthenticationServerInsert : Cannot insert record.', 15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRANSACTION;

		RETURN(0);
	END;
GO
