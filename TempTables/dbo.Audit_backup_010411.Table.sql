USE [TempTables]
GO
/****** Object:  Table [dbo].[Audit_backup_010411]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit_backup_010411](
	[AuditID] [bigint] IDENTITY(1,1) NOT NULL,
	[AuditDate] [datetime] NOT NULL,
	[SysUser] [varchar](50) NOT NULL,
	[Application] [varchar](50) NOT NULL,
	[TableName] [sysname] NOT NULL,
	[Operation] [char](1) NOT NULL,
	[PrimaryKey] [nvarchar](max) NOT NULL,
	[PrimaryKey2] [nvarchar](max) NULL,
	[PrimaryKey3] [nvarchar](max) NULL,
	[PrimaryKey4] [nvarchar](max) NULL,
	[PrimaryKey5] [nvarchar](max) NULL,
	[RowDescription] [varchar](50) NULL,
	[SecondaryRow] [varchar](50) NULL,
	[ColumnName] [sysname] NULL,
	[OldValue] [varchar](50) NULL,
	[NewValue] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
