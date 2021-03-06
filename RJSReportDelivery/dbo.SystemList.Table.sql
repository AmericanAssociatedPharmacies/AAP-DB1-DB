USE [RJSReportDelivery]
GO
/****** Object:  Table [dbo].[SystemList]    Script Date: 12/22/2020 5:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemList](
	[SystemId] [int] IDENTITY(1,1) NOT NULL,
	[SystemName] [varchar](255) NOT NULL,
	[SystemDesc] [varchar](50) NULL,
	[SystemUser] [varchar](50) NOT NULL,
	[SystemPassword] [varchar](50) NOT NULL,
	[SystemActivate] [varchar](3) NOT NULL,
	[SystemType] [varchar](20) NOT NULL,
	[UseSecureConnection] [bit] NULL,
 CONSTRAINT [PK__SYSTEMLIST__7E6CC920] PRIMARY KEY CLUSTERED 
(
	[SystemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
