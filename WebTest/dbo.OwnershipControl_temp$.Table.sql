USE [WebTest]
GO
/****** Object:  Table [dbo].[OwnershipControl_temp$]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OwnershipControl_temp$](
	[NPI] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[First Name] [nvarchar](255) NULL,
	[Middle Name] [nvarchar](255) NULL,
	[Last Name] [nvarchar](255) NULL,
	[SSN] [nvarchar](255) NULL,
	[DOB] [nvarchar](255) NULL
) ON [PRIMARY]
GO
