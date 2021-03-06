USE [Reports]
GO
/****** Object:  Table [dbo].[CommCode]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommCode](
	[AffiliateCode] [varchar](max) NULL,
	[ProgramCode] [varchar](max) NULL,
	[ExcludeMCCode] [varchar](max) NULL,
	[ExcludeMLCode] [varchar](max) NULL,
	[IncludeMCNoNPPCode] [varchar](max) NULL,
	[IncludeMCNPPCode] [varchar](max) NULL,
	[IncludeMLCode] [varchar](max) NULL,
	[EmailListTypeCode] [varchar](max) NULL,
	[FaxListTypeCode] [varchar](max) NULL,
	[EmailFaxFaxListTypeCode] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
