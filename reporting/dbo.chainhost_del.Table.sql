USE [reporting]
GO
/****** Object:  Table [dbo].[chainhost_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chainhost_del](
	[id] [int] NOT NULL,
	[Pharm ID] [nvarchar](50) NULL,
	[BIN Nbr] [nvarchar](50) NULL,
	[PCN] [nvarchar](50) NULL,
	[Group Nbr] [nvarchar](50) NULL,
	[Submitted] [nvarchar](50) NULL,
	[Rx Date] [nvarchar](50) NULL,
	[Qty Dispensed] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL,
	[Fee Submitted] [nvarchar](50) NULL,
	[Cost Submitted] [nvarchar](50) NULL,
	[Fee Paid] [nvarchar](50) NULL,
	[Cost Paid] [nvarchar](50) NULL,
	[Plan Amount] [nvarchar](50) NULL,
	[Co Pay Amount] [nvarchar](50) NULL,
	[U and C] [nvarchar](50) NULL,
	[Total Price] [nvarchar](50) NULL
) ON [PRIMARY]
GO
