USE [AAP]
GO
/****** Object:  Table [dbo].[Audit]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit](
	[AuditID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[AuditDate] [datetime] NOT NULL,
	[SysUser] [varchar](50) NOT NULL,
	[Application] [varchar](50) NOT NULL,
	[TableName] [sysname] NOT NULL,
	[Operation] [char](1) NOT NULL,
	[PrimaryKey] [nvarchar](max) NOT NULL,
	[PrimaryKey2] [nvarchar](max) NULL,
	[PrimaryKey3] [nvarchar](max) NULL,
	[RowDescription] [varchar](50) NULL,
	[SecondaryRow] [varchar](50) NULL,
	[ColumnName] [sysname] NULL,
	[OldValue] [varchar](50) NULL,
	[NewValue] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
