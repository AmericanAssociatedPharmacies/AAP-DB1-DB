USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmLdapAuthenticationServerDelete]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmLdapAuthenticationServerDelete]
		@Id [char](36)
	AS
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
		SET NOCOUNT ON;

		DECLARE @UserCount [int];
		SET @UserCount = (SELECT COUNT(*) FROM dmUser WHERE AuthenticationServerId = @Id);

		IF @UserCount > 0
			RAISERROR (N'Cannot delete an authentication server that has users assigned to it.', 10, 1);

		DELETE FROM [dmLdapAuthenticationServer]
		WHERE [AuthenticationServerId] = @Id

		DELETE FROM [dmAuthenticationServerCredential]
		WHERE [AuthenticationServerId] = @Id

		DELETE FROM [dmAuthenticationServer]
		WHERE [Id] = @Id

		-- If an error occurred then return the error number
		IF @@ERROR <> 0
			RETURN @@ERROR;
		Else
			RETURN 0;
	END;
GO
