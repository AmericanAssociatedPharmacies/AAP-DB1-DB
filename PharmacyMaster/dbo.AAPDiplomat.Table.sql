USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[AAPDiplomat]    Script Date: 12/22/2020 4:45:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAPDiplomat](
	[NCPDP] [varchar](20) NULL,
	[Store] [nvarchar](250) NULL,
	[State] [varchar](2) NULL,
	[GoLive] [smalldatetime] NULL
) ON [PRIMARY]
GO
