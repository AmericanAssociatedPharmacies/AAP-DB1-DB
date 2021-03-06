USE [API]
GO
/****** Object:  Table [dbo].[APISalesNDC_QTR]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesNDC_QTR](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[YEAR] [int] NOT NULL,
	[NDC] [varchar](50) NOT NULL,
	[Type] [varchar](20) NULL,
	[Q1] [float] NULL,
	[Q2] [float] NULL,
	[Q3] [float] NULL,
	[Q4] [float] NULL,
	[Q1_st_cnt] [int] NULL,
	[Q2_st_cnt] [int] NULL,
	[Q3_st_cnt] [int] NULL,
	[Q4_st_cnt] [int] NULL,
 CONSTRAINT [PK_APISalesNDC_QTR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
