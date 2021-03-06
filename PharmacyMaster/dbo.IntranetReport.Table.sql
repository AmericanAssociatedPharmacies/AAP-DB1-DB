USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[IntranetReport]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IntranetReport](
	[IntranetReportID] [int] IDENTITY(1,1) NOT NULL,
	[ServerID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](255) NULL,
	[IsAdminMode] [bit] NOT NULL,
	[DateAdded] [datetime2](7) NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ReportPathOrGuid] [varchar](255) NOT NULL,
 CONSTRAINT [PK_IntranetReport] PRIMARY KEY CLUSTERED 
(
	[IntranetReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IntranetReport] ADD  CONSTRAINT [DF_IntranetReport_IsAdminMode]  DEFAULT ((0)) FOR [IsAdminMode]
GO
ALTER TABLE [dbo].[IntranetReport]  WITH CHECK ADD  CONSTRAINT [FK_IntranetReport_IntranetReportServer] FOREIGN KEY([ServerID])
REFERENCES [dbo].[IntranetReportServer] ([ServerID])
GO
ALTER TABLE [dbo].[IntranetReport] CHECK CONSTRAINT [FK_IntranetReport_IntranetReportServer]
GO
