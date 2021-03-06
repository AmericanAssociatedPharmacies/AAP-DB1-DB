USE [WebDev]
GO
/****** Object:  Table [dbo].[CredOutstanding]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CredOutstanding](
	[NCPDP] [nvarchar](255) NULL,
	[NPI] [float] NULL,
	[PhcyName] [nvarchar](255) NULL,
	[EffDate] [datetime] NULL,
	[Re-Credentialing Status] [nvarchar](255) NULL,
	[On-Line] [nvarchar](255) NULL,
	[Detail] [nvarchar](255) NULL
) ON [PRIMARY]
GO
