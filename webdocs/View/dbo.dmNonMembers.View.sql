USE [webdocs]
GO
/****** Object:  View [dbo].[dmNonMembers]    Script Date: 12/22/2020 9:42:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

	CREATE VIEW [dbo].[dmNonMembers]
	AS
	SELECT DISTINCT
		[UserKey],
		[GroupKey],
		[LoginName],
		[LoginPassword],
		[Expiration],
		[Email],
		[dmUser].[Description],
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
		[DefaultFolderKey],
		[MustChangePassword],
		[AuthenticationServerId]
	FROM dmUser, dbo.dmGroup
	WHERE (UserKey + GroupKey)
	NOT IN (SELECT UserKey + GroupKey FROM dmMembership)
GO
