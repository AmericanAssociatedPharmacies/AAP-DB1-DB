USE [reporting]
GO
/****** Object:  Table [dbo].[vendorrebate]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendorrebate](
	[oldvendorid] [int] NOT NULL,
	[year] [char](4) NULL,
	[totalpercentrebate] [numeric](5, 5) NULL
) ON [PRIMARY]
GO
