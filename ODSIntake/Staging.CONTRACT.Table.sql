USE [ODSIntake]
GO
/****** Object:  Table [Staging].[CONTRACT]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[CONTRACT](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NULL,
	[show] [bit] NOT NULL,
	[ID] [int] NOT NULL,
	[delete] [bit] NOT NULL,
	[Contract Status] [nvarchar](255) NULL,
	[Contract Status 2] [nvarchar](255) NULL,
	[Control Rx] [bit] NOT NULL,
	[API Item #] [nvarchar](255) NULL,
	[REPLACE#] [nvarchar](50) NULL,
	[NDC #] [nvarchar](12) NULL,
	[Brand Reference] [nvarchar](255) NULL,
	[Item Description] [nvarchar](255) NULL,
	[Unit] [nvarchar](255) NULL,
	[Size] [decimal](8, 2) NULL,
	[Contract] [nvarchar](255) NULL,
	[Program] [nvarchar](255) NULL,
	[Rate] [nvarchar](255) NULL,
	[Invoice Price] [money] NULL,
	[DISCOUNT-RX PRICE] [money] NULL,
	[BW Contract Price] [money] NULL,
	[Contract Price] [money] NULL,
	[API Price] [money] NULL,
	[AWP] [money] NULL,
	[Net Price] [money] NULL,
	[Rebate] [money] NULL,
	[% Rebate] [float] NULL,
	[case pk] [int] NULL,
	[inner pk] [int] NULL,
	[Fee] [nvarchar](255) NULL,
	[MFG Date] [nvarchar](255) NULL,
	[API Date] [datetime] NULL,
	[billable size] [nvarchar](50) NULL,
	[billable cost] [nvarchar](50) NULL,
	[4% of price] [nvarchar](255) NULL,
	[rebate minus 4% of price] [nvarchar](255) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Staging_CONTRACT] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[CONTRACT] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
