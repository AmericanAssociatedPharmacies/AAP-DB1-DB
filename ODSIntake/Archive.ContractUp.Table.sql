USE [ODSIntake]
GO
/****** Object:  Table [Archive].[ContractUp]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[ContractUp](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NULL,
	[case pk] [float] NULL,
	[inner pk] [float] NULL,
	[1] [nvarchar](255) NULL,
	[2] [nvarchar](255) NULL,
	[Control Rx] [bit] NULL,
	[API ITEM #] [nvarchar](255) NULL,
	[REPLACE#] [nvarchar](255) NULL,
	[NDC #] [nvarchar](255) NULL,
	[temp-ndc number] [nvarchar](255) NULL,
	[BRAND REFER] [nvarchar](255) NULL,
	[ITEM DESCRIPTION] [nvarchar](255) NULL,
	[UNIT] [nvarchar](255) NULL,
	[SIZE] [nvarchar](255) NULL,
	[CONTRACT] [nvarchar](255) NULL,
	[INVOICE PRICE] [money] NULL,
	[CONTRACT PRICE] [money] NULL,
	[API PRICE] [money] NULL,
	[FEE SCHED] [float] NULL,
	[AWP] [money] NULL,
	[PROGRAM] [nvarchar](255) NULL,
	[RATE] [nvarchar](255) NULL,
	[MFG Multiple for  Rebate] [float] NULL,
	[NET PRICE] [money] NULL,
	[REBATE] [money] NULL,
	[% REBATE] [float] NULL,
	[Value Add Factor] [float] NULL,
	[Value Add Basis] [nvarchar](255) NULL,
	[ADR Item] [bit] NULL,
	[ADR Expiry] [nvarchar](255) NULL,
	[MFG DATE] [nvarchar](255) NULL,
	[Work Date] [nvarchar](255) NULL,
	[API DATE] [datetime] NULL,
	[REVIEW] [nvarchar](255) NULL,
	[GPI] [nvarchar](255) NULL,
	[TempSIZE] [nvarchar](255) NULL,
	[billable size] [nvarchar](255) NULL,
	[billable cost] [nvarchar](255) NULL,
	[4% of price] [nvarchar](255) NULL,
	[rebate minus 4% of price] [nvarchar](255) NULL,
	[Comments] [nvarchar](255) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Archive_ContractUp] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Archive].[ContractUp] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
