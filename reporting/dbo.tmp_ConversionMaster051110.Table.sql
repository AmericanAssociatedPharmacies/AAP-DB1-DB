USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_ConversionMaster051110]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ConversionMaster051110](
	[territory] [varchar](4) NULL,
	[pmid] [int] NULL,
	[AAP#] [nvarchar](255) NULL,
	[Parent] [nvarchar](255) NULL,
	[Aff#] [varchar](255) NULL,
	[DC] [varchar](255) NULL,
	[Acct#] [nvarchar](255) NULL,
	[Customer Name] [nvarchar](255) NULL,
	[Master#] [varchar](255) NULL,
	[AAP Member Start Date] [datetime] NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Store#] [nvarchar](255) NULL,
	[DEA] [nvarchar](255) NULL,
	[DEA Exp] [datetime] NULL,
	[SBOP] [nvarchar](255) NULL,
	[SBOP Exp] [datetime] NULL,
	[AR2000 Terms Code] [nvarchar](255) NULL,
	[Date Documentation Sent to CCDB] [datetime] NULL,
	[New AAP Affiliation] [varchar](255) NULL,
	[New Rx COGs] [float] NULL,
	[New Store Number] [nvarchar](255) NULL,
	[Committed Volume] [money] NULL,
	[Terms] [nvarchar](255) NULL,
	[Notes] [nvarchar](255) NULL,
	[Field27] [nvarchar](255) NULL
) ON [PRIMARY]
GO
