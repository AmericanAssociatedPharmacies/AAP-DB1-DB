USE [HSMonitor]
GO
/****** Object:  Table [dbo].[ReportData]    Script Date: 12/22/2020 4:30:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RecordID] [int] NOT NULL,
	[FieldID] [int] NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReportData] ADD  DEFAULT ('') FOR [Data]
GO
ALTER TABLE [dbo].[ReportData]  WITH CHECK ADD  CONSTRAINT [FK_ReportData_ReportFields] FOREIGN KEY([FieldID])
REFERENCES [dbo].[ReportFields] ([ID])
GO
ALTER TABLE [dbo].[ReportData] CHECK CONSTRAINT [FK_ReportData_ReportFields]
GO
ALTER TABLE [dbo].[ReportData]  WITH CHECK ADD  CONSTRAINT [FK_ReportData_ReportRecords] FOREIGN KEY([RecordID])
REFERENCES [dbo].[ReportRecords] ([ID])
GO
ALTER TABLE [dbo].[ReportData] CHECK CONSTRAINT [FK_ReportData_ReportRecords]
GO
