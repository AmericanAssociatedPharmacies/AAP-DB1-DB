USE [reporting]
GO
/****** Object:  Table [dbo].[Rx30PMLast_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rx30PMLast_del](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[RxId] [int] NULL,
	[Type] [int] NULL,
	[GeneratedOn] [smalldatetime] NULL,
 CONSTRAINT [PK_Rx30PMGEN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
