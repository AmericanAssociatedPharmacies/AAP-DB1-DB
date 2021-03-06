USE [API]
GO
/****** Object:  Table [dbo].[tmp_APIStatus_SLX]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_APIStatus_SLX](
	[APIAccountNo] [varchar](32) NULL,
	[AccountName] [varchar](255) NULL,
	[Addr1] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](15) NULL,
	[APIStatus] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Territory] [varchar](4) NULL
) ON [PRIMARY]
GO
