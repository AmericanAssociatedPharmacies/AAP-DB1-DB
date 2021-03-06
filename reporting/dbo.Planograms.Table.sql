USE [reporting]
GO
/****** Object:  Table [dbo].[Planograms]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Planograms](
	[Territory_DO NOT USE] [nvarchar](255) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[Street 1] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Main Phone] [nvarchar](255) NULL,
	[Type] [nvarchar](255) NULL,
	[AAP #] [nvarchar](255) NULL,
	[AAP Effective] [datetime] NULL,
	[AAP Parent #] [nvarchar](255) NULL,
	[API #] [nvarchar](255) NULL,
	[Arete Network] [nvarchar](255) NULL,
	[Combined Volume] [float] NULL,
	[Primary Contact] [nvarchar](255) NULL
) ON [PRIMARY]
GO
