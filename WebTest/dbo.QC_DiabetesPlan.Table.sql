USE [WebTest]
GO
/****** Object:  Table [dbo].[QC_DiabetesPlan]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QC_DiabetesPlan](
	[RxID] [int] NOT NULL,
	[Pharm ID] [nvarchar](50) NULL,
	[PatID] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Rx] [nvarchar](50) NULL,
	[DrugName] [varchar](25) NULL,
	[RA] [int] NULL
) ON [PRIMARY]
GO
