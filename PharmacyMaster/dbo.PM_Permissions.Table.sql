USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PM_Permissions]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Permissions](
	[sysUser] [varchar](75) NOT NULL,
	[Administration] [smallint] NULL,
	[AllowDelete] [smallint] NULL,
	[ReadOnly] [smallint] NULL,
	[TestDatabase] [smallint] NULL,
	[WholeSaler_RW] [smallint] NULL,
	[WebPermissions] [smallint] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
 CONSTRAINT [PK_PM_Permissions] PRIMARY KEY CLUSTERED 
(
	[sysUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PM_Permissions] ADD  CONSTRAINT [DF_PM_Permissions_TestDatabase]  DEFAULT ((0)) FOR [TestDatabase]
GO
ALTER TABLE [dbo].[PM_Permissions] ADD  CONSTRAINT [DF_PM_Permissions_WholeSaler_RW]  DEFAULT ((0)) FOR [WholeSaler_RW]
GO
ALTER TABLE [dbo].[PM_Permissions] ADD  CONSTRAINT [DF_PM_Permissions_WebPermissions]  DEFAULT ((0)) FOR [WebPermissions]
GO
ALTER TABLE [dbo].[PM_Permissions] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_Permissions] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_Permissions] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
