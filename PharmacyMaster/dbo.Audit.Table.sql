USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[Audit]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit](
	[AuditID] [bigint] IDENTITY(1,1) NOT NULL,
	[AuditDate] [datetime] NOT NULL,
	[SysUser] [varchar](250) NULL,
	[Application] [varchar](250) NULL,
	[TableName] [nvarchar](250) NULL,
	[Operation] [char](1) NOT NULL,
	[PrimaryKey] [nvarchar](max) NOT NULL,
	[PrimaryKey2] [nvarchar](max) NULL,
	[PrimaryKey3] [nvarchar](max) NULL,
	[PrimaryKey4] [nvarchar](max) NULL,
	[PrimaryKey5] [nvarchar](max) NULL,
	[RowDescription] [varchar](250) NULL,
	[SecondaryRow] [varchar](250) NULL,
	[ColumnName] [nvarchar](250) NULL,
	[OldValue] [varchar](250) NULL,
	[NewValue] [varchar](250) NULL,
 CONSTRAINT [PK__Audit__65AC084E] PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
