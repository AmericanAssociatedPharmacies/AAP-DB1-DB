USE [API]
GO
/****** Object:  Table [dbo].[APISalesNDC_MO]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesNDC_MO](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[YEAR] [int] NOT NULL,
	[NDC] [varchar](50) NOT NULL,
	[Type] [varchar](20) NULL,
	[JANUARY] [float] NULL,
	[FEBRUARY] [float] NULL,
	[MARCH] [float] NULL,
	[APRIL] [float] NULL,
	[MAY] [float] NULL,
	[JUNE] [float] NULL,
	[JULY] [float] NULL,
	[AUGUST] [float] NULL,
	[SEPTEMBER] [float] NULL,
	[OCTOBER] [float] NULL,
	[NOVEMBER] [float] NULL,
	[DECEMBER] [float] NULL,
	[january_st_cnt] [int] NULL,
	[february_st_cnt] [int] NULL,
	[march_st_cnt] [int] NULL,
	[april_st_cnt] [int] NULL,
	[may_st_cnt] [int] NULL,
	[june_st_cnt] [int] NULL,
	[july_st_cnt] [int] NULL,
	[august_st_cnt] [int] NULL,
	[september_st_cnt] [int] NULL,
	[october_st_cnt] [int] NULL,
	[november_st_cnt] [int] NULL,
	[december_st_cnt] [int] NULL,
 CONSTRAINT [PK_APISalesNDC_MO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
