USE [reporting]
GO
/****** Object:  Table [dbo].[Rx30MaxID_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rx30MaxID_del](
	[Rx Nbr] [nvarchar](10) NOT NULL,
	[RxID] [int] NULL,
 CONSTRAINT [PK_Rx30MaxID] PRIMARY KEY CLUSTERED 
(
	[Rx Nbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
