USE [reporting]
GO
/****** Object:  Table [dbo].[bg_pslist1ms]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bg_pslist1ms](
	[ndc] [varchar](11) NOT NULL,
	[drugname] [varchar](25) NULL,
	[gpidesc] [varchar](60) NULL,
	[drugnamecomp] [varchar](8000) NULL,
	[gpidesccomp] [varchar](8000) NULL
) ON [PRIMARY]
GO
