USE [reporting]
GO
/****** Object:  Table [dbo].[vendorstatus]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendorstatus](
	[vendorstatusid] [int] NOT NULL,
	[status] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
