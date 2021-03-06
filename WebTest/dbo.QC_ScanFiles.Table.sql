USE [WebTest]
GO
/****** Object:  Table [dbo].[QC_ScanFiles]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QC_ScanFiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileType] [nvarchar](50) NULL,
	[FromLocation] [nvarchar](350) NULL,
	[ToFileLocation] [nvarchar](350) NULL,
	[ProcessingInfo] [nvarchar](max) NULL,
	[CreateDateTime] [datetime] NULL,
	[IsProcess] [bit] NULL,
 CONSTRAINT [PK_QC_SCAN_Files] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[QC_ScanFiles] ADD  CONSTRAINT [DF_QC_ScanFiles_CreateDateTime]  DEFAULT (getdate()) FOR [CreateDateTime]
GO
ALTER TABLE [dbo].[QC_ScanFiles] ADD  CONSTRAINT [DF_QC_ScanFiles_IsProcess]  DEFAULT ((1)) FOR [IsProcess]
GO
