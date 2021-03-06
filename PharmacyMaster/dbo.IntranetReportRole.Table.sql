USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[IntranetReportRole]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IntranetReportRole](
	[IntranetReportID] [int] NOT NULL,
	[IntranetRoleID] [int] NOT NULL,
	[DateAdded] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_IntranetReportRole] PRIMARY KEY CLUSTERED 
(
	[IntranetReportID] ASC,
	[IntranetRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IntranetReportRole]  WITH CHECK ADD  CONSTRAINT [FK_IntranetReportRole_IntranetReportRole] FOREIGN KEY([IntranetReportID])
REFERENCES [dbo].[IntranetReport] ([IntranetReportID])
GO
ALTER TABLE [dbo].[IntranetReportRole] CHECK CONSTRAINT [FK_IntranetReportRole_IntranetReportRole]
GO
ALTER TABLE [dbo].[IntranetReportRole]  WITH CHECK ADD  CONSTRAINT [FK_IntranetReportRole_IntranetRole] FOREIGN KEY([IntranetRoleID])
REFERENCES [dbo].[IntranetRole] ([IntranetRoleID])
GO
ALTER TABLE [dbo].[IntranetReportRole] CHECK CONSTRAINT [FK_IntranetReportRole_IntranetRole]
GO
