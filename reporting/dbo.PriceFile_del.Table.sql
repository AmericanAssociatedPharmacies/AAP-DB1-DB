USE [reporting]
GO
/****** Object:  Table [dbo].[PriceFile_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceFile_del](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WholeSaler] [nvarchar](50) NULL,
	[seq] [int] NULL,
 CONSTRAINT [PK_WholeSaler] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
