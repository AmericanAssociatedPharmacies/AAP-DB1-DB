USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_NCDV]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_NCDV](
	[Chain Code] [float] NULL,
	[NCPDP] [nvarchar](255) NULL,
	[NPI] [nvarchar](255) NULL,
	[AccountName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Mailing Address] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[FedID] [nvarchar](255) NULL,
	[DEA] [nvarchar](255) NULL,
	[DEAEXP] [datetime] NULL,
	[StateLicNo] [nvarchar](255) NULL,
	[StateLicExpDate] [datetime] NULL,
	[StateMedicaidNo] [nvarchar](255) NULL,
	[Claim Count] [float] NULL,
	[Unique Member Count] [float] NULL
) ON [PRIMARY]
GO
