USE [WebTest]
GO
/****** Object:  Table [dbo].[QC_DiabetesPlanOld]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QC_DiabetesPlanOld](
	[Pharm ID] [nvarchar](50) NULL,
	[PatID] [nvarchar](50) NULL,
	[NDC1] [nvarchar](50) NULL,
	[NDC2] [nvarchar](50) NULL,
	[StartDate1] [datetime] NULL,
	[StartDate2] [datetime] NULL,
	[EndDate1] [datetime] NULL,
	[EndDate2] [datetime] NULL,
	[Rx1] [nvarchar](50) NULL,
	[Rx2] [nvarchar](50) NULL,
	[DrugName1] [varchar](25) NULL,
	[DrugName2] [varchar](25) NULL,
	[RA1] [int] NULL,
	[PatName1] [nvarchar](200) NULL,
	[RA2] [int] NULL,
	[PatName2] [nvarchar](200) NULL,
	[Doctor1] [nvarchar](50) NULL,
	[Doctor2] [nvarchar](50) NULL,
	[BirthDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
