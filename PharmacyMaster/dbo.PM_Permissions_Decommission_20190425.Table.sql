USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PM_Permissions_Decommission_20190425]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Permissions_Decommission_20190425](
	[sysUser] [varchar](75) NOT NULL,
	[Administration] [smallint] NULL,
	[AllowDelete] [smallint] NULL,
	[ReadOnly] [smallint] NULL,
	[TestDatabase] [smallint] NULL,
	[WholeSaler_RW] [smallint] NULL,
	[WebPermissions] [smallint] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
