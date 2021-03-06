USE [API]
GO
/****** Object:  Table [dbo].[APICustomersExistAI]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APICustomersExistAI](
	[APIAccountNo] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[MemNum] [varchar](12) NULL,
	[EffectiveDate] [datetime] NULL,
	[Phone] [varchar](30) NULL,
	[Fax] [varchar](30) NULL,
	[DEA] [varchar](50) NULL,
	[CustomerStatus] [varchar](12) NULL,
	[Email] [varchar](50) NULL,
	[Territory] [varchar](5) NULL,
	[DeleteStatus] [varchar](5) NULL,
	[Type] [varchar](5) NULL
) ON [PRIMARY]
GO
