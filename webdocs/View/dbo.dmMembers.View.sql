USE [webdocs]
GO
/****** Object:  View [dbo].[dmMembers]    Script Date: 12/22/2020 9:42:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE VIEW [dbo].[dmMembers]
	AS
	SELECT [dmUser].[UserKey],
		[GroupKey],
		[LoginName],
		[LoginPassword],
		[Expiration],
		[Email],
		[Description],
		[FirstName],
		[LastName],
		[Phone],
		[Company],
		[Title],
		[Admin],
		[Active],
		[EnterpriseWorkflowUsername],
		[EnterpriseWorkflowPassword],
		[AllowEnterpriseWorkflow],
		[WebFormsUsername],
		[WebFormsPassword],
		[AllowWebForms],
		[DefaultDocumentTypeKey],
		[DefaultFolderKey]
		[MustChangePassword],
		[AuthenticationServerId]
	FROM [dmUser]
	INNER JOIN [dmMembership]
	ON [dmUser].[UserKey] = [dmMembership].[UserKey]
GO
