USE [API]
GO
/****** Object:  Table [dbo].[tmp_VolumePivot_13mo_source]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_VolumePivot_13mo_source](
	[pmid] [int] NULL,
	[col] [varchar](21) NULL,
	[value] [float] NULL
) ON [PRIMARY]
GO
