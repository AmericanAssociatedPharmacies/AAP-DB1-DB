USE [TempTables]
GO
/****** Object:  Table [dbo].[Tristate2]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tristate2](
	[Customer #] [float] NULL,
	[Customer Name] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[Sate] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Business Type] [nvarchar](255) NULL,
	[Sales] [money] NULL,
	[Rebate Amount (3#5%)] [money] NULL
) ON [PRIMARY]
GO
