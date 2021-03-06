USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmUserInsert]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmUserInsert]
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
		@IsActive [bit] = 1,
		@UserKey [char](36) OUTPUT
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			SET @UserKey = NEWID();

			INSERT INTO dmUser
			   	(UserKey,LoginName,LoginPassword,Expiration,Email,[Description],FirstName,LastName,Phone,Company,Title,CheckoutFolder,UseCheckoutFolder,TemplateFolder,UseTemplateFolder,LocationKey,AllowEnterpriseWorkflow,EnterpriseWorkflowUsername,EnterpriseWorkflowPassword,AllowWebForms,WebFormsUsername,WebFormsPassword,DefaultDocumentTypeKey,DefaultFolderKey,AuthenticationServerId,MustChangePassword,Active,Admin)
			   	VALUES (@UserKey,@LoginName,@LoginPassword,@Expiration,@Email,@Description,@FirstName,@LastName,@Phone,@Company,@Title,@CheckoutFolder,@UseCheckoutFolder,@TemplateFolder,@UseTemplateFolder,@LocationKey,@AllowEnterpriseWorkflow,@EnterpriseWorkflowUsername,@EnterpriseWorkflowPassword,@AllowWebForms,@WebFormsUsername,@WebFormsPassword,@DefaultDocumentTypeKey,@DefaultFolderKey,@AuthenticationServerId,@MustChangePassword,@IsActive,@IsAdministrator);

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmUserInsert : Cannot insert record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRANSACTION;

		RETURN(0);
	END;
GO
