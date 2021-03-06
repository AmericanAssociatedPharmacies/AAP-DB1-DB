USE [reporting]
GO
/****** Object:  Table [dbo].[GMOutput]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GMOutput](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Brand] [nvarchar](max) NOT NULL,
	[NDCCount] [numeric](28, 2) NULL,
	[NDCCountMatch] [numeric](28, 2) NULL,
	[Scripts] [numeric](28, 2) NULL,
	[ScriptsMatch] [numeric](28, 2) NULL,
	[PatientPaid] [numeric](28, 2) NULL,
	[PlanPaid] [numeric](28, 2) NULL,
	[AWP] [numeric](28, 2) NULL,
	[WAC] [numeric](28, 2) NULL,
	[PercentNDCMatch] [numeric](18, 4) NULL,
	[PercentScriptsMatch] [numeric](18, 4) NULL,
	[AnalysisID] [int] NULL,
 CONSTRAINT [PK_tmp_MagmaOutput] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[GMOutput]  WITH CHECK ADD  CONSTRAINT [FK_GMOutput_GMAnalysis] FOREIGN KEY([AnalysisID])
REFERENCES [dbo].[GMAnalysis] ([AnalysisID])
GO
ALTER TABLE [dbo].[GMOutput] CHECK CONSTRAINT [FK_GMOutput_GMAnalysis]
GO
