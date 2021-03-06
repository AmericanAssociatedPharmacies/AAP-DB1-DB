USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[IntranetReportAdminReason]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IntranetReportAdminReason](
	[IntranetReportID] [int] NOT NULL,
	[AdminDate] [datetime2](7) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Reason] [varchar](255) NOT NULL,
	[AdminMode] [bit] NOT NULL,
 CONSTRAINT [PK_IntranetReportAdminReason] PRIMARY KEY CLUSTERED 
(
	[IntranetReportID] ASC,
	[AdminDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IntranetReportAdminReason]  WITH CHECK ADD  CONSTRAINT [FK_IntranetReportAdminReason_IntranetReport] FOREIGN KEY([IntranetReportID])
REFERENCES [dbo].[IntranetReport] ([IntranetReportID])
GO
ALTER TABLE [dbo].[IntranetReportAdminReason] CHECK CONSTRAINT [FK_IntranetReportAdminReason_IntranetReport]
GO
