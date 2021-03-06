USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmUserUpdate]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmUserUpdate]
		@UserKey [char](36),
		@LoginName [varchar](20),
		@LoginPassword [varchar](256),
		@Expiration [datetime],
		@Email [varchar](128),
		@Description [varchar](256),
		@FirstName [varchar](40),
		@LastName [varchar](40),
		@Phone [varchar](30),
		@Company [varchar](40),
		@Title [varchar](40),
		@CheckoutFolder [varchar](255) = '',
		@UseCheckoutFolder [bit] = 0,
		@TemplateFolder [varchar](255) = '',
		@UseTemplateFolder [bit] = 0,
		@LocationKey [char](36) = '',
		@AllowEnterpriseWorkflow [bit] = 0,
		@EnterpriseWorkflowUsername [varchar](255) = '',
		@EnterpriseWorkflowPassword [varchar](255) = '',
		@AllowWebForms [bit] = 0,
		@WebFormsUsername [varchar](255) = '',
		@WebFormsPassword [varchar](255) = '',
		@DefaultDocumentTypeKey [char](36) = '',
		@DefaultFolderKey [char](36) = '',
		@AuthenticationServerId [char](36) = '',
		@MustChangePassword [bit] = 0,
		@IsAdministrator [bit] = 0,
		@IsActive [bit] = 0
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			UPDATE dmUser  SET LoginName = @LoginName,
				LoginPassword = @LoginPassword,
				Expiration = @Expiration,
				Email = @Email,
				Description = @Description,
				FirstName = @FirstName,
				LastName = @LastName,
				Phone = @Phone,
				Company = @Company,
				Title = @Title,
				CheckoutFolder = @CheckoutFolder,
				TemplateFolder = @TemplateFolder,
				UseTemplateFolder = @UseTemplateFolder,
				UseCheckoutFolder = @UseCheckoutFolder,
				LocationKey = @LocationKey,
				AllowEnterpriseWorkflow = @AllowEnterpriseWorkflow,
				EnterpriseWorkflowUsername = @EnterpriseWorkflowUsername,
				EnterpriseWorkflowPassword = @EnterpriseWorkflowPassword,
				AllowWebForms = @AllowWebForms,
				WebFormsUsername = @WebFormsUsername,
				WebFormsPassword = @WebFormsPassword,
				DefaultDocumentTypeKey = @DefaultDocumentTypeKey,
				DefaultFolderKey = @DefaultFolderKey,
				AuthenticationServerId = @AuthenticationServerId,
				MustChangePassword = @MustChangePassword,
				Admin = @IsAdministrator,
				Active = @IsActive
				WHERE UserKey = @UserKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmUserUpdate : Cannot update record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRANSACTION;

		RETURN(0);
	END;
GO
