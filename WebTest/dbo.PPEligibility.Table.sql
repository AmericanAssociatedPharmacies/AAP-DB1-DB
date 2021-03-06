USE [WebTest]
GO
/****** Object:  Table [dbo].[PPEligibility]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PPEligibility](
	[CustomerNumber] [varchar](255) NULL,
	[CustomerName] [varchar](255) NULL,
	[CIN_4354692] [varchar](50) NULL,
	[CIN_4260956] [varchar](50) NULL,
	[CIN_4072062] [varchar](50) NULL,
	[CIN_4309548] [varchar](50) NULL,
	[CIN_3583465] [varchar](50) NULL,
	[CIN_3583481] [varchar](50) NULL,
	[CIN_3583507] [varchar](50) NULL,
	[CIN_3684511] [varchar](50) NULL,
	[PMID] [nvarchar](50) NULL
) ON [PRIMARY]
GO
