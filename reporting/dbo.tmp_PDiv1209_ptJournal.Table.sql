USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_PDiv1209_ptJournal]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PDiv1209_ptJournal](
	[Vendor ID] [nvarchar](255) NULL,
	[Invoice #] [varchar](11) NOT NULL,
	[Date] [varchar](8) NOT NULL,
	[Date Due] [varchar](8) NOT NULL,
	[Accounts Payable Account] [varchar](7) NOT NULL,
	[Number Of Distributions] [int] NOT NULL,
	[GL Account] [varchar](7) NOT NULL,
	[Amount] [float] NULL,
	[Recur Number] [int] NOT NULL,
	[Recur Frequency] [int] NOT NULL
) ON [PRIMARY]
GO
